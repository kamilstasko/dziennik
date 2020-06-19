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
    public partial class DodajOceny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            using (SqlConnection con = new SqlConnection(cs))
            {
                //uczen

                SqlCommand cmd2 = new SqlCommand("wyswietlUczen", con);
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add(new SqlParameter("@sImie", '%'));
                cmd2.Parameters.Add(new SqlParameter("@sNazwisko", '%'));
                cmd2.Parameters.Add(new SqlParameter("@sAdres", '%'));
                cmd2.Parameters.Add(new SqlParameter("@sNrTel", '%'));
                cmd2.Parameters.Add(new SqlParameter("@sKlasa", '%'));

                SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                DataTable data2 = new DataTable();
                adapter2.Fill(data2);

                m_add_uczen.DataSource = data2;
                m_add_uczen.DataTextField = "uczen";
                m_add_uczen.DataValueField = "idUczen";
                m_add_uczen.DataBind();

                //przedmiot

                SqlCommand cmd3 = new SqlCommand("wyswietlPrzedmiot", con);
                cmd3.CommandType = CommandType.StoredProcedure;

                cmd3.Parameters.Add(new SqlParameter("@sPrzedmiot", '%'));

                SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
                DataTable data3 = new DataTable();
                adapter3.Fill(data3);

                m_add_przedmiot.DataSource = data3;
                m_add_przedmiot.DataTextField = "nazwa";
                m_add_przedmiot.DataValueField = "idPrzedmiot";
                m_add_przedmiot.DataBind();

                //nauczyciel

                SqlCommand cmd4 = new SqlCommand("wyswietlNauczyciel", con);
                cmd4.CommandType = CommandType.StoredProcedure;

                cmd4.Parameters.Add(new SqlParameter("@sImie", '%'));
                cmd4.Parameters.Add(new SqlParameter("@sNazwisko", '%'));
                cmd4.Parameters.Add(new SqlParameter("@sAdres", '%'));
                cmd4.Parameters.Add(new SqlParameter("@sNrTel", '%'));

                SqlDataAdapter adapter4 = new SqlDataAdapter(cmd4);
                DataTable data4 = new DataTable();
                adapter4.Fill(data4);

                m_add_nauczyciel.DataSource = data4;
                m_add_nauczyciel.DataTextField = "nauczyciel";
                m_add_nauczyciel.DataValueField = "idNauczyciel";
                m_add_nauczyciel.DataBind();

                //ocena

                SqlCommand cmd5 = new SqlCommand("wyswietlOcena", con);
                cmd5.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter5 = new SqlDataAdapter(cmd5);
                DataTable data5 = new DataTable();
                adapter5.Fill(data5);

                m_add_ocena.DataSource = data5;
                m_add_ocena.DataTextField = "stopien";
                m_add_ocena.DataValueField = "idOcena";
                m_add_ocena.DataBind();
            }

        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Oceny.aspx");
        }
        protected void m_zapisz_przycisk(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("dodajWynik", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sUczen", m_add_uczen.Text));
                cmd.Parameters.Add(new SqlParameter("@sOcena", m_add_ocena.Text));
                cmd.Parameters.Add(new SqlParameter("@sNauczyciel", m_add_nauczyciel.Text));
                cmd.Parameters.Add(new SqlParameter("@sPrzedmiot", m_add_przedmiot.Text));

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Oceny.aspx");
        }
    }
}