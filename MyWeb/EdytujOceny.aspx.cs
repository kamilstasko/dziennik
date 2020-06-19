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
    public partial class EdytujOceny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            m_usun.Attributes.Add("onclick", "return(confirm('Jesteś pewny że chcesz usunąć klasę ?'));");

            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string selectedUczen = "";
                string selectedPrzedmiot = "";
                string selectedNauczyciel = "";
                string selectedOcena = "";

                SqlCommand cmd = new SqlCommand("wyswietlWynikId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@sId", id.ToString()));

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    selectedUczen = rdr["idUczen"].ToString().Trim();
                    selectedPrzedmiot = rdr["idPrzedmiot"].ToString().Trim();
                    selectedNauczyciel = rdr["idNauczyciel"].ToString().Trim();
                    selectedOcena = rdr["idOcena"].ToString().Trim();
                    break;
                }
                con.Close();

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

                m_change_uczen.DataSource = data2;
                m_change_uczen.DataTextField = "uczen";
                m_change_uczen.DataValueField = "idUczen";
                m_change_uczen.SelectedValue = selectedUczen;
                m_change_uczen.DataBind();

                //przedmiot

                SqlCommand cmd3 = new SqlCommand("wyswietlPrzedmiot", con);
                cmd3.CommandType = CommandType.StoredProcedure;

                cmd3.Parameters.Add(new SqlParameter("@sPrzedmiot", '%'));

                SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
                DataTable data3 = new DataTable();
                adapter3.Fill(data3);

                m_change_przedmiot.DataSource = data3;
                m_change_przedmiot.DataTextField = "nazwa";
                m_change_przedmiot.DataValueField = "idPrzedmiot";
                m_change_przedmiot.SelectedValue = selectedPrzedmiot;
                m_change_przedmiot.DataBind();

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

                m_change_nauczyciel.DataSource = data4;
                m_change_nauczyciel.DataTextField = "nauczyciel";
                m_change_nauczyciel.DataValueField = "idNauczyciel";
                m_change_nauczyciel.SelectedValue = selectedNauczyciel;
                m_change_nauczyciel.DataBind();

                //ocena

                SqlCommand cmd5 = new SqlCommand("wyswietlOcena", con);
                cmd5.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter5 = new SqlDataAdapter(cmd5);
                DataTable data5 = new DataTable();
                adapter5.Fill(data5);

                m_change_ocena.DataSource = data5;
                m_change_ocena.DataTextField = "stopien";
                m_change_ocena.DataValueField = "idOcena";
                m_change_ocena.SelectedValue = selectedOcena;
                m_change_ocena.DataBind();
            }
        }
        protected void m_anuluj_przycisk(object sender, EventArgs e)
        {
            Response.Redirect("Oceny.aspx");
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
                SqlCommand cmd = new SqlCommand("usunWynik", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Oceny.aspx");
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
                SqlCommand cmd = new SqlCommand("aktualizujWynik", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@sId", id.ToString());
                cmd.Parameters.Add(parameter1);

                SqlParameter parameter2 = new SqlParameter("@sUczen", m_change_uczen.Text);
                cmd.Parameters.Add(parameter2);

                SqlParameter parameter3 = new SqlParameter("@sOcena", m_change_ocena.Text);
                cmd.Parameters.Add(parameter3);

                SqlParameter parameter4 = new SqlParameter("@sNauczyciel", m_change_nauczyciel.Text);
                cmd.Parameters.Add(parameter4);

                SqlParameter parameter5 = new SqlParameter("@sPrzedmiot", m_change_przedmiot.Text);
                cmd.Parameters.Add(parameter5);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Oceny.aspx");
        }
    }
}