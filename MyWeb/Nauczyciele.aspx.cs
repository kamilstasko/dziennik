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
    public partial class Nauczyciele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlNauczyciel", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@sImie", '%' + m_search_imie.Text + '%');
                cmd.Parameters.Add(param1);

                SqlParameter param2 = new SqlParameter("@sNazwisko", '%' + m_search_nazwisko.Text + '%');
                cmd.Parameters.Add(param2);

                SqlParameter param3 = new SqlParameter("@sAdres", '%' + m_search_adres.Text + '%');
                cmd.Parameters.Add(param3);

                SqlParameter param4 = new SqlParameter("@sNrTel", '%' + m_search_nr_tel.Text + '%');
                cmd.Parameters.Add(param4);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet data = new DataSet();
                adapter.Fill(data);

                this.m_rptNauczyciele.DataSource = data;

                this.m_rptNauczyciele.DataBind();
            }
        }
        protected void m_add_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajNauczyciele.aspx");
        }
    }
}