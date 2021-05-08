using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DataCommunicationsSP21Final
{
    public partial class add_tenant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            String myConStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConDBStr"].ConnectionString;
            String mySQL = "INSERT INTO Tenant (Name, PhoneNumber, LeaseTerm, FK_PropertyID)" + "VALUES (@Name, @Phone, @Lease, @PropID)";
            using (SqlConnection myCon = new SqlConnection(myConStr))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    myCom.Parameters.AddWithValue("@PropID", ddlProperty.SelectedValue);
                    myCom.Parameters.AddWithValue("@Name", txtName.Text);
                    myCom.Parameters.AddWithValue("@Lease", txtLease.Text);
                    myCon.Open();
                    myCom.ExecuteNonQuery();
                    myCon.Close();
                    lblOut.Text = "Successfully Inserted";
                    gvTenant.DataBind();
                }
            }
        }
    }
}