using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridFill();
        }
    }
 
    protected void GridFill()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SignUpDataGrid", conn)
        {
            CommandType = CommandType.StoredProcedure
        };
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }


    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        string query = "SELECT * FROM tbl_sign";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    protected void submit_btn_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd;
            if (submit_btn.Text == "Save")
            {
                cmd = new SqlCommand("signup_insert", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@FULL_NAME", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@PHONE", txtphone.Text.Trim());
                cmd.Parameters.AddWithValue("@USERNAME", txtuname.Text.Trim());
                cmd.Parameters.AddWithValue("@PASSWORD", txtpass.Text.Trim());
            }
            else if (submit_btn.Text == "Update")
            {
                cmd = new SqlCommand("SignUpUpdate", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID", (ViewState["lbl_Id"]));
                cmd.Parameters.AddWithValue("@FULL_NAME", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@PHONE", txtphone.Text.Trim());
                cmd.Parameters.AddWithValue("@USERNAME", txtuname.Text.Trim());
                cmd.Parameters.AddWithValue("@PASSWORD", txtpass.Text.Trim());
                submit_btn.Text = "Save";
            }
            else
            {
                return;
            }

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridFill();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd;
            if (e.CommandName == "UpdateRecord")
            {
                Label lbl_FullName = (Label)row.FindControl("lbl_FullName");
                Label lbl_Email = (Label)row.FindControl("lbl_Email");
                Label lbl_Phone = (Label)row.FindControl("lbl_Phone");
                Label lbl_USERNAME = (Label)row.FindControl("lbl_USERNAME");
                Label lbl_PASSWORD = (Label)row.FindControl("lbl_PASSWORD");

                txtname.Text = lbl_FullName.Text;
                txtemail.Text = lbl_Email.Text;
                txtphone.Text = lbl_Phone.Text;
                txtuname.Text = lbl_USERNAME.Text;
                txtpass.Text = lbl_PASSWORD.Text;

                ViewState["lbl_Id"] = e.CommandArgument;
                submit_btn.Text = "Update";
            }
            else if (e.CommandName == "DeleteRecord")
            {
                cmd = new SqlCommand("SignUpDelete", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID", (e.CommandArgument));
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable ds = new DataTable();
                sda.Fill(ds);
                GridFill();
            }
        }
    }
}
