using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindGridView2(); // Bind data to GridView on initial page load
        }
    }

    private void BindGridView2()
    {
        string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        string query = "SELECT * FROM tbl_sign;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (submit_btn.Text == "Save")
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("signup_insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FULL_NAME", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@PHONE", txtphone.Text.Trim());
                cmd.Parameters.AddWithValue("@USERNAME", txtuname.Text.Trim());
                cmd.Parameters.AddWithValue("@PASSWORD", txtpass.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridFill();
                conn.Close();

                txtname.Text = "";
                txtemail.Text = String.Empty;
                txtphone.Text = String.Empty;
                txtuname.Text = String.Empty;
                txtpass.Text = String.Empty;


            }
            else if (submit_btn.Text == "Update")
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SignUpUpdate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FULL_NAME", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@PHONE", txtphone.Text.Trim());
                cmd.Parameters.AddWithValue("@USERNAME", txtuname.Text.Trim());
                cmd.Parameters.AddWithValue("@PASSWORD", txtpass.Text.Trim());
                cmd.Parameters.AddWithValue("@ID", txt_id.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataBind();
                conn.Close();
                txtname.Text = String.Empty;
                txtemail.Text = String.Empty;
                txtphone.Text = String.Empty;
                txtuname.Text = String.Empty;
                txtpass.Text = String.Empty;

                submit_btn.Text = "Submit";
                BindGridView2();
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Error : " + ex;
        }
    }
    protected void GridFill()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SignUpDataGrid", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        conn.Close();
    }

    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            SqlCommand cmd;
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            if (e.CommandName == "UpdateRecord")
            {
                Label lbl_FullName = (Label)row.FindControl("lbl_FullName");
                Label lbl_Email = (Label)row.FindControl("lbl_Email");
                Label lbl_Phone = (Label)row.FindControl("lbl_Phone");
                Label lbl_USERNAME = (Label)row.FindControl("lbl_USERNAME");
                Label lbl_PASSWORD = (Label)row.FindControl("lbl_PASSWORD");
                Label lbl_Id = (Label)row.FindControl("lbl_Id");

                txtname.Text = lbl_FullName.Text;
                txtemail.Text = lbl_Email.Text;
                txtphone.Text = lbl_Phone.Text;
                txtuname.Text = lbl_USERNAME.Text;
                txtpass.Text = lbl_PASSWORD.Text;
                txt_id.Text = lbl_Id.Text;
                submit_btn.Text = "Update";
            }
            else if (e.CommandName == "DeleteRecord")
            {
                string commandArgument = e.CommandArgument.ToString();
                int id;
                if (int.TryParse(commandArgument, out id))

               { 
                string query = "DELETE FROM tbl_sign WHERE ID = @ID";
                string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;


                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                this.BindGridView2();
            }
                else
                {
                    lblmsg.Text = "Error: Invalid ID format.";
                }
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Error : " + ex.Message;
        }
    }
}

























  