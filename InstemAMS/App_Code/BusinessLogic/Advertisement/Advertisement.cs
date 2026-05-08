using System;
using ARP.DataLayer;
using System.Data;
using System.IO;
namespace ARP.BusinessLogic
{
	/// <summary>
	/// Represents the advertisement posted by the user
	/// </summary>
	
	public class Advertisement
	{
		private int _ID;
		private string _Title;
        private string _ClientName;
		private string _Email;
		private string _Phone;
		private bool _Status;
		private string _Image;
		private string _Reference;
		private string _Contact_Address;
		private DateTime _StartOn = new DateTime(); 
		private DateTime _EndOn = new DateTime();
		private string _HandPhone;
		private string _Location;
		private string _Details;
		private string _Country;
		private string _EnteredBy;
		private int _Advt;
		private string _Client;
		//private DateTime _CreatedDate;

		public int ID
		{
			get
			{
				return _ID;
			}
			set
			{
				_ID = value;
			}
		}

		public string Title
		{
			get
			{
				return _Title;
			}
			set
			{
				_Title = value;
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
		public int Advt
		{
			get
			{
				return _Advt;
			}
			set
			{
				_Advt = value;
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

		public string Email
		{
			get
			{
				return _Email;
			}
			set
			{
				_Email = value;
			}
		}

		public string Phone
		{
			get
			{
				return _Phone;
			}
			set
			{
				_Phone = value;
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

		public string Image
		{
			get
			{
				return _Image;
			}
			set
			{
				_Image = value;
			}
		}

		public string Reference
		{
			get
			{
				return _Reference;
			}
			set
			{
				_Reference = value;
			}
		}

		public string ContactAddress
		{
			get
			{
				return _Contact_Address;
			}
			set
			{
				_Contact_Address = value;
			}
		}
		
		public DateTime StartOn
		{
			get
			{
				return _StartOn;
			}
			set
			{
				_StartOn = value;
			}
		}

		public DateTime EndOn
		{
			get
			{
				return _EndOn;
			}
			set
			{
				_EndOn = value;
			}
		}

		public string HandPhone
		{
			get
			{
				return _HandPhone;
			}
			set
			{
				_HandPhone = value;
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
		public string Details
		{
			get
			{
				return _Details;;
			}
			set
			{
				_Details = value;
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
		public string Client
		{
			get
			{
				return _Client;
			}
			set
			{
				_Client = value;
			}
		}

		public bool Save()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			int TempId = dataLayer.AddAdvertisement(this);

			if(TempId>0)
			{
				return true;
			}
			return false;
		}

		public DataSet GetAllAdvertisements()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllAdvertisements();
		}

		public DataSet GetAllValidAdvertisements()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllValidAdvertisements();
		}

		public DataSet GetAClientAdvertisements(string  clientName )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetClientAdvertisements( clientName );
		}

		public DataSet SearchAdvertisements()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchAdvertisements(this);
		}

		public DataSet SearchValidAdvertisements()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchValidAdvertisements(this);
		}
		public DataSet CountryResponseByAdvt()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.CountryResponseByAdvt(this);
		}

		public DataSet CountryResponse()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.CountryResponse(this);
		}
		public DataSet AdvertisementReport()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.AdvertisementReport(this);
		}
		public DataSet SearchAClientAds()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.SearchAClientAds(this);
		}

		public static bool IsAdvertisementExist(string advertisementName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsAdvertisementExists(advertisementName) >0)
			{
				return true;
			}

			return false;
		}

		public static bool IsAdvertisementExist(string advertisementName, int ID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsAdvertisementExists(advertisementName, ID) >0)
			{
				return true;
			}

			return false;
		}
		
		public bool DeleteAdvertisement()
		{
			int result=0;

			//Deleting AddImage file
			string fileImgName = "";
			DataSet dsImg = new DataSet();
 
			SQLDataAccessLayer dataLayer1 = new SQLDataAccessLayer();
			int IsvalidDelete = dataLayer1.IsValidAdvtDeletion( ID );

			if( IsvalidDelete <= 0 )
			{
				dsImg = dataLayer1.GetAdvertisementByID(ID); 
				
				if(dsImg.Tables[0].Rows.Count >0)
				{
				
					if ( dsImg.Tables[0].Rows[0]["IMAGE"].ToString() != "" )
					{
						fileImgName = dsImg.Tables[0].Rows[0]["IMAGE"].ToString();
						FileInfo theFile  = new FileInfo(System.Configuration.ConfigurationSettings.AppSettings["AdvtImagePath"] + fileImgName);    	
						if( theFile.Exists )
						{
							File.Delete(System.Configuration.ConfigurationSettings.AppSettings["AdvtImagePath"] + fileImgName); 
						}
					}
				}
		
				//Delete Add Record
				SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
				result = dataLayer.DeleteAdvertisement (ID);         
			
				if ( result > 0 )
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}

		public bool UpdateStatus()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateAdvertisementStatus(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}

		public DataSet GetAdvertisementByID()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.GetAdvertisementByID ( ID );  
   
			return result;
		}
		public DataSet GetAddImageByID()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.GetAddImagebyID(ID);   
			return result;
		}

		public DataSet GetAdvertisementDetails( int advtID )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAdvertisementResponses( advtID );
		}

		public bool UpdateAdvertisement()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateAdvertisement(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}
	}
}