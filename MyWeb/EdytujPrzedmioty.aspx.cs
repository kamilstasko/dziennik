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
    public partial class EdytujPrzedmioty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            m_usun.Attributes.Add("onclick", "return(confirm('Jesteś pewny że chcesz usunąć przedmiot ?'));");

            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlPrzedmiotId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sId", id.ToString()));

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    m_change_przedmiot.Text = rdr["nazwa"].ToString().Trim();
                    break;
                }
                con.Close();
            }
        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Przedmioty.aspx");
        }

        protected void m_usun_przycisk(object sender, EventArgs e)
        {
            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("usunPrzedmiot", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Przedmioty.aspx");
                }
                catch
                {
                    Response.Write("<script>if(alert('Nie można usunąć. Najpierw usuń pola w których wykorzystany jest ten rekord.'));</script>");
                }

            }

        }

        protected void m_zapisz_przycisk(object sender, EventArgs e)
        {
            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("aktualizujPrzedmiot", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                SqlParameter parameter2 = new SqlParameter("@sNazwa", m_change_przedmiot.Text);
                cmd.Parameters.Add(parameter2);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Przedmioty.aspx");
        }
    }
}