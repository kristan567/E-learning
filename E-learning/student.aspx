<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="E_learning.student" %>

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
            <h1 style="margin-top: 33px; font-weight: 20;">Student</h1>
        </center>
        <hr />
        <br />

        <form id="form1" runat="server">
             <uc:SidebarControl runat="server" />




            <br />

            <asp:FormView ID="FormView2" runat="server" DataKeyNames="STUDENT_NUMBER" DataSourceID="SqlDataSource1" Width="584px">
                <InsertItemTemplate>
                    <div class="form-group" style="height: auto; width: 100%;">
                        STUDENT_NUMBER:
                        <asp:TextBox ID="STUDENT_NUMBERTextBox" runat="server" Text='<%# Bind("STUDENT_NUMBER") %>' CssClass="form-control" />
                        <br />
                        STUDENT_NAME:
                        <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control" />
                        <br />
                        DATE_OF_BIRTH:
                        <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' CssClass="form-control" />
                        <br />
                        CONTACT:
                        <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control" />
                        <br />
                        EMAIL:
                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                        <br />
                        COUNTRY:
                        <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" CssClass="btn btn-primary custom-width custom-color custom-margin" />
                </ItemTemplate>
            </asp:FormView>




            <br />

           




            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_NUMBER" DataSourceID="SqlDataSource1" AllowPaging="True">


                <Columns>

                    <asp:BoundField DataField="STUDENT_NUMBER" HeaderText="STUDENT_NUMBER" ReadOnly="True" SortExpression="STUDENT_NUMBER" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />

                    <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-secondary" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>




                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_NUMBER&quot; = :STUDENT_NUMBER" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_NUMBER, :STUDENT_NAME, :DATE_OF_BIRTH, :CONTACT, :EMAIL, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;COUNTRY&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_NUMBER&quot; = :STUDENT_NUMBER">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_NUMBER" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="STUDENT_NAME" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    <asp:Parameter Name="CONTACT" Type="Decimal" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="STUDENT_NAME" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    <asp:Parameter Name="CONTACT" Type="Decimal" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="STUDENT_NUMBER" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </form>

    </div>


</body>
</html>
