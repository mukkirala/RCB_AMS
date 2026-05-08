using System;
using System.Data; 
using System.IO;
using System.Configuration;
using ARP.BusinessLogic;
using ARP.DataLayer; 
using System.Web;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ARP.BusinessLogic
{
	/// <summary>
	/// Summary description for Resume.
	/// </summary>
	public class Resume
	{
		private int _ResumeID;
		private string _JobCode;
		private string _FirstName;
		private string _MiddleName;
		private string _FamilyName;
		private DateTime _DOB;
		private string _Nationality;
		private string _EmailID1;
		private string _EmailID2;
		private string  _TelephoneNumber;
		private string _OtherTelephoneNumber;
		private string _HandTelephoneNumber;
		private string _PostalAddress;
		private string _PostalAddress2;
		private string _City;
		private string _Country;
		private string _AttachedResumeName;
		private string _Source;
		private int _ConsultNames;
		private int _AdvtNames;
		private bool _Status;
		private string _candidate;
		private DateTime _RegTime;
		private string _EnteredBy;
		private string _ModifiedBy;
        private DateTime _ModifiedDate;
		private string _CurrentEmployer;
		private string _CurrentDesignation;
		private int _TotalExperience;
		private string _Qualification;
		private int _check;
		private int _Stage;
		private string _RegNo;
		private string _ClientName;

		public int ResumeID
		{
			get
			{
				return _ResumeID;
			}
			set
			{
				_ResumeID = value;
			}
		}
		public int check
		{
			get
			{
				return _check;
			}
			set
			{
				_check = value;
			}
		}
		public string JobCode
		{
			get
			{
				return _JobCode;
			}
			set
			{
				_JobCode = value;
			}
		}
		public string FirstName
		{
			get
			{
				return _FirstName;
			}
			set
			{
				_FirstName = value;
			}
		}
		public string MiddleName
		{
			get
			{
				return _MiddleName;
			}
			set
			{
				_MiddleName = value;
			}
		}
		public string FamilyName
		{
			get
			{
				return _FamilyName;
			}
			set
			{
				_FamilyName = value;
			}
		}
		public DateTime DOB
		{
			get
			{
				return _DOB;
			}
			set
			{
				_DOB = value;
			}
		}
		public string Nationality
		{
			get
			{
				return _Nationality;
			}
			set
			{
				_Nationality = value;
			}
		}
		public string EmailID1
		{
			get
			{
				return _EmailID1;
			}
			set
			{
				_EmailID1 = value;
			}
		}
		public string EmailID2
		{
			get
			{
				return _EmailID2;
			}
			set
			{
				_EmailID2 = value;
			}
		}
		public string  TelephoneNumber
		{
			get
			{
				return _TelephoneNumber;
			}
			set
			{
				_TelephoneNumber = value;
			}
		}
		public string HandTelephoneNumber
		{
			get
			{
				return _HandTelephoneNumber;
			}
			set
			{
				_HandTelephoneNumber = value;
			}
		}
		public string OtherTelephoneNumber
		{
			get
			{
				return _OtherTelephoneNumber;
			}
			set
			{
				_OtherTelephoneNumber = value;
			}
		}
		public string PostalAddress
		{
			get 
			{
				return _PostalAddress;
			}
			set
			{
				_PostalAddress = value;
			}
		}
		public string PostalAddress2
		{
			get 
			{
				return _PostalAddress2;
			}
			set
			{
				_PostalAddress2 = value;
			}
		}
		public string City
		{
			get
			{
				return _City;
			}
			set
			{
				_City = value;
			}
		}
		public string Country
		{
			get
			{
				return _Country;
			}
			set
			{
				_Country = value;
			}
		}
		public string AttachedResumeName
		{
			get
			{
				return _AttachedResumeName;
			}
			set
			{
				_AttachedResumeName = value;
			}
		}
		public string Source
		{
			get
			{
				return _Source;
			}
			set
			{
				_Source = value;
			}
		}
		public int ConsultNames
		{
			get
			{
				return _ConsultNames;
			}
			set
			{
				_ConsultNames = value;
			}
		}
		public int AdvtNames
		{
			get 
			{
				return _AdvtNames;
			}
			set
			{
				_AdvtNames = value;
			}
		}
		public bool  Status
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
		public DateTime RegTime
		{
			get
			{
				return _RegTime;
			}
			set
			{
				_RegTime = value;
			}
		}

		public string CandidateID
		{
			get
			{
				return _candidate;
			}
			set
			{
				_candidate = value;
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
		public string ModifiedBy
		{
			get
			{
				return _ModifiedBy;
			}
			set
			{
				_ModifiedBy = value;
			}
		}
		public DateTime ModifiedDate
		{
			get
			{
				return _ModifiedDate;
			}
			set
			{
				_ModifiedDate = value;
			}
		}
	
		public string CurrentEmployer
		{
			get
			{
				return _CurrentEmployer;
			}
			set
			{
				_CurrentEmployer = value;
			}
		}
		public string CurrentDesignation
		{
			get
			{
				return _CurrentDesignation;
			}
			set
			{
				_CurrentDesignation = value;
			}
		}
		public int TotalExperience
		{
			get
			{
				return _TotalExperience;
			}
			set
			{
				_TotalExperience = value;
			}
		}
		
			public string Qualification
			{
				get
				{
					return _Qualification;
				}
				set
				{
					_Qualification = value;
				}
			}
		public int Stage
		{
			get
			{
				return _Stage;
			}
			set
			{
				_Stage = value;
			}
		}

	public string RegNo
	{
		get
		{
			return _RegNo;
		}
		set
		{
			_RegNo = value;
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
		
		public bool save()
		{
			SQLDataAccessLayer layer = new  SQLDataAccessLayer();
			int result;
			int hitCountUpdated = 0;

			if( this.AdvtNames.ToString() != "")
			{
				hitCountUpdated = layer.UpdateHitCount( this.AdvtNames );
			}

			result = layer.AddResume(this);			

            if( result > 0 && hitCountUpdated >= 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public DataSet GetAllResumes()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.getAllResumes(); 
		}
		public DataSet GetResumesByClient()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.getResumesByClient(this); 
		}
		public DataSet countactiveresume()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.countactiveresume(); 
		}
		public DataSet countactiveresumebyclient()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.countactiveresumebyclient(this); 
		}
		public DataSet countinactiveresume()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.countinactiveresume(); 
		}
		public DataSet countinactiveresumeByClient()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.countinactiveresumeByClient(this); 
		}
	
		public DataSet GetAllInactiveResumes()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.getAllInactiveResumes(); 
		}
		public DataSet GetInactiveResumesByClient()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.GetInactiveResumesByClient(this); 
		}
		public DataSet GetResumeByID()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.GetResumesByID(ResumeID);
		}
		public DataSet GetResumeCode(string jobcode,string emailid)
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			return Layer.GetResumeCode(jobcode,emailid);
		}
		public bool updateStatus()
		{
			int Result;
			SQLDataAccessLayer layer = new SQLDataAccessLayer();
			Result = layer.updResumeStatus(this);
 
			if(Result > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public bool DeleteResume()
		{
			int result;
			DataSet ds;
			string candtID;
			string fileext;
			string path;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			ds = dataLayer.DeleteResumeFile( ResumeID );
			
			candtID = ds.Tables[0].Rows[0]["Candidate"].ToString();
			fileext = ds.Tables[0].Rows[0]["RESUME_EXTENSION"].ToString();
            
            path = this.GeneratePath( candtID, fileext );
			if( System.IO.File.Exists( path ) )
			{
				System.IO.File.Delete( path );
			}

			result = dataLayer.DeleteResume(ResumeID); 
			
			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public bool DataTimeValid()
		{
			SQLDataAccessLayer Layer = new SQLDataAccessLayer();
			DataSet dateSet = new DataSet(); 
			dateSet = Layer.GetDateForID(ResumeID);
			DateTime earlierTime = System.Convert.ToDateTime(dateSet.Tables[0].Rows[0]["RESUME_DATETIME"].ToString());   
			
			DateTime nowTime = System.DateTime.Now;
			TimeSpan x = nowTime -  earlierTime;
			if(x.Days > 180)
			{
				return true;
			}
			else
			{
				return false;
			}
			
			//string x = dataSet.t

		}
		public DataSet GetAllValidAdvertisements()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllValidAdvertisements();
		}
		public DataSet GetValidAdvertisementsByClients()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetValidAdvertisementsByClients(this);
		}
		public DataSet GetAllActConsultants()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllActiveConsultants(); 
		}

		public bool UpdateResumes()
		{
			int result;
			SQLDataAccessLayer layer = new SQLDataAccessLayer();
			result = layer.UpdateResume(this);
			
			if(result > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public static bool UpdateResumeByPostedDate(string EMail,string jobcode)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if( dataLayer.IsUpdateResumeByDate( EMail,jobcode ) > 0 )
			{
				return true;
			}
			else
			{
				return false;
			} 
		}

		public static bool IsResumeExists(string EMail)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if(dataLayer.IsResumeExist( EMail ) > 0)
			{
				return true;
			}
			else
			{
				return false;
			} 
		}

		public static bool IsResumeExistsValidate( string EMail )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if( dataLayer.IsValidateResume( EMail) > 0 )
			{
				return true;
			}
			else
			{
				return false;
			} 
		}
		public DataSet CheckStatus(string EMail)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.CheckStatus(EMail);
		}

		public DataSet GetResumeIDByEmail( string Email )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			return dataLayer.GetResumeIDByMail( Email );
		}
        
		public static bool IsResumeExistforUpd(string EMail, int id)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			if(dataLayer.isJobExistforUpdate(EMail,id) > 0)
			{
				return true;
			}
			return false;
		}

		public DataSet SearchAResumes()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchAResume(this);
		}
		public DataSet SearchAResumesByClient()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchAResumeByClient(this);
		}
		public DataSet SearchcountAResumes()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchcountAResumes(this);
		}
		public DataSet SearchcountAResumesByClient()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchcountAResumesByClient(this);
		}
		
		

		public string  GetCandidateID( int resumeID)
		{
			string candtID;
			DataSet ds;
			
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();

			ds = dataLayer.GetCandidateIDByResumeID( resumeID );

			candtID = ds.Tables[0].Rows[0]["Candidate"].ToString();
			
			return candtID;
		}
		
		public string GenerateCandidateID()
		{
			int curYear;
			int LastPortionofID;
			string actualID;
			DataSet ds;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();

			curYear = DateTime.Now.Year;

			ds = dataLayer.GetCandidateID();
			LastPortionofID  = Convert.ToInt32 ( ds.Tables[0].Rows[0]["LastCandidateID"].ToString() );
			LastPortionofID = LastPortionofID +1;
			actualID = curYear+"-"+LastPortionofID;	

			return actualID;
		}

		public bool UpdateCandidateID(  )
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateCandidateID( );

			if( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public string GeneratePath( string candidateID, string extension )
		{
			int candtID;
			int folder;
			string[] yearandID = new string[2];

			string orgPath = ConfigurationSettings.AppSettings["ResumePath"]+"";
			
			yearandID = candidateID.Split('-');

			candtID	= Convert.ToInt32( yearandID[1].ToString() ) ;
			
			int rem = candtID%5000;

			if ( rem > 0 )
			{
				folder = (candtID - rem)+5000;
			}
			else
			{
				folder = candtID - rem;
			}

			if( ! Directory.Exists( orgPath+"/"+folder.ToString()) )
			{
				Directory.CreateDirectory( orgPath+"/"+ folder.ToString() );
			}

			string path = orgPath+folder+"/"+ candidateID + extension;

			return path;
		}

//		public string GeneratePath( string candidateID, string extension )
//		{
//			int candtID;
//			int folder;
//			string[] yearandID = new string[2];
//
//			//string orgPath = ConfigurationSettings.AppSettings["ResumePath1"].ToString()+ "";
//
//			string orgPath=ConfigurationSettings.AppSettings["ResumePath"].ToString()+ "";
//
//			//string Root= ConfigurationSettings.AppSettings["Root"]+"";
//			
//			yearandID = candidateID.Split('-');
//
//			candtID	= Convert.ToInt32( yearandID[1].ToString() ) ;
//			
//			int rem = candtID%5000;
//
//			if ( rem > 0 )
//			{
//				folder = (candtID - rem)+5000;
//			}
//			else
//			{
//				folder = candtID - rem;
//			}
//
//			if( ! Directory.Exists( orgPath+"/"+folder.ToString()) )
//			{
//				Directory.CreateDirectory(orgPath+"/"+ folder.ToString() );
//			}
//			string path = orgPath+folder+"/"+ candidateID + extension;
//
//			return path;
//		}


		public Resume()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
