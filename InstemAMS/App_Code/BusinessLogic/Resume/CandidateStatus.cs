using System;
using System.Data;
using System.IO;
using ARP.DataLayer;

namespace ARP.BusinessLogic
{
	/// <summary>
	/// Summary description for CandidateStatus.
	/// </summary>
	public class CandidateStatus
	{

		private string candtEmail;
		private string jobCode;
		private int statusID;
		private string _candtName;
		private string _country;
		private string _remarks;
		private DateTime _regFDate;
		private DateTime _regToDate;
		private string _keyword;
		private string _Regno;
		private string _advtid;
		private string _ClientName;
		private string _Consultants;
	    private string	_InterviewLocation;
		private string	_InterviewDate;
		
		public string Consultants
		{
			get{ return _Consultants;}
			set {_Consultants = value;}
		}

		public string CandidateEmail
		{
			get
			{
				return candtEmail;
			}
			set
			{
				candtEmail = value;
			}
		}

		public string JobCode
		{
			get
			{
				return jobCode;
			}
			set
			{
				jobCode = value;
			}
		}
		
		public int Status
		{
			get
			{
				return statusID;
			}
			set
			{
				statusID = value;
			}
		}

		public string CandidateName
		{
			get
			{
				return _candtName;
			}
			set
			{
				_candtName = value;
			}

		}

		public string Country
		{
			get
			{
				return _country;
			}
			set
			{
				_country = value;
			}
		}

		public string Remarks
		{
			get
			{
				return _remarks;
			}
			set
			{
				_remarks = value;
			}
		}
		
		public DateTime RegFromDate
		{
			get
			{
				return _regFDate;
			}
			set
			{
				_regFDate = value;
			}
		}

		public DateTime RegToDate
		{
			get
			{
				return _regToDate;
			}
			set
			{
				_regToDate= value;
			}
		}
		public string keyword
		{
			get
			{
				return _keyword;
			}
			set
			{
				_keyword = value;
			}
		}
		public string Regno
		{
			get
			{
				return _Regno;
			}
			set
			{
				_Regno = value;
			}
		}
		public string Advtid
		{
			get
			{
				return _advtid;
			}
			set
			{
				_advtid = value;
			}
		}
		public string ClientName
		{
			get
			{
				return _ClientName;
			}
			set
			{
				_ClientName = value;
			}
		}

		public string InterviewDate
		{
			get
			{
				return _InterviewDate;
			}
			set
			{
				_InterviewDate = value;
			}
		}
		public string InterviewLocation
		{
			get
			{
				return _InterviewLocation;
			}
			set
			{
				_InterviewLocation = value;
			}
		}
        public DataSet GetClientStatus()
		{
			SQLDataAccessLayer objAllStatus = new SQLDataAccessLayer();
            return objAllStatus.GetClientStatus();
		}

