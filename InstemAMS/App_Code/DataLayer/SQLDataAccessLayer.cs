using System;
using ARP.BusinessLogic.Admin;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;
using System.Configuration;
using System.Web;
using ARP.BusinessLogic;
using System.Web.Configuration;



namespace ARP.DataLayer
{
    /// <summary>
    /// Contains the methods for accessing database
    /// </summary>

    public class SQLDataAccessLayer
    {
        //Constants contain names for SQL stored procedures. If you want to change the name of any stored procedure
        //then you can change the contact's value.

        /*** PRIVATE FIELDS ***/

        private string _connectionString;
        private const string SP_CREATENEWUSER = "";
        private const string SP_CREATENEWROLE = "InsertNewRole";
        private const string SP_GETALLROLES = "GetAllRoles";
        private const string SP_GETALLPRIVILEGES = "GetAllPrivileges";
        private const string SP_GETALLPRIVILEGESBYPAGENAME = "GetPrivilegeByPage";
        private const string SP_GETAROLEBYSEARCH = "GetRoleByRoleName";
        private const string SP_GETONLYROLES = "GetOnlyRoles";
        private const string SP_GETACTIVEROLES = "GetActiveRoles";

        private const string SP_INSERTNEWUSER = "InsertNewUser";
        private const string SP_DELETEROLE = "DeleteARole";
        private const string SP_UPDATEROLE = "UpdateRole";
        private const string SP_GETSINGLEROLE = "GetRoleByRoleID";
        private const string SP_ISROLEEXISTS = "IsRoleExists";
        private const string SP_ISROLEEXISTSFORUPDATE = "IsRoleExistsForUpdate";
        private const string SP_UPDATEROLESTATUS = "UpdateRoleStatus";
        private const string SP_UPDATEUSERTATUS = "UpdateUserStatus";
        private const string SP_DELETEUSER = "DeleteUser";
        private const string SP_GETALLUSERS = "GetAllUsers";
        private const string SP_GETUSERBYNAME = "GetUserByUserName";
        private const string SP_GETUSERBYLOGINNAME = "GetUserByLoginName";
        private const string SP_GETSINGLEUSER = "GetUserByUserID";
        private const string SP_GETEUSERBYBOTH = "GetUser";
        private const string SP_UPDATEUSER = "UpdateUser";
        private const string SP_ISLOGINEXISTS = "IsLoginNameExist";
        private const string SP_VALIDATELOGIN = "ValidateLogin";
        private const string SP_GETCLIENTNAMEBYCLIENT = "GetClientName";

        private const string SP_GETUSERPRIVLIGES = "GetUserPrivileges";
        private const string SP_ADMINMESSAGE = "BasicSettings";
        private const string SP_CHANGEPASSWORD = "ChangePassWord";
        private const string SP_ISUSEREXIST = "IsUserExists";
        private const string SP_GETADMINSETTINGS = "GetAdminSettings";
        private const string SP_WRITELOGINFO = "InsertLogInfo";
        private const string SP_SENDEMAILBYSTATUS = "SendMailsByStatus";

        private const string SP_ISCONSULATANTEXISTS = "IsConsultantExists";
        private const string SP_ISCONSULATANTEXISTSFORUPDATE = "IsConsultantExistsForUpdate";
        private const string SP_ADDCONSULTANT = "AddConsultant";
        private const string SP_GETALLCONSULTANTS = "GetAllConsultants";
        private const string SP_GETCONSULTANTBYNAME = "GetConsultantByName";
        private const string SP_GETCONSULTANTBYID = "GetConsultantByID";
        private const string SP_DELETECONSULTANT = "DeleteConsultant";
        private const string SP_UPDATECONSULTANTSTATUS = "UpdateConsultantStatus";
        private const string SP_UPDATECONSULTANT = "UpdateConsultant";
        private const string SP_GETALLACTIVECONSULTANT = "GetAllActiveConsultant";

        private const string SP_ISADVERTISEMENTEXISTS = "IsAdvertisementExists";
        private const string SP_ISADVERTISEMENTEXISTSFORUPDATE = "IsAdvertisementExistsForUpdate";
        private const string SP_ADDADVERTISEMENT = "AddAdvertisement";
        private const string SP_GETALLADVERTISEMENT = "GetAllAdvertisements";
        private const string SP_GETADVERTISEMENTBYSEARCH = "GetAdvertisementBySearch";
        private const string SP_GETADVERTISEMENTBYID = "GetAdvertisementByID";
        private const string SP_DELETEADVERTISEMENT = "DeleteAdvertisement";
        private const string SP_UPDATEADVERTISEMENTSTATUS = "UpdateAdvertisementStatus";
        private const string SP_UPDATEADVERTISEMENT = "UpdateAdvertisement";
        private const string SP_GETALLVALIDADS = "GetAllValidAdvertisements";
        private const string SP_GETTADDIMAGE = "GetADDIMAGEBYID";
        private const string SP_GETADVERTISEMENTBYCLIENT = "GetAdvertisementbyclient";
        private const string SP_GETVARIOUSSTAGES = "GetAdvertisementResponses";
        private const string SP_DELETEADDIMAGE = "deleteAddImage";
        private const string SP_ISVALIDADVERTISEMENT = "IsValidAdvertisement";
        private const string SP_ISVALIDADVTDELETION = "IsValidAdvtDeletion";

        private const string SP_CREATEJOBS = "InsertNewJobSP";
        private const string SP_GETALLJOBS = "GetAllJobs";
        private const string SP_UPDATEJOBSTATUS = "updateJobStatus";
        private const string SP_DELETEJOB = "DeleteJob";
        private const string SP_GETJOBSBYID = "getjobsbyid";
        private const string SP_ISJOBEXISTFORSAVE = "IsJobExistforSave";
        private const string SP_ISJOBEXISTFORUPDATE = "isjobexistforupdate";
        private const string SP_UPDATEJOB = "updatejob11";
        private const string SP_GETJOBSBYAD = "GetJobsByAD";
        private const string SP_GETACTIVEJOBS = "GetActiveJobs";
        private const string SP_GETJOBCODEBYCLIENTNAME = "GetJobCodeByClientName";
        private const string SP_ISVALIDJOBDELETE = "IsValidJobDeletion";
        private const string SP_GETJOBSWITHCOUNT = "GetJobsWithCount";

        private const string SP_ADDRESUME = "AddResumes";
        private const string SP_ADDRESUMEBYCLIENT = "getresumebyclient";
        private const string SP_INACTIVERESUMEBYCLIENT = "getinactiveresumebyclient";
        private const string SP_GETALLRESULT = "getallresume";
        private const string SP_GETALLINACTIVERESULT = "getallinactiveresume";
        private const string SP_UPDATERESUMESTATUS = "updateResumeStatus";
        private const string SP_DELETERESUME = "DeleteResume";
        private const string SP_GETRESUMEBYID = "getresumebyid";
        private const string SP_GETRESUMECODE = "getresumecode";
        private const string SP_UPDATERESUME = "UpdateResume";
        private const string SP_ISRESUMEEXISTFORSAVE = "isResumeExist";
        private const string SP_ISRESUMEEXISTFORUPDATE = "isResumeExistsforUpdate";
        private const string SP_GETDATETIME = "checkdateforResume";
        private const string SP_ISVALIDATERESUME = "CheckMailIDs";
        private const string SP_GETRESUMEIDBYEMAIL = "GetResumeIDByEmail";
        private const string SP_GETCANDIDATEID = "GetCandidateID";
        private const string SP_UPDATECANDIDATEID = "UpdateCandidateID";
        private const string SP_GETCANDIDATEIDBYID = "GetCandidateIDByID";
        private const string SP_DELETERESUMEFILE = "DeleteResumeFile";
        private const string SP_GETRESUMESTAGESBYJOB = "GetResumeStagesByJob";
        private const string SP_UPDATERESUMEBYDATEEXPIRED = "UpdateResumeByDate";
        private const string SP_CheckStatus = "checkstatus";
        private const string SP_COUNTACTIVERESUME = "countactiveresume";
        private const string SP_COUNTACTIVERESUMEBYCLIENT = "countactiveresumebyclient";
        private const string SP_COUNTINACTIVERESUME = "countinactiveresume";
        private const string SP_COUNTINACTIVERESUMEBYCLIENT = "countinactiveresumebyclient";



        private const string SP_ADDCLIENT = "addClientData";
        private const string SP_GETALLCLIENT = "selectAllClient";
        private const string SP_ISCLIENTEXISTS = "IsClientExists";
        private const string SP_ISCLIENTEXISTSFORUPDATE = "IsClientExistsForUpdate";
        private const string SP_GETCLIENTBYID = "GetClientByID";
        private const string SP_UPDATECLIENTSTATUS = "UpdateClientStatus";
        private const string SP_DELETECLIENT = "DeleteClient";
        private const string SP_UPDATECLIENT = "UpdateClient";
        private const string SP_GETCLIENTSBYNAME = "GetClientByName";
        private const string SP_GETALLVALIDCLIENTS = "GetAllValidClients";
        private const string SP_ISVALIDCLIENTDELETE = "IsValidClientDeletion";
        private const string SP_UPDATEADVTWHENCLIENTCHANGE = "UpdateAdvtByClient";
        private const string SP_GETJOBCODESBYCLIENT = "GetJobCodesByClient";

        //private const string SP_GETALLCVSTATUS = "GetAllCVStatus";

        private const string SP_GETADMINCVSTATUS = "GetAllCVStatus";
        private const string SP_GETALLCVSTATUS = "GetClientStatus";
        private const string SP_GETCANDIDATES = "GetCandidateStatus";
        private const string SP_GETCOUNTCANDIDATES = "GetCountCandidateStatus";
        private const string SP_GETALLRESUME = "GetPostedResumes";
        private const string SP_GETCountALLRESUME = "GetCountPostedResumes";
        private const string SP_GETRESUMESTAGE = "GetAResumeStatus";
        private const string SP_LOADLOCATIONLIST = "sp_LoadInterviewLocation";
        private const string SP_LOADALLLOCATIONLIST = "sp_LoadallInterviewLocation";
        private const string SP_CHANGERESUMESTAGE = "ChangeResumeStage";
        private const string SP_UPDATEINTERVIEWDETAILS = "updateinterviewdetails";
        private const string SP_UPDATEHITCOUNT = "UpdateHitCount";

        private const string SP_SELECTCOUNTRY = "selectCountry";
        private const string SP_SELECTNATIONAL = "selectNational";

        private const string SP_GETALLRESUMEBYCLIENT = "GetAllResumeByClient";
        private const string SP_GETCLIENTADS = "GetAClientAds";
        private const string SP_GETCLIENTNAMES = "GetClientNames";
        private const string sp_Getreason = "GetReasonMaster";

        // Added by Ram on 14 Dec 2007 - for forgot password
        private const string SP_ForgotPassword = "Sp_ForgotPassword";


        /*** PROPERTIES ***/

        /// <summary>
        /// Returns the connectionstring from web.config
        /// </summary>

        public string ConnectionString
        {
            get
            {

                //string str = WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString;
                string str = WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString;
                //  string str = ConfigurationSettings.AppSettings["ConnectionString"];
                if (str == null || str.Length <= 0)
                    throw (new ApplicationException("ConnectionString configuration is missing from you web.config. It should contain  <appSettings><add key=\"InstemAMSConnectionString\" value=\"database=IssueTrackerStarterKit;server=localhost;Trusted_Connection=true\" /></appSettings> "));
                else
                    return (str);
            }
            set
            {
                _connectionString = value;
            }
        }

        //********************************************************************
        //
        // Mehtods for Consulatnts
        //
        //********************************************************************

