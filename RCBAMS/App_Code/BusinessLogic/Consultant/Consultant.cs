using System;
using System.Data;
using ARP.DataLayer;

namespace ARP.BusinessLogic
{
	public class Consultant
	{
		private int _ID;
		private string _Name;
		private string _Email;
		private string _Phone;
		private string _Phone1;
		private string _Contact_Address;
		private string _Designation;
		private string _Center;
		private bool _Status;		

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

		public string Name
		{
			get
			{
				return _Name;
			}
			set
			{
				_Name = value;
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
		public string Phone1
		{
			get
			{
				return _Phone1;
			}
			set
			{
				_Phone1 = value;
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

		public string Designation
		{
			get
			{
				return _Designation;
			}
			set
			{
				_Designation = value;
			}
		}
		
		public string Center
		{
			get
			{
				return _Center;
			}
			set
			{
				_Center = value;
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
				 _Status=value;
			}
		}

		public bool Save()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			int TempId = dataLayer.AddConsultant (this);

			if(TempId>0)
			{
				return true;
			}
			return false;
		}

		public DataSet GetAllConsultants()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllConsultants();
		}

		public DataSet GetConsultantsByName()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetConsultantByName(Name);
		}

		public static bool IsConsultantExist(string consultantName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsConsultantExists(consultantName) >0)
			{
				return true;
			}

			return false;
		}

		public static bool IsConsultantExist(string consultantName, int consultantID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsConsultantExists(consultantName, consultantID) >0)
			{
				return true;
			}

			return false;
		}
		
		public bool DeleteConsultant()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.DeleteConsultant (ID);            
			
			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool UpdateConsultant()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateConsultant(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;

		}

		public bool UpdateStatus()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateConsultantStatus(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}

		public DataSet GetConsultantByID()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.GetConsultantByID ( ID );  
   
			return result;
		}
	}
}