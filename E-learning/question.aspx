<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="question.aspx.cs" Inherits="E_learning.question" %>


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
            <h1 style="margin-top: 33px; font-weight: 20;">question</h1>
        </center>
        <hr />
        <br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />

            <div>
            </div>

            <br />

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="QUESTION_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="form-group">
                        QUESTION_ID:
            <asp:TextBox ID="QUESTION_IDTextBox" runat="server" Text='<%# Bind("QUESTION_ID") %>' CssClass="form-control" />
                        <br />
                        QUESTION_DATE:
            <asp:TextBox ID="QUESTION_DATETextBox" runat="server" Text='<%# Bind("QUESTION_DATE") %>' CssClass="form-control" />
                        <br />
                        QUESTION_TEXT:
            <asp:TextBox ID="QUESTION_TEXTTextBox" runat="server" Text='<%# Bind("QUESTION_TEXT") %>' CssClass="form-control" />
                        <br />
                        STUDENT_STUDENT_NUMBER:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="STUDENT_NAME" DataValueField="STUDENT_NUMBER" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>' CssClass="form-control" Width="170px">
            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        <br />
                        COURSE_COURSE_ID:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" CssClass="form-control" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>' Width="173px">
            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary custom-width custom-color custom-margin" />
                </ItemTemplate>
            </asp:FormView>



            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QUESTION_ID" DataSourceID="SqlDataSource1">
                <Columns>

                    <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" ReadOnly="True" SortExpression="QUESTION_ID" />
                    <asp:BoundField DataField="QUESTION_DATE" HeaderText="QUESTION_DATE" SortExpression="QUESTION_DATE" />
                    <asp:BoundField DataField="QUESTION_TEXT" HeaderText="QUESTION_TEXT" SortExpression="QUESTION_TEXT" />
                    <asp:BoundField DataField="STUDENT_STUDENT_NUMBER" HeaderText="STUDENT_STUDENT_NUMBER" SortExpression="STUDENT_STUDENT_NUMBER" />
                    <asp:BoundField DataField="COURSE_COURSE_ID" HeaderText="COURSE_COURSE_ID" SortExpression="COURSE_COURSE_ID" />
                    <asp:TemplateField HeaderText="student_name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="STUDENT_NAME" DataValueField="STUDENT_NUMBER" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course_name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-secondary" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;QUESTION&quot; WHERE &quot;QUESTION_ID&quot; = :QUESTION_ID" InsertCommand="INSERT INTO &quot;QUESTION&quot; (&quot;QUESTION_ID&quot;, &quot;QUESTION_DATE&quot;, &quot;QUESTION_TEXT&quot;, &quot;STUDENT_STUDENT_NUMBER&quot;, &quot;COURSE_COURSE_ID&quot;) VALUES (:QUESTION_ID, :QUESTION_DATE, :QUESTION_TEXT, :STUDENT_STUDENT_NUMBER, :COURSE_COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QUESTION_ID&quot;, &quot;QUESTION_DATE&quot;, &quot;QUESTION_TEXT&quot;, &quot;STUDENT_STUDENT_NUMBER&quot;, &quot;COURSE_COURSE_ID&quot; FROM &quot;QUESTION&quot;" UpdateCommand="UPDATE &quot;QUESTION&quot; SET &quot;QUESTION_DATE&quot; = :QUESTION_DATE, &quot;QUESTION_TEXT&quot; = :QUESTION_TEXT, &quot;STUDENT_STUDENT_NUMBER&quot; = :STUDENT_STUDENT_NUMBER, &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID WHERE &quot;QUESTION_ID&quot; = :QUESTION_ID">
                <DeleteParameters>
                    <asp:Parameter Name="QUESTION_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="QUESTION_ID" Type="String" />
                    <asp:Parameter Name="QUESTION_DATE" Type="DateTime" />
                    <asp:Parameter Name="QUESTION_TEXT" Type="String" />
                    <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="QUESTION_DATE" Type="DateTime" />
                    <asp:Parameter Name="QUESTION_TEXT" Type="String" />
                    <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    <asp:Parameter Name="QUESTION_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </form>
</body>
</html>
