<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="E_learning.Course" %>
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
             <h1 style="margin-top: 33px; font-weight: 20;">Course</h1>
         </center>
        <hr />
        <br />
        <form id="form1" runat="server">
             <uc:SidebarControl runat="server" />


            <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="form-group">
                        COURSE_ID:
                        <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' CssClass="form-control" />
                        <br />
                        COURSE_TITLE:
                        <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' CssClass="form-control" />
                        <br />
                        DURATION:
                        <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' CssClass="form-control" />
                        <br />
                        PRICE:
                        <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' CssClass="form-control" />
                        <br />
                        DESCRIPTION:
                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary custom-width custom-color custom-margin" />
                </ItemTemplate>
            </asp:FormView>


                <asp:GridView class="table table-hover" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        
                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                        <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                        <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                        
                        <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-secondary" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle CssClass="btn btn-danger" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;DURATION&quot;, &quot;PRICE&quot;, &quot;DESCRIPTION&quot;) VALUES (:COURSE_ID, :COURSE_TITLE, :DURATION, :PRICE, :DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;DURATION&quot;, &quot;PRICE&quot;, &quot;DESCRIPTION&quot; FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE, &quot;DURATION&quot; = :DURATION, &quot;PRICE&quot; = :PRICE, &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="COURSE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="COURSE_ID" Type="String" />
                        <asp:Parameter Name="COURSE_TITLE" Type="String" />
                        <asp:Parameter Name="DURATION" Type="String" />
                        <asp:Parameter Name="PRICE" Type="Decimal" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="COURSE_TITLE" Type="String" />
                        <asp:Parameter Name="DURATION" Type="String" />
                        <asp:Parameter Name="PRICE" Type="Decimal" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                        <asp:Parameter Name="COURSE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

        </form>

    </div>
</body>
</html>
