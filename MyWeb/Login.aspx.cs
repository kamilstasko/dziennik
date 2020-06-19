using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MyWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Authenticate agains the list stored in web.config
            if (FormsAuthentication.Authenticate(txtUserName.Text, txtPassword.Text))
            {
                // Create the authentication cookie and redirect the user to welcome page
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, chkBoxRememberMe.Checked);
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Błędny login lub hasło";
            }
        }
    }
}