using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DataCommunicationsSP21Final
{
    public partial class add_payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            String myConStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConDBStr"].ConnectionString;
            String mySQL = "INSERT INTO Payment (PayMade, FK_PropertyID )" + "VALUES (@PayMade, @FK_PropertyID)";
            using (SqlConnection myCon = new SqlConnection(myConStr))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@PayMade", ddlPay.SelectedValue);
                    myCom.Parameters.AddWithValue("@FK_PropertyID", ddlTenant.SelectedValue);
                    myCon.Open();
                    myCom.ExecuteNonQuery();
                    myCon.Close();
                    lblOut.Text = "Successfully Inserted";
                    gvPay.DataBind();
                }
            }
        }
    }
    }
