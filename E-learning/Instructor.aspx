<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="E_learning.Instructor" %>

<%@ Register Src="~/sidebar.ascx" TagName="SidebarControl" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />

    <style>
        .custom-width {
            width: 150px; /* Adjust the width as needed */
        }

        .custom-color {
            background-color: #065036; /* Change to the desired color */
            color: white;
        }

        .custom-margin {
            margin-right: 20px; /* Adjust the margin as needed */
        }
    </style>
</head>
<body>

    <div class="main">

        <center>
            <h1 style="margin-top: 33px; font-weight: 20;">Instructor</h1>
        </center>
        <hr />
        <br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="form-group">
                        INSTRUCTOR_ID:
            <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control" />
                        <br />
                        COURSE_COURSE_ID:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" CssClass="form-control" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>'>
            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_ID, COURSE_TITLE FROM COURSE"></asp:SqlDataSource>
                        <br />
                        INSTRUCTOR_NAME:
            <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control" />
                        <br />
                        CONTACT:
            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control" />
                        <br />
                        EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                        <br />
                        SPECIALIZE:
            <asp:TextBox ID="SPECIALIZETextBox" runat="server" Text='<%# Bind("SPECIALIZE") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Instructor" CssClass="btn btn-primary custom-width custom-color custom-margin" />
                </ItemTemplate>
            </asp:FormView>





            <br />




            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" Width="1631px">
                <Columns>

                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="COURSE_COURSE_ID" HeaderText="COURSE_COURSE_ID" SortExpression="COURSE_COURSE_ID" />
                    <asp:TemplateField HeaderText="Course_title">
                        <ItemTemplate>
                            <asp:DropDownList  ID="DropDownList2" runat="server" DataSourceID="Course_title" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Course_title" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="SPECIALIZE" HeaderText="SPECIALIZE" SortExpression="SPECIALIZE" />
                   

                    <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-secondary" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>


                </Columns>
            </asp:GridView>



            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;SPECIALIZE&quot;) VALUES (:INSTRUCTOR_ID, :COURSE_COURSE_ID, :INSTRUCTOR_NAME, :CONTACT, :EMAIL, :SPECIALIZE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;SPECIALIZE&quot; FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID, &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;SPECIALIZE&quot; = :SPECIALIZE WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
                <DeleteParameters>
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="SPECIALIZE" Type="String" />
                </InsertParameters>

                <UpdateParameters>

                   <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="SPECIALIZE" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </form>

    </div>
</body>
</html>
