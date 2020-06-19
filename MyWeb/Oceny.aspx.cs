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
    public partial class Oceny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("wyswietlWynik", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@sUczen", '%'+m_search_uczen.Text+'%');
                cmd.Parameters.Add(param1);

                SqlParameter param2 = new SqlParameter("@sPrzedmiot", '%' + m_search_przedmiot.Text + '%');
                cmd.Parameters.Add(param2);

                SqlParameter param3 = new SqlParameter("@sNauczyciel", '%' + m_search_nauczyciel.Text + '%');
                cmd.Parameters.Add(param3);

                if(m_search_ocena.Text.Length > 0)
                {
                    SqlParameter param4 = new SqlParameter("@sOcena", m_search_ocena.Text);
                    cmd.Parameters.Add(param4);
                }
                else
                {
                    SqlParameter param4 = new SqlParameter("@sOcena", '%');
                    cmd.Parameters.Add(param4);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet data = new DataSet();
                adapter.Fill(data);

                this.m_rptOceny.DataSource = data;

                this.m_rptOceny.DataBind();
            }
        }
        protected void m_add_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajOceny.aspx");
        }
    }
}