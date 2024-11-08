<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_class.aspx.cs" Inherits="E_learning.student_class" %>

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
            <h1 style="margin-top: 33px; font-weight: 20;">Progress</h1>
        </center>
        <hr />
        &nbsp;<br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />


<asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_STUDENT_NUMBER,LESSON_LESSON_NO,LESSON_COURSE_COURSE_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            STUDENT_STUDENT_NUMBER:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CONTACT||''||STUDENT_NAME" DataValueField="STUDENT_NUMBER" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>' CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select contact || ' ' || student_name, student_number from student"></asp:SqlDataSource>
            <br />
            <br />
            LESSON_LESSON_NO:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_LESSON_NO") %>' CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT LESSON_NO, LESSON_TITLE FROM LESSON"></asp:SqlDataSource>
            <br />
            <br />
            LAST_ACCESSED_DATE:
            <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' CssClass="form-control" />
            <br />
            <br />
            LESSON_STATUS:
            <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' CssClass="form-control" />
            <br />
            <br />
            LESSON_COURSE_COURSE_ID:
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("LESSON_COURSE_COURSE_ID") %>' CssClass="form-control" Width="228px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add record" CssClass="btn btn-primary custom-width custom-color custom-margin" />
    </ItemTemplate>
</asp:FormView>

            <br />

            <div>
                <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_STUDENT_NUMBER,LESSON_LESSON_NO,LESSON_COURSE_COURSE_ID" DataSourceID="SqlDataSource1">
                    <Columns>

                        <asp:BoundField DataField="STUDENT_STUDENT_NUMBER" HeaderText="STUDENT_STUDENT_NUMBER" ReadOnly="True" SortExpression="STUDENT_STUDENT_NUMBER" />
                        <asp:TemplateField HeaderText="student_name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="STUDENT_NAME" DataValueField="STUDENT_NUMBER" Height="16px" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LESSON_LESSON_NO" HeaderText="LESSON_LESSON_NO" ReadOnly="True" SortExpression="LESSON_LESSON_NO" />
                        
                        <asp:TemplateField HeaderText="lesson_title">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="SqlDataSource6" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_LESSON_NO") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" />
                        <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />
                        <asp:BoundField DataField="LESSON_COURSE_COURSE_ID" HeaderText="LESSON_COURSE_COURSE_ID" ReadOnly="True" SortExpression="LESSON_COURSE_COURSE_ID" />
                        <asp:TemplateField HeaderText="Course_title">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList6" runat="server" DataSourceID="coursetitle" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("LESSON_COURSE_COURSE_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="coursetitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_CLASS&quot; WHERE &quot;STUDENT_STUDENT_NUMBER&quot; = :STUDENT_STUDENT_NUMBER AND &quot;LESSON_LESSON_NO&quot; = :LESSON_LESSON_NO AND &quot;LESSON_COURSE_COURSE_ID&quot; = :LESSON_COURSE_COURSE_ID" InsertCommand="INSERT INTO &quot;STUDENT_CLASS&quot; (&quot;STUDENT_STUDENT_NUMBER&quot;, &quot;LESSON_LESSON_NO&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;LESSON_STATUS&quot;, &quot;LESSON_COURSE_COURSE_ID&quot;) VALUES (:STUDENT_STUDENT_NUMBER, :LESSON_LESSON_NO, :LAST_ACCESSED_DATE, :LESSON_STATUS, :LESSON_COURSE_COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_STUDENT_NUMBER&quot;, &quot;LESSON_LESSON_NO&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;LESSON_STATUS&quot;, &quot;LESSON_COURSE_COURSE_ID&quot; FROM &quot;STUDENT_CLASS&quot;" UpdateCommand="UPDATE &quot;STUDENT_CLASS&quot; SET &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE, &quot;LESSON_STATUS&quot; = :LESSON_STATUS WHERE &quot;STUDENT_STUDENT_NUMBER&quot; = :STUDENT_STUDENT_NUMBER AND &quot;LESSON_LESSON_NO&quot; = :LESSON_LESSON_NO AND &quot;LESSON_COURSE_COURSE_ID&quot; = :LESSON_COURSE_COURSE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                        <asp:Parameter Name="LESSON_LESSON_NO" Type="String" />
                        <asp:Parameter Name="LESSON_COURSE_COURSE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                        <asp:Parameter Name="LESSON_LESSON_NO" Type="String" />
                        <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                        <asp:Parameter Name="LESSON_STATUS" Type="String" />
                        <asp:Parameter Name="LESSON_COURSE_COURSE_ID" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                        <asp:Parameter Name="LESSON_STATUS" Type="String" />
                        <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                        <asp:Parameter Name="LESSON_LESSON_NO" Type="String" />
                        <asp:Parameter Name="LESSON_COURSE_COURSE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

        </form>

    </div>
</body>
</html>
