using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConsultaLicencias.Infrastructure.Security
{
    public static class SessionGuard
    {
        public static bool TieneSesionActiva()
        {
            return HttpContext.Current?.User?.Identity?.IsAuthenticated == true;
        }
    }
}