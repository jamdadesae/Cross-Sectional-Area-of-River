using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SQLite;
using System.Configuration;
namespace CrossSectionArea
{
    public partial class Site1 : System.Web.UI.MasterPage
    {

        string emailid;
        string username;
        string Password;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Labelmsg.Visible = false;
        }

        protected void ButtonReg_Click(object sender, EventArgs e)
        {
            string dbcon = ConfigurationManager.ConnectionStrings["dataconnection"].ConnectionString;
            SQLiteConnection con1 = new SQLiteConnection(dbcon);
            //select
            con1.Open();
            string qr = "select * from Registration where emailid='"+TextBoxemail.Text+"'" ;// FROM DATABASE 
            SQLiteCommand cmd = new SQLiteCommand(qr, con1);
            SQLiteDataReader d = cmd.ExecuteReader();
            while (d.Read()) //fetch
            {
                emailid = d["emailid"].ToString(); 

            }

            if ( emailid == TextBoxemail.Text )
            {
                Labelmsg.Visible = true;
                Labelmsg.Text = "You Have already Registered";
            }
            else
            {
                string stringQuery = "INSERT INTO Registration" + "(name,emailid,password)" + "Values('" + TextBoxName.Text + "','" + TextBoxemail.Text + "','" + TextBoxpassword.Text + "')";//insert the studyinfo into Db

                //Open the SqliteConnection
                var SqliteCmd = new SQLiteCommand();//Initialize the SqliteCommand
                SqliteCmd = con1.CreateCommand();//Create the SqliteCommand
                SqliteCmd.CommandText = stringQuery;//Assigning the query to CommandText
                SqliteCmd.ExecuteNonQuery();//Execute the SqliteCommand
                con1.Close();//Close the SqliteConnection

                Labelmsg.Visible = true;
                Labelmsg.Text = "You Have Register Successfully";
            }
           




                        



        }
        protected void ButtonLog_Click(object sender, EventArgs e)
        {
            string dbcon = ConfigurationManager.ConnectionStrings["dataconnection"].ConnectionString;
            SQLiteConnection con1 = new SQLiteConnection(dbcon);
            //select
            con1.Open();
            string qr = "select * from Registration where emailid='" + TextBoxusername.Text + "'";// FROM DATABASE 
            SQLiteCommand cmd = new SQLiteCommand(qr, con1);
            SQLiteDataReader d = cmd.ExecuteReader();
            while (d.Read()) //fetch
            {
                emailid = d["emailid"].ToString();

            }

            if (emailid == TextBoxusername.Text)
            {
                Labelmsg.Visible = true;
                Labelmsg.Text = "Logged In!";
            }
            else
            {
                con1.Close();//Close the SqliteConnection

                Labelmsg.Visible = true;
                Labelmsg.Text = "Please Registerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr!";
            }



        }
    }
}