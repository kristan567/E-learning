<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course_Instructor.aspx.cs" Inherits="E_learning.Course_Instructor" %>

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
            <h1 style="margin-top:33px; font-weight: 25;">Course Instructor</h1>
        </center>
        <hr />

        <form id="form1" runat="server">
            <center>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            <p style="font-size: 20px;">Select the name of the Course to see the available Instructor:</p>
            <asp:DropDownList class="btn btn-secondary dropdown-toggle" Style="margin: 10px; width: 150px;" ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID">
            </asp:DropDownList>
            <br />
                </center>
            <uc:SidebarControl runat="server" />
            


            <asp:GridView class="table table-hover" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="SPECIALIZE" HeaderText="SPECIALIZE" SortExpression="SPECIALIZE" />

                  
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select c.course_id, c.course_title, c.duration, i.instructor_id, i.instructor_name, i.contact, i.specialize from course c join instructor i on c.course_id= i.course_Course_id where c.course_id = :course">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="course" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>
</body>
</html>
