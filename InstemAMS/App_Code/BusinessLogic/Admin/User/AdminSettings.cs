using System;
using System.Data;
using System.Data.SqlClient;
using ARP.BusinessLogic;

namespace ARP.BusinessLogic.Admin
{
	/// <summary>
	/// Summary description for AdminSettings.
	/// </summary>
	public class AdminSettings
	{
		private string _Admin;
		private string _Email;
		private string _Welcometxt;
		private string _username;
		private string _password;
		
		public string Name
		{
			get
			{
                return _Admin;
			}
			set
			{
				_Admin = value;
			}
		}

		public string EMail
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

		public string WelcomeTxt
		{
			get
			{
				return _Welcometxt;
			}
			set
			{
				_Welcometxt = value;
			}
		}

		public string UserName
		{
			get
			{
				return _username;
			}
			set
			{
				_username = value;
			}
		}
		public string PassWord
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

		public AdminSettings()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public bool AddMessage()
		{
			int retres;

			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			retres = objLayer.AddAdminMessage( this );		

			if ( retres > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool UpdatePassWord()
		{
			int retres;
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			retres = objLayer.UpdatePassWord(this );

			if ( retres > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public static DataSet GetAdminSettings()
		{
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			return objLayer.GetAdminSettings();
		}

		public DataSet GetEmailIDsByStatus(int statusID, string jobCode,string fromdate,string todate)
		{
			ARP.DataLayer.SQLDataAccessLayer objLayer = new ARP.DataLayer.SQLDataAccessLayer();
			return objLayer.GetEmailIDsByStatus( statusID, jobCode,fromdate,todate );
		}
	}
}
