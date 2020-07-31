/********************************************************************
 License: https://github.com/chengderen/Smartflow/blob/master/LICENSE 
 Home page: https://www.smartflow-sharp.com
 Github : https://github.com/chengderen/Smartflow-Sharp
 ********************************************************************
 */
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

using Smartflow;
using Smartflow.Elements;

namespace Smartflow.Internals
{
    internal class Utils
    {
        public static readonly string CONST_REJECT_TRANSITION_ID = "NID_REJECT_ID_80_11";

        public static readonly Transition CONST_REJECT_TRANSITION = new Transition
        {
            NID = Utils.CONST_REJECT_TRANSITION_ID,
            Name = "否决"
        };

        public static WorkflowNodeCategory Convert(string category)
        {
            return (WorkflowNodeCategory)Enum.Parse(typeof(WorkflowNodeCategory), category, true);
        }

        public static Object CreateInstance(Type createType)
        {
            return System.Activator.CreateInstance(createType);
        }

        public static void Log(string type, string message)
        {
            using (StreamWriter sw = new StreamWriter("C:\\MyThings\\logs\\sf.log", true, Encoding.UTF8))
            {
                sw.WriteLine($"{DateTime.Now:yyyy-MM-dd HH:mm:ss} {type}, {message}");
            }
        }
        public static void LogInfo(string message)
        {
            Log("INFO", message);
        }
        public static void LogError(string message)
        {
            Log("ERRO", message);
        }
    }
}
