using System;
using System.Data;
using ARP.DataLayer; 

namespace ARP.BusinessLogic
{
	/// <summary>
	/// Summary description for Job.
	/// </summary>
	public class Job
	{	
		private string _Advertisement;
		private string _Code;
		private string _Title;
		private string _Position;
		private string _Department;
		private string _Education;
		private string _Skillset;
		private string _Experience;
		private string _Location;
		private string _Remarks;
		private bool _Status;
		private int _JobID;
		private DateTime _StartDate;
		private DateTime _EndDate;
		private string _EnteredBy; 
		private string _country;
		private string _ClientName;
		private bool _PostAdvt;
		private bool  _Active;

		public string Advertisement
		{
			get
			{
				return _Advertisement;
			}
			set
			{
				_Advertisement = value;
			}
		}
		public string Code
		{
			get
			{
				return _Code;
			}
			set
			{
				_Code = value;
			}
		}
		public string Title
		{
			get
			{
				return _Title ;
			}
			set
			{
				_Title = value;
			}
		}
		public string Position
		{
			get
			{
				return _Position ;
			}
			set
			{
				_Position = value;
			}
		}
		public string Department
		{
			get
			{
				return _Department ;
			}
			set
			{
				_Department = value;
			}
		}

		public string Education
		{
			get
			{
				return _Education;
			}
			set
			{
				_Education = value;
			}
		}
		public string Skillset
		{
			get
			{
				return _Skillset;
			}
			set
			{
				_Skillset = value;
			}
		}
		public string Experience
		{
			get
			{
				return _Experience;
			}
			set
			{
				_Experience = value;
			}
		}
		public string Location
		{
			get
			{
				return _Location;
			}
			set
			{
				_Location = value;
			}
		}
		public string Remarks
		{
			get
			{
				return _Remarks;
			}
			set
			{
				_Remarks = value;
			}
		}
		public bool Status
		{
			get
			{
				return _Status;
			}
			set
			{
				_Status = value;
			}
		}
		public int JobID
		{
			get
			{
				return _JobID;
			}
			set
			{
				_JobID = value;
			}
		}
		public DateTime StartDate
		{
			get
			{
				return _StartDate;
			}
			set
			{
				_StartDate = value;
			}
		}
		public DateTime EndDate
		{
			get
			{
				return _EndDate;
			}
			set
			{
				_EndDate = value;
			}
		}
		public string EnteredBy
		{
			get
			{
				return _EnteredBy;
			}
			set
			{
				_EnteredBy = value;
			}
		}

	public string country
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
		

		public bool PostAdvt
		{
			get 
			{
				return _PostAdvt;
			}
			set
			{
				_PostAdvt= value;
			}
		}

		public bool Active
		{
			get{return this._Active;}
			set {this._Active =value;}
		}
		public bool save()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();		
			int result;
			result = dataLayer.AddJob (this); 

			if(result > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public DataSet GetAllJobs()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GelAllJobs();
		}

		public DataSet GetActiveJobs()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GelActiveJobs();
		}
		
		public DataSet GetActiveJobsByClientName(string ClientName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GelActiveJobsByClientName(ClientName);
		}

		public bool UpdateStatus()
		{
			int Result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			Result = dataLayer.updateJobStatus(this); 

			if(Result > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public string DeleteJob()
		{
			int result;
			int isDeleteOK;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			isDeleteOK = dataLayer.isJobsDeletePossible( JobID );

			if( isDeleteOK > 0 )
			{
				return " You can't delete this job ";
			}
			else
			{
				result = dataLayer.DeleteJobs1( JobID ); 
				if ( result > 0 )
				{
					return " ";
				}
				else
				{
					return "Deletion Failed";
				}
			}
           
		}
		public DataSet GetJobbyId()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = 	dataLayer.GetJobsById(JobID);
			return result;
		}

		public static DataSet GetJobsByAdId(int AdId)
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = 	dataLayer.GetJobsByAdId(AdId);
			return result;
		}

		public static bool IsJobCodeExists(string Code)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if(dataLayer.IsJobCodeExist(Code) > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
 
		}
		public static bool IsJobExistforUpd(string jobCode, int JobID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if(dataLayer.isJobExistforUpdate(jobCode,JobID) > 0)
			{
				return true;
			}
			return false;
		}
		public bool updateJob()
		{
			int result;
			SQLDataAccessLayer layer = new SQLDataAccessLayer();
			result = layer.updateJobs(this);
			
			if(result > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public DataSet SearchJobs()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchAJobs(this);
		}

		public DataSet GetAllJobsWithCount()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllJobsWithCount();
		}

		public DataSet GetClientJobsWithCount( string allJobCodes )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
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

			return dataLayer.GetClientJobsWithCount( JobCodes );
		}

		public DataSet GetClientJobCodesWithTitle( string allJobCodes )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
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

			return dataLayer.GetClientJobCodesWithTitle( JobCodes );
		}
	

		public DataSet SearchJobsWithResponses()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchJobsWithResponses( this );
		}

		public DataSet GetResumeStagesByJob(int jobid,string fromdate,string todate,string country,int advertisement,string clientname)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetResumeStagesByJob(jobid,fromdate,todate,country,advertisement,clientname);
		}

	}
}