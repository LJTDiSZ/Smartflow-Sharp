--����뵱ǰ���ݿ�Ĺؼ����г�ͻ�������е���
USE Smartflow_Demo

GO
--T_USER
SET IDENTITY_INSERT T_USER ON 
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(1,'chengderen','123456','�̵���','001001','�����з�һ��')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(2,'xuq','123456','��Ⱥ','001001','�����з�һ��')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(3,'xyq','123456','����Ⱥ','001002','�����з�����')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(4,'zhangsan','123456','����','002','�г���')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(5,'wangwu','123456','����','002','�г���')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(6,'wanger','123456','����','002','�г���')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(7,'libin','123456','���','002','�г���')
INSERT INTO T_USER(IDENTIFICATION,USERNAME,USERPWD,EMPLOYEENAME,ORGCODE,ORGNAME) VALUES(8,'zhongsan','123456','����','002','�г���')
SET IDENTITY_INSERT T_USER OFF 


SET IDENTITY_INSERT T_ROLE ON 
INSERT INTO T_ROLE(Identification,Appellation)VALUES(1,'ϵͳ����Ա')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(2,'С�鳤')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(3,'�ܾ���')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(4,'���ž���')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(5,'��������')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(6,'�ܾ�������')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(7,'��Ŀ����')
INSERT INTO T_ROLE(Identification,Appellation)VALUES(8,'�г�������')
SET IDENTITY_INSERT T_ROLE OFF 

--T_UMR
INSERT INTO T_UMR(RID,UUID)VALUES(1,1)
INSERT INTO T_UMR(RID,UUID)VALUES(1,2)
INSERT INTO T_UMR(RID,UUID)VALUES(1,3)
INSERT INTO T_UMR(RID,UUID)VALUES(2,4)
INSERT INTO T_UMR(RID,UUID)VALUES(2,8)
INSERT INTO T_UMR(RID,UUID)VALUES(3,1)
INSERT INTO T_UMR(RID,UUID)VALUES(4,2)
INSERT INTO T_UMR(RID,UUID)VALUES(4,5)
INSERT INTO T_UMR(RID,UUID)VALUES(5,7)
INSERT INTO T_UMR(RID,UUID)VALUES(6,6)
INSERT INTO T_UMR(RID,UUID)VALUES(7,3)
INSERT INTO T_UMR(RID,UUID)VALUES(7,8)
INSERT INTO T_UMR(RID,UUID)VALUES(8,4)


