using System;
using ARP.BusinessLogic;
using ARP.DataLayer; 
using System.Data; 

namespace ARP.BusinessLogic
{
	/// <summary>
	/// Summary description for Client
	/// </summary>
	public class Client
	{
		private int  _ClientID;
		private string _ClientName;
		private bool _ClientStatus;
		private string _ClientDescription;

		public int ClientID
		{
			get
			{
				return _ClientID;
			}
			set
			{
				_ClientID = value;
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
		public bool ClientStatus
		{
			get
			{
				return _ClientStatus;
			}
			set
			{
				_ClientStatus = value;
			}
		}
		public string ClientDescription
		{
			get
			{
				return _ClientDescription;
			}
			set
			{
				_ClientDescription = value;
			}
		}
		
		public bool Save()
		{
			SQLDataAccessLayer layer = new  SQLDataAccessLayer();
			int result;
			result = layer.AddClient(this);
			if(result>0)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}

		public DataSet GetAllClients()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.getAllClients (); 
		}

		public DataSet GetAllValidClients()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllValidClients (); 
		}

		public static bool IsClientExist(string clientName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsClientExists(clientName) >0)
			{
				return true;
			}

			return false;
		}

		public static bool IsClientExist(string clineName, int ID)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			if(dataLayer.IsClientExists(clineName, ID) >0)
			{
				return true;
			}

			return false;
		}
		
		public DataSet GetClientByID()
		{
			DataSet result;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.GetClientByID ( ClientID );  
   
			return result;
		}		

		public bool UpdateStatus()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateClientStatus(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}

		public bool UpdateAdvtWhenClientChange( string oldName, string newName)
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateAdvtWhenClientChange( oldName, newName );            

			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public string DeleteClient()
		{
			int result;
			int isDeleteOK;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			
			isDeleteOK = dataLayer.isClientDeletePossible( ClientID );

			if ( isDeleteOK > 0 )
			{
				return " You can't delete this client";			
			}
			else
			{
				result = dataLayer.DeleteClient( ClientID );            

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

		public bool UpdateClient()
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.UpdateClient(this);            

			if ( result > 0 )
			{
				return true;
			}

			return false;
		}

		public DataSet GetClientNames()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetAllClientName();
		}

		public DataSet GetClientByName()
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			return dataLayer.GetClientByName(ClientName);
		}


        public DataSet LoadReason(string StatusId)
        {
            SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
            return dataLayer.LoadReason(StatusId);
        }
		public string GetJobCodeByClient( string clientName )
		{
			string jobCode = "";
			DataSet ds;
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			ds = dataLayer.GetJobCodesByClient( clientName );
			int j = 1;
			for ( int i=0; i < ds.Tables[0].Rows.Count; i++ )
			{
				if ( j == ds.Tables[0].Rows.Count )
				{
					jobCode +=  ds.Tables[0].Rows[i]["JobCode"].ToString();
				}
				else
				{
					jobCode +=  ds.Tables[0].Rows[i]["JobCode"].ToString();
					jobCode += ",";
				}
				j++;
			}

			return jobCode;
		}
	}
}
