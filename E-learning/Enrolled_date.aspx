<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enrolled_date.aspx.cs" Inherits="E_learning.Enrolled_date" %>

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
        <hr />
        <br />
        <form id="form1" runat="server">
            <uc:SidebarControl runat="server" />

            <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select contact || ' ' || student_name, student_number from student"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select s.*, c.* , e.enroll_date from student s join Enroll_student e on s.student_number = e.student_student_number join course c on e.course_course_id = c.course_id where s.student_number = :student">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="student" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            Select the name of the student :
        <asp:DropDownList class="btn btn-secondary dropdown-toggle" style="margin:10px; width: 300px;" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CONTACT||''||STUDENT_NAME" DataValueField="STUDENT_NUMBER">
        </asp:DropDownList>
            <br />
            <asp:GridView class="table table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_NUMBER,COURSE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="STUDENT_NUMBER" HeaderText="STUDENT_NUMBER" ReadOnly="True" SortExpression="STUDENT_NUMBER" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                 
                
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                 
                    
                    <asp:BoundField DataField="ENROLL_DATE" HeaderText="ENROLL_DATE" SortExpression="ENROLL_DATE" />

                  
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
