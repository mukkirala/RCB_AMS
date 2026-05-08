using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DatabaseConnection
/// </summary>
public class DatabaseConnection
{
    private SqlConnection MyConnection;
    private DataTable sqldatatable = new DataTable();
    string Connectionstring = ConfigurationManager.ConnectionStrings["AttendanceManagementConnectionString"].ConnectionString;


    public DatabaseConnection()
    {
        MyConnection = new SqlConnection(Connectionstring);
    }

    //to execute a nonquery
    public void ExecuteNonQuery(SqlCommand Execuedcmd)
    {
        try
        {
            Execuedcmd.Connection = OpenConnection();
            Execuedcmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
        finally
        {
            Execuedcmd.Connection = CloseConnection();
        }
    }

    //open the db connection
    public SqlConnection OpenConnection()
    {
        if (MyConnection.State == ConnectionState.Closed || MyConnection.State == ConnectionState.Broken)
        {
            MyConnection.Open();
        }
        return MyConnection;
    }

    //close the db connection
    public SqlConnection CloseConnection()
    {
        if (MyConnection.State == ConnectionState.Open)
        {
            MyConnection.Close();
        }
        return MyConnection;
    }

    //to execute a ExecuteScalar
    public int ExecuteScalar(SqlCommand Execcmd)
    {
        int insertid = 0;
        try
        {
            Execcmd.Connection = OpenConnection();
            insertid = Convert.ToInt32(Execcmd.ExecuteScalar());
        }
        catch (Exception Ex)
        {
            Ex.Message.ToString();
        }
        finally
        {
            Execcmd.Connection = CloseConnection();
        }
        return insertid;
    }

    //returns a datatable
    public DataTable returnDataTable(SqlCommand DTcmd)
    {
        SqlDataAdapter DTadapter;
        try
        {
            sqldatatable.Clear();
            DTcmd.Connection = OpenConnection();
            DTadapter = new SqlDataAdapter(DTcmd);
            DTadapter.Fill(sqldatatable);
        }
        catch (Exception Ex)
        {
            Ex.Message.ToString();
        }
        finally
        {
            DTcmd.Connection = CloseConnection();
        }
        return sqldatatable;
    }

}