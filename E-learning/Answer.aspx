<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="E_learning.Answer" %>

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

    <br />
    <div class="main">

        <center>
            <h1 style="margin-top: 33px; font-weight: 20;">Answer</h1>
        </center>
        <hr />
        <br />


        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />
            <br />
            <div>
            </div>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ANSWER_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">

                <InsertItemTemplate>
                    <div class="form-group">
                        ANSWER_ID:
            <asp:TextBox ID="ANSWER_IDTextBox" runat="server" Text='<%# Bind("ANSWER_ID") %>' CssClass="form-control" />
                        <br />
                        ANSWER_TEXT:
            <asp:TextBox ID="ANSWER_TEXTTextBox" runat="server" Text='<%# Bind("ANSWER_TEXT") %>' CssClass="form-control" />
                        <br />
                        ANSWER_DATE:
            <asp:TextBox ID="ANSWER_DATETextBox" runat="server" Text='<%# Bind("ANSWER_DATE") %>' CssClass="form-control" />
                        <br />
                        QUESTION_ID:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="QUESTION_TEXT" DataValueField="QUESTION_ID" CssClass="form-control" SelectedValue='<%# Bind("QUESTION_ID") %>'>
            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QUESTION_ID&quot;, &quot;QUESTION_TEXT&quot; FROM &quot;QUESTION&quot;"></asp:SqlDataSource>
                        <br />
                        INSTRUCTOR_INSTRUCTOR_ID:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" CssClass="form-control" SelectedValue='<%# Bind("INSTRUCTOR_INSTRUCTOR_ID") %>'>
            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary custom-width custom-color custom-margin" />
                </ItemTemplate>

            </asp:FormView>



            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ANSWER_ID" DataSourceID="SqlDataSource1">
                <Columns>

                    <asp:BoundField DataField="ANSWER_ID" HeaderText="ANSWER_ID" ReadOnly="True" SortExpression="ANSWER_ID" />
                    <asp:BoundField DataField="ANSWER_TEXT" HeaderText="ANSWER_TEXT" SortExpression="ANSWER_TEXT" />
                    <asp:BoundField DataField="ANSWER_DATE" HeaderText="ANSWER_DATE" SortExpression="ANSWER_DATE" />
                    <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" SortExpression="QUESTION_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_INSTRUCTOR_ID" HeaderText="INSTRUCTOR_INSTRUCTOR_ID" SortExpression="INSTRUCTOR_INSTRUCTOR_ID" />
                    <asp:TemplateField HeaderText="question">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="QUESTION_TEXT" DataValueField="QUESTION_ID" SelectedValue='<%# Bind("QUESTION_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QUESTION_ID&quot;, &quot;QUESTION_TEXT&quot; FROM &quot;QUESTION&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="instructor_name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_INSTRUCTOR_ID") %>' Style="margin-bottom: 0px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ANSWER&quot; WHERE &quot;ANSWER_ID&quot; = :ANSWER_ID" InsertCommand="INSERT INTO &quot;ANSWER&quot; (&quot;ANSWER_ID&quot;, &quot;ANSWER_TEXT&quot;, &quot;ANSWER_DATE&quot;, &quot;QUESTION_ID&quot;, &quot;INSTRUCTOR_INSTRUCTOR_ID&quot;) VALUES (:ANSWER_ID, :ANSWER_TEXT, :ANSWER_DATE, :QUESTION_ID, :INSTRUCTOR_INSTRUCTOR_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ANSWER_ID&quot;, &quot;ANSWER_TEXT&quot;, &quot;ANSWER_DATE&quot;, &quot;QUESTION_ID&quot;, &quot;INSTRUCTOR_INSTRUCTOR_ID&quot; FROM &quot;ANSWER&quot;" UpdateCommand="UPDATE &quot;ANSWER&quot; SET &quot;ANSWER_TEXT&quot; = :ANSWER_TEXT, &quot;ANSWER_DATE&quot; = :ANSWER_DATE, &quot;QUESTION_ID&quot; = :QUESTION_ID, &quot;INSTRUCTOR_INSTRUCTOR_ID&quot; = :INSTRUCTOR_INSTRUCTOR_ID WHERE &quot;ANSWER_ID&quot; = :ANSWER_ID">
                <DeleteParameters>
                    <asp:Parameter Name="ANSWER_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ANSWER_ID" Type="String" />
                    <asp:Parameter Name="ANSWER_TEXT" Type="String" />
                    <asp:Parameter Name="ANSWER_DATE" Type="DateTime" />
                    <asp:Parameter Name="QUESTION_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_INSTRUCTOR_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ANSWER_TEXT" Type="String" />
                    <asp:Parameter Name="ANSWER_DATE" Type="DateTime" />
                    <asp:Parameter Name="QUESTION_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_INSTRUCTOR_ID" Type="String" />
                    <asp:Parameter Name="ANSWER_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </form>

    </div>
</body>
</html>
