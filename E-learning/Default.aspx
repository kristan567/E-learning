<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="graph.aspx.cs" Inherits="E_learning.graph" %>

<%@ Register Src="~/sidebar.ascx" TagName="SidebarControl" TagPrefix="uc" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .page {
            font-family: sans-serif;
            padding: 24px;
        }

        hr {
            margin-block: 32px;
        }

        .layout {
            display: flex;
            gap: 24px;
            flex-flow: row wrap;
        }

            .layout > div {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 12px;
                min-inline-size: 300px;
                min-block-size: 100px;
                box-shadow: 0 0 8px grey;
            }

                .layout > div:hover {
                    box-shadow: 0 0 16px grey;
                    transition-duration: 0.2s;
                }






        #DropDownList2 {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: none;
            background-color: #DBAE58;
        }






        #DropDownList1 {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: none;
            background-color: #EA6A47;
        }





        #DropDownList3 {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: none;
            background-color: #488A99;
        }





        #DropDownList4 {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: none;
            background-color: #B3C100;
        }




        #DropDownList5 {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: none;
            background-color: #4CB5F5;
        }
    </style>
</head>
<body>







    <div class="main">

        <form id="form1" runat="server">

            <div class="page">

                <div class="layout">
                    <div style="background-color: #EA6A47;">
                        <div>
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-person-fill" viewBox="0 0 16 16">
                                    <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2m-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11" />
                                </svg>
                                Total Student:<asp:SqlDataSource ID="info" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(student_number) AS TotalStudents FROM student
"></asp:SqlDataSource>

                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="info" DataTextField="TOTALSTUDENTS" DataValueField="TOTALSTUDENTS">
                                </asp:DropDownList>
                            </h2>
                            <p>&nbsp;</p>
                        </div>
                    </div>

                    <div style="background-color: #DBAE58;">
                        <div>
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                                    <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                    <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5" />
                                </svg>Enroll student<asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(student_student_number) from enroll_student"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="course" DataTextField="COUNT(STUDENT_STUDENT_NUMBER)" DataValueField="COUNT(STUDENT_STUDENT_NUMBER)">
                                </asp:DropDownList>
                            </h2>
                            <p>&nbsp;</p>
                        </div>
                    </div>

                    <div style="background-color: #488A99;">
                        <div>
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mortarboard-fill" viewBox="0 0 16 16">
                                    <path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917z" />
                                    <path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466z" />
                                </svg>
                                Total Instructor<asp:SqlDataSource ID="Instructor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(instructor_id) from instructor"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Instructor" DataTextField="COUNT(INSTRUCTOR_ID)" DataValueField="COUNT(INSTRUCTOR_ID)" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                </asp:DropDownList>
                            </h2>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                    <div style="background-color: #B3C100;">
                        <div>
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-fill" viewBox="0 0 16 16">
                                    <path d="M8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783" />
                                </svg>
                                Total Course<asp:SqlDataSource ID="enroll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(course_id) from course"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="enroll" DataTextField="COUNT(COURSE_ID)" DataValueField="COUNT(COURSE_ID)">
                                </asp:DropDownList>
                            </h2>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                    <div style="background-color: #4CB5F5;">
                        <div>
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                                    <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z" />
                                </svg>
                                Total Lesson:<asp:SqlDataSource ID="lessson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(lesson_no) from lesson"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="lessson" DataTextField="COUNT(LESSON_NO)" DataValueField="COUNT(LESSON_NO)">
                                </asp:DropDownList>
                            </h2>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                </div>
            </div>








            <hr />
            <br />

            <uc:SidebarControl runat="server" />

            <div>
            </div>
            <div style="display: inline-block;">
                <div style="margin-left: 50px; display: inline-block;">
                    <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1" Width="1142px">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="NUM_OF_STUDENT">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Courses">
                                    <LabelStyle Interval="1" Angle="-90" IsEndLabelVisible="true" />
                                </AxisX>
                                <AxisY Title="Number of Students"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" select c.course_title, count(s.student_number) as num_of_student from student s join enroll_student e on s.student_number = e.student_student_number join course c on e.course_course_id = c.course_id group by c.course_title"></asp:SqlDataSource>
                   <center><h3>Number of Student Enrolled in Course</h3></center>

                </div>
                

                <div style="margin-left: 150px; display: inline-block;">
                    <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource2" OnLoad="Chart4_Load">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="NUM_OF_LESSON" ChartType="Bar">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Courses">
                                    <LabelStyle Interval="1" Angle="-90" IsEndLabelVisible="true" />
                                </AxisX>
                                <AxisY Title="no of lesson"></AxisY>


                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" select c.course_title, count(l.lesson_no) as num_of_lesson from lesson l join course c on l.course_course_id = c.course_id group by c.course_title"></asp:SqlDataSource>
                 <center><h3>Number of lesson in Course</h3></center>
                    </div>

                <div style="margin-left: 350px; display: inline-block;">
                    <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource3">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="NUM_OF_QUESTION">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Courses">
                                    <LabelStyle Interval="1" Angle="-90" IsEndLabelVisible="true" />
                                </AxisX>
                                <AxisY Title="Number of question"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" select c.course_title, count(q.question_id) as num_of_question from question q join course c on c.course_id = q.course_course_id group by c.course_title"></asp:SqlDataSource>
                  <center><h3>Number of Question for Course </h3></center>
                </div>

                <div style="margin-left: 100px; display: inline-block;">
                    <asp:Chart ID="Chart6" runat="server" DataSourceID="SqlDataSource4" Width="1049px">
                        <Series>
                            <asp:Series ChartType="Line" Name="Series1" XValueMember="LESSON_TYPE" YValueMembers="NUM_OFLESSONS">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">

                                <AxisX Title="types of file">
                                    <LabelStyle Interval="1" Angle="-90" IsEndLabelVisible="true" />
                                </AxisX>
                                <AxisY Title="no of lesson"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                      <center><h3>types of lesson attended</h3></center>


                </div>


            </div>

        </form>

    </div>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" select lesson_type, count(lesson_no) as num_oflessons from lesson group by lesson_type"></asp:SqlDataSource>
    </p>
</body>
</html>
