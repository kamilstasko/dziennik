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
    public partial class DodajNauczyciele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Nauczyciele.aspx");
        }
        protected void m_zapisz_przycisk(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("dodajNauczyciel", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sImie", m_add_imie.Text));
                cmd.Parameters.Add(new SqlParameter("@sNazwisko", m_add_nazwisko.Text));
                cmd.Parameters.Add(new SqlParameter("@sAdres", m_add_adres.Text));
                cmd.Parameters.Add(new SqlParameter("@sNrTel", m_add_nr_tel.Text));

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Nauczyciele.aspx");
        }
    }
}