--T_ORG
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('��֯����','000','0','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('�����з���','001','000','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('�г���','002','000','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('�ۺϹ���','003','000','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('���ڱ�����','004','000','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('�����з�һ��','001001','001','')
INSERT INTO T_ORG(ORGNAME,ORGCODE,PARENTCODE,DESCRIPTION)VALUES('�����з�����','001002','001','')

GO

USE [Smartflow]
GO
INSERT [dbo].[t_category] ([NID], [Name], [Url], [Script], [Expression]) VALUES (N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', N'../Smartflow.Web.Mvc/Vacation/edit.html', N'UPDATE T_VACATION SET  [NodeName] = @NodeName   WHERE NID=@NID', N'')
GO
--�����������ӷ���
INSERT [dbo].[t_config] ([ID], [Name], [ConnectionString], [ProviderName]) VALUES (1, N'ҵ���', N'server=127.0.0.1;database=Smartflow_Demo;uid=sa;pwd=Sql2019', N'System.Data.SqlClient')
GO
INSERT [dbo].[t_structure] ([NID], [StructName], [StructXml], [CateCode], [CateName], [Status], [Memo], [CreateDateTime]) VALUES (N'0440A7FE-E124-4CF9-AC43-13264EF22287', N'������̣�2.0��', N'<workflow mode="Mix"><start id="32" name="��ʼ" layout="267 32 74 5" category="start"><transition name="line" destination="34" layout="327,74 395,73" id="40" direction="go"></transition></start><end id="33" name="����" layout="273 23 290 2" category="end"></end><node id="34" name="�ڵ�" layout="395 79 53 14" category="node"><transition name="line" destination="35" layout="575,73 685,73" id="41" direction="go"></transition><transition name="ԭ·�˻�" destination="32" layout="327,74 395,73" id="40" direction="back"></transition></node><node id="35" name="�ڵ�" layout="685 79 53 14" category="node"><transition name="line" destination="36" layout="775,93 775,154" id="42" direction="go"></transition><transition name="ԭ·�˻�" destination="34" layout="575,73 685,73" id="41" direction="back"></transition></node><node id="36" name="�ڵ�" layout="685 105 154 13" category="node"><transition name="line" destination="37" layout="775,194 776,266" id="43" direction="go"></transition><transition name="line" destination="38" layout="685,174 578,174" id="44" direction="go"></transition><transition name="ԭ·�˻�" destination="35" layout="775,93 775,154" id="42" direction="back"></transition></node><node id="37" name="�ڵ�" layout="686 118 266 11" category="node"><transition name="line" destination="33" layout="686,286 333,290" id="45" direction="go"></transition><transition name="ԭ·�˻�" destination="36" layout="775,194 776,266" id="43" direction="back"></transition></node><node id="38" name="�ڵ�" layout="398 87 154 12" category="node"><transition name="line" destination="33" layout="398,174 303,175 303,260" id="46" direction="go"><marker x="298" y="170" length="62"/></transition><transition name="ԭ·�˻�" destination="36" layout="685,174 578,174" id="44" direction="back"></transition></node></workflow>', N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', 0, N'����ڵ�', NULL)
GO
INSERT [dbo].[t_structure] ([NID], [StructName], [StructXml], [CateCode], [CateName], [Status], [Memo], [CreateDateTime]) VALUES (N'292087CB-C2EE-4F3F-8A64-9FD2795818D8', N'�°桪���̲���', N'<workflow mode="Transition"><start id="32" name="��ʼ" layout="191 23 94 -7" category="start" cooperation="0"><transition name="�ύ���ž�������" destination="34" layout="251,94 350,94" id="37" direction="go"></transition></start><end id="33" name="����" layout="451 28 221 -2" category="end" cooperation="0"></end><node id="34" name="���ž���" layout="350 118 74 21" category="node" cooperation="1"><group id="5" name="���ž���"/><transition name="�ύ��Ŀ�ʲ�����Ա����" destination="35" layout="530,94 653,95" id="38" direction="go"></transition></node><node id="35" name="��Ŀ�ʲ�����Ա" layout="653 131 75 7" category="node" cooperation="0"><group id="4" name="��Ŀ�ʲ�����Ա"/><transition name="�ύ��������Ա����" destination="36" layout="743,115 744,199" id="39" direction="go"></transition><actor id="1" name="chengderen"/><actor id="4" name="wangwu"/><actor id="8" name="zhongsan"/></node><node id="36" name="��������Ա" layout="654 106 199 8" category="node" cooperation="0"><group id="1" name="��������Ա"/><transition name="����" destination="33" layout="654,219 511,221" id="40" direction="go"></transition></node></workflow>', N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', 0, N'�¿⡣', CAST(N'2020-02-01T15:42:59.130' AS DateTime))
GO
INSERT [dbo].[t_structure] ([NID], [StructName], [StructXml], [CateCode], [CateName], [Status], [Memo], [CreateDateTime]) VALUES (N'6003237F-DB38-4EB0-96B5-5EE0AE060829', N'������̣������Զ��жϽڵ㣩', N'<workflow mode="Mix"><start id="32" name="��ʼ" layout="346 30 82 -7" category="start"><transition name="�ύ�з���С�鳤����" destination="34" layout="376,112 377,151" id="40" direction="go"></transition></start><end id="33" name="����" layout="348 37 457 -6" category="end"></end><node id="34" name="�з���С�鳤" layout="287 112 151 19" category="node"><group id="2" name="С�鳤"/><transition name="�ύ������������" destination="35" layout="377,191 377,230" id="41" direction="go"></transition><transition name="ԭ·����" destination="32" layout="376,112 377,151" id="40" direction="back"></transition></node><node id="35" name="��������" layout="287 105 230 17" category="node"><group id="5" name="��������"/><transition name="����������Զ��ж�" destination="37" layout="377,270 377,305" id="42" direction="go"></transition><transition name="ԭ·����" destination="34" layout="377,191 377,230" id="41" direction="back"></transition></node><node id="36" name="���ž���" layout="114 129 366 13" category="node"><group id="4" name="���ž���"/><transition name="����" destination="33" layout="204,406 203,460 348,457" id="43" direction="go"><marker x="198" y="455" length="67"/></transition><transition name="ԭ·����" destination="37" layout="327,330 204,330 204,366" id="44" direction="back"><marker x="199" y="325" length="46"/></transition></node><decision id="37" name="��֧�ڵ�" layout="327 56 330 -10" category="decision"><command><text><![CDATA[select * from [dbo].[t_vacation] where instanceID=@InstanceID]]></text><id><![CDATA[1]]></id></command><transition name="�ύ���ž�������" destination="36" layout="327,330 204,330 204,366" id="44" direction="go"><expression><![CDATA[DAY>10]]></expression><marker x="199" y="325" length="46"/></transition><transition name="����" destination="33" layout="377,355 378,427" id="45" direction="go"><expression><![CDATA[DAY<10]]></expression></transition><transition name="ԭ·����" destination="35" layout="377,270 377,305" id="42" direction="back"><expression><![CDATA[]]></expression></transition></decision></workflow>', N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', 0, N'�����Զ��жϽڵ㣬�������趨������������ת��', NULL)
GO
INSERT [dbo].[t_structure] ([NID], [StructName], [StructXml], [CateCode], [CateName], [Status], [Memo], [CreateDateTime]) VALUES (N'9D24166D-8CCD-4968-A541-91CB3A4A698F', N'���ߵ�������', N'<workflow mode="Transition"><start id="32" name="��ʼ" layout="122 5 82 1" category="start"><transition name="�ύ�з���С�鳤����" destination="35" layout="182,82 233,82" id="40" direction="go"></transition></start><end id="33" name="����" layout="571 17 306 0" category="end"></end><node id="34" name="��������" layout="510 124 63 8" category="node"><group id="5" name="��������"/><transition name="�ύ���ž�������" destination="36" layout="690,83 787,84" id="41" direction="go"></transition></node><node id="35" name="�з���С�鳤" layout="233 133 62 8" category="node"><group id="2" name="С�鳤"/><transition name="�Ჿ������������" destination="34" layout="413,82 510,83" id="42" direction="go"></transition></node><node id="36" name="���ž���" layout="787 46 64 19" category="node"><group id="4" name="���ž���"/><transition name="�ύ�ܾ�����������" destination="37" layout="877,104 878,169" id="43" direction="go"></transition></node><node id="37" name="�ܾ�������" layout="788 106 169 2" category="node"><group id="6" name="�ܾ�������"/><transition name="�ύ�ܾ�������" destination="38" layout="788,189 690,189" id="44" direction="go"></transition></node><node id="38" name="�ܾ���" layout="510 102 169 16" category="node"><group id="3" name="�ܾ���"/><transition name="����" destination="33" layout="600,209 601,276" id="45" direction="go"></transition><transition name="��ز�����������" destination="34" layout="600,169 600,103" id="46" direction="go"></transition><transition name="����з�С�鳤����" destination="35" layout="510,189 322,188 323,102" id="47" direction="go"><marker x="317" y="183" length="106"/></transition></node></workflow>', N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', 0, N'������ת��', NULL)
GO
INSERT [dbo].[t_structure] ([NID], [StructName], [StructXml], [CateCode], [CateName], [Status], [Memo], [CreateDateTime]) VALUES (N'E081D8FB-6D3D-4521-BD3B-29B89FBE7896', N'�������1.7', N'<workflow mode="Mix"><start id="32" name="��ʼ" layout="337 20 117 19" category="start" cooperation="0"><transition name="�ύ�з���С�鳤����" destination="34" layout="367,147 366,202" id="36" direction="go"></transition></start><end id="33" name="����" layout="335 11 474 -7" category="end" cooperation="0"><action id="Smartflow.Bussiness.WorkflowService.TestAction" name="TestAction"/></end><node id="34" name="�з���С�鳤" layout="276 132 202 5" category="node" cooperation="0"><group id="2" name="С�鳤"/><transition name="�ύ���ž�������" destination="35" layout="366,242 364,301" id="37" direction="go"></transition><transition name="ԭ·����" destination="32" layout="367,147 366,202" id="36" direction="back"></transition></node><node id="35" name="���ž���" layout="274 79 301 6" category="node" cooperation="0"><transition name="����" destination="33" layout="364,341 365,444" id="38" direction="go"></transition><transition name="ԭ·����" destination="34" layout="366,242 364,301" id="37" direction="back"></transition><actor id="1" name="chengderen"/><actor id="4" name="zhangsan"/></node></workflow>', N'7F1CC595-5BB1-4144-A72F-C509D4ACC3FB', N'�������', 1, N'��ͨԱ����������̵���', NULL)

GO
INSERT [dbo].[t_constraint] ([NID], [Name], [Sort]) VALUES (N'node_send_latest_user', N'���Ͻڵ�������˲���ɸѡ', 2)
GO
INSERT [dbo].[t_constraint] ([NID], [Name], [Sort]) VALUES (N'node_send_start_user', N'�������˲���ɸѡ', 1)
GO

