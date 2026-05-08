using System;
using System.Data;
using System.Data.SqlClient;
using ARP.DataLayer;

namespace ARP.BusinessLogic.Admin
{
	/// <summary>
	/// Summary description for ARPUser.
	/// </summary>
	
	public class User
	{
		private string _LoginName;
		private string _password;
		private string _privileges;
		private int _roleID;
		private string _usertype;
		private int _userID;
		private string _client;

		public DateTime dt = DateTime.Now;		
		public string UserName;
        public string Designation;
        public string Emailid;
		public bool Status;
		
		public string LoginName
		{
			get
			{
				return _LoginName;
			}
			set
			{
				_LoginName = value;
			}
		}

		public string UserPWD
		{
			get
			{
				return _password;
			}
			set
			{
				_password = value;
			}
		}

		public string Privileges
		{
			get
			{
				return _privileges;
			}
			set
			{
				_privileges = value;
			}
		}

		public int RoleID
		{
			get
			{
				return _roleID;
			}
			set
			{
				_roleID = value;
			}
		}

		public string UserType
		{
			get
			{
				return _usertype;
			}
			set
			{
				_usertype = value;
			}
		}
		public int UserID
		{
			get
			{
				return _userID;
			}
			set
			{
				_userID = value;
			}
		}

		public string ClientName
		{
			get
			{
				return _client;
			}
			set
			{
				_client = value;
			}
		}

        
		public User()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public bool AddNewUser()
		{
			int result;

			if(UserType == "ROLE")
			{
				_privileges = "0";
			}

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.InsertNewUser(this);

			if( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool UpdateStatus()
		{
			int result;

			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			result = objLayer.UpdateUserStatus(this);

			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}		
		}

		public bool DeleteUser()
		{
			int result;

			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			result = objLayer.DeleteUser(this.UserID);
            
			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public DataSet GetAllUsers()
		{
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			return objLayer.GetAllUsers();
		}

		public DataSet GetUsers()
		{
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			return objLayer.GetUser(this.UserName,this.LoginName);
		}

		public DataSet GetSingleUser()
		{
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			return objLayer.GetSingleUser( this.UserID );
		}

		public bool UpdateUser()
		{
			int result;

			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			
			result = objLayer.UpdateUser(this );

			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool isLoginNameExist()
		{
			int exist;
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			exist = objLayer.isLoginNameExist( this.LoginName );
			
			if ( exist > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool IsUserExist(string userName, int roleID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if( (dataLayer.IsUserExist( userName, roleID)) > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}