		public DataSet GetAllCandidates()
		{
			SQLDataAccessLayer objAllCandt = new SQLDataAccessLayer();
			return	objAllCandt.GetAllCandidates();
		}
		public DataSet GetCountAllCandidates()
		{
			SQLDataAccessLayer objAllCandt = new SQLDataAccessLayer();
			return	objAllCandt.GetCountAllCandidates();
		}
		public DataSet SearchCandidate()
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.SearchACandidate(this);
		}
		public DataSet SearchCountCandidate()
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.SearchCountACandidate(this);
		}
		

		public DataSet GetAllPostedResumes()
		{
			SQLDataAccessLayer objResume = new SQLDataAccessLayer();
			return	objResume.GetPostedResumes();
		}
		public DataSet GetPostedcountResumes()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetPostedcountResumes();
		}
		public DataSet GetResumesByClient( string allJobCodes, int whichpage )
		{
			string JobCodes = "";
			if ( allJobCodes != "" )
			{
				string[] jobcode = allJobCodes.Split(',');				
				int j = 1;
				for( int i = 0; i < jobcode.Length; i++ )
				{
					if( j == jobcode.Length )
					{
						JobCodes += "'"+jobcode[i].ToString()+"'";						
					}
					else
					{
						if( jobcode[i].ToString() != "" )
						{
							JobCodes += "'"+jobcode[i].ToString()+"'";
							JobCodes += ",";
						}
					}
					j++;
				}				
			}

			SQLDataAccessLayer objResume = new SQLDataAccessLayer();

			if( whichpage == 0 )
			{
				return	objResume.GetResumesByClient( JobCodes, 0 );
			}
			else
			{
				return	objResume.GetResumesByClient( JobCodes, 1 );
			}
		}

		public DataSet GetResumesCountByClient( string allJobCodes, int whichpage )
		{
			string JobCodes = "";
			if ( allJobCodes != "" )
			{
				string[] jobcode = allJobCodes.Split(',');				
				int j = 1;
				for( int i = 0; i < jobcode.Length; i++ )
				{
					if( j == jobcode.Length )
					{
						JobCodes += "'"+jobcode[i].ToString()+"'";						
					}
					else
					{
						if( jobcode[i].ToString() != "" )
						{
							JobCodes += "'"+jobcode[i].ToString()+"'";
							JobCodes += ",";
						}
					}
					j++;
				}				
			}

			SQLDataAccessLayer objResume = new SQLDataAccessLayer();

			if( whichpage == 0 )
			{
				return	objResume.GetResumesCountByClient( JobCodes, 0 );
			}
			else
			{
				return	objResume.GetResumesCountByClient( JobCodes, 1 );
			}
		}

		public DataSet SearchPostedResumes()
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.SearchPostedResumes(this);

		}
		public DataSet SearchcountPostedResumes()
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.SearchcountPostedResumes(this);
		}
		

		public DataSet GetAResumeStatus( int statusID, string userName )
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.GetAResumeStatus( statusID, userName );
		}

        public DataSet GetAdminStatus(int statusID, string userName)
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
            return objCandt.GetAdminStatus(statusID, userName);
		}

        
		public int GetLocationList(string JobCode)
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.GetLocationList(JobCode);
		}
		public DataSet LoadLocationList()
		{
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			return	objCandt.LoadLocationList();
		}

		public bool ChangeCurrentStage( int statusID )
		{
			int result;
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			result = objCandt.ChangeResumeStage( this, statusID );

			if( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public bool UpdateInterviewDetails( string ResumeCode,int InterviewLocation,string InterviewDate )
		{
			int result;
			SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
			result = objCandt.UpdateInterviewDetail( ResumeCode,InterviewLocation,InterviewDate );

			if( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public DataSet SearchCandidateByClient(string allJobCodes )
		{
			string JobCodes = "";
			if ( allJobCodes != "" )
			{
				string[] jobcode = allJobCodes.Split(',');				
				int j = 1;
				for( int i = 0; i < jobcode.Length; i++ )
				{
					if( j == jobcode.Length )
					{
						JobCodes += "'"+jobcode[i].ToString()+"'";						
					}
					else
					{
						if( jobcode[i].ToString() != "" )
						{
							JobCodes += "'"+jobcode[i].ToString()+"'";
							JobCodes += ",";
						}
					}
					j++;
				}				
			}

			SQLDataAccessLayer objResume = new SQLDataAccessLayer();
			return objResume.SearchCandidatesByClient(this, JobCodes );

		}
	//Prabakaran

		public string SearchCandidateByClientString(string allJobCodes )
		{
			string JobCodes = "";
			if ( allJobCodes != "" )
			{
				string[] jobcode = allJobCodes.Split(',');				
				int j = 1;
				for( int i = 0; i < jobcode.Length; i++ )
				{
					if( j == jobcode.Length )
					{
						JobCodes += "'"+jobcode[i].ToString()+"'";						
					}
					else
					{
						if( jobcode[i].ToString() != "" )
						{
							JobCodes += "'"+jobcode[i].ToString()+"'";
							JobCodes += ",";
						}
					}
					j++;
				}				
			}

			SQLDataAccessLayer objResume = new SQLDataAccessLayer();
			return objResume.SearchCandidatesByClientString(this, JobCodes );

		}
		public DataSet SearchCandidateCountByClient(string allJobCodes )
		{
			string JobCodes = "";
			if ( allJobCodes != "" )
			{
				string[] jobcode = allJobCodes.Split(',');				
				int j = 1;
				for( int i = 0; i < jobcode.Length; i++ )
				{
					if( j == jobcode.Length )
					{
						JobCodes += "'"+jobcode[i].ToString()+"'";						
					}
					else
					{
						if( jobcode[i].ToString() != "" )
						{
							JobCodes += "'"+jobcode[i].ToString()+"'";
							JobCodes += ",";
						}
					}
					j++;
				}				
			}

			SQLDataAccessLayer objResume = new SQLDataAccessLayer();
			return objResume.SearchCandidateCountByClient(this, JobCodes );

		}

		public string GetRemarks()
		{
			DataSet ds;
			string remark;
			SQLDataAccessLayer objResume = new SQLDataAccessLayer();

			string sql = "Select Remarks from AddResume where RESUME_EMAILD1 = '" + candtEmail + "' and RESUME_JOBCODE = '"+jobCode+"' ";
			
			ds = objResume.GetRemarks(sql);
			remark = ds.Tables[0].Rows[0]["Remarks"].ToString();
			
			return remark;
		}

		public CandidateStatus()
		{
			//
			// TODO: Add constructor logic here
			//
		}


        public DataTable getPresentedRecords(string clientName)
        {
            DataSet ds;
			SQLDataAccessLayer objResume = new SQLDataAccessLayer();

            string sql = "SELECT AddResume.Candidate, AddResume.RESUME_JOBCODE,  AddResume.Resume_FirstName + ' ' + AddResume.Resume_MiddleName + ' ' + AddResume.Resume_FamilyName AS CandidateName, "+
                "AddResume.Candidate, AddResume.Resume_Extension, AddResume.Resume_Status, AddResume.ModifiedBy, AddResume.Modified_Date, AddResume.Remarks, " +
                "InsertNewJobs.Job_Title from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME "+
                "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Status =CVStatus.CV_ID left outer join interviewdetails  "+
                " ON AddResume.candidate = interviewdetails.resumecode where CVStatus.CV_ID = AddResume.RESUME_STATUS "+
                " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddResume.Resume_Status=1  AND AddClient.Client_Name ='" + clientName + "' ORDER BY Candidate ";

            //string sql = "SELECT AddResume.*,CVStatus.CV_STATUS,insertnewjobs.JOB_TITLE,interviewdetails.*,(AddResume.resume_firstname + ' ' +  AddResume.resume_middlename+ ' ' + AddResume.resume_familyname) as candidatename "+
            //    "from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME "+
            //    " inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_STAGE =CVStatus.CV_ID left outer join interviewdetails  "+
            //    " on AddResume.candidate = interviewdetails.resumecode where CVStatus.CV_ID = AddResume.RESUME_STATUS "+
            //    " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddResume.Resume_Status=1 AND AddClient.Client_Name ='"+clientName+"' ORDER BY Candidate ";

            //string sql = " select a.*,(a..resume_firstname + ' ' +  a.resume_middlename+ ' ' + a.resume_familyname) as candidatename, b.JOB_TITLE from addresume a inner join insertnewjobs b on a.resume_jobcode=b.job_code " +
            //    "inner join tblAdvertisements advert on advert.ID = a.RESUME_ADVTNAME inner join AddClient c on c.client_name = advert.client_name "+
            //    "where b.JOB_STATUS = 1 and c.CLIENT_STATUS=1 AND c.Client_Name ='"+clientName+"' AND a.Resume_Status = 1 order by candidate   ";
			
			ds = objResume.GetRemarks(sql);
            return ds.Tables[0];
        }

        public DataTable getAllRecordsForClient(string clientName)
        {
            DataSet dsRecords = new DataSet();
            SQLDataAccessLayer objSql = new SQLDataAccessLayer();
            string sql = "SELECT AddResume.Candidate, AddResume.RESUME_JOBCODE,  AddResume.Resume_FirstName + ' ' + AddResume.Resume_MiddleName + ' ' + AddResume.Resume_FamilyName AS CandidateName, " +
      "AddResume.Candidate, AddResume.Resume_Extension, AddResume.Resume_Status, AddResume.ModifiedBy, AddResume.Modified_Date, AddResume.Remarks, " +
      "InsertNewJobs.Job_Title from addresume  inner join insertnewjobs  on addresume.resume_jobcode=insertnewjobs.job_code inner join tblAdvertisements on tblAdvertisements.ID = addresume.RESUME_ADVTNAME " +
      "inner join AddClient  on AddClient.client_name = tblAdvertisements.client_name inner join CVStatus  on addresume.RESUME_Status =CVStatus.CV_ID left outer join interviewdetails  " +
      " ON AddResume.candidate = interviewdetails.resumecode where CVStatus.CV_ID = AddResume.RESUME_STATUS " +
      " AND AddResume.RESUME_JOBCODE = InsertNewJobs.JOB_CODE AND AddClient.Client_Name ='" + clientName + "' ORDER BY Candidate ";


            dsRecords = objSql.GetRemarks(sql);
            return dsRecords.Tables[0];
        }

       //public DataTable GetAllResumeStatus()
       // {
       //     SQLDataAccessLayer objCandt = new SQLDataAccessLayer();
       //     return objCandt.GetAllResumeStatus();
       // } 


	}
}
