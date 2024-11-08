<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enroll_student.aspx.cs" Inherits="E_learning.Enroll_student" %>

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
        <br />
        <center>
            <h1 style="margin-top: 33px; font-weight: 20;">Enrolled Student</h1>
        </center>
        <hr style=" color:black;"/>
        <br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />

            <br />

 <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_STUDENT_NUMBER,COURSE_COURSE_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            STUDENT_STUDENT_NUMBER:
            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="CONTACT||''||STUDENT_NAME" DataValueField="STUDENT_NUMBER" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>' CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select contact || ' ' || student_name, student_number from student"></asp:SqlDataSource>
            <br />
            COURSE_COURSE_ID:
            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>' CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            <br />
            ENROLL_DATE:

            <input  id="ENROLLMENT_DATETextBox" class="form-control" runat="server" value='<%# Bind("ENROLL_DATE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-secondary" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </InsertItemTemplate>
    <ItemTemplate>
        <br />
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Enrolls" CssClass="btn btn-primary custom-width custom-color custom-margin" />
    </ItemTemplate>
</asp:FormView>




            <br />

            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_STUDENT_NUMBER,COURSE_COURSE_ID" DataSourceID="SqlDataSource1">

                <Columns>

                    <asp:BoundField DataField="STUDENT_STUDENT_NUMBER" HeaderText="STUDENT_STUDENT_NUMBER" ReadOnly="True" SortExpression="STUDENT_STUDENT_NUMBER" />
                    <asp:TemplateField HeaderText="student name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_NUMBER" SelectedValue='<%# Bind("STUDENT_STUDENT_NUMBER") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NUMBER&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="COURSE_COURSE_ID" HeaderText="COURSE_COURSE_ID" ReadOnly="True" SortExpression="COURSE_COURSE_ID" />
                    <asp:TemplateField HeaderText="Course name">
                        <ItemTemplate>
                            <asp:DropDownList  ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ENROLL_DATE" HeaderText="ENROLL_DATE" SortExpression="ENROLL_DATE" />
 
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-secondary" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>

                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ENROLL_STUDENT&quot; WHERE &quot;STUDENT_STUDENT_NUMBER&quot; = :STUDENT_STUDENT_NUMBER AND &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID" InsertCommand="INSERT INTO &quot;ENROLL_STUDENT&quot; (&quot;STUDENT_STUDENT_NUMBER&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;ENROLL_DATE&quot;) VALUES (:STUDENT_STUDENT_NUMBER, :COURSE_COURSE_ID, :ENROLL_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_STUDENT_NUMBER&quot;, &quot;COURSE_COURSE_ID&quot;, &quot;ENROLL_DATE&quot; FROM &quot;ENROLL_STUDENT&quot;" UpdateCommand="UPDATE &quot;ENROLL_STUDENT&quot; SET &quot;ENROLL_DATE&quot; = :ENROLL_DATE WHERE &quot;STUDENT_STUDENT_NUMBER&quot; = :STUDENT_STUDENT_NUMBER AND &quot;COURSE_COURSE_ID&quot; = :COURSE_COURSE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                    <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                    <asp:Parameter Name="STUDENT_STUDENT_NUMBER" Type="String" />
                    <asp:Parameter Name="COURSE_COURSE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </form>

    </div>
</body>
</html>
