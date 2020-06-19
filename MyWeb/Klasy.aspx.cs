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
    public partial class Klasy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlKlasa", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@sKlasa", '%' + m_search_klasa.Text + '%');
                cmd.Parameters.Add(param1);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet data = new DataSet();
                adapter.Fill(data);

                this.m_rptKlasy.DataSource = data;

                this.m_rptKlasy.DataBind();
            }
        }
        protected void m_add_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajKlasy.aspx");
        }
    }
}