using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIGARH.Account
{
    public partial class reseteapassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtLogin.Text;
            string password = txtPassword.Text;
            MembershipUser mu = Membership.GetUser(username);

            if (mu != null)
            {
                mu.IsApproved = true;
                if (mu.IsLockedOut)
                {
                    mu.UnlockUser();
                }
                mu.ChangePassword(mu.ResetPassword(), password);
            }

        }
    }
}