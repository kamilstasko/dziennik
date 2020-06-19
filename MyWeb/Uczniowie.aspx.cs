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
    public partial class Uczniowie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlUczen", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@sImie", '%' + m_search_imie.Text + '%');
                cmd.Parameters.Add(param1);

                SqlParameter param2 = new SqlParameter("@sNazwisko", '%' + m_search_nazwisko.Text + '%');
                cmd.Parameters.Add(param2);

                SqlParameter param3 = new SqlParameter("@sAdres", '%' + m_search_adres.Text + '%');
                cmd.Parameters.Add(param3);

                SqlParameter param4 = new SqlParameter("@sNrTel", '%' + m_search_nr_tel.Text + '%');
                cmd.Parameters.Add(param4);

                SqlParameter param5 = new SqlParameter("@sKlasa", '%' + m_search_klasa.Text + '%');
                cmd.Parameters.Add(param5);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet data = new DataSet();
                adapter.Fill(data);
              
                this.m_rptUczniowe.DataSource = data;

                this.m_rptUczniowe.DataBind();
            }
        }
        protected void m_add_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajUczniowie.aspx");
        }
    }
}