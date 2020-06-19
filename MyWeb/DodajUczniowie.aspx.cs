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
    public partial class DodajUczniowie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlKlasa", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sKlasa", '%'));

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                adapter.Fill(data);

                m_add_klasa.DataSource = data;
                m_add_klasa.DataTextField = "nazwa";
                m_add_klasa.DataValueField = "idKlasa";
                
                m_add_klasa.DataBind();
            }

         }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Uczniowie.aspx");
        }
        protected void m_zapisz_przycisk(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("dodajUczen", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sImie", m_add_imie.Text));
                cmd.Parameters.Add(new SqlParameter("@sNazwisko", m_add_nazwisko.Text));
                cmd.Parameters.Add(new SqlParameter("@sAdres", m_add_adres.Text));
                cmd.Parameters.Add(new SqlParameter("@sNrTel", m_add_nr_tel.Text));
                cmd.Parameters.Add(new SqlParameter("@sIdKlasa", m_add_klasa.Text));

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Uczniowie.aspx");
        }
    }
}