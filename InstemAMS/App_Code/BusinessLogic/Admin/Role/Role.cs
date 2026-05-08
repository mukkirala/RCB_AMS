using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using ARP.DataLayer;

namespace ARP.BusinessLogic.Admin
{
	/// <summary>
	/// Represents a Role in ARP system.
	/// </summary>
	public class Role
	{
		private string _RoleName;
		private string _Privileges;
		private string _Description;
		private bool _Status;
		private int _RoleID;


		public string RoleName
		{
			get
			{
				return _RoleName;
			}
			set
			{
				_RoleName = value;
			}
		}

		public string Privileges
		{
			get
			{
				return _Privileges;
			}
			set
			{
				_Privileges = value;
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

		public string Description
		{
			get
			{
				return _Description;
			}
			set
			{
				_Description = value;
			}
		}

		public int RoleID
		{
			get
			{
				return _RoleID;
			}
			set
			{
				_RoleID = value;
			}
		}

		public bool Save()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			int TempId = dataLayer.CreateNewRole(this);

			if(TempId>0)
			{
				return true;
			}
			return false;
		}

		public DataSet GetAllRoles()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllRoles();
		}

		public DataSet GetRolesBySearch()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetRoleBySearch(RoleName);
		}

		public DataSet GetOnlyRoles()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetOnlyRoles();
		}

		public DataSet GetActiveRoles()
		{
			SQLDataAccessLayer dataLayer1 = new SQLDataAccessLayer();
			return dataLayer1.GetAllActiveRoles();
		}

		public static bool IsRoleExist(string roleName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsRoleExists(roleName) >0)
			{
				return true;
			}

			return false;
		}

		public static bool IsRoleExist(string roleName, int roleID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsRoleExists(roleName, roleID) >0)
			{
				return true;
			}

			return false;
		}

		public bool DeleteRole()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.DeleteRole( _RoleID );            

			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool UpdateRole()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateRole(this);            

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
			result = dataLayer.UpdateRoleStatus(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}

		public DataSet GetSingleRole()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.GetSingleRole( RoleID );  
   
			return result;
		}
	}
}