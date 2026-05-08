using System;
using ARP.DataLayer ;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web;
//using GOATechnologies.Tools;
namespace ARP.BusinessLogic.Misc
{
	/// <summary>
	/// Contains some useful methods for various operations
	/// </summary>
	public class Utilities
	{
		public static DataSet GetPrivilages()
		{
			SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			return dbLayer.GetAllPrevileges();
		}
		
		public static DataSet GetAllRoles()
		{
			SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			return dbLayer.GetAllRoles();
		}

		public static void UpdateLog( string userID, string logInfo )
		{
            SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			dbLayer.WriteLogInfo( userID,logInfo );			
		}

		public static Hashtable GetRightsForPage(string pageUrl,string privList)
		{
			DataSet ds = new DataSet();
			Hashtable ht = new Hashtable();

			SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			ds = dbLayer.GetAllPrevileges(pageUrl);

			if(ds.Tables[0].Rows.Count >0)
			{
				for(int i=0;i<ds.Tables[0].Rows.Count;i++)
				{
					DataRow dr;
					dr = ds.Tables[0].Rows[i];

					if(privList.ToCharArray()[(System.Convert.ToInt32(dr["PRIV_INDEX"].ToString()))-1] == '1')
					{
                        ht[dr["PRIV_NAME"].ToString()] = true;
					}
					else
					{
                        ht[dr["PRIV_NAME"].ToString()] = false;
					}
				}
			}

			return ht;
		}

		public static bool IsPageAccessable(string pageName,string privList)
		{
			DataSet ds = new DataSet();
			Hashtable ht = new Hashtable();

			SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			ds = dbLayer.GetAllPrevileges(pageName);

			if(ds.Tables[0].Rows.Count>0)
			{
				for(int i=0;i< ds.Tables[0].Rows.Count;i++)
				{
					DataRow dr;
					dr = ds.Tables[0].Rows[i];

					if(privList.ToCharArray()[(System.Convert.ToInt32(dr["PRIV_INDEX"].ToString()))-1] == '1')
					{
						return true;
					}
				}
			}

			return false;
		}

		public static string AdjustQuote(string value)
		{
			return value.Replace("'","''");
		}

		public static string RevertQuote(string value)
		{
			return value.Replace("''","'");
		}

		public static bool ValidateLogin(string loginName, string password)
		{
			int result;

			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();
			result = dataLayer.ValidateLogin(loginName, password);

			if ( result > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public static string GetClientByUser( string clientName )
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();		
			return dataLayer.GetClientNameByUser( clientName );			
		}
		public static string GetPrivlegeByUser(string loginName)
		{
			SQLDataAccessLayer dataLayer = new SQLDataAccessLayer();		
			return dataLayer.GetPrivlegeByUser(loginName);
		}
		
		public static Hashtable GetUsersLink(string privList)
		{
			DataSet ds = new DataSet();                                                                                                                                                                                                                                                                                                                                 
			Hashtable ht = new Hashtable();

			SQLDataAccessLayer dbLayer = new SQLDataAccessLayer();
			ds = dbLayer.GetAllPrevileges();

			if(ds.Tables[0].Rows.Count>0)
			{
				for(int i=0;i< ds.Tables[0].Rows.Count;i++)
				{
					DataRow dr;
					dr = ds.Tables[0].Rows[i];

					if(privList.ToCharArray()[(System.Convert.ToInt32(dr["PRIV_INDEX"].ToString()))-1] == '1')
					{
						LeftMenuItem m;

						//Log.Write("C:\\arp.txt", i.ToString() + " - " + dr["CATEGORY"].ToString());
						
						if(ht[dr["CATEGORY"]] == null)
						{
							m = new LeftMenuItem();
						}
						else
						{
							m = ht[dr["CATEGORY"]] as LeftMenuItem;
						}

						m.Name = dr["CATEGORY"].ToString();
						Hashtable h = new Hashtable();
						h["PageTitle"] = dr["PAGE_NAME"].ToString();
						h["PageURL"] = dr["PAGE_URL"].ToString();
						//Log.Write("C:\\arp.txt", dr["PRIV_NAME"].ToString());

						m.Links.Add(h);
						ht[dr["CATEGORY"]] = m;
					}
				}
			}
			
			return ht;
		}
		public static string DateConverterIntoDMY(string date)
		{
			if(date.CompareTo ("")!=0)
			{
				string delimiterStr ="/";
				char [] delimiter;
				string [] split = null;
				delimiter = delimiterStr.ToCharArray();
				split = date.Split (delimiter,3);

				if(split.Length <3)
					return "";

				string temp;
				temp = split[0];
				split[0]=split[1];
				split[1]=temp;
				string DMYformat  = "";
				for(int i =0;i<3;i++)
				{
					DMYformat+= split[i];
					if(i<2) DMYformat+="/";
				}
				return DMYformat;
			}
			else return "";
		}

        //created By Monvendra for authentication
        public static void Authentication(string PAGENAME, string PAGEURL)
        {
            string sPrivList = "";
            sPrivList = HttpContext.Current.Session["PRIVLIST"] + "";

            if (sPrivList == "")
            {
                HttpContext.Current.Response.Redirect(WebConfigurationManager.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Session expired. Please login again");
            }

            Hashtable ht = ARP.BusinessLogic.Misc.Utilities.GetRightsForPage(PAGEURL, sPrivList);

            if (ht == null)
            {
                HttpContext.Current.Response.Redirect(WebConfigurationManager.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Page not found");
            }

            if (System.Convert.ToBoolean(ht[PAGENAME].ToString()) == false)
            {
                HttpContext.Current.Response.Redirect("~/UnAuthorisedUser.aspx");
            }

        }
        // Authentication Finished



	}

	public class LeftMenuItem
	{
		public string Name = "";
		public ArrayList Links = new ArrayList();
	}
    
}