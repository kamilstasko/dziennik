using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWeb
{
    public partial class DodajKlasy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Klasy.aspx");
        }
        protected void m_zapisz_przycisk(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("dodajKlasa", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sNazwa", m_add_klasa.Text));

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Klasy.aspx");
        }
    }
}