<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Best_E-Learning_Course.aspx.cs" Inherits="E_learning.Best_E_Learning_Course" %>

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
         <h1 style="margin-top: 33px; font-weight: 20;">Top 3 Enrolled Course</h1>
     </center>
     <hr style="color:black;"/>
     <br />
    <form id="form1" runat="server">
                     <uc:SidebarControl runat="server" />

        <center>

            <p style="font-size: 20px;">provide Date To See The Top 3 Enrolled Course in a month:</p>

            <asp:DropDownList class="btn btn-secondary dropdown-toggle" Style="margin: 10px; width: 150px;" aria-label=".form-select-lg example" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="ENROLLMENT_MONTH" DataValueField="ENROLLMENT_MONTH">
                <asp:ListItem>january</asp:ListItem>
                <asp:ListItem Value="febuary"></asp:ListItem>
                <asp:ListItem>march</asp:ListItem>
                <asp:ListItem>April</asp:ListItem>
                <asp:ListItem>May</asp:ListItem>
                <asp:ListItem>June</asp:ListItem>
                <asp:ListItem>July</asp:ListItem>
                <asp:ListItem>August</asp:ListItem>
                <asp:ListItem>september</asp:ListItem>
                <asp:ListItem>octuber</asp:ListItem>
                <asp:ListItem>November</asp:ListItem>
                <asp:ListItem>December</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList class="btn btn-secondary dropdown-toggle" Style="margin: 10px; width: 150px;" ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="year" DataTextField="ENROLLMENT_YEAR" DataValueField="ENROLLMENT_YEAR">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" SELECT DISTINCT EXTRACT(MONTH FROM enroll_date) AS enrollment_month FROM Enroll_student"></asp:SqlDataSource>
        </center>
        <div>
        <asp:SqlDataSource ID="year" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT EXTRACT(YEAR FROM enroll_date) AS enrollment_year
FROM Enroll_student"></asp:SqlDataSource>
            <br />
        </div>
        <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="COURSE_COURSE_ID" HeaderText="COURSE_COURSE_ID" SortExpression="COURSE_COURSE_ID" />
                <asp:BoundField DataField="ENROLL_COUNT" HeaderText="ENROLL_COUNT" SortExpression="ENROLL_COUNT" />
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="coursename" DataValueField="COURSE_ID" SelectedValue='<%# bind("course_course_id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="coursename" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select course_course_id, enroll_count FROM ( select course_course_id, count(*) AS enroll_count from enroll_student where extract(month from enroll_date) = :selected_month AND extract(year from enroll_date) = :selected_year group by course_course_id order by enroll_count desc ) where rownum &lt;= 3



">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="selected_month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="selected_year" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

         </div>
</body>
</html>
