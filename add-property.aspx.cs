using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DataCommunicationsSP21Final
{
    public partial class add_property : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            String myConStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConDBStr"].ConnectionString;
            String mySQL = "INSERT INTO Property (Rent, Address)" + "VALUES (@Rent, @Address)";
            using (SqlConnection myCon = new SqlConnection(myConStr))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@Rent", txtRent.Text);
                    myCom.Parameters.AddWithValue("@Address", txtAddress.Text);
                    myCon.Open();
                    myCom.ExecuteNonQuery();
                    myCon.Close();
                    lblOut.Text = "Successfully Inserted";
                    gvCombo.DataBind();

                }
            }
        }
    }
}