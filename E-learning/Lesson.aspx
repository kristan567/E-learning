<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="E_learning.Lesson" %>

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
            <h1 style="margin-top: 33px; font-weight: 20;">Lesson</h1>
        </center>
        <hr />
        <br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />

<asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_NO,COURSE_COURSE_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            LESSON_NO:
            <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' CssClass="form-control" />
            <br />
            LESSON_TITLE:
            <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' CssClass="form-control" />
            <br />
            COURSE_COURSE_ID:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>' CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_ID, COURSE_TITLE FROM COURSE"></asp:SqlDataSource>
            <br />
            LESSON_TYPE:
            <asp:TextBox ID="LESSON_TYPETextBox" runat="server" Text='<%# Bind("LESSON_TYPE") %>' CssClass="form-control" />
            <br />
            DESCRIPTION:
            <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Lesson" CssClass="btn btn-primary custom-width custom-color custom-margin" />
    </ItemTemplate>
</asp:FormView>


            <br />

            <div>
                <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_NO,COURSE_COURSE_ID" DataSourceID="SqlDataSource1">
                    <Columns>

                        <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                        <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                        <asp:BoundField DataField="COURSE_COURSE_ID" HeaderText="COURSE_COURSE_ID" ReadOnly="True" SortExpression="COURSE_COURSE_ID" />
                        <asp:TemplateField HeaderText="Course_title">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LESSON_TYPE" HeaderText="LESSON_TYPE" SortExpression="LESSON_TYPE" />
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />

                        <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-secondary" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle CssClass="btn btn-danger" />
                        </asp:CommandField>


                    </Columns>
                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;LESSON_TYPE&quot;, &quot;DESCRIPTION&quot;) VALUES (:LESSON_NO, :LESSON_TITLE, :COURSE_COURSE_ID, :LESSON_TYPE, :DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;LESSON_TYPE&quot;, &quot;DESCRIPTION&quot; FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;LESSON_TYPE&quot; = :LESSON_TYPE, &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="LESSON_NO" Type="String" />
                        <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LESSON_NO" Type="String" />
                        <asp:Parameter Name="LESSON_TITLE" Type="String" />
                        <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                        <asp:Parameter Name="LESSON_TYPE" Type="String" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LESSON_TITLE" Type="String" />
                        <asp:Parameter Name="LESSON_TYPE" Type="String" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                        <asp:Parameter Name="LESSON_NO" Type="String" />
                        <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>


        </form>

        </div>
</body>
</html>