        public int AddConsultant(Consultant newConsultant)
        {
            Object result;

            // Validate Parameters
            if (newConsultant == null)
                throw new ArgumentNullException("newConsultant");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 150, ParameterDirection.Input, newConsultant.Name);
            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, newConsultant.Email);
            AddParamToSQLCmd(sqlCmd, "@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, newConsultant.Phone);
            AddParamToSQLCmd(sqlCmd, "@Phone1", SqlDbType.VarChar, 50, ParameterDirection.Input, newConsultant.Phone1);
            AddParamToSQLCmd(sqlCmd, "@Address", SqlDbType.VarChar, 255, ParameterDirection.Input, newConsultant.ContactAddress);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 60, ParameterDirection.Input, newConsultant.Designation);
            AddParamToSQLCmd(sqlCmd, "@Center", SqlDbType.VarChar, 50, ParameterDirection.Input, newConsultant.Center);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADDCONSULTANT);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);
        }

        public DataSet GetAllConsultants()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLCONSULTANTS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet GetAllActiveConsultants()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLACTIVECONSULTANT);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public int IsConsultantExists(string consultantName)
        {
            // Validate Parameters
            if (consultantName == "")
                throw new ArgumentNullException("No Consultant Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 150, ParameterDirection.Input, consultantName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISCONSULATANTEXISTS);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int IsConsultantExists(string consultantName, int consultantID)
        {
            // Validate Parameters
            if (consultantName == "")
                throw new ArgumentNullException("No Consultant Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, consultantName);
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.VarChar, 100, ParameterDirection.Input, consultantID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISCONSULATANTEXISTSFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public DataSet GetConsultantByName(string consultantName)
        {
            // Validate Parameters
            if (consultantName == "")
                throw new Exception("Consultant name is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, consultantName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCONSULTANTBYNAME);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetConsultantByID(int consultantID)
        {
            if (consultantID.ToString() == "")
                throw new Exception("Consultant ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 2, ParameterDirection.Input, consultantID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCONSULTANTBYID);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int DeleteConsultant(int consultantID)
        {
            int result = 0;

            // Validate Parameters
            if (consultantID.ToString() == "")
                throw new ArgumentNullException("Consultant ID is not available");

            DataSet ds = getAllResumes();

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.RowFilter = "RESUME_CONSULTANTNAME=" + consultantID;

                if (dv.Count <= 0)
                {
                    // Execute SQL Command
                    SqlCommand sqlCmd = new SqlCommand();

                    AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 30, ParameterDirection.Input, consultantID);

                    SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETECONSULTANT);
                    result = (int)ExecuteNonQueryCmd(sqlCmd);
                }
            }

            return result;
        }

        public int UpdateConsultantStatus(Consultant newConsultant)
        {
            if (newConsultant == null)
                throw new ArgumentNullException("Invalid Consultant");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 30, ParameterDirection.Input, newConsultant.ID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, newConsultant.Status);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATECONSULTANTSTATUS);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public int UpdateConsultant(Consultant consultantObj)
        {
            int result;

            // Validate Parameters
            if (consultantObj == null)
                throw new ArgumentNullException("New Consultant");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, consultantObj.ID);
            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 150, ParameterDirection.Input, consultantObj.Name);
            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, consultantObj.Email);
            AddParamToSQLCmd(sqlCmd, "@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, consultantObj.Phone);
            AddParamToSQLCmd(sqlCmd, "@Phone1", SqlDbType.VarChar, 50, ParameterDirection.Input, consultantObj.Phone1);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 60, ParameterDirection.Input, consultantObj.Designation);
            AddParamToSQLCmd(sqlCmd, "@Center", SqlDbType.VarChar, 50, ParameterDirection.Input, consultantObj.Center);
            AddParamToSQLCmd(sqlCmd, "@Address", SqlDbType.VarChar, 255, ParameterDirection.Input, consultantObj.ContactAddress);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATECONSULTANT);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        //********************************************************************
        //
        // Mehtods for Jobs
        //
        //********************************************************************

        public int AddJob(Job newJob)
        {
            object result;

            //validate parameters
            if (newJob == null)
                throw new ArgumentNullException("newJob");

            //Exceute SqlCommand
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@advertisement", SqlDbType.VarChar, 200, ParameterDirection.Input, newJob.Advertisement);
            AddParamToSQLCmd(sqlCmd, "@code", SqlDbType.VarChar, 50, ParameterDirection.Input, newJob.Code);
            AddParamToSQLCmd(sqlCmd, "@title", SqlDbType.VarChar, 260, ParameterDirection.Input, newJob.Title);
            AddParamToSQLCmd(sqlCmd, "@Position", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.Position);
            AddParamToSQLCmd(sqlCmd, "@Departmant", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.Department);
            AddParamToSQLCmd(sqlCmd, "@education", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.Education);
            AddParamToSQLCmd(sqlCmd, "@skillset", SqlDbType.VarChar, 260, ParameterDirection.Input, newJob.Skillset);
            AddParamToSQLCmd(sqlCmd, "@experience", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.Experience);
            AddParamToSQLCmd(sqlCmd, "@location", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.Location);
            AddParamToSQLCmd(sqlCmd, "@Remarks", SqlDbType.Text, 3000, ParameterDirection.Input, newJob.Remarks);
            AddParamToSQLCmd(sqlCmd, "@EnteredBy", SqlDbType.VarChar, 100, ParameterDirection.Input, newJob.EnteredBy);
            AddParamToSQLCmd(sqlCmd, "@job_postadvt", SqlDbType.Bit, 1, ParameterDirection.Input, newJob.PostAdvt);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_CREATEJOBS);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);

        }

        public void DeleteJobAdMapping(string jobcode)
        {
            string sql = "delete JopADMapping where jobcode='" + jobcode + "'";

            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.Text, sql);

            ExecuteScalarCmd(sqlCmd);
        }


        public void AddJobAdMapping(string jobcode, string adid)
        {
            string sql = "Insert into JopADMapping values('" + jobcode + "','" + adid + "')";

            SqlCommand sqlCmd1 = new SqlCommand();
            SetCommandType(sqlCmd1, CommandType.Text, sql);

            ExecuteScalarCmd(sqlCmd1);
        }

        public DataSet GelAllJobs()
        {
            SqlCommand myComm = new SqlCommand();
            SetCommandType(myComm, CommandType.StoredProcedure, SP_GETALLJOBS);

            DataSet ds = GetDataSet(myComm);
            return ds;
        }

        public DataSet GelActiveJobs()
        {
            SqlCommand myComm = new SqlCommand();
            SetCommandType(myComm, CommandType.StoredProcedure, SP_GETACTIVEJOBS);

            DataSet ds = GetDataSet(myComm);
            return ds;
        }
        public DataSet GelActiveJobsByClientName(string ClientName)
        {
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ClientName", SqlDbType.VarChar, 100, ParameterDirection.Input, ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETJOBCODEBYCLIENTNAME);

            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public int updateJobStatus(Job newJob)
        {

            if (newJob == null)
                throw new ArgumentNullException("Invalid Role");

            //Exceute Sql Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@JobID", SqlDbType.Int, 4, ParameterDirection.Input, newJob.JobID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 1, ParameterDirection.Input, newJob.Status);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEJOBSTATUS);

            object result;

            result = ExecuteScalarCmd(sqlCmd);

            if (result != null)
            {
                return (int)result;
            }
            return 0;
        }

        public int DeleteJobs1(int JobID)
        {
            int result;
            //validate Parameters
            if (JobID.ToString() == "")
                throw new ArgumentNullException("Job ID is not available");

            DataSet ds = getAllResumes();

            //			if(ds.Tables[0].Rows.Count >0)
            //			{
            //				DataView dv = ds.Tables[0].DefaultView;
            //				dv.RowFilter = "RESUME_CONSULTANTNAME=" + consultantID;
            //
            //				if(dv.Count <=0)
            //				{

            //Exceute SQl Command
            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, JobID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETEJOB);
            result = (int)ExecuteNonQueryCmd(sqlCmd);
            //				}
            //			}

            return result;
        }

        public int isJobsDeletePossible(int jobID)
        {
            int result;

            // Validate Parameters
            if (jobID.ToString() == "")
                throw new ArgumentNullException("jobID");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@jobID", SqlDbType.Int, 4, ParameterDirection.Input, jobID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISVALIDJOBDELETE);
            result = (int)ExecuteScalarCmd(sqlCmd);

            return result;
        }

        public DataSet GetJobsById(int JobID)
        {
            if (JobID.ToString() == null)
                throw new Exception("Job ID is not initialized ");

            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, JobID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETJOBSBYID);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public DataSet GetJobsByAdId(int AdID)
        {
            if (AdID.ToString() == null)
                throw new Exception("Ad ID is not initialized ");

            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, AdID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETJOBSBYAD);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public int IsJobCodeExist(string JobCode)
        {
            if (JobCode == "")
                throw new ArgumentException("No JobCode");
            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@codeJob", SqlDbType.NVarChar, 50, ParameterDirection.Input, JobCode);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISJOBEXISTFORSAVE);

            return (int)ExecuteScalarCmd(sqlCmd);

        }
        public int isJobExistforUpdate(string jobCode, int JobID)
        {
            if (jobCode == "")
                throw new ArgumentNullException("No Job Code");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@jobcode", SqlDbType.Char, 10, ParameterDirection.Input, jobCode);
            AddParamToSQLCmd(sqlCmd, "@jobid ", SqlDbType.Int, 4, ParameterDirection.Input, JobID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISJOBEXISTFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);

        }
        public int updateJobs(Job updateJob1)
        {
            int result;

            //validate parameters
            if (updateJob1 == null)
                throw new ArgumentNullException("updateJob");

            //Exceute SqlCommand
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@id", SqlDbType.Int, 4, ParameterDirection.Input, updateJob1.JobID);
            AddParamToSQLCmd(sqlCmd, "@advertisement", SqlDbType.VarChar, 200, ParameterDirection.Input, updateJob1.Advertisement);
            AddParamToSQLCmd(sqlCmd, "@code", SqlDbType.VarChar, 40, ParameterDirection.Input, updateJob1.Code);
            AddParamToSQLCmd(sqlCmd, "@title", SqlDbType.VarChar, 255, ParameterDirection.Input, updateJob1.Title);
            AddParamToSQLCmd(sqlCmd, "@Position", SqlDbType.VarChar, 100, ParameterDirection.Input, updateJob1.Position);
            AddParamToSQLCmd(sqlCmd, "@Departmant", SqlDbType.VarChar, 100, ParameterDirection.Input, updateJob1.Department);
            AddParamToSQLCmd(sqlCmd, "@education", SqlDbType.VarChar, 100, ParameterDirection.Input, updateJob1.Education);
            AddParamToSQLCmd(sqlCmd, "@skillset", SqlDbType.VarChar, 255, ParameterDirection.Input, updateJob1.Skillset);
            AddParamToSQLCmd(sqlCmd, "@experience", SqlDbType.VarChar, 100, ParameterDirection.Input, updateJob1.Experience);
            AddParamToSQLCmd(sqlCmd, "@location", SqlDbType.VarChar, 100, ParameterDirection.Input, updateJob1.Location);
            AddParamToSQLCmd(sqlCmd, "@Remarks", SqlDbType.Text, 3000, ParameterDirection.Input, updateJob1.Remarks);
            AddParamToSQLCmd(sqlCmd, "@job_postadvert", SqlDbType.Bit, 1, ParameterDirection.Input, updateJob1.PostAdvt);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEJOB);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;

        }

        public DataSet SearchAJobs(Job newJobs)
        {
            if (newJobs == null)
                throw new Exception("newJobs");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT * FROM InsertNewJobs WHERE ";


            if (newJobs.Code != "")
            {

                //strSQL += " JOB_CODE like '%" + newJobs.Code + "%'";
                strSQL += " JOB_CODE in (" + newJobs.Code + ")";

            }

            if (newJobs.Experience != "")
            {
                if (newJobs.Code.Trim() != "")
                {
                    strSQL += " AND JOB_EXPERIENCE like '%" + newJobs.Experience + "%'";
                }
                else
                {
                    strSQL += " JOB_EXPERIENCE like '%" + newJobs.Experience + "%'";
                }
            }
            else
                strSQL += "  and JOB_EXPERIENCE like '%%'";
            if (newJobs.Active)
            {
                strSQL += " and job_status=1";
            }
            else
                strSQL += " and job_status=0";


            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAllJobsWithCount()
        {
            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETJOBSWITHCOUNT);
            ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetResumeStagesByJob(int jobid, string fromdate, string todate, string country, int advertisement, string clientname)
        {
            if (jobid.ToString() == "")
                throw new Exception(" Job ID ");

            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            AddParamToSQLCmd(sqlCmd, "@jobid", SqlDbType.Int, 4, ParameterDirection.Input, jobid);
            AddParamToSQLCmd(sqlCmd, "@fromdate", SqlDbType.VarChar, 50, ParameterDirection.Input, fromdate);
            AddParamToSQLCmd(sqlCmd, "@todate", SqlDbType.VarChar, 50, ParameterDirection.Input, todate);
            AddParamToSQLCmd(sqlCmd, "@country", SqlDbType.VarChar, 50, ParameterDirection.Input, country);
            AddParamToSQLCmd(sqlCmd, "@advt", SqlDbType.Int, 4, ParameterDirection.Input, advertisement);
            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, clientname);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETRESUMESTAGESBYJOB);
            ds = GetDataSet(sqlCmd);

            return ds;

        }

        public DataSet SearchJobsWithResponses(Job newJob)
        {
            if (newJob == null)
                throw new Exception("newJobs");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //            strSQL += "SELECT job.JOB_ID, job.JOB_CODE, job.JOB_TITLE, job.JOB_EXPERIENCE,job.JOB_LOCATION, ";
            //			strSQL += " (SELECT COUNT(*) FROM AddResume res WHERE res.RESUME_JOBCODE = job.JOB_CODE AND res.RESUME_STATUS = 1  ) AS 'Count'";
            //			strSQL += " FROM InsertNewJobs job WHERE ";

            //strSQL += "select b.JOB_ID,b.JOB_CODE,b.JOB_TITLE,b.JOB_EXPERIENCE,b.JOB_LOCATION ,isnull(b.job_position,'') as job_position,isnull(b.job_department,'') as job_department,isnull(replace(convert (varchar,advert.STARTON,103),'Null',''),'') as STARTON , count(b.JOB_ID) AS 'Count' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join jopadmapping jobad on b.job_Code = jobad.jobcode inner join tbladvertisements advert  on  jobad.advertisementid = advert.[id] where b.JOB_STATUS = 1 AND a.RESUME_STATUS = 1 ";

            strSQL += "select b.JOB_ID,b.JOB_CODE,b.JOB_TITLE,b.JOB_EXPERIENCE,b.JOB_LOCATION ,isnull(b.job_position,'') as job_position,isnull(b.job_department,'') as job_department, count(b.JOB_ID) AS 'Count'from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name where  c.CLIENT_STATUS=1 and b.JOB_STATUS = 1 AND a.RESUME_STATUS = 1";

            if (newJob.Code != "")
            {
                //strSQL += " job.JOB_CODE LIKE '"+ newJob.Code +"%' ";
                strSQL += " and b.job_code= '" + newJob.Code + "' ";
            }

            if (newJob.country != null)
            {

                if (newJob.country != "")
                {
                    if (newJob.Code != "")
                    {
                        strSQL += "and a.resume_country= '" + newJob.country + "' ";
                    }
                    else
                    {
                        strSQL += "and a.resume_country= '" + newJob.country + "' ";
                    }
                }

            }
            if (newJob.Advertisement != null)
            {
                if (newJob.Advertisement != "")
                {
                    if (newJob.Code != "" || newJob.country != "")
                    {
                        strSQL += "and a.RESUME_advtname = '" + newJob.Advertisement + "' ";
                    }
                    else
                    {
                        strSQL += "and a.RESUME_advtname = '" + newJob.Advertisement + "' ";
                    }
                }
            }



            if (newJob.ClientName != "null")
            {
                if (newJob.ClientName != "")
                {
                    if (newJob.country != "" || newJob.Advertisement != "")
                    {
                        strSQL += "and advert.client_name = '" + newJob.ClientName + "' ";
                    }
                    else
                    {
                        strSQL += " and advert.client_name = '" + newJob.ClientName + "' ";
                    }
                }
            }

            if (newJob.StartDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newJob.EndDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newJob.Code != "") || newJob.country != "" || newJob.Advertisement != "" || newJob.ClientName != "")
                    {
                        //						strSQL += " AND ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                        strSQL += " AND a.[resume_datetime] between convert(datetime,'" + newJob.StartDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newJob.EndDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //						strSQL += " ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                        strSQL += " and  a.[resume_datetime] between convert(datetime,'" + newJob.StartDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newJob.EndDate.Date.ToShortDateString() + "',120)";
                    }
                }
                else
                {
                    if ((newJob.Code != "" || newJob.country != "" || newJob.Advertisement != "" || newJob.ClientName != ""))
                    {
                        //strSQL += " AND ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "'";
                        strSQL += " AND a.[resume_datetime] >= convert(datetime,'" + newJob.StartDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //strSQL += " ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                        strSQL += " and a.[resume_datetime] >= convert(datetime,'" + newJob.StartDate.Date.ToShortDateString() + "',120) ";
                    }
                }

            }

            if (newJob.EndDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newJob.StartDate <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newJob.Code != "" || newJob.country != "" || newJob.Advertisement != "" || newJob.ClientName != ""))
                    {
                        //strSQL += " AND convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        strSQL += " AND a.[resume_datetime] <= convert(datetime,'" + newJob.EndDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //strSQL += " convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        strSQL += " and a.[resume_datetime] <= convert(datetime,'" + newJob.EndDate.Date.ToShortDateString() + "',120) ";
                    }
                }
            }
            //			if ( ( newJob != "" ) )
            //			{
            //				strSQL += " AND job.JOB_STATUS = 1 ";
            //			}
            //			else
            //			{
            //				strSQL += " job.JOB_STATUS = 1 ";
            //			}
            //if ( ( newJob.Code != "" ) )
            //{
            strSQL += "group by b.JOB_ID,b.JOB_CODE,b.JOB_TITLE,b.JOB_EXPERIENCE,b.JOB_LOCATION,b.job_position,b.job_department ORDER BY b.JOB_CODE ";
            //}
            ///else
            //{
            //	strSQL += " job.JOB_STATUS = 1 ";
            //}
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public bool IsValidAdvertisement(int advtID, DateTime curDate)
        {
            if (advtID.ToString() == "")
                throw new ArgumentNullException(" Advertisement title not available ");

            int count;
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@advtID", SqlDbType.Int, 4, ParameterDirection.Input, advtID);
            AddParamToSQLCmd(sqlCmd, "@cdate", SqlDbType.DateTime, 8, ParameterDirection.Input, curDate);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISVALIDADVERTISEMENT);
            count = (int)ExecuteNonQueryCmd(sqlCmd);
            string print = "Count :" + count;

            if (count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //***************************End************************************************

        //********************************************************************
        //
        // Methods for Resume
        //
        //********************************************************************

        public int AddResume(Resume newResume)
        {
            object Result;

            //validate parameters
            if (newResume == null)
                throw new ArgumentNullException("newResume");

            //Execute SqlCommand
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@jobcode", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.JobCode);
            AddParamToSQLCmd(sqlCmd, "@firstname", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.FirstName);
            AddParamToSQLCmd(sqlCmd, "@middlename", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.MiddleName);
            AddParamToSQLCmd(sqlCmd, "@familyname", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.FamilyName);

            if (newResume.DOB == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@dob", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@dob", SqlDbType.DateTime, 8, ParameterDirection.Input, newResume.DOB);
            }

            AddParamToSQLCmd(sqlCmd, "@nationality", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.Nationality);
            AddParamToSQLCmd(sqlCmd, "@emailid1", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.EmailID1);
            AddParamToSQLCmd(sqlCmd, "@emailid2", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.EmailID2);
            AddParamToSQLCmd(sqlCmd, "@telephoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.TelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@othertelphoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.OtherTelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@handtelephoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.HandTelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@postaladdress", SqlDbType.VarChar, 255, ParameterDirection.Input, newResume.PostalAddress);
            AddParamToSQLCmd(sqlCmd, "@qualification", SqlDbType.VarChar, 255, ParameterDirection.Input, newResume.Qualification);
            AddParamToSQLCmd(sqlCmd, "@city", SqlDbType.VarChar, 150, ParameterDirection.Input, newResume.City);
            AddParamToSQLCmd(sqlCmd, "@country", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.Country);
            AddParamToSQLCmd(sqlCmd, "@attachedcvname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.AttachedResumeName);
            AddParamToSQLCmd(sqlCmd, "@consultantname", SqlDbType.Int, 4, ParameterDirection.Input, newResume.ConsultNames);
            AddParamToSQLCmd(sqlCmd, "@advtID", SqlDbType.Int, 4, ParameterDirection.Input, newResume.AdvtNames);
            AddParamToSQLCmd(sqlCmd, "@candidateID", SqlDbType.VarChar, 20, ParameterDirection.Input, newResume.CandidateID);
            AddParamToSQLCmd(sqlCmd, "@regTime", SqlDbType.DateTime, 8, ParameterDirection.Input, newResume.RegTime.Date.ToShortDateString());
            AddParamToSQLCmd(sqlCmd, "@EnteredBy", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.EnteredBy);

            AddParamToSQLCmd(sqlCmd, "@Employer", SqlDbType.VarChar, 100, ParameterDirection.Input, newResume.CurrentEmployer);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 100, ParameterDirection.Input, newResume.CurrentDesignation);
            AddParamToSQLCmd(sqlCmd, "@Experience", SqlDbType.Int, 4, ParameterDirection.Input, newResume.TotalExperience);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADDRESUME);
            Result = ExecuteNonQueryCmd(sqlCmd);
            return System.Convert.ToInt32(Result);
        }

        public DataSet getAllResumes()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLRESULT);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }
        public DataSet getResumesByClient(Resume newResume)
        {

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADDRESUMEBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet GetInactiveResumesByClient(Resume newResume)
        {

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_INACTIVERESUMEBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet countactiveresumebyclient(Resume newResume)
        {

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_COUNTACTIVERESUMEBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet countactiveresume()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_COUNTACTIVERESUME);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public DataSet countinactiveresumeByClient(Resume newResume)
        {

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_COUNTINACTIVERESUMEBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet countinactiveresume()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_COUNTINACTIVERESUME);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }
        public DataSet getAllInactiveResumes()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLINACTIVERESULT);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public int UpdateHitCount(int advtID)
        {
            if (advtID.ToString() == "")
                throw new ArgumentNullException(" Advertisement title not available ");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@advtID", SqlDbType.Int, 4, ParameterDirection.Input, advtID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEHITCOUNT);
            return (int)ExecuteNonQueryCmd(sqlCmd);
        }

        public int updResumeStatus(Resume newResume)
        {
            if (newResume == null)
                throw new ArgumentNullException("Invalid Resume");
            //DateTime modifiedDate = System.DateTime.Now.Date;

            SqlCommand myComm = new SqlCommand();

            AddParamToSQLCmd(myComm, "@resumeID", SqlDbType.Int, 4, ParameterDirection.Input, newResume.ResumeID);
            AddParamToSQLCmd(myComm, "@status", SqlDbType.Bit, 1, ParameterDirection.Input, newResume.Status);
            AddParamToSQLCmd(myComm, "@modifiedBy", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ModifiedBy);

            SetCommandType(myComm, CommandType.StoredProcedure, SP_UPDATERESUMESTATUS);

            object result;

            result = ExecuteScalarCmd(myComm);

            if (result != null)
            {
                return (int)result;
            }
            return 0;
        }

        public int DeleteResume(int ResumeID)
        {
            int result;
            //validate Parameters
            if (ResumeID.ToString() == "")
                throw new ArgumentNullException("Job ID is not available");
            //Exceute SQl Command
            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, ResumeID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETERESUME);

            result = (int)ExecuteNonQueryCmd(sqlCmd);
            return result;
        }

        public DataSet DeleteResumeFile(int ResumeID)
        {
            DataSet resultSet;
            //validate Parameters
            if (ResumeID.ToString() == "")
                throw new ArgumentNullException("Resume ID is not available");
            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@resumeID", SqlDbType.Int, 4, ParameterDirection.Input, ResumeID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETERESUMEFILE);

            resultSet = GetDataSet(sqlCmd);

            return resultSet;
        }

        public DataSet GetResumesByID(int ID)
        {
            if (ID.ToString() == "")
                throw new Exception("Resume ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@id", SqlDbType.Int, 4, ParameterDirection.Input, ID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETRESUMEBYID);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetResumeCode(string jobcode, string email)
        {
            if (jobcode.ToString() == "" && email.ToString() == "")
                throw new Exception("Resume Code is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@jobcode", SqlDbType.VarChar, 50, ParameterDirection.Input, jobcode);
            AddParamToSQLCmd(sqlCmd, "@emailid", SqlDbType.VarChar, 50, ParameterDirection.Input, email);


            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETRESUMECODE);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetDateForID(int ID)
        {
            if (ID.ToString() == "")
                throw new Exception("Resume ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@id", SqlDbType.Int, 4, ParameterDirection.Input, ID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETDATETIME);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public int UpdateResume(Resume newResume)
        {
            int result;

            //validate parameters
            if (newResume == null)
                throw new ArgumentNullException("newResume");

            //Execute SqlCommand
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@id", SqlDbType.Int, 4, ParameterDirection.Input, newResume.ResumeID);
            AddParamToSQLCmd(sqlCmd, "@jobcode", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.JobCode);
            AddParamToSQLCmd(sqlCmd, "@firstname", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.FirstName);
            AddParamToSQLCmd(sqlCmd, "@middlename", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.MiddleName);
            AddParamToSQLCmd(sqlCmd, "@familyname", SqlDbType.VarChar, 30, ParameterDirection.Input, newResume.FamilyName);
            if (newResume.DOB == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@dob", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@dob", SqlDbType.DateTime, 8, ParameterDirection.Input, newResume.DOB);
            }

            AddParamToSQLCmd(sqlCmd, "@nationality", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.Nationality);
            AddParamToSQLCmd(sqlCmd, "@emailid1", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.EmailID1);
            AddParamToSQLCmd(sqlCmd, "@emailid2", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.EmailID2);
            AddParamToSQLCmd(sqlCmd, "@telephoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.TelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@othertelphoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.OtherTelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@handtelephoneno", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.HandTelephoneNumber);
            AddParamToSQLCmd(sqlCmd, "@postaladdress", SqlDbType.VarChar, 255, ParameterDirection.Input, newResume.PostalAddress);
            AddParamToSQLCmd(sqlCmd, "@qualification", SqlDbType.VarChar, 100, ParameterDirection.Input, newResume.Qualification);
            AddParamToSQLCmd(sqlCmd, "@city", SqlDbType.VarChar, 150, ParameterDirection.Input, newResume.City);
            AddParamToSQLCmd(sqlCmd, "@country", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.Country);
            AddParamToSQLCmd(sqlCmd, "@attachedcvname", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.AttachedResumeName);
            AddParamToSQLCmd(sqlCmd, "@consultantname", SqlDbType.Int, 4, ParameterDirection.Input, newResume.ConsultNames);
            AddParamToSQLCmd(sqlCmd, "@advtID", SqlDbType.Int, 4, ParameterDirection.Input, newResume.AdvtNames);
            //AddParamToSQLCmd(sqlCmd,"@candidateID",SqlDbType.VarChar,25,ParameterDirection.Input,newResume.CandidateID); 

            AddParamToSQLCmd(sqlCmd, "@Employer", SqlDbType.VarChar, 100, ParameterDirection.Input, newResume.CurrentEmployer);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 100, ParameterDirection.Input, newResume.CurrentDesignation);
            AddParamToSQLCmd(sqlCmd, "@Experience", SqlDbType.Int, 4, ParameterDirection.Input, newResume.TotalExperience);

            AddParamToSQLCmd(sqlCmd, "@ModifiedBy", SqlDbType.VarChar, 50, ParameterDirection.Input, newResume.ModifiedBy);
            AddParamToSQLCmd(sqlCmd, "@Modified_Date", SqlDbType.DateTime, 8, ParameterDirection.Input, newResume.ModifiedDate.ToShortDateString());


            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATERESUME);
            result = (int)ExecuteNonQueryCmd(sqlCmd);
            return result;
        }

        public int IsUpdateResumeByDate(string Email, string jobcode)
        {
            if (Email == "")
                throw new ArgumentException("No Email");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@EmailID", SqlDbType.VarChar, 50, ParameterDirection.Input, Email);
            AddParamToSQLCmd(sqlCmd, "@jobcode", SqlDbType.VarChar, 50, ParameterDirection.Input, jobcode);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATERESUMEBYDATEEXPIRED);

            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public DataSet CheckStatus(string Email)
        {
            if (Email == "")
                throw new ArgumentException("No Email");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@email", SqlDbType.VarChar, 50, ParameterDirection.Input, Email);
            //AddParamToSQLCmd(sqlCmd,"@jobcode",SqlDbType.VarChar,50,ParameterDirection.Input, jobCode );

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_CheckStatus);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet GetResumeIDByMail(string Email)
        {
            if (Email == "")
                throw new ArgumentException("No Email");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, Email);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETRESUMEIDBYEMAIL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int IsResumeExist(string EMail)
        {
            if (EMail == "")
                throw new ArgumentException("No Email");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@email", SqlDbType.VarChar, 50, ParameterDirection.Input, EMail);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISRESUMEEXISTFORSAVE);

            return (int)ExecuteScalarCmd(sqlCmd);

        }

        public int IsValidateResume(string EMail)
        {
            if (EMail == "")
                throw new ArgumentException(" No Email ");

            SqlCommand sqlCmd = new SqlCommand();

            //AddParamToSQLCmd(sqlCmd,"@jobCode",SqlDbType.VarChar,50,ParameterDirection.Input,jobCode);
            AddParamToSQLCmd(sqlCmd, "@email", SqlDbType.VarChar, 50, ParameterDirection.Input, EMail);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISVALIDATERESUME);

            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int isResumeExistforUpdate(string EMail, int id)
        {
            if (EMail == "")
                throw new ArgumentNullException("No EMail");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@email", SqlDbType.VarChar, 50, ParameterDirection.Input, EMail);
            AddParamToSQLCmd(sqlCmd, "@ID ", SqlDbType.Int, 4, ParameterDirection.Input, id);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISRESUMEEXISTFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);

        }

        public DataSet SearchcountAResumesByClient(Resume newResume)
        {
            if (newResume == null)
                throw new Exception("newResume");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT count(a.resumecode) as 'count'  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 and c.client_name ='" + newResume.ClientName + "'";


            if (newResume.EmailID1 != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 like '%" + newResume.EmailID1 + "%' OR a.RESUME_EMAILID2 LIKE '%" + newResume.EmailID1 + "%' )";
            }
            if (newResume.AdvtNames != 0)
            {
                strSQL += " AND (a.RESUME_ADVTNAME = " + newResume.AdvtNames + ") ";
            }

            if (newResume.JobCode != null)
            {
                strSQL += " AND a.RESUME_JOBCODE = '" + newResume.JobCode + "' ";

            }

            if (newResume.FirstName != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND (a.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%' OR a.RESUME_FAMILYNAME like '%" + newResume.FirstName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newResume.FirstName + "%' ) ";
            }
            if (newResume.RegNo != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.candidate like '%" + newResume.RegNo + "%' ";
            }
            //newly added
            if (newResume.Stage != 0)
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.RESUME_STAGE = '" + newResume.Stage + "' ";
            }
            if (newResume.ClientName != null)
            {
                if (newResume.ClientName != "")
                {
                    strSQL += " AND advert.client_name= '" + newResume.ClientName + "' ";

                }
            }
            if (newResume.RegTime > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
            }

            //************

            if (newResume.DOB > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
            }



            //Log.Write("C:\\ARPNameSQL.txt", strSQL );
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet SearchcountAResumes(Resume newResume)
        {
            if (newResume == null)
                throw new Exception("newResume");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT count(a.resumecode) as 'count'  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1";


            if (newResume.EmailID1 != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 like '%" + newResume.EmailID1 + "%' OR a.RESUME_EMAILID2 LIKE '%" + newResume.EmailID1 + "%' )";
            }
            if (newResume.AdvtNames != 0)
            {
                strSQL += " AND (a.RESUME_ADVTNAME = " + newResume.AdvtNames + ") ";
            }

            if (newResume.JobCode != null)
            {
                strSQL += " AND a.RESUME_JOBCODE = '" + newResume.JobCode + "' ";

            }

            if (newResume.FirstName != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND (a.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%' OR a.RESUME_FAMILYNAME like '%" + newResume.FirstName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newResume.FirstName + "%' ) ";
            }
            if (newResume.RegNo != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.candidate like '%" + newResume.RegNo + "%' ";
            }
            //newly added
            if (newResume.Stage != 0)
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.RESUME_STAGE = '" + newResume.Stage + "' ";
            }
            if (newResume.ClientName != null)
            {
                if (newResume.ClientName != "")
                {
                    strSQL += " AND advert.client_name= '" + newResume.ClientName + "' ";

                }
            }
            if (newResume.RegTime > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
            }

            //************

            if (newResume.DOB > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
            }



            //Log.Write("C:\\ARPNameSQL.txt", strSQL );
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchAResume(Resume newResume)
        {
            if (newResume == null)
                throw new Exception("newResume");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT a.*, b.JOB_TITLE  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1";


            if (newResume.EmailID1 != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 like '%" + newResume.EmailID1 + "%' OR a.RESUME_EMAILID2 LIKE '%" + newResume.EmailID1 + "%' )";
            }
            if (newResume.AdvtNames != 0)
            {
                strSQL += " AND (a.RESUME_ADVTNAME = " + newResume.AdvtNames + ") ";
            }

            if (newResume.JobCode != null)
            {

                strSQL += " AND a.RESUME_JOBCODE = '" + newResume.JobCode + "' ";

            }
            if (newResume.RegNo != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.candidate like '%" + newResume.RegNo + "%' ";
            }
            if (newResume.FirstName != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND (a.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%' OR a.RESUME_FAMILYNAME like '%" + newResume.FirstName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newResume.FirstName + "%' ) ";
            }
            if (newResume.Stage != 0)
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.RESUME_STAGE = '" + newResume.Stage + "' ";
            }
            if (newResume.ClientName != null)
            {
                if (newResume.ClientName != "")
                {
                    strSQL += " AND advert.client_name= '" + newResume.ClientName + "' ";

                }
            }
            //newly added

            if (newResume.RegTime > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
            }

            //************

            if (newResume.DOB > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
            }

            strSQL += " ORDER BY Candidate";

            //Log.Write("C:\\ARPNameSQL.txt", strSQL );
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet SearchAResumeByClient(Resume newResume)
        {
            if (newResume == null)
                throw new Exception("newResume");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT a.*, b.JOB_TITLE  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1";


            if (newResume.EmailID1 != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 like '%" + newResume.EmailID1 + "%' OR a.RESUME_EMAILID2 LIKE '%" + newResume.EmailID1 + "%' )";
            }
            if (newResume.AdvtNames != 0)
            {
                strSQL += " AND (a.RESUME_ADVTNAME = " + newResume.AdvtNames + ") ";
            }

            if (newResume.JobCode != null)
            {

                strSQL += " AND a.RESUME_JOBCODE = '" + newResume.JobCode + "' ";

            }
            if (newResume.RegNo != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.candidate = '" + newResume.RegNo + "' ";
            }
            if (newResume.FirstName != "")
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND (a.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%' OR a.RESUME_FAMILYNAME like '%" + newResume.FirstName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newResume.FirstName + "%' ) ";
            }
            if (newResume.Stage != 0)
            {
                //strSQL += " AND res.RESUME_FIRSTNAME like '%" + newResume.FirstName + "%'";
                strSQL += " AND a.RESUME_STAGE = '" + newResume.Stage + "' ";
            }
            if (newResume.ClientName != null)
            {
                if (newResume.ClientName != "")
                {
                    strSQL += " AND advert.client_name= '" + newResume.ClientName + "' ";

                }
            }
            //newly added

            if (newResume.RegTime > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DATETIME = '" + newResume.RegTime + "'";
                }
            }

            //************

            if (newResume.DOB > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if ((newResume.EmailID1 != "") || (newResume.JobCode != null) || (newResume.FirstName != ""))
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
                else
                {
                    strSQL += " AND a.RESUME_DOB = '" + newResume.DOB + "'";
                }
            }

            strSQL += "and c.client_name ='" + newResume.ClientName + "' ORDER BY Candidate";

            //Log.Write("C:\\ARPNameSQL.txt", strSQL );
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetCandidateID()
        {
            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCANDIDATEID);
            ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAdDetails(string sql)
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.Text, sql);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetCandidateIDByResumeID(int resumeID)
        {
            if (resumeID.ToString() == "")
                throw new Exception(" Resume ID ");

            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            AddParamToSQLCmd(sqlCmd, "@resumeID", SqlDbType.Int, 4, ParameterDirection.Input, resumeID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCANDIDATEIDBYID);
            ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int UpdateCandidateID()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATECANDIDATEID);

            return (int)ExecuteNonQueryCmd(sqlCmd);
        }


        public DataSet GetAllCountrys()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_SELECTCOUNTRY);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet GetAllNationals()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_SELECTNATIONAL);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }



        //*********************End*****************************************

        //********************************************************************
        //
        // Mehtods for Client
        //
        //********************************************************************

        public int AddClient(Client AddClient)
        {
            object result;

            //validate parameters
            if (AddClient == null)
                throw new ArgumentNullException("AddClient");

            //Execute Sql Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, AddClient.ClientName);
            AddParamToSQLCmd(sqlCmd, "@clientdescription", SqlDbType.VarChar, 150, ParameterDirection.Input, AddClient.ClientDescription);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADDCLIENT);

            result = ExecuteNonQueryCmd(sqlCmd);
            return System.Convert.ToInt32(result);

        }
        public DataSet getAllClients()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLCLIENT);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public DataSet GetAllValidClients()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLVALIDCLIENTS);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;
        }

        public int IsClientExists(string clientName)
        {
            // Validate Parameters
            if (clientName == "")
                throw new ArgumentNullException("No Client Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, clientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISCLIENTEXISTS);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int IsClientExists(string clientName, int clientID)
        {
            // Validate Parameters
            if (clientName == "")
                throw new ArgumentNullException("No Client Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, clientName);
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, clientID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISCLIENTEXISTSFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public DataSet GetClientByID(int ID)
        {
            if (ID.ToString() == "")
                throw new Exception("Client ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 2, ParameterDirection.Input, ID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCLIENTBYID);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int UpdateClientStatus(Client newClient)
        {
            if (newClient == null)
                throw new ArgumentNullException("Invalid Client");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 30, ParameterDirection.Input, newClient.ClientID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, newClient.ClientStatus);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATECLIENTSTATUS);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public int UpdateAdvtWhenClientChange(string oldName, string newName)
        {
            if (oldName == "" && newName == "")
                throw new ArgumentNullException("Client Name");

            int result;

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@oldClient", SqlDbType.VarChar, 100, ParameterDirection.Input, oldName);
            AddParamToSQLCmd(sqlCmd, "@newClient", SqlDbType.VarChar, 100, ParameterDirection.Input, newName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEADVTWHENCLIENTCHANGE);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public int DeleteClient(int clientID)
        {
            int result = 0;

            // Validate Parameters
            if (clientID.ToString() == "")
                throw new ArgumentNullException("clientID");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, clientID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETECLIENT);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public int isClientDeletePossible(int clientID)
        {
            int result;

            // Validate Parameters
            if (clientID.ToString() == "")
                throw new ArgumentNullException("clientID");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientID", SqlDbType.Int, 4, ParameterDirection.Input, clientID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISVALIDCLIENTDELETE);
            result = (int)ExecuteScalarCmd(sqlCmd);

            return result;
        }

        public int UpdateClient(Client clientObj)
        {
            int result;

            // Validate Parameters
            if (clientObj == null)
                throw new ArgumentNullException("NewClient");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, clientObj.ClientID);
            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 55, ParameterDirection.Input, clientObj.ClientName);
            AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 150, ParameterDirection.Input, clientObj.ClientDescription);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATECLIENT);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public DataSet GetClientByName(string clientName)
        {
            if (clientName.ToString() == "")
                throw new Exception("clientName is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, clientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCLIENTSBYNAME);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetJobCodesByClient(string clientName)
        {

            if (clientName.ToString() == "")
                throw new Exception("clientName is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Client", SqlDbType.VarChar, 100, ParameterDirection.Input, clientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETJOBCODESBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }


        //*********************End*****************************************
        //********************************************************************
        //
        // Mehtods for Advertisements
        //
        //********************************************************************

        public int AddAdvertisement(Advertisement newAdvertisement)
        {
            Object result;

            // Validate Parameters
            if (newAdvertisement == null)
                throw new ArgumentNullException("newAdvertisement");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Title", SqlDbType.VarChar, 260, ParameterDirection.Input, newAdvertisement.Title);
            AddParamToSQLCmd(sqlCmd, "@ClientName", SqlDbType.VarChar, 155, ParameterDirection.Input, newAdvertisement.ClientName);
            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, newAdvertisement.Email);
            AddParamToSQLCmd(sqlCmd, "@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, newAdvertisement.Phone);
            AddParamToSQLCmd(sqlCmd, "@Address", SqlDbType.VarChar, 255, ParameterDirection.Input, newAdvertisement.ContactAddress);
            AddParamToSQLCmd(sqlCmd, "@Image", SqlDbType.VarChar, 50, ParameterDirection.Input, newAdvertisement.Image);
            AddParamToSQLCmd(sqlCmd, "@Reference", SqlDbType.VarChar, 100, ParameterDirection.Input, newAdvertisement.Reference);
            AddParamToSQLCmd(sqlCmd, "@HandPhone", SqlDbType.VarChar, 50, ParameterDirection.Input, newAdvertisement.HandPhone);
            AddParamToSQLCmd(sqlCmd, "@EnteredBy", SqlDbType.VarChar, 50, ParameterDirection.Input, newAdvertisement.EnteredBy);
            AddParamToSQLCmd(sqlCmd, "@HitCount", SqlDbType.Int, 4, ParameterDirection.Input, 0);

            if (newAdvertisement.StartOn == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@startDate", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@startDate", SqlDbType.DateTime, 8, ParameterDirection.Input, newAdvertisement.StartOn);
            }

            if (newAdvertisement.EndOn == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@EndOn", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@EndOn", SqlDbType.DateTime, 8, ParameterDirection.Input, newAdvertisement.EndOn);
            }

            AddParamToSQLCmd(sqlCmd, "@Location", SqlDbType.VarChar, 155, ParameterDirection.Input, newAdvertisement.Location);
            AddParamToSQLCmd(sqlCmd, "@Details", SqlDbType.VarChar, 255, ParameterDirection.Input, newAdvertisement.Details);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADDADVERTISEMENT);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);
        }

        public DataSet GetAllAdvertisements()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLADVERTISEMENT);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAllValidAdvertisements()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLVALIDADS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet GetValidAdvertisementsByClients(Resume newresume)
        {


            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@clientname", SqlDbType.VarChar, 50, ParameterDirection.Input, newresume.ClientName);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETADVERTISEMENTBYCLIENT);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;

        }

        public DataSet GetAddImagebyID(int advertisementID)
        {
            if (advertisementID.ToString() == "")
                throw new Exception("Advertisement ID is not initalized");

            SqlCommand sqlCmd = new SqlCommand();
            //AddParamToSQLCmd(sqlCmd,"@ID",SqlDbType.Int,4,ParameterDirection.Input,advertisementID);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETTADDIMAGE);
            DataSet ds = GetDataSet(sqlCmd);
            return ds;

        }

        public int IsAdvertisementExists(string advertisementTitle)
        {
            // Validate Parameters
            if (advertisementTitle == "")
                throw new ArgumentNullException("No Advertisement Title");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Title", SqlDbType.VarChar, 255, ParameterDirection.Input, advertisementTitle);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISADVERTISEMENTEXISTS);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int IsAdvertisementExists(string advertisementTitle, int id)
        {
            // Validate Parameters
            if (advertisementTitle == "")
                throw new ArgumentNullException("No Advertisement Title");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Title", SqlDbType.VarChar, 100, ParameterDirection.Input, advertisementTitle);
            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.VarChar, 100, ParameterDirection.Input, id);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISADVERTISEMENTEXISTSFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int UpdateAdvertisementStatus(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new ArgumentNullException("Invalid Consultant");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 30, ParameterDirection.Input, newAdvertisement.ID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, newAdvertisement.Status);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEADVERTISEMENTSTATUS);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public int DeleteAdvertisement(int adID)
        {
            int result = 0;

            // Validate Parameters
            if (adID.ToString() == "")
                throw new ArgumentNullException("Advertisement ID is not available");

            DataSet ds = GetJobsByAdId(adID);

            if (ds.Tables[0].Rows.Count <= 0)
            {

                // Execute SQL Command
                SqlCommand sqlCmd = new SqlCommand();

                AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 30, ParameterDirection.Input, adID);

                SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETEADVERTISEMENT);
                result = (int)ExecuteNonQueryCmd(sqlCmd);
            }

            return result;
        }

        public int IsValidAdvtDeletion(int adID)
        {
            int result;

            if (adID.ToString() == null)
                throw new ArgumentNullException("Invalid Consultant");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@adID", SqlDbType.Int, 4, ParameterDirection.Input, adID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISVALIDADVTDELETION);

            result = (int)ExecuteScalarCmd(sqlCmd);

            return result;

        }

        public DataSet GetAdvertisementByID(int advertisementID)
        {
            if (advertisementID.ToString() == "")
                throw new Exception("Consultant ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 2, ParameterDirection.Input, advertisementID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETADVERTISEMENTBYID);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAdvertisementResponses(int advtID)
        {
            // Get various stages of resume for an advertisement

            if (advtID.ToString() == "")
                throw new Exception("Consultant ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@advtID", SqlDbType.Int, 2, ParameterDirection.Input, advtID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETVARIOUSSTAGES);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int UpdateAdvertisement(Advertisement advertisemntObj)
        {
            int result;

            // Validate Parameters
            if (advertisemntObj == null)
                throw new ArgumentNullException("New Advertisement");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 4, ParameterDirection.Input, advertisemntObj.ID);
            AddParamToSQLCmd(sqlCmd, "@Title", SqlDbType.VarChar, 255, ParameterDirection.Input, advertisemntObj.Title);
            AddParamToSQLCmd(sqlCmd, "@ClientName", SqlDbType.VarChar, 150, ParameterDirection.Input, advertisemntObj.ClientName);
            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, advertisemntObj.Email);
            AddParamToSQLCmd(sqlCmd, "@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, advertisemntObj.Phone);
            AddParamToSQLCmd(sqlCmd, "@Address", SqlDbType.VarChar, 255, ParameterDirection.Input, advertisemntObj.ContactAddress);

            AddParamToSQLCmd(sqlCmd, "@FImage", SqlDbType.VarChar, 50, ParameterDirection.Input, advertisemntObj.Image);
            AddParamToSQLCmd(sqlCmd, "@Reference", SqlDbType.VarChar, 100, ParameterDirection.Input, advertisemntObj.Reference);
            AddParamToSQLCmd(sqlCmd, "@HandPhone", SqlDbType.VarChar, 50, ParameterDirection.Input, advertisemntObj.HandPhone);

            if (advertisemntObj.StartOn == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@startOn", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@startOn", SqlDbType.DateTime, 8, ParameterDirection.Input, advertisemntObj.StartOn);
            }

            if (advertisemntObj.EndOn == System.DateTime.MinValue)
            {
                AddParamToSQLCmd(sqlCmd, "@EndOn", SqlDbType.DateTime, 8, ParameterDirection.Input, null);
            }
            else
            {
                AddParamToSQLCmd(sqlCmd, "@EndOn", SqlDbType.DateTime, 8, ParameterDirection.Input, advertisemntObj.EndOn);
            }

            AddParamToSQLCmd(sqlCmd, "@Location", SqlDbType.VarChar, 150, ParameterDirection.Input, advertisemntObj.Location);
            AddParamToSQLCmd(sqlCmd, "@Details", SqlDbType.VarChar, 255, ParameterDirection.Input, advertisemntObj.Details);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEADVERTISEMENT);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public DataSet ShowJobsDetails(string sql)
        {
            if (sql == "")
                throw new Exception("No Search Criteria");

            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.Text, sql);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchAdvertisements(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT * FROM tblAdvertisements WHERE ";

            if (newAdvertisement.Title != "")
            {
                strSQL += " TITLE LIKE '%" + newAdvertisement.Title + "%'";
            }

            if (newAdvertisement.ClientName != "")
            {
                if (newAdvertisement.Title != "")
                {
                    strSQL += " AND Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
                else
                {
                    strSQL += " Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
            }

            if (newAdvertisement.Location != "")
            {
                if ((newAdvertisement.Title != "") || (newAdvertisement.ClientName != ""))
                {
                    strSQL += " AND LOCATION like '%" + newAdvertisement.Location + "%'";
                }
                else
                {
                    strSQL += " LOCATION like '%" + newAdvertisement.Location + "%'";
                }
            }


            if (newAdvertisement.StartOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND STARTON >= '" + newAdvertisement.StartOn.Date.ToShortDateString() + "' ";
                        strSQL += " AND ENDON <= '" + newAdvertisement.EndOn.Date.ToShortDateString() + "' ";
                    }
                    else
                    {
                        strSQL += " STARTON >= '" + newAdvertisement.StartOn.Date.ToShortDateString() + "' ";
                        strSQL += " AND ENDON <= '" + newAdvertisement.EndOn.Date.ToShortDateString() + "' ";
                    }
                }
                else
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND STARTON = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                    }
                    else
                    {
                        strSQL += " STARTON = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                    }
                }

            }

            if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.StartOn <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND ENDON = '" + newAdvertisement.EndOn.Date.ToShortDateString() + "'";
                    }
                    else
                    {
                        strSQL += " ENDON = '" + newAdvertisement.EndOn.Date.ToShortDateString() + "'";
                    }
                }
            }

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet CountryResponse(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";
            strSQL = "select 1,resume_country as country, count(*) as 'countcountry' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 group by resume_country union select 2,'Total Response',count(*) from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet AdvertisementReport(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";
            //strSQL = "select a.title,count(a.title) as 'advtcount' from tbladvertisements as a inner join addresume as b on a.[id] = b.resume_advtname and b.RESUME_STATUS = '1' and a.status=1  group by a.title"; 
            strSQL = "select advert.title,count(advert.title) as 'advtcount' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where b.JOB_STATUS = 1 and c.CLIENT_STATUS= 1 AND a.RESUME_STATUS = 1 group by advert.title";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public DataSet CountryResponseByAdvt(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            if (newAdvertisement.Advt != 0)
            {

                //strSQL = "select 1,resume_country as country, count(*) as 'countcountry' from addresume where resume_advtname = '"+ newAdvertisement.Advt +"' and RESUME_STATUS= 1 group by resume_country union select 2,'Total Response',count(*) from addresume where resume_advtname = '"+ newAdvertisement.Advt +"' and RESUME_STATUS= 1 "; 
                strSQL = "select 1,resume_country as country, count(*) as 'countcountry' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where a.resume_advtname = '" + newAdvertisement.Advt + "' and b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 group by resume_country union select 2,'Total Response',count(*) from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where a.resume_advtname = '" + newAdvertisement.Advt + "' and b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1";
            }
            if (newAdvertisement.Client != "")
            {
                //strSQL = "select 1,resume_country as country, count(*) as 'countcountry' from addresume a inner join tblAdvertisements b on a.RESUME_ADVTNAME= b.ID where b.CLIENT_NAME='" + newAdvertisement.Client +"' and a.RESUME_STATUS= 1 group by resume_country union select 2,'Total Response',count(*) from addresume a inner join tblAdvertisements b on a.RESUME_ADVTNAME= b.ID where b.CLIENT_NAME='" + newAdvertisement.Client +"' and a.RESUME_STATUS= 1"; 
                strSQL = "select 1,resume_country as country, count(*) as 'countcountry' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where c.CLIENT_NAME='" + newAdvertisement.Client + "' and b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 group by resume_country union select 2,'Total Response',count(*) from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where c.CLIENT_NAME='" + newAdvertisement.Client + "' and b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1";
            }


            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchValidAdvertisements(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //strSQL = "SELECT * FROM tblAdvertisements WHERE ";
            strSQL = "select distinct(advert.title),advert.Client_Name,advert.starton,advert.endon,advert.ID from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where";
            //from tbladvertisements b left outer join addresume a on b.[id] = a.resume_advtname WHERE "; 
            if (newAdvertisement.Title != "")
            {
                strSQL += " advert.TITLE LIKE '%" + newAdvertisement.Title + "%'";
            }

            if (newAdvertisement.ClientName != "")
            {
                if (newAdvertisement.Title != "")
                {
                    strSQL += " AND advert.Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
                else
                {
                    strSQL += " advert.Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
            }

            //			if(newAdvertisement.Location != "")
            //			{
            //				if((newAdvertisement.Title !="") || (newAdvertisement.ClientName != ""))
            //				{
            //					strSQL += " AND LOCATION like '%" + newAdvertisement.Location + "%'";
            //				}
            //				else
            //				{
            //					strSQL += " LOCATION like '%" + newAdvertisement.Location + "%'";
            //				}
            //			}

            if (newAdvertisement.Country != "")
            {
                if ((newAdvertisement.Title != "") || (newAdvertisement.ClientName != ""))
                {
                    strSQL += " AND a.RESUME_COUNTRY like '%" + newAdvertisement.Country + "%'";
                }
                else
                {
                    strSQL += " a.RESUME_COUNTRY like '%" + newAdvertisement.Country + "%'";
                }
            }


            if (newAdvertisement.StartOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Country != ""))
                    {
                        //						strSQL += " AND ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //strSQL += " AND starton >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString()+ "',120) between ";
                        strSQL += " AND  a.entered_date >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString() + "',120) AND a.entered_date <=convert(datetime,'" + newAdvertisement.EndOn.Date.ToString() + "',120)";
                        //strSQL += " AND convert(Varchar(10),entered_date,101) between '" + newAdvertisement.StartOn.Date.ToString("MM/dd/yyyy")+ "' and '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                    }
                    else
                    {
                        //						strSQL += " ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //strSQL += "  starton >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString()+ "',120)";
                        strSQL += " a.entered_date >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString() + "',120) AND a.entered_date <=convert(datetime,'" + newAdvertisement.EndOn.Date.ToString() + "',120)";
                        //strSQL += " convert(Varchar(10),entered_date,101) between '" + newAdvertisement.StartOn.Date.ToString("MM/dd/yyyy")+ "' and '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                    }
                }
                else
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Country != ""))
                    {
                        //strSQL += " AND ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "'";
                        strSQL += " AND a.entered_date >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString() + "',120)";
                        //strSQL += " AND convert(Varchar(10),entered_date,101) >= '" + newAdvertisement.StartOn.Date.ToString("MM/dd/yyyy") + "' ";
                    }
                    else
                    {
                        //strSQL += " ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                        strSQL += " a.entered_date >= convert(datetime,'" + newAdvertisement.StartOn.Date.ToShortDateString() + "',120)";
                        //strSQL += " convert(Varchar(10),entered_date,101) >= '" + newAdvertisement.StartOn.Date.ToString("MM/dd/yyyy") + "' ";
                    }
                }

            }

            if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.StartOn <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Country != ""))
                    {
                        //strSQL += " AND convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        strSQL += " AND a.entered_date <= convert(datetime,'" + newAdvertisement.EndOn.Date.ToShortDateString() + "',120)";
                        //strSQL += " AND convert(Varchar(10),entered_date,101) <= '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy") + "' ";
                    }
                    else
                    {
                        //strSQL += " convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        strSQL += " a.entered_date <= convert(datetime,'" + newAdvertisement.EndOn.Date.ToShortDateString() + "',120)";
                        //strSQL += "convert(Varchar(10),entered_date,101) <= '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy") + "' ";
                    }
                }
            }

            strSQL += "AND  b.JOB_STATUS = 1 and c.CLIENT_STATUS= 1 AND a.RESUME_STATUS = 1 order by title asc ";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        /*** INSTANCE METHODS ***/

        //*********************************************************************
        //
        // Role Methods
        //
        // The following methods are used for working with roles.
        //
        //*********************************************************************

        public int CreateNewRole(Role newRole)
        {
            Object result;

            // Validate Parameters
            if (newRole == null)
                throw new ArgumentNullException("newRole");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Rolename", SqlDbType.NVarChar, 30, ParameterDirection.Input, newRole.RoleName);
            AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 256, ParameterDirection.Input, newRole.Description);
            AddParamToSQLCmd(sqlCmd, "@Privileges", SqlDbType.VarChar, 120, ParameterDirection.Input, newRole.Privileges);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, newRole.Status);
            AddParamToSQLCmd(sqlCmd, "@CDate", SqlDbType.DateTime, 0, ParameterDirection.Input, System.DateTime.Now.Date);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_CREATENEWROLE);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);
        }

        public DataSet GetAllRoles()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLROLES);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAllActiveRoles()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETACTIVEROLES);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetRoleBySearch(string roleName)
        {
            // Validate Parameters
            if (roleName == "")
                throw new Exception("Role name is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@Rolename", SqlDbType.VarChar, 30, ParameterDirection.Input, roleName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETAROLEBYSEARCH);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetOnlyRoles()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETONLYROLES);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetSingleRole(int RoleID)
        {
            if (RoleID.ToString() == "")
                throw new Exception("Role ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@RoleID", SqlDbType.Int, 2, ParameterDirection.Input, RoleID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETSINGLEROLE);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        //		public DataSet GetActiveRoles()
        //		{


        public int DeleteRole(int RoleID)
        {
            int result = 0;

            // Validate Parameters
            if (RoleID.ToString() == "")
                throw new ArgumentNullException("newRole");

            DataSet ds = GetAllUsers();

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.RowFilter = "USR_ROLEID=" + RoleID;

                if (dv.Count <= 0)
                {
                    // Execute SQL Command
                    SqlCommand sqlCmd = new SqlCommand();

                    AddParamToSQLCmd(sqlCmd, "@RoleID", SqlDbType.Int, 30, ParameterDirection.Input, RoleID);

                    SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETEROLE);
                    result = (int)ExecuteNonQueryCmd(sqlCmd);
                }
            }

            return result;
        }

        public int IsRoleExists(string roleName)
        {
            // Validate Parameters
            if (roleName == "")
                throw new ArgumentNullException("No Role Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@RoleName", SqlDbType.VarChar, 100, ParameterDirection.Input, roleName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISROLEEXISTS);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int IsRoleExists(string roleName, int roleID)
        {
            // Validate Parameters
            if (roleName == "")
                throw new ArgumentNullException("No Role Name");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@RoleName", SqlDbType.VarChar, 100, ParameterDirection.Input, roleName);
            AddParamToSQLCmd(sqlCmd, "@RoleID", SqlDbType.VarChar, 100, ParameterDirection.Input, roleID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISROLEEXISTSFORUPDATE);
            return (int)ExecuteScalarCmd(sqlCmd);
        }

        public int UpdateRoleStatus(Role newRole)
        {
            if (newRole == null)
                throw new ArgumentNullException("Invalid Role");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@RoleID", SqlDbType.Int, 30, ParameterDirection.Input, newRole.RoleID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, newRole.Status);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEROLESTATUS);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public int UpdateRole(Role roleObj)
        {
            int result;

            // Validate Parameters
            if (roleObj == null)
                throw new ArgumentNullException("NewRole");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@RoleID", SqlDbType.Int, 30, ParameterDirection.Input, roleObj.RoleID);
            AddParamToSQLCmd(sqlCmd, "@Rolename", SqlDbType.VarChar, 100, ParameterDirection.Input, roleObj.RoleName);
            AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 200, ParameterDirection.Input, roleObj.Description);
            AddParamToSQLCmd(sqlCmd, "@Privileges", SqlDbType.VarChar, 50, ParameterDirection.Input, roleObj.Privileges);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, roleObj.Status);
            AddParamToSQLCmd(sqlCmd, "@CDate", SqlDbType.DateTime, 8, ParameterDirection.Input, DateTime.Now);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEROLE);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        //********************************************************************
        // Admin Settings Methods
        //*********************************************************************

        public DataSet GetAdminSettings()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETADMINSETTINGS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetEmailIDsByStatus(int statusID, string jobCode, string fromdate, string todate)
        {
            // Send Email by resume stages

            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@statusID", SqlDbType.Int, 4, ParameterDirection.Input, statusID);
            AddParamToSQLCmd(sqlCmd, "@jobCode", SqlDbType.VarChar, 62, ParameterDirection.Input, jobCode);
            AddParamToSQLCmd(sqlCmd, "@fromdate", SqlDbType.VarChar, 10, ParameterDirection.Input, fromdate);
            AddParamToSQLCmd(sqlCmd, "@todate", SqlDbType.VarChar, 10, ParameterDirection.Input, todate);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_SENDEMAILBYSTATUS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;

        }

        public DataSet GetAllPrevileges()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLPRIVILEGES);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAllPrevileges(string pageUrl)
        {
            SqlCommand sqlCmd = new SqlCommand();
            AddParamToSQLCmd(sqlCmd, "@PageUrl", SqlDbType.VarChar, 100, ParameterDirection.Input, pageUrl);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLPRIVILEGESBYPAGENAME);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int AddAdminMessage(AdminSettings objAdmin)
        {
            Object result;

            // Validate Parameters
            if (objAdmin == null)
                throw new ArgumentNullException("newAdmin");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@AdminName", SqlDbType.NVarChar, 30, ParameterDirection.Input, objAdmin.Name);
            AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, objAdmin.EMail);
            AddParamToSQLCmd(sqlCmd, "@WelcomeMsg", SqlDbType.Text, 2000, ParameterDirection.Input, objAdmin.WelcomeTxt);
            AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.VarChar, 30, ParameterDirection.Input, objAdmin.UserName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ADMINMESSAGE);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);

        }

        public int UpdatePassWord(AdminSettings objAdmin)
        {
            Object result;

            // Validate Parameters
            if (objAdmin == null)
                throw new ArgumentNullException("newAdmin");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@LoginName", SqlDbType.NVarChar, 50, ParameterDirection.Input, objAdmin.UserName);
            AddParamToSQLCmd(sqlCmd, "@PWD", SqlDbType.VarChar, 50, ParameterDirection.Input, objAdmin.PassWord);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_CHANGEPASSWORD);
            result = ExecuteNonQueryCmd(sqlCmd);

            return System.Convert.ToInt32(result);
        }

        //*********************************************************************
        //
        // SQL Helper Methods
        //
        // The following utility methods are used to interact with SQL Server.
        //
        //*********************************************************************

        public int ValidateLogin(string loginName, string password)
        {
            if (loginName == "")
                throw new Exception("Login Name not initialized");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@LoginName", SqlDbType.VarChar, 100, ParameterDirection.Input, loginName);
            AddParamToSQLCmd(sqlCmd, "@Password", SqlDbType.VarChar, 50, ParameterDirection.Input, password);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_VALIDATELOGIN);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public string GetPrivlegeByUser(string loginName)
        {
            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@login", SqlDbType.VarChar, 50, ParameterDirection.Input, loginName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETUSERPRIVLIGES);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (string)results;
            }

            return "";
        }

        public string GetClientNameByUser(string userName)
        {
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@login", SqlDbType.VarChar, 50, ParameterDirection.Input, userName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCLIENTNAMEBYCLIENT);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results.ToString() != "")
            {
                return (string)results;
            }
            else
            {
                return "";
            }

        }

        public DataSet GetAllUsers()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLUSERS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int InsertNewUser(User userObj)
        {
            int result;
            // Validate Parameters
            if (userObj == null)
                throw new ArgumentNullException("User");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.NVarChar, 50, ParameterDirection.Input, userObj.UserName);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 50, ParameterDirection.Input, userObj.Designation);
            AddParamToSQLCmd(sqlCmd, "@Emailid", SqlDbType.VarChar, 50, ParameterDirection.Input, userObj.Emailid);
            AddParamToSQLCmd(sqlCmd, "@Login", SqlDbType.VarChar, 50, ParameterDirection.Input, userObj.LoginName);
            AddParamToSQLCmd(sqlCmd, "@UserPwd", SqlDbType.VarChar, 25, ParameterDirection.Input, userObj.UserPWD);
            AddParamToSQLCmd(sqlCmd, "@UserType", SqlDbType.VarChar, 8, ParameterDirection.Input, userObj.UserType);
            AddParamToSQLCmd(sqlCmd, "@UserRoleID", SqlDbType.Int, 2, ParameterDirection.Input, userObj.RoleID);

            AddParamToSQLCmd(sqlCmd, "@UsrPrivilege", SqlDbType.VarChar, 255, ParameterDirection.Input, userObj.Privileges);
            AddParamToSQLCmd(sqlCmd, "@UserStatus", SqlDbType.Bit, 2, ParameterDirection.Input, userObj.Status);
            AddParamToSQLCmd(sqlCmd, "@CreatedDate", SqlDbType.DateTime, 8, ParameterDirection.Input, userObj.dt);
            AddParamToSQLCmd(sqlCmd, "@Client", SqlDbType.VarChar, 70, ParameterDirection.Input, userObj.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_INSERTNEWUSER);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public int UpdateUserStatus(User userObj)
        {
            if (userObj == null)
                throw new ArgumentNullException("Invalid User");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserID", SqlDbType.Int, 4, ParameterDirection.Input, userObj.UserID);
            AddParamToSQLCmd(sqlCmd, "@Status", SqlDbType.Bit, 2, ParameterDirection.Input, userObj.Status);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEUSERTATUS);

            object results;

            results = ExecuteScalarCmd(sqlCmd);

            if (results != null)
            {
                return (int)results;
            }

            return 0;
        }

        public int DeleteUser(int UserID)
        {
            int result;

            // Validate Parameters
            if (UserID.ToString() == "")
                throw new ArgumentNullException("newUser");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserID", SqlDbType.Int, 4, ParameterDirection.Input, UserID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_DELETEUSER);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public DataSet GetUser(string UserName, string Loginname)
        {
            // Validate Parameters
            if (UserName == "" && Loginname == "")
                throw new Exception("User name/Login Name is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            if ((UserName != null) && (Loginname != null))
            {
                AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.VarChar, 30, ParameterDirection.Input, UserName);
                AddParamToSQLCmd(sqlCmd, "@LoginName", SqlDbType.VarChar, 30, ParameterDirection.Input, Loginname);
                SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETEUSERBYBOTH);
            }
            else if (UserName != null)
            {
                AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.VarChar, 30, ParameterDirection.Input, UserName);
                SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETUSERBYNAME);
            }
            else if (Loginname != null)
            {
                AddParamToSQLCmd(sqlCmd, "@LoginName", SqlDbType.VarChar, 30, ParameterDirection.Input, Loginname);
                SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETUSERBYLOGINNAME);
            }

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetSingleUser(int UserID)
        {
            if (UserID.ToString() == "")
                throw new Exception("User ID is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserID", SqlDbType.Int, 2, ParameterDirection.Input, UserID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETSINGLEUSER);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public int UpdateUser(User userObj)
        {
            int result;
            // Validate Parameters
            //			if ( userObj == null )
            //				throw new ArgumentNullException("User");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserID", SqlDbType.Int, 4, ParameterDirection.Input, userObj.UserID);
            AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.NVarChar, 50, ParameterDirection.Input, userObj.UserName);
            AddParamToSQLCmd(sqlCmd, "@Designation", SqlDbType.VarChar, 50, ParameterDirection.Input, userObj.Designation);
            AddParamToSQLCmd(sqlCmd, "@Emailid", SqlDbType.VarChar, 100, ParameterDirection.Input, userObj.Emailid);
            AddParamToSQLCmd(sqlCmd, "@Login", SqlDbType.VarChar, 50, ParameterDirection.Input, userObj.LoginName);
            AddParamToSQLCmd(sqlCmd, "@UserPWD", SqlDbType.VarChar, 25, ParameterDirection.Input, userObj.UserPWD);
            AddParamToSQLCmd(sqlCmd, "@UserType", SqlDbType.VarChar, 8, ParameterDirection.Input, userObj.UserType);
            AddParamToSQLCmd(sqlCmd, "@UserRoleID", SqlDbType.Int, 2, ParameterDirection.Input, userObj.RoleID);
            AddParamToSQLCmd(sqlCmd, "@UsrPrivilege", SqlDbType.VarChar, 255, ParameterDirection.Input, userObj.Privileges);
            AddParamToSQLCmd(sqlCmd, "@UserStatus", SqlDbType.Bit, 2, ParameterDirection.Input, userObj.Status);
            AddParamToSQLCmd(sqlCmd, "@CreatedDate", SqlDbType.DateTime, 8, ParameterDirection.Input, userObj.dt);
            AddParamToSQLCmd(sqlCmd, "@Client", SqlDbType.VarChar, 70, ParameterDirection.Input, userObj.ClientName);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEUSER);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;
        }

        public int isLoginNameExist(string UserName)
        {
            if (UserName == "")
                throw new Exception("User Name is not initialized");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@LoginName", SqlDbType.VarChar, 40, ParameterDirection.Input, UserName);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISLOGINEXISTS);

            return (int)ExecuteScalarCmd(sqlCmd);

        }

        public int IsUserExist(string userName, int userID)
        {
            if (userName == "")
                throw new Exception("User Name is not initialized");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@UserName", SqlDbType.VarChar, 40, ParameterDirection.Input, userName);
            AddParamToSQLCmd(sqlCmd, "@UserID", SqlDbType.Int, 2, ParameterDirection.Input, userID);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ISUSEREXIST);

            return (int)ExecuteScalarCmd(sqlCmd);
        }


        //********************************************************************
        //
        // Mehtods for Search
        //
        //********************************************************************
        public DataSet GetClientStatus()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLCVSTATUS);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        public DataSet GetAllCandidates()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCANDIDATES);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }
        public DataSet GetCountAllCandidates()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCOUNTCANDIDATES);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }
        public DataSet SearchCountACandidate(CandidateStatus newCandidate)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //sureshchanges 21/3/08
            strSQL += "SELECT   count (distinct(a.candidate)) as 'count' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  inner join candidatestatustrack e on a.candidate= e.regno   where";


            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                {
                    strSQL += " d.CV_ID = " + newCandidate.Status;
                    strSQL += " AND d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " d.CV_ID = '" + newCandidate.Status + "' ";
                    strSQL += " AND d.CV_ID = a.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                {
                    strSQL += " d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " d.CV_ID = a.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR a.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }
            if (newCandidate.Advtid != "")
            {
                strSQL += "and a.resume_advtname='" + newCandidate.Advtid + "' ";
            }

            if (newCandidate.JobCode != "")
            {
                strSQL += " AND b.JOB_CODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND a.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND a.RESUME_JOBCODE = b.JOB_CODE  ";
            }
            if (newCandidate.ClientName != "")
            {
                strSQL += "and advert.client_name='" + newCandidate.ClientName + "'";

            }
            if (newCandidate.CandidateName != "")
            {
                strSQL += " AND (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_FAMILYNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newCandidate.CandidateName + "%') ";
            }
            if (newCandidate.Regno != "")
            {
                strSQL += " AND a.candidate LIKE '" + newCandidate.Regno + "%' ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND a.RESUME_COUNTRY LIKE '" + newCandidate.Country + "' ";
            }
            if (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newCandidate.RegToDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                        //						strSQL += " AND ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                //suresh 17/04/2008        strSQL += " AND a.[resume_datetime] between convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND e.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and e.[Modified_date] < DATEADD(DAY,1,convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)) ";
                        
                    }
                    else
                    {
                        //						strSQL += " ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                        //suresh 17/04/2008       strSQL += " and a.[resume_datetime] between convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)";
                        strSQL += " AND e.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and e.[Modified_date] < DATEADD(DAY,1,convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)) ";
                    }
                }
                else
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                   //strSQL += " AND ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "'";
                  //suresh 17/04/2008     strSQL += " AND a.[resume_datetime] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND e.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //strSQL += " ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                        //suresh 17/04/2008     strSQL += " AND a.[resume_datetime] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND e.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                    }
                }

            }

            if (newCandidate.RegToDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newCandidate.RegFromDate <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                        //strSQL += " AND convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        //suresh 17/04/2008   strSQL += " AND a.[resume_datetime] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND e.[Modified_date] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //strSQL += " convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                        //suresh 17/04/2008   strSQL += " AND a.[resume_datetime] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND e.[Modified_date] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                    }
                }
            }

            strSQL += " AND b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }


        public DataSet SearchACandidate(CandidateStatus newCandidate)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //strSQL += "SELECT a.*,d.CV_STATUS,b.JOB_TITLE from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where";
            //suresh changes21/3/08--strSQL += "SELECT a.*,d.CV_STATUS,b.JOB_TITLE, CASE WHEN ReasonMaster.Rid=0 THEN '' ELSE Reason END AS Reason from addresume a inner join ReasonMaster on a.Remarks = ReasonMaster.RId inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where";
            strSQL += "select a.*, max (c.[Modified_date]) as ModifiedDate,d.CV_STATUS,b.JOB_TITLE, CASE WHEN ReasonMaster.Rid=0 THEN '' ELSE Reason END AS Reason from addresume a inner join  candidatestatustrack c on a.candidate=c.regno right outer join ReasonMaster on a.Remarks = ReasonMaster.RId inner join CVStatus d on a.RESUME_STAGE =d.CV_ID inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient e on e.client_name = advert.client_name  where";

            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                {
                    strSQL += " d.CV_ID = " + newCandidate.Status;
                    strSQL += " AND d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " d.CV_ID = '" + newCandidate.Status + "' ";
                    strSQL += " AND d.CV_ID = a.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                {
                    strSQL += " d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " d.CV_ID = a.RESUME_STAGE ";
                }
            }
            if (newCandidate.ClientName != "")
            {
                strSQL += "and advert.client_name='" + newCandidate.ClientName + "'";

            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR a.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }
            if (newCandidate.Advtid != "")
            {
                strSQL += "and a.resume_advtname='" + newCandidate.Advtid + "' ";
            }

            if (newCandidate.JobCode != "")
            {
                strSQL += " AND b.JOB_CODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND a.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND a.RESUME_JOBCODE = b.JOB_CODE  ";
            }

            if (newCandidate.CandidateName != "")
            {
                strSQL += " AND (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_FAMILYNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newCandidate.CandidateName + "%') ";
            }
            if (newCandidate.Regno != "")
            {
                strSQL += " AND a.candidate LIKE '" + newCandidate.Regno + "%' ";
            }
            if (newCandidate.Country != "")
            {
                strSQL += " AND a.RESUME_COUNTRY LIKE '" + newCandidate.Country + "' ";
            }
            if (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newCandidate.RegToDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                        //						strSQL += " AND ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                        //20-03-08 comment by sureshfor dateformat in statustrack---   strSQL += " AND a.[resume_datetime] between convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and c.[Modified_date] < DATEADD(DAY,1,convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)) ";
                                                                                                                                                                               
                    }
                    else
                    {
                        //						strSQL += " ENTERED_DATE >= '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "' ";
                        //						strSQL += " AND ENTERED_DATE <= '" + newAdvertisement.EndOn.Date.ToShortDateString()+ "' ";
                        //17-03-08 comment by sureshfor dateformat in statustrack---     strSQL += " and a.[resume_datetime] between convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)";
                        strSQL += " and c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) and c.[Modified_date] < DATEADD(DAY,1,convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120)) ";
                    }
                }
                else
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                        //strSQL += " AND ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString()+ "'";
                        //17-03-08 comment by sureshfor dateformat in statustrack--- strSQL += " AND a.[resume_datetime] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                          strSQL += " AND c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                    }
                    else
                    {
                        //strSQL += " ENTERED_DATE = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                        //17-03-08 comment by sureshfor dateformat in statustrack--- strSQL += " and a.[resume_datetime] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                            strSQL += " and c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                    }
                }

            }

            if (newCandidate.RegToDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newCandidate.RegFromDate <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.CandidateName != "") || (newCandidate.Advtid != ""))
                    {
                        //strSQL += " AND convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                       //17-03-08 comment by sureshfor dateformat in statustrack---   strSQL += " AND a.[resume_datetime] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                         
                    }
                    else
                    {
                        //strSQL += " convert(Varchar(10),entered_date,101) = '" + newAdvertisement.EndOn.Date.ToString("MM/dd/yyyy")+ "'";
                         //17-03-08 comment by sureshfor dateformat in statustrack---  strSQL += " AND a.[resume_datetime] <= convert(datetime,'" + newCandidate.RegToDate.Date.ToShortDateString() + "',120) ";
                        strSQL += " AND c.[Modified_date] >= convert(datetime,'" + newCandidate.RegFromDate.Date.ToShortDateString() + "',120) ";
                    }
                }
            }


                //21-03-08 comment by sureshfor dateformat in statustrack---  strSQL += " AND  b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 ORDER BY Candidate ";
            strSQL += " AND  b.JOB_STATUS = 1 and e.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 group by a.RESUMECODE,a.RESUME_JOBCODE,a.RESUME_FIRSTNAME,a.RESUME_MIDDLENAME,a.RESUME_FAMILYNAME,a.RESUME_DOB,a.RESUME_NATIONALITY,a.RESUME_EMAILD1,a.RESUME_EMAILID2,a.RESUME_TELEPHONENO,a.RESUME_OTHERTELEPHONE,a.RESUME_HANDTELEPHONE,a.RESUME_POSTALADDRESS,a.RESUME_POSTALADDRESS2,a.RESUME_CITY,a.RESUME_COUNTRY,a.RESUME_EXTENSION,a.RESUME_CONSULTANTNAME,a.RESUME_ADVTNAME,a.RESUME_STATUS,a.RESUME_STAGE,a.Candidate,a.RESUME_DATETIME,a.Remarks,a.EnteredBy,a.ModifiedBy,a.Modified_Date,a.Resume_Employer,a.Resume_Designation,a.Resume_Experience,a.Resume_Qualification,a.IsProcessed, d.CV_STATUS,b.JOB_TITLE,Reason,ReasonMaster.Rid ORDER BY Candidate ";
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchPostedResumes(CandidateStatus newCandidate)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL += "SELECT distinct(a.Resumecode) as Resumecode,a.*,(a.resume_firstname + ' ' +  a.resume_middlename+ ' ' + a.resume_familyname) as candidatename,d.CV_STATUS,b.JOB_TITLE from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where ";


            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.keyword != "") || (newCandidate.Regno != "") || (newCandidate.CandidateName != "") || (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) || (newCandidate.Advtid != "") || (newCandidate.ClientName != ""))
                {
                    strSQL += "  d.CV_ID = " + newCandidate.Status;
                    strSQL += "  AND d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    //strSQL += "  CVStatus.CV_ID LIKE '"+ newCandidate.Status +"%' ";
                    strSQL += "  d.CV_ID = " + newCandidate.Status;
                    strSQL += "  AND d.CV_ID = a.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.keyword != "") || (newCandidate.Regno != "") || (newCandidate.CandidateName != "") || (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) || (newCandidate.Advtid != "") || (newCandidate.ClientName != ""))
                {
                    strSQL += "  d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " and d.CV_ID = a.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR a.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }
            if (newCandidate.Advtid != "0")
            {
                strSQL += "and a.resume_advtname='" + newCandidate.Advtid + "'";
            }
            if (newCandidate.ClientName != "0")
            {
                strSQL += "and c.client_name='" + newCandidate.ClientName + "'";

            }
            if (newCandidate.JobCode != "")
            {
                strSQL += " AND b.JOB_CODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND a.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND a.RESUME_JOBCODE = b.JOB_CODE  ";
            }

            if (newCandidate.Consultants != null)
            {
                strSQL += " and a.resume_consultantname='" + newCandidate.Consultants + "'";
            }


            if (newCandidate.CandidateName != "")
            {
                strSQL += " and (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_FAMILYNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newCandidate.CandidateName + "%') ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND a.RESUME_COUNTRY LIKE '%" + newCandidate.Country + "' ";
            }
            if (newCandidate.Regno != "")
            {
                strSQL += " AND a.candidate = '" + newCandidate.Regno + "' ";
            }

            if (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                strSQL += " AND a.RESUME_DATETIME BETWEEN '" + newCandidate.RegFromDate + "'";
                strSQL += " AND '" + newCandidate.RegToDate + "' ";
            }
                //suresh
            if ((newCandidate.ClientName != "") && (newCandidate.JobCode == "Select Jobs Code - jobs Title") && (newCandidate.CandidateEmail == "") && (newCandidate.Country == "") && (newCandidate.keyword == "") && (newCandidate.Regno == "") && (newCandidate.CandidateName == "") && (newCandidate.RegFromDate == System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) && (newCandidate.Advtid == "0") )
            
           
           {
              strSQL = "SELECT distinct(a.Resumecode) as Resumecode,a.*,(a.resume_firstname + ' ' +  a.resume_middlename+ ' ' + a.resume_familyname) as candidatename,d.CV_STATUS,b.JOB_TITLE from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where   d.CV_ID = a.RESUME_STAGE and c.client_name='" + newCandidate.ClientName + "'";

           }

            if (newCandidate.keyword != "")
            {
                strSQL += " and (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.keyword + "%' or a.RESUME_JOBCODE LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_MIDDLENAME LIKE '%" + newCandidate.keyword + "%' or a.RESUME_FAMILYNAME LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_NATIONALITY LIKE '%" + newCandidate.keyword + "%' or a.RESUME_EMAILD1 LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_EMAILID2 LIKE '%" + newCandidate.keyword + "%' or a.candidate LIKE '%" + newCandidate.keyword + "%' or a.RESUME_TELEPHONENO LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_JOBCODE  LIKE '%" + newCandidate.keyword + "%'  or a.RESUME_HANDTELEPHONE  LIKE '%" + newCandidate.keyword + "%'  ";
                strSQL += " or a.RESUME_OTHERTELEPHONE LIKE '%" + newCandidate.keyword + "%' or a.Resume_Designation LIKE '%" + newCandidate.keyword + "%'";
                strSQL += " or a.RESUME_POSTALADDRESS LIKE '%" + newCandidate.keyword + "%' or a.Resume_Qualification LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_CITY  LIKE '%" + newCandidate.keyword + "%' or a.RESUME_COUNTRY LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.Resume_Employer  LIKE '%" + newCandidate.keyword + "%'  or b.JOB_TITLE LIKE '%" + newCandidate.keyword + "%') ";


            }


            strSQL += " and b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 ORDER BY Candidate";
            //			Log.Write("C:\\ARPDate.txt",strSQL);
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchcountPostedResumes(CandidateStatus newCandidate)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL += "SELECT count(distinct (a.Resumecode)) as 'count' from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where";

            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.keyword != "") || (newCandidate.Regno != "") || (newCandidate.CandidateName != "") || (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) || (newCandidate.Advtid != "") || (newCandidate.ClientName != ""))
                {
                    strSQL += "  d.CV_ID = " + newCandidate.Status;
                    strSQL += "  AND d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    //strSQL += "  CVStatus.CV_ID LIKE '"+ newCandidate.Status +"%' ";
                    strSQL += "  d.CV_ID = " + newCandidate.Status;
                    strSQL += "  AND d.CV_ID = a.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.keyword != "") || (newCandidate.Regno != "") || (newCandidate.CandidateName != "") || (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) || (newCandidate.Advtid != "") || (newCandidate.ClientName != ""))
                {
                    strSQL += "  d.CV_ID = a.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " and d.CV_ID = a.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (a.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR a.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }

            if (newCandidate.Consultants != null)
            {
                strSQL += "and a.resume_consultantname='" + newCandidate.Consultants + "'";

            }
            if (newCandidate.Advtid != "0")
            {
                strSQL += "and a.resume_advtname='" + newCandidate.Advtid + "'";
            }
            if (newCandidate.ClientName != "0")
            {
                strSQL += "and c.client_name='" + newCandidate.ClientName + "'";

            }


            if (newCandidate.JobCode != "")
            {
                strSQL += " AND b.JOB_CODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND a.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND a.RESUME_JOBCODE = b.JOB_CODE  ";
            }

            if (newCandidate.CandidateName != "")
            {
                strSQL += " and (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_FAMILYNAME LIKE '%" + newCandidate.CandidateName + "%' OR a.RESUME_MIDDLENAME LIKE '%" + newCandidate.CandidateName + "%') ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND a.RESUME_COUNTRY LIKE '%" + newCandidate.Country + "' ";
            }
            if (newCandidate.Regno != "")
            {
                strSQL += " AND a.candidate = '" + newCandidate.Regno + "' ";
            }

            if (newCandidate.RegFromDate > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                strSQL += " AND a.RESUME_DATETIME BETWEEN '" + newCandidate.RegFromDate + "'";
                strSQL += " AND '" + newCandidate.RegToDate + "' ";
            }

            if (newCandidate.keyword != "")
            {
                strSQL += " and (a.RESUME_FIRSTNAME LIKE '%" + newCandidate.keyword + "%' or a.RESUME_JOBCODE LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_MIDDLENAME LIKE '%" + newCandidate.keyword + "%' or a.RESUME_FAMILYNAME LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_NATIONALITY LIKE '%" + newCandidate.keyword + "%' or a.RESUME_EMAILD1 LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_EMAILID2 LIKE '%" + newCandidate.keyword + "%' or a.candidate LIKE '%" + newCandidate.keyword + "%' or a.RESUME_TELEPHONENO LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_JOBCODE  LIKE '%" + newCandidate.keyword + "%'  or a.RESUME_HANDTELEPHONE  LIKE '%" + newCandidate.keyword + "%'  ";
                strSQL += " or a.RESUME_OTHERTELEPHONE LIKE '%" + newCandidate.keyword + "%' or a.Resume_Designation LIKE '%" + newCandidate.keyword + "%'";
                strSQL += " or a.RESUME_POSTALADDRESS LIKE '%" + newCandidate.keyword + "%' or a.Resume_Qualification LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.RESUME_CITY  LIKE '%" + newCandidate.keyword + "%' or a.RESUME_COUNTRY LIKE '%" + newCandidate.keyword + "%' ";
                strSQL += " or a.Resume_Employer  LIKE '%" + newCandidate.keyword + "%'  or b.JOB_TITLE LIKE '%" + newCandidate.keyword + "%') ";


            }

            //suresh
            if ((newCandidate.ClientName != "") && (newCandidate.JobCode == "Select Jobs Code - jobs Title") && (newCandidate.CandidateEmail == "") && (newCandidate.Country == "") && (newCandidate.keyword == "") && (newCandidate.Regno == "") && (newCandidate.CandidateName == "") && (newCandidate.RegFromDate == System.Convert.ToDateTime("1/1/0001 12:00:00 AM")) && (newCandidate.Advtid == "0"))
            {
                strSQL = "Select  count(distinct (a.Resumecode)) as 'count'  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where   d.CV_ID = a.RESUME_STAGE and c.client_name='" + newCandidate.ClientName + "'";

            }

           // else
           // {
            //    strSQL ="Select  count(distinct (a.Resumecode)) as 'count'  from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name inner join CVStatus d on a.RESUME_STAGE =d.CV_ID  where   d.CV_ID = a.RESUME_STAGE and c.client_name='" + newCandidate.ClientName + "'";

           // }

            strSQL += " and  b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND a.RESUME_STATUS = 1 ";
            //			Log.Write("C:\\ARPDate.txt",strSQL);
            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAResumeStatus(int statusID, string userName)
        {
            if (statusID < 0)
                throw new Exception("Resume Status is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            //AddParamToSQLCmd(sqlCmd, "@statusID", SqlDbType.Int, 4, ParameterDirection.Input, statusID );
            //AddParamToSQLCmd(sqlCmd, "@User", SqlDbType.VarChar, 50, ParameterDirection.Input, userName );

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLCVSTATUS);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        public DataSet GetAdminStatus(int statusID, string userName)
        {
            if (statusID < 0)
                throw new Exception("Resume Status is not initialized");

            SqlCommand sqlCmd = new SqlCommand();

            //AddParamToSQLCmd(sqlCmd, "@statusID", SqlDbType.Int, 4, ParameterDirection.Input, statusID );
            //AddParamToSQLCmd(sqlCmd, "@User", SqlDbType.VarChar, 50, ParameterDirection.Input, userName );

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETADMINCVSTATUS);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }


        public int GetLocationList(string JobCode)
        {

            int locationid;
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_LOADLOCATIONLIST);
            AddParamToSQLCmd(sqlCmd, "@JobCode", SqlDbType.VarChar, 30, ParameterDirection.Input, JobCode);
            DataSet cvSet = GetDataSet(sqlCmd);
            if (cvSet.Tables[0].Rows.Count > 0)
            {
                locationid = Convert.ToInt32(cvSet.Tables[0].Rows[0]["InterviewLocationId"]);
                locationid--;
            }
            else
            {
                locationid = -1;
            }
            return locationid;
        }
        public DataSet LoadLocationList()
        {


            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_LOADALLLOCATIONLIST);

            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        public int ChangeResumeStage(CandidateStatus newCandt, int stageID)
        {
            if (stageID < 0)
                throw new Exception("Resume Stage is not initialized");

            if (newCandt == null)
                throw new Exception(" Candidate is not initialized ");
            DateTime modifiedDate = System.DateTime.Now;

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@StageID", SqlDbType.Int, 2, ParameterDirection.Input, stageID);
           //24-04-08 AddParamToSQLCmd(sqlCmd, "@Email", SqlDbType.VarChar, 50, ParameterDirection.Input, newCandt.CandidateEmail);
            AddParamToSQLCmd(sqlCmd, "@Regno", SqlDbType.VarChar, 20, ParameterDirection.Input, newCandt.Regno);
            AddParamToSQLCmd(sqlCmd, "@JobCode", SqlDbType.VarChar, 50, ParameterDirection.Input, newCandt.JobCode);
            AddParamToSQLCmd(sqlCmd, "@Remarks", SqlDbType.VarChar, 100, ParameterDirection.Input, newCandt.Remarks);
            AddParamToSQLCmd(sqlCmd, "@modifiedBy", SqlDbType.VarChar, 50, ParameterDirection.Input, newCandt.CandidateName);
            AddParamToSQLCmd(sqlCmd, "@modifyDate", SqlDbType.DateTime, 8, ParameterDirection.Input, modifiedDate);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_CHANGERESUMESTAGE);

            return (int)ExecuteNonQueryCmd(sqlCmd);

        }
        public int UpdateInterviewDetail(string ResumeCode, int InterviewLocation, string InterviewDate)
        {
            //			if ( stageID < 0 )
            //				throw new Exception("Resume Stage is not initialized");
            //
            //			if ( newCandt == null )
            //				throw new Exception(" Candidate is not initialized ");
            DateTime modifiedDate = System.DateTime.Now;

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@ResumeCode", SqlDbType.VarChar, 50, ParameterDirection.Input, ResumeCode);
            AddParamToSQLCmd(sqlCmd, "@InterviewLocation", SqlDbType.Int, 2, ParameterDirection.Input, InterviewLocation);
            AddParamToSQLCmd(sqlCmd, "@InterviewDate", SqlDbType.VarChar, 30, ParameterDirection.Input, InterviewDate);


            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_UPDATEINTERVIEWDETAILS);

            return (int)ExecuteNonQueryCmd(sqlCmd);

        }

        public DataSet GetPostedcountResumes()
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCountALLRESUME);
            DataSet cvSet = GetDataSet(sqlCmd);
            return cvSet;
        }
        public DataSet GetPostedResumes()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETALLRESUME);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        //****************************
        // Methods of Each client
        //****************************

        public DataSet GetResumesByClient(string alljobcodes, int whichpage)
        {
            if (alljobcodes == "")
                throw new Exception(" Job codes not initialized ");

            string strSQL = "";
            SqlCommand sqlCmd = new SqlCommand();

            if (whichpage == 0)
            {
                ////strSQL += "SELECT AddResume.*,(AddResume.resume_firstname + ' ' +  AddResume.resume_middlename+ ' ' + AddResume.resume_familyname) as candidatename,";
                ////strSQL += "CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE,'' as InterviewLocation  FROM AddResume, CVStatus, InsertNewJobs WHERE " ;				
                ////strSQL +=" SELECT AddResume.*,(AddResume.resume_firstname + ' ' +  AddResume.resume_middlename+ ' ' + AddResume.resume_familyname) as candidatename,interviewdetails.*,";
                ////strSQL +=" CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE FROM AddResume left outer join interviewdetails  on AddResume.candidate = interviewdetails.resumecode, CVStatus, InsertNewJobs where";
                //strSQL += "SELECT AddResume.*,CVStatus.CV_STATUS,insertnewjobs.JOB_TITLE,interviewdetails.*,(AddResume.resume_firstname + ' ' +  AddResume.resume_middlename+ ' ' + AddResume.resume_familyname) as candidatename from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_STAGE =CVStatus.CV_ID left outer join interviewdetails  on AddResume.candidate = interviewdetails.resumecode where";
                //strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE AND AddResume.RESUME_JOBCODE IN ( ";
                //strSQL += alljobcodes;
                //strSQL += " ) AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddResume.Resume_Status=1 ORDER BY Candidate ";


                strSQL += "SELECT AddResume.RESUME_COUNTRY,AddResume.Resume_Qualification, AddResume.Resume_Designation, AddResume.Resume_Experience, AddResume.Candidate, AddResume.RESUME_JOBCODE,  AddResume.Resume_FirstName + ' ' + AddResume.Resume_MiddleName + ' ' + AddResume.Resume_FamilyName AS CandidateName, " +
       "AddResume.Candidate, AddResume.Resume_Emaild1, AddResume.Resume_Extension, AddResume.Resume_Stage, AddResume.ModifiedBy, AddResume.Modified_Date, AddResume.Remarks, " +
       "InsertNewJobs.Job_Title, CVStatus.Cv_Status , CASE WHEN ReasonMaster.Rid=0 THEN '' ELSE Reason END AS Reason from addresume inner join ReasonMaster on addResume.Remarks = ReasonMaster.RId inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME " +
       "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails  " +
       " ON AddResume.candidate = interviewdetails.resumecode where " +
       " AddResume.RESUME_JOBCODE IN (" + alljobcodes + ") " +
       " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "' ORDER BY Candidate ";

            }
            else
            {
                //// strSQL += "SELECT AddResume.*,";					
                // // strSQL += "CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE,'' as InterviewLocation FROM AddResume, CVStatus, InsertNewJobs ";
                // // strSQL += "SELECT AddResume.*,interviewdetails.*,";					
                //  //strSQL += "CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE,'' as InterviewLocation FROM AddResume, CVStatus, InsertNewJobs,interviewdetails ";
                // strSQL += "SELECT AddResume.*,CVStatus.CV_STATUS,insertnewjobs.JOB_TITLE,interviewdetails.*,(AddResume.resume_firstname + ' ' +  AddResume.resume_middlename+ ' ' + AddResume.resume_familyname) as candidatename from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_STAGE =CVStatus.CV_ID left outer join interviewdetails  on AddResume.candidate = interviewdetails.resumecode where";
                // strSQL += " CVStatus.CV_ID =  AddResume.RESUME_STAGE AND AddResume.RESUME_JOBCODE IN (";		
                // strSQL += alljobcodes;
                // strSQL += ") AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE  AND AddResume.Resume_Status=1 ORDER BY Candidate ";

                strSQL += "SELECT AddResume.RESUME_COUNTRY,AddResume.Resume_Qualification, AddResume.Resume_Designation, AddResume.Resume_Experience, AddResume.Candidate, AddResume.RESUME_JOBCODE,  AddResume.Resume_FirstName + ' ' + AddResume.Resume_MiddleName + ' ' + AddResume.Resume_FamilyName AS CandidateName, " +
      "AddResume.Candidate, AddResume.Resume_Extension, AddResume.Resume_Stage, AddResume.ModifiedBy, AddResume.Modified_Date, AddResume.Remarks, " +
      "InsertNewJobs.Job_Title, CVStatus.Cv_Status, CASE WHEN ReasonMaster.Rid=0 THEN '' ELSE Reason END AS Reason from addresume inner join ReasonMaster on addResume.Remarks = ReasonMaster.RId  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME " +
      "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails  " +
      " ON AddResume.candidate = interviewdetails.resumecode where " +
      " AddResume.RESUME_JOBCODE IN (" + alljobcodes + ") " +
      " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "' ORDER BY Candidate ";

            }

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        public DataSet GetResumesCountByClient(string alljobcodes, int whichpage)
        {
            if (alljobcodes == "")
                throw new Exception(" Job codes not initialized ");

            string strSQL = "";
            SqlCommand sqlCmd = new SqlCommand();

            if (whichpage == 0)
            {

                strSQL += "SELECT  count(distinct(AddResume.Resumecode)) as 'count'  FROM AddResume " +
                    "inner join ReasonMaster on addResume.Remarks = ReasonMaster.RId inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code " +
                    "inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name " +
                    "inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails   ON AddResume.candidate = interviewdetails.resumecode " +
                    " where  AddResume.RESUME_JOBCODE IN (" + alljobcodes + ")  " +
                    "AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "'";


            }
            else
            {

                strSQL += "SELECT  count(distinct(AddResume.Resumecode)) as 'count'  FROM AddResume " +
               "inner join ReasonMaster on addResume.Remarks = ReasonMaster.RId inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code " +
               "inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name " +
               "inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails   ON AddResume.candidate = interviewdetails.resumecode " +
               " where  AddResume.RESUME_JOBCODE IN (" + alljobcodes + ")  " +
               "AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "'";

            }

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet cvSet = GetDataSet(sqlCmd);

            return cvSet;
        }

        public DataSet SearchCandidateCountByClient(CandidateStatus newCandidate, string jobcodes)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            if (jobcodes == "")
                throw new Exception(" Job Codes not initialized ");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //			strSQL += "SELECT AddResume.*,";
            //			strSQL += " CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE ";
            //			strSQL += " FROM AddResume, CVStatus,InsertNewJobs WHERE ";
            //	strSQL += "select count(distinct(AddResume.Resumecode)) as 'count'  from addresume inner join cvstatus on CVStatus.CV_ID = AddResume.RESUME_STAGE inner join insertnewjobs on AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE where";

            strSQL += "SELECT count(distinct(AddResume.Resumecode)) as 'count' " +
                " from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME " +
       "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails  " +
       " ON AddResume.candidate = interviewdetails.resumecode where ";




            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = " + newCandidate.Status;
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = '" + newCandidate.Status + "' ";
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (AddResume.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR AddResume.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }
            if (newCandidate.InterviewLocation != "")
            {
                strSQL += " AND interviewdetails.InterviewLocation = '" + newCandidate.InterviewLocation + "' ";
            }
            if (newCandidate.JobCode != "")
            {
                strSQL += " AND AddResume.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND InsertNewJobs.JOB_CODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND AddResume.RESUME_JOBCODE IN (" + jobcodes + ")";
                strSQL += " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE  ";
            }

            if (newCandidate.CandidateName != "")
            {
                strSQL += " AND AddResume.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND AddResume.RESUME_COUNTRY = '" + newCandidate.Country + "' ";
            }


            if (newCandidate.Regno != "")
            {
                if (newCandidate.Regno != null)
                {
                    strSQL += " AND AddResume.Candidate = '" + newCandidate.Regno + "' ";
                }
            }
            strSQL += "  AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "'  AND AddResume.RESUME_STATUS = 1";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchCandidatesByClient(CandidateStatus newCandidate, string jobcodes)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            if (jobcodes == "")
                throw new Exception(" Job Codes not initialized ");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //			strSQL += "SELECT AddResume.*,";
            //			strSQL += " CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE ";
            //			strSQL += " FROM AddResume, CVStatus,InsertNewJobs WHERE ";


            //strSQL += "select *,CVStatus.CV_STATUS,(resume_firstname + ' ' +  resume_middlename+ ' ' + resume_familyname) as candidatename,interviewdetails.* from addresume inner join cvstatus on CVStatus.CV_ID = AddResume.RESUME_STAGE inner join insertnewjobs on AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE left outer join interviewdetails on addresume.candidate = interviewdetails.resumecode  where ";


            strSQL += "SELECT AddResume.Candidate, AddResume.RESUME_JOBCODE,  AddResume.Resume_FirstName + ' ' + AddResume.Resume_MiddleName + ' ' + AddResume.Resume_FamilyName AS CandidateName, " +
    "AddResume.Candidate, AddResume.Resume_Emaild1, AddResume.Resume_Extension, AddResume.Resume_Stage, AddResume.ModifiedBy, AddResume.Modified_Date, AddResume.Remarks, " +
    "InsertNewJobs.Job_Title, AddResume.RESUME_COUNTRY, AddResume.Resume_Qualification, AddResume.Resume_Designation, AddResume.Resume_Experience, " +
    "CVStatus.Cv_Status, CASE WHEN ReasonMaster.Rid=0 THEN '' ELSE Reason END AS Reason from addresume inner join ReasonMaster on addResume.Remarks = ReasonMaster.RId  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME " +
    "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Stage =CVStatus.CV_ID left outer join interviewdetails  " +
    " ON AddResume.candidate = interviewdetails.resumecode where ";
            //" AddResume.RESUME_JOBCODE IN (" + alljobcodes + ") " +
            //" AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='Bbt Client' ORDER BY Candidate ";




            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = " + newCandidate.Status;
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = '" + newCandidate.Status + "' ";
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (AddResume.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR AddResume.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }

            if (newCandidate.JobCode != "")
            {
                strSQL += " AND AddResume.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND InsertNewJobs.JOB_CODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND AddResume.RESUME_JOBCODE IN (" + jobcodes + ")";
                strSQL += " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE  ";
            }

            if (newCandidate.CandidateName != "")
            {
                strSQL += " AND AddResume.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND AddResume.RESUME_COUNTRY = '" + newCandidate.Country + "' ";
            }

            if (newCandidate.InterviewLocation != "")
            {
                strSQL += " AND interviewdetails.InterviewLocation = '" + newCandidate.InterviewLocation + "' ";
            }


            if (newCandidate.Regno != "")
            {
                if (newCandidate.Regno != null)
                {
                    strSQL += " AND AddResume.Candidate = '" + newCandidate.Regno + "' ";
                }
            }
            strSQL += " AND AddClient.Client_Name ='" + HttpContext.Current.Session["ClientName"].ToString() + "' AND AddResume.RESUME_STATUS = 1 ORDER BY Candidate ";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }
        public string SearchCandidatesByClientString(CandidateStatus newCandidate, string jobcodes)
        {
            if (newCandidate == null)
                throw new Exception("New Candidate");

            if (jobcodes == "")
                throw new Exception(" Job Codes not initialized ");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            //			strSQL += "SELECT AddResume.*,";
            //			strSQL += " CVStatus.CV_STATUS, InsertNewJobs.JOB_TITLE ";
            //			strSQL += " FROM AddResume, CVStatus,InsertNewJobs WHERE ";
            strSQL += "select *,CVStatus.CV_STATUS,(resume_firstname + ' ' +  resume_middlename+ ' ' + resume_familyname) as candidatename,interviewdetails.* from addresume inner join cvstatus on CVStatus.CV_ID = AddResume.RESUME_STAGE inner join insertnewjobs on AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE left outer join interviewdetails on addresume.candidate = interviewdetails.resumecode  where ";


            if (newCandidate.Status > 0)
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = " + newCandidate.Status;
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = '" + newCandidate.Status + "' ";
                    strSQL += " AND CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            else
            {
                if ((newCandidate.JobCode != "") || (newCandidate.CandidateEmail != "") || (newCandidate.Country != "") || (newCandidate.Regno != ""))
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
                else
                {
                    strSQL += " CVStatus.CV_ID = AddResume.RESUME_STAGE ";
                }
            }
            if (newCandidate.CandidateEmail != "")
            {
                strSQL += " AND (AddResume.RESUME_EMAILD1 LIKE '%" + newCandidate.CandidateEmail + "%' OR AddResume.RESUME_EMAILID2 LIKE '%" + newCandidate.CandidateEmail + "%' )";
            }

            if (newCandidate.JobCode != "")
            {
                strSQL += " AND AddResume.RESUME_JOBCODE = '" + newCandidate.JobCode + "' ";
                strSQL += " AND InsertNewJobs.JOB_CODE = '" + newCandidate.JobCode + "' ";
            }
            else
            {
                strSQL += " AND AddResume.RESUME_JOBCODE IN (" + jobcodes + ")";
                strSQL += " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE  ";
            }

            if (newCandidate.CandidateName != "")
            {
                strSQL += " AND AddResume.RESUME_FIRSTNAME LIKE '%" + newCandidate.CandidateName + "%' ";
            }

            if (newCandidate.Country != "")
            {
                strSQL += " AND AddResume.RESUME_COUNTRY = '" + newCandidate.Country + "' ";
            }

            if (newCandidate.InterviewLocation != "")
            {
                strSQL += " AND interviewdetails.InterviewLocation = '" + newCandidate.InterviewLocation + "'	 ";
            }


            if (newCandidate.Regno != "")
            {
                if (newCandidate.Regno != null)
                {
                    strSQL += " AND AddResume.Candidate = '" + newCandidate.Regno + "' ";
                }
            }
            strSQL += " AND AddResume.RESUME_STATUS = 1 ORDER BY Candidate ";

            //SetCommandType( sqlCmd, CommandType.Text, strSQL );
            //DataSet ds = GetDataSet(sqlCmd);

            return strSQL;
        }
        //Prabakaran
        public DataSet GetClientJobsWithCount(string allJobCode)
        {
            string strSQL = "";
            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            strSQL += "SELECT job.JOB_ID, job.JOB_CODE, job.JOB_TITLE, job.JOB_EXPERIENCE,job.JOB_LOCATION,";
            strSQL += "(SELECT COUNT(*) FROM AddResume res WHERE res.RESUME_JOBCODE = job.JOB_CODE";
            strSQL += " AND res.RESUME_STATUS = 1 ) AS 'Count' FROM InsertNewJobs job  WHERE job.JOB_CODE IN (";
            strSQL += allJobCode;
            strSQL += ") AND job.JOB_STATUS = 1";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetClientJobCodesWithTitle(string allJobCode)
        {
            string strSQL = "";
            SqlCommand sqlCmd = new SqlCommand();
            DataSet ds;

            strSQL += "SELECT job.JOB_CODE, job.JOB_TITLE ";
            strSQL += " FROM InsertNewJobs job  WHERE job.JOB_CODE IN (";
            strSQL += allJobCode;
            strSQL += ") AND job.JOB_STATUS = 1 ORDER BY job.JOB_CODE ";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetClientAdvertisements(string clientName)
        {
            if (clientName == "")
                throw new Exception(" Client Name not initialized ");

            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@clientName", SqlDbType.VarChar, 100, ParameterDirection.Input, clientName);
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCLIENTADS);

            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet SearchAClientAds(Advertisement newAdvertisement)
        {
            if (newAdvertisement == null)
                throw new Exception("newAdvertisement");

            SqlCommand sqlCmd = new SqlCommand();

            string strSQL = "";

            strSQL = "SELECT * FROM tblAdvertisements WHERE ";

            if (newAdvertisement.Title != "")
            {
                strSQL += " TITLE LIKE '%" + newAdvertisement.Title + "%'";
            }

            if (newAdvertisement.ClientName != "")
            {
                if (newAdvertisement.Title != "")
                {
                    strSQL += " AND Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
                else
                {
                    strSQL += " Client_Name like '%" + newAdvertisement.ClientName + "%'";
                }
            }

            if (newAdvertisement.Location != "")
            {
                if ((newAdvertisement.Title != "") || (newAdvertisement.ClientName != ""))
                {
                    strSQL += " AND LOCATION like '%" + newAdvertisement.Location + "%'";
                }
                else
                {
                    strSQL += " LOCATION like '%" + newAdvertisement.Location + "%'";
                }
            }


            if (newAdvertisement.StartOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND STARTON >= '" + newAdvertisement.StartOn.Date.ToShortDateString() + "' ";
                        strSQL += " AND ENDON <= '" + newAdvertisement.EndOn.Date.ToShortDateString() + "' ";
                    }
                    else
                    {
                        strSQL += " STARTON >= '" + newAdvertisement.StartOn.Date.ToShortDateString() + "' ";
                        strSQL += " AND ENDON <= '" + newAdvertisement.EndOn.Date.ToShortDateString() + "' ";
                    }
                }
                else
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND STARTON = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                    }
                    else
                    {
                        strSQL += " STARTON = '" + newAdvertisement.StartOn.Date.ToShortDateString() + "'";
                    }
                }

            }

            if (newAdvertisement.EndOn > System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                if (newAdvertisement.StartOn <= System.Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    if ((newAdvertisement.ClientName != "") || (newAdvertisement.Title != "") || (newAdvertisement.Location != ""))
                    {
                        strSQL += " AND ENDON = '" + newAdvertisement.EndOn.Date.ToShortDateString() + "'";
                    }
                    else
                    {
                        strSQL += " ENDON = '" + newAdvertisement.EndOn.Date.ToShortDateString() + "'";
                    }
                }
            }

            strSQL += " AND STATUS = 1 ";

            SetCommandType(sqlCmd, CommandType.Text, strSQL);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }

        public DataSet GetAllClientName()
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_GETCLIENTNAMES);
            DataSet nameSet = GetDataSet(sqlCmd);

            return nameSet;
        }

        public DataSet GetRemarks(string sql)
        {
            if (sql == "")
                throw new Exception("No Search Criteria");

            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.Text, sql);
            DataSet ds = GetDataSet(sqlCmd);

            return ds;
        }


        private void AddParamToSQLCmd(SqlCommand sqlCmd, string paramId, SqlDbType sqlType, int paramSize, ParameterDirection paramDirection, object paramvalue)
        {
            // Validate Parameter Properties
            if (sqlCmd == null)
                throw (new ArgumentNullException("sqlCmd"));
            if (paramId == string.Empty)
                throw (new ArgumentOutOfRangeException("paramId"));

            // Add Parameter
            SqlParameter newSqlParam = new SqlParameter();
            newSqlParam.ParameterName = paramId;
            newSqlParam.SqlDbType = sqlType;
            newSqlParam.Direction = paramDirection;

            if (paramSize > 0)
                newSqlParam.Size = paramSize;

            if (paramvalue != null)
                newSqlParam.Value = paramvalue;

            sqlCmd.Parameters.Add(newSqlParam);
        }

        private Object ExecuteNonQueryCmd(SqlCommand sqlCmd)
        {
            // Validate Command Properties
            if (ConnectionString == string.Empty)
                throw (new ArgumentOutOfRangeException("ConnectionString"));

            if (sqlCmd == null)
                throw (new ArgumentNullException("sqlCmd"));

            Object result = null;

            using (SqlConnection cn = new SqlConnection(this.ConnectionString))
            {
                sqlCmd.Connection = cn;
                cn.Open();
                result = sqlCmd.ExecuteNonQuery();
            }

            return result;
        }

        private SqlDataReader ExecuteReaderCmd(SqlCommand sqlCmd)
        {
            if (ConnectionString == string.Empty)
                throw (new ArgumentOutOfRangeException("ConnectionString"));

            if (sqlCmd == null)
                throw (new ArgumentNullException("sqlCmd"));

            using (SqlConnection cn = new SqlConnection(this.ConnectionString))
            {
                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();
                return (reader);
            }
        }

        private Object ExecuteScalarCmd(SqlCommand sqlCmd)
        {
            // Validate Command Properties
            if (ConnectionString == string.Empty)
                throw (new ArgumentOutOfRangeException("ConnectionString"));

            if (sqlCmd == null)
                throw (new ArgumentNullException("sqlCmd"));

            Object result = null;

            using (SqlConnection cn = new SqlConnection(this.ConnectionString))
            {
                sqlCmd.Connection = cn;
                cn.Open();
                result = sqlCmd.ExecuteScalar();
            }

            return result;
        }

        private DataSet GetDataSet(SqlCommand sqlCmd)
        {
            DataSet ds = new DataSet();

            if (ConnectionString == string.Empty)
                throw (new ArgumentOutOfRangeException("ConnectionString"));

            if (sqlCmd == null)
                throw (new ArgumentNullException("sqlCmd"));

            using (SqlConnection cn = new SqlConnection(this.ConnectionString))
            {
                SqlDataAdapter sAdaptor;

                try
                {
                    sAdaptor = new SqlDataAdapter(sqlCmd.CommandText, cn);
                    sqlCmd.Connection = cn;
                    sAdaptor.SelectCommand = sqlCmd;
                    sAdaptor.Fill(ds);
                }
                catch (Exception)
                {
                    throw;
                }
            }

            return ds;
        }

        private void SetCommandType(SqlCommand sqlCmd, CommandType cmdType, string cmdText)
        {
            sqlCmd.CommandType = cmdType;
            sqlCmd.CommandText = cmdText;
        }

        public int WriteLogInfo(string userID, string LogInfo)
        {
            int result;

            // Validate Parameters
            if (LogInfo == "")
                throw new ArgumentNullException("LogInfo Error");

            // Execute SQL Command
            SqlCommand sqlCmd = new SqlCommand();

            AddParamToSQLCmd(sqlCmd, "@User_ID", SqlDbType.VarChar, 50, ParameterDirection.Input, userID);
            AddParamToSQLCmd(sqlCmd, "@LOG_INFO", SqlDbType.VarChar, 255, ParameterDirection.Input, LogInfo);
            AddParamToSQLCmd(sqlCmd, "@UpdateDate", SqlDbType.DateTime, 8, ParameterDirection.Input, DateTime.Now);

            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_WRITELOGINFO);
            result = (int)ExecuteNonQueryCmd(sqlCmd);

            return result;

        }

        public DataSet LoadReason(string StatusId)
        {
            SqlCommand sqlCmd = new SqlCommand();

            SetCommandType(sqlCmd, CommandType.StoredProcedure, sp_Getreason);
            AddParamToSQLCmd(sqlCmd, "@statusid", SqlDbType.VarChar, 50, ParameterDirection.Input, StatusId);
            DataSet dsreason = GetDataSet(sqlCmd);

            return dsreason;
        }

        // Added by Ram on 14 Dec 2007 
        public bool ForgotPassword(string loginName, string emailId, string password)
        {
            SqlCommand sqlCmd = new SqlCommand();
            SetCommandType(sqlCmd, CommandType.StoredProcedure, SP_ForgotPassword);
            AddParamToSQLCmd(sqlCmd, "@Usr_Login", SqlDbType.VarChar, 50, ParameterDirection.Input, loginName);
            AddParamToSQLCmd(sqlCmd, "@EmailId", SqlDbType.VarChar, 100, ParameterDirection.Input, emailId);
            AddParamToSQLCmd(sqlCmd, "@Usr_Password", SqlDbType.VarChar, 50, ParameterDirection.Input, password);

            return bool.Parse(ExecuteScalarCmd(sqlCmd).ToString());
        }

        // Added by Ram on 19 Dec 2007 for getting the user role in selection process

        public string GetRole()
        {
            string sql = "SELECT Usr_Type FROM tbluser WHERE Usr_Login = '" + HttpContext.Current.Session["username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;
            return ExecuteScalarCmd(cmd).ToString();
        }

        // Added by Ram on 20 Dec 2007 for changing the status in Candidate Status Track

        public void UpdateStatus(string resumeCodes)
        {
            string sql = "UPDATE AddResume SET IsProcessed = 1  WHERE ResumeCode IN (" + resumeCodes + ")";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;

            object o = ExecuteNonQueryCmd(cmd);

        }




    }

}
