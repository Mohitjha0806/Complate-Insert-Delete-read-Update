<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div style="height: 100vh;" class="py-4 col-md-3 bg-danger-subtle">
                    <div class="container">
                        <asp:Label ID="lbl_msg" runat="server"  />
                        <h1 class="display-6 mt-3 fw-semibold text-center">Sign Up</h1>
                        <div class="col mt-5">
                            <asp:TextBox runat="server" ID="txtname" Placeholder="Full Name" CssClass="fs-6 form-control fw-semibold border-2 border-primary-subtle" />
                          <%--  <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="red" ControlToValidate="txtname" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="regExValidator"
                                runat="server"
                                ControlToValidate="txtname"
                                ErrorMessage="Invalid input"
                                ForeColor="red"
                                Display="Dynamic"
                                ValidationExpression="^[A-Za-z\s]+$"
                                InitialValue="Enter name" />--%>
                        </div>

                        <div class="col mt-3">
                            <asp:TextBox runat="server" ID="txtemail" Placeholder="Email" TextMode="Email" MaxLength="24" CssClass="fs-6 form-control fw-semibold border-2 border-primary-subtle" />
                           <%-- <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="red" ControlToValidate="txtemail" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="regExValidatorEmail"
                                runat="server"
                                ControlToValidate="txtemail"
                                ErrorMessage="Invalid email format"
                                ForeColor="red"
                                Display="Dynamic"
                                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,}$"
                                InitialValue="Enter email" />--%>
                        </div>

                        <div class="col mt-3">
                            <asp:TextBox runat="server" ID="txtphone" Placeholder="Phone" TextMode="Phone" MaxLength="10" CssClass="fs-6 form-control fw-semibold border-2 border-primary-subtle" />
                            <%--<asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="red" ControlToValidate="txtphone" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="regExValidatorPhone"
                                runat="server"
                                ControlToValidate="txtphone"
                                ErrorMessage="Invalid phone number format"
                                ForeColor="red"
                                Display="Dynamic"
                                ValidationExpression="^\+?[1-9]\d{1,14}$"
                                InitialValue="Enter phone number" />--%>
                        </div>


                        <div class="col mt-3">
                            <asp:TextBox runat="server" ID="txtuname" Placeholder="User Name" MaxLength="14" CssClass="fs-6 form-control fw-semibold border-2 border-primary-subtle" />
                           <%-- <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="red" ControlToValidate="txtuname" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="regExValidatorUsername"
                                runat="server"
                                ControlToValidate="txtuname"
                                ErrorMessage="Invalid username format"
                                ForeColor="red"
                                Display="Dynamic"
                                ValidationExpression="^[a-zA-Z0-9_]{5,20}$"
                                InitialValue="Enter username" />--%>
                        </div>


                        <div class="col mt-3">
                            <asp:TextBox runat="server" Placeholder="Password" ID="txtpass" TextMode="Password" MaxLength="16" CssClass="fs-6 form-control fw-semibold border-2 border-primary-subtle" />
                            <%--<asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="red" ControlToValidate="txtpass" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="regExValidatorPassword"
                                runat="server"
                                ControlToValidate="txtpass"
                                ErrorMessage="Invalid password format"
                                ForeColor="red"
                                Display="Dynamic"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                                InitialValue="Enter password" />--%>
                        </div>

                        <div class="row mt-3  d-flex justify-content-center">
                            <div class="col-4">
                                <asp:Button Text="Save" CssClass="px-4 btn btn-success" runat="server" ID="submit_btn" OnClick="submit_btn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button Text="Clear" CssClass="px-4 btn btn-danger" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 bg-info-subtle">
                    <div class="container py-4">
                        <h1 class="display-6 mt-3 fw-semibold text-center">Data</h1>
                        <div class="row">

                            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" CssClass="table table-bordered border-dark-subtle px-4" DataKeyNames="ID" OnRowCommand="GridView1_RowCommand" >
                                <Columns>
                                    <asp:TemplateField Visible="false" HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("ID") %>' runat="server" ID="lbl_Id" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Full Name">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("FULL_NAME") %>' runat="server" ID="lbl_FullName" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("EMAIL") %>' runat="server" ID="lbl_Email" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Phone">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("PHONE") %>' runat="server" ID="lbl_Phone" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Username">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("USERNAME") %>' runat="server" ID="lbl_USERNAME" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField Visible="false" HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#Eval("PASSWORD") %>' ID="lbl_PASSWORD" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update/Remove">
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Update" CssClass="btn btn-warning" CommandName="UpdateRecord" CommandArgument='<%# "ID"%>' runat="server" />
                                            <asp:LinkButton Text="Delete" CssClass="btn btn-danger" CommandName="DeleteRecord" CommandArgument='<%# "ID"%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
