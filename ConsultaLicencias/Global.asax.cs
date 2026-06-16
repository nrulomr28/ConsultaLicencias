using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using ConsultaLicencias;

namespace ConsultaLicencias
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();

            // Log the error (example: write to a file, database, or event log)
            string errorMessage = $"Error occurred at {DateTime.Now}: {ex.Message}\nStack Trace: {ex.StackTrace}";
            string logPath = Server.MapPath("~/App_Data/ErrorLog.txt");


            try
            {
                // Append the error to a log file
                System.IO.File.AppendAllText(logPath, errorMessage + "\n\n");
            }
            catch
            {
                // Handle any issues with logging (e.g., file access issues)
                // Optionally, you could use another logging mechanism here
            }

            // Optionally, clear the error to prevent it from propagating
            Server.ClearError();

            // Redirect to a custom error page (optional)
            //Response.Redirect("~/Error.aspx");

        }
    }
}
