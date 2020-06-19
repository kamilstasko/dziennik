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
    public partial class EdytujUczniowie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            m_usun.Attributes.Add("onclick", "return(confirm('Jesteś pewny że chcesz usunąć ucznia ?'));");

            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string selectedValue = "";

                SqlCommand cmd = new SqlCommand("wyswietlUczenId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sId", id.ToString()));

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    m_change_imie.Text = rdr["imie"].ToString().Trim();
                    m_change_nazwisko.Text = rdr["nazwisko"].ToString().Trim();
                    m_change_adres.Text = rdr["adres"].ToString().Trim();
                    m_change_nr_tel.Text = rdr["nr_tel"].ToString().Trim();
                    selectedValue = rdr["idKlasa"].ToString().Trim();
                    break;
                }
                con.Close();

                SqlCommand cmd2 = new SqlCommand("wyswietlKlasa", con);
                cmd2.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@sKlasa", '%');
                cmd2.Parameters.Add(param1);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
                DataTable data = new DataTable();
                adapter.Fill(data);

                m_change_klasa.DataSource = data;
                m_change_klasa.DataTextField = "nazwa";
                m_change_klasa.DataValueField = "idKlasa";
                m_change_klasa.SelectedValue = selectedValue;
                m_change_klasa.DataBind();
            }
        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Uczniowie.aspx");
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
                SqlCommand cmd = new SqlCommand("usunUczen", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Uczniowie.aspx");
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
                SqlCommand cmd = new SqlCommand("aktualizujUczen", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                SqlParameter parameter2 = new SqlParameter("@sImie", m_change_imie.Text);
                cmd.Parameters.Add(parameter2);

                SqlParameter parameter3 = new SqlParameter("@sNazwisko", m_change_nazwisko.Text);
                cmd.Parameters.Add(parameter3);

                SqlParameter parameter4 = new SqlParameter("@sAdres", m_change_adres.Text);
                cmd.Parameters.Add(parameter4);

                SqlParameter parameter5 = new SqlParameter("@sNrTel", m_change_nr_tel.Text);
                cmd.Parameters.Add(parameter5);

                SqlParameter parameter6 = new SqlParameter("@sIdKlasa", m_change_klasa.Text);
                cmd.Parameters.Add(parameter6);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Uczniowie.aspx");
        }
    }
}