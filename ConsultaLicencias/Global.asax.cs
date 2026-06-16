using System;
using System.IO;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

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

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            #if DEBUG
            System.Diagnostics.Debug.WriteLine(
                string.Format(
                    "[{0:yyyy-MM-dd HH:mm:ss}] {1} {2}",
                    DateTime.Now,
                    Request.HttpMethod,
                    Request.Url));
            #endif
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();

            try
            {
                string appData = Server.MapPath("~/App_Data");

                if (!Directory.Exists(appData))
                    Directory.CreateDirectory(appData);

                string logFile = Path.Combine(
                    appData,
                    $"ErrorLog_{DateTime.Now:yyyyMMdd}.txt");

                HttpException httpEx = ex as HttpException;

                int statusCode = 500;

                if (httpEx != null)
                    statusCode = httpEx.GetHttpCode();

                string message =
                    Environment.NewLine +
                    "==================================================" +
                    Environment.NewLine +
                    $"Fecha        : {DateTime.Now:yyyy-MM-dd HH:mm:ss}" +
                    Environment.NewLine +
                    $"StatusCode   : {statusCode}" +
                    Environment.NewLine +
                    $"URL          : {Request.Url}" +
                    Environment.NewLine +
                    $"Usuario      : {(Context?.User?.Identity?.Name ?? "Anonimo")}" +
                    Environment.NewLine +
                    $"IP           : {Request.UserHostAddress}" +
                    Environment.NewLine +
                    $"Excepcion    : {ex?.GetType().FullName}" +
                    Environment.NewLine +
                    $"Mensaje      : {ex?.Message}" +
                    Environment.NewLine +
                    $"Inner        : {ex?.InnerException?.Message}" +
                    Environment.NewLine +
                    $"StackTrace   : {ex?.StackTrace}" +
                    Environment.NewLine;

                File.AppendAllText(logFile, message);
            }
            catch
            {
                // Nunca romper el manejador de errores.
            }

#if !DEBUG

HttpException httpException = ex as HttpException;
int code = httpException?.GetHttpCode() ?? 500;

Server.ClearError();

switch (code)
{
    case 401:
        Response.Redirect("~/Error401.aspx", false);
        break;

    case 404:
        Response.Redirect("~/Error404.aspx", false);
        break;

    default:
        Response.Redirect("~/Error500.aspx", false);
        break;
}

Context.ApplicationInstance.CompleteRequest();

#endif
        }
    }
}
