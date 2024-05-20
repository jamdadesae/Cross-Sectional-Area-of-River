using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;

namespace CrossSectionArea
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) 
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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
        }
    
    }
}