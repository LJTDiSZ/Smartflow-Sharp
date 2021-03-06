﻿/********************************************************************
 License: https://github.com/chengderen/Smartflow/blob/master/LICENSE 
 Home page: https://www.smartflow-sharp.com
 ********************************************************************
 */
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

using Dapper;
using Smartflow;
using System.Configuration;
using Smartflow.Common;
using Smartflow.Bussiness.Models;
using Smartflow.Bussiness.Queries;
using Smartflow.Elements;
using Smartflow.Bussiness.Interfaces;

namespace Smartflow.Bussiness.WorkflowService
{
    public class BaseBridgeService : AbstractBridgeService
    {
        private readonly IDbConnection connection = DBUtils.CreateConnection();
        private readonly IActorService _actorService = new ActorService();

        public override List<WorkflowGroup> GetGroup()
        {
            string query = " SELECT * FROM T_ROLE WHERE 1=1 ";
            List<WorkflowGroup> groupList = new List<WorkflowGroup>();
            using (IDataReader dr = connection.ExecuteReader(query))
            {
                while (dr.Read())
                {
                    groupList.Add(new WorkflowGroup()
                    {
                        ID = dr["IDENTIFICATION"].ToString(),
                        Name = dr["Appellation"].ToString()
                    });
                }
            }
            return groupList;
        }

        public override List<WorkflowActor> GetActor(int pageIndex, int pageSize, out int total, string actorIDs, string searchKey)
        {
            string conditionStr = string.Empty;
            if (!String.IsNullOrEmpty(actorIDs))
            {
                conditionStr = string.Format("{0} AND IDENTIFICATION NOT IN ({1})", conditionStr,CommonMethods.BindQuot(actorIDs));
            }
            if (!String.IsNullOrEmpty(searchKey))
            {
                conditionStr = string.Format("{0} AND USERNAME LIKE '%{1}%'", conditionStr, searchKey);
            }

            string query = String.Format("SELECT TOP {0} * FROM T_USER WHERE IDENTIFICATION NOT IN (SELECT TOP {1} IDENTIFICATION  FROM T_USER WHERE 1=1 {2} ORDER BY IDENTIFICATION ASC) {2}  ORDER BY IDENTIFICATION ASC ", pageSize, pageSize * (pageIndex - 1), conditionStr);
            total = connection.ExecuteScalar<int>(String.Format("SELECT COUNT(1) FROM T_USER WHERE 1=1 {0}", conditionStr));
            List<WorkflowActor> actors = new List<WorkflowActor>();
            using (var dr = connection.ExecuteReader(query))
            {
                while (dr.Read())
                {
                    actors.Add(new WorkflowActor()
                    {
                        ID = dr["IDENTIFICATION"].ToString(),
                        Name = string.Format("{0}", dr["USERNAME"]),
                        Data = new
                        {
                            OrgName = dr["ORGNAME"],
                            OrgCode = dr["ORGCODE"]
                        }
                    });
                }
            }
            return actors;
        }

        public override List<WorkflowActor> GetActor(string actorIDs)
        {
            if (String.IsNullOrEmpty(actorIDs))
            {
                return new List<WorkflowActor>();
            }
            else
            {
                string conditionStr = string.Format(" AND IDENTIFICATION IN ({0})", CommonMethods.BindQuot(actorIDs));
                string query = String.Format(" SELECT * FROM T_USER WHERE 1=1 {0} ORDER BY IDENTIFICATION ASC ", conditionStr);
                List<WorkflowActor> actors = new List<WorkflowActor>();
                using (var dr = connection.ExecuteReader(query))
                {
                    while (dr.Read())
                    {
                        actors.Add(new WorkflowActor()
                        {
                            ID = dr["IDENTIFICATION"].ToString(),
                            Name = string.Format("{0}", dr["USERNAME"]),
                            Data = new
                            {
                                OrgName = dr["ORGNAME"],
                                OrgCode = dr["ORGCODE"]
                            }
                        });
                    }
                }
                return actors;
            }
        }


        public List<User> GetActorByGroup(Node node, WorkflowOpertaion direction)
        {
            List<User> userList = new List<User>();
            List<string> gList = new List<string>();
            List<string> ids = new List<string>();
            foreach (Group g in node.Groups)
            {
                gList.Add(string.Format("'{0}'", g.ID.ToString()));
            }

            foreach (Actor item in node.Actors)
            {
                ids.Add(string.Format("'{0}'", item.ID));
            }

            if (gList.Count > 0)
            {
                if (node.Rules.Count > 0)
                {
                    userList.AddRange(QueryActor(string.Join(",", gList), node.Rules));
                }
                else
                {
                    userList.AddRange(_actorService.GetActorByRole(string.Join(",", gList)));
                }
            }

            if (ids.Count > 0)
            {
                userList.AddRange(_actorService.Query(string.Join(",", ids)));
            }

            if (direction == WorkflowOpertaion.Back && node.Cooperation == 0)
            {
                WorkflowProcess process = base.ProcessService
                                          .Get(node.InstanceID)
                                          .Where(n => n.Origin == node.ID)
                                          .OrderByDescending(e => e.CreateDateTime)
                                          .FirstOrDefault();

                //return new UserByActorQueryService().Query(process.ActorID).ToList();
                return userList.Where(e => e.UniqueId == process.ActorID).ToList();
            }
            else
            {
                return userList
                    .ToLookup(p => p.UniqueId)
                    .Select(c => c.First())
                    .ToList();
            }
        }

        private IList<User> QueryActor(string group, IList<Elements.Rule> rules)
        {
            IList<User> users = _actorService.GetActorByRole(group);
            List<User> actorList = new List<User>();
            foreach (Elements.Rule rule in rules)
            {
                WorkflowRuleType ruleType = (WorkflowRuleType)Enum.Parse(typeof(WorkflowRuleType), rule.ID,true);
                if (ruleType == WorkflowRuleType.NODE_SEND_START_USER)
                {
                    WorkflowProcess process = base.ProcessService.Get(rule.InstanceID)
                                                .OrderByDescending(e => e.CreateDateTime)
                                                .FirstOrDefault(e => e.NodeType == WorkflowNodeCategory.Start);

                    if (process != null)
                    {
                        String orgCode = _actorService.GetOrganizationCode(process.ActorID);
                        actorList.AddRange(users.Where(u => u.OrgCode == orgCode).ToList());
                    }
                }
                else
                {
                    WorkflowProcess process = base.ProcessService.Get(rule.InstanceID).OrderByDescending(e => e.CreateDateTime).FirstOrDefault();
                    if (process != null)
                    {
                        String orgCode = _actorService.GetOrganizationCode(process.ActorID);
                        actorList.AddRange(users.Where(u => u.OrgCode == orgCode).ToList());
                    }
                }
            }
            return actorList;
        }
    }
}

