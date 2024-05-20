using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;

namespace CrossSectionArea
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
            uploadform.Visible = false;
            charts1.Visible = false;
            


        }

        protected void processCSV1_Click(object sender, EventArgs e)
        {
            string selectedDataType = dataType.SelectedValue;
            string riverBasinName = riverBasin.Text;
            if (selectedDataType == "Upload")
            {
                if (csvFileInput.HasFile)
                {
                    try
                    {
                        // Specify the path and filename for saving the uploaded file
                        string fileName = Path.Combine(Server.MapPath("CrossSection/UploadedFiles"), "xsectionflow.11.13_xsArea.xlsx");

                        // Save the file to the server
                        csvFileInput.SaveAs(fileName);

                        Response.Write("File uploaded and saved successfully!");

                        Process proc = null;
                        string targetDir = string.Format(Server.MapPath("/"));   //this is where mybatch.bat lies
                        proc = new Process();
                        proc.StartInfo.WorkingDirectory = targetDir;
                        proc.StartInfo.FileName = "anapython.bat";
                        proc.StartInfo.Arguments = string.Format("10");  //this is argument
                        proc.StartInfo.CreateNoWindow = false;
                        proc.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;  //this is for hiding the cmd window...so execution will happen in back ground.
                        proc.Start();
                        
                        proc.WaitForExit();

                        Response.Write("Success!");
                        


                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("Please select a file to upload.");
                }
            }
            else if (selectedDataType == "ManualInput")
            {
                string ManualInput = manualInput.Text;
                Response.Write("Manual Input.");
            }
            else
            {
                Response.Write("Please select a Input method.");
            }

        }

        protected void radiouserupload_CheckedChanged(object sender, EventArgs e)
        {
            uploadform.Visible = true;

        }

        protected void radiocharts_CheckedChanged(object sender, EventArgs e)
        {
            charts1.Visible = true;
            

        }
    }
}

