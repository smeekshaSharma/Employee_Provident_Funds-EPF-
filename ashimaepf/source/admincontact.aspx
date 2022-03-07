<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EPF |Contact Detail</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from contact where office='" & t1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("this contact subject already exist")
            conn.Close()
            
        Else
            sql = "insert into contact values('" & d1.Text & "','" & d2.Text & "','" & t1.Text & "','" & t2.Text & "','" & t3.Text & "','" & t4.Text & "','" & t5.Text & "','" & t6.Text & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("contact submitted successfully")
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = ""
            
             
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from contact where office='" & d1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            comm = New Data.SqlClient.SqlCommand("select st from contact where office='" & d1.Text & "'")
            comm.Connection = conn
            d1.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select ci from about where office='" & d1.Text & "'")
            comm.Connection = conn
            d2.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select pc from about where office='" & d1.Text & "'")
            comm.Connection = conn
            t3.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select em from about where office='" & d1.Text & "'")
            comm.Connection = conn
            t4.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select cn from about where office='" & d1.Text & "'")
            comm.Connection = conn
            t5.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select fn from about where office='" & d1.Text & "'")
            comm.Connection = conn
            t6.Text = comm.ExecuteScalar
        Else
            MsgBox("this about not exist")
            conn.Close()
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = ""
            
            
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from contact where office='" & t1.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("contact detail deleted successfuylly")
        conn.Close()
        d1.Text = ""
        d2.Text = ""
        t1.Text = ""
        t2.Text = ""
        t3.Text = ""
        t4.Text = ""
        t5.Text = ""
        t6.Text = ""
        
        
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("update contact set st ='" & d1.Text & "',ci='" & d2.Text & "',ad='" & t2.Text & "',pc='" & t3.Text & "',em='" & t4.Text & "',cn='" & t5.Text & "',fn='" & t6.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("contact detail updated successfully")
        d1.Text = ""
        d2.Text = ""
        t1.Text = ""
        t2.Text = ""
        t3.Text = ""
        t4.Text = ""
        t5.Text = ""
        t6.Text = ""
        
        
    End Sub
    Dim fname As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select uname from logintemp")
        comm.Connection = conn
        Label1.Text = comm.ExecuteScalar
        If Label1.Text = "Null" Then
            MsgBox("Login Your Account")
            Response.Redirect("adminlogin.aspx")
        Else
            comm = New Data.SqlClient.SqlCommand("select fname from reg where email='" & Label1.Text & "'")
            comm.Connection = conn
            fname = comm.ExecuteScalar
            Label2.Text = "Welcome: " & fname
        End If
        conn.Close()
    End Sub

    Protected Sub d1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        d2.Items.Clear()
        If d1.Text = "Punjab" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Amritsar")
            d2.Items.Add("Jalandhar")
            d2.Items.Add("Ludhiana")
            d2.Items.Add("Beas")
            d2.Items.Add("gurdaspur")
        ElseIf d1.Text = "Andhra Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Visakhapatnam")
            d2.Items.Add("Vijayawada")
            d2.Items.Add("Tirupati")
            d2.Items.Add("chittor")
            d2.Items.Add("Amaravati")
        ElseIf d1.Text = "Arunachal Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Tawang")
            d2.Items.Add("Bomdila")
            d2.Items.Add("Deomali")
            d2.Items.Add("Hawai")
            d2.Items.Add("Pangin")
        ElseIf d1.Text = "Assam" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Guwahati")
            d2.Items.Add("Tezpur")
            d2.Items.Add("Lanka")
            d2.Items.Add("Silchar")
            d2.Items.Add("Jorhat")
        ElseIf d1.Text = "Bihar" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Patna")
            d2.Items.Add("Gaya")
            d2.Items.Add("Muzaffarpur")
            d2.Items.Add("Darbhanga")
            d2.Items.Add("Munger")
        ElseIf d1.Text = "Chhattisgarh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Raipur")
            d2.Items.Add("Bastar")
            d2.Items.Add("Drug")
            d2.Items.Add("Dhamtari")
            d2.Items.Add("Kanker")
        ElseIf d1.Text = "Goa" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Panaji")
            d2.Items.Add("Ponda")
            d2.Items.Add("Madgaon")
            d2.Items.Add("Mapuca")
            d2.Items.Add("Sancoale")
        ElseIf d1.Text = "Gujarat" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Ahmedabad")
            d2.Items.Add("Surat")
            d2.Items.Add("Gandhinagar")
            d2.Items.Add("Somnath")
            d2.Items.Add("Dwarka")
        ElseIf d1.Text = "Haryana" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Faridabad")
            d2.Items.Add("Panipat")
            d2.Items.Add("Ambala")
            d2.Items.Add("Karnal")
            d2.Items.Add("Sonipat")
        ElseIf d1.Text = "Himachal Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Shimla")
            d2.Items.Add("Manali")
            d2.Items.Add("Dharamshala")
            d2.Items.Add("Kufri")
            d2.Items.Add("Dalhousie")
        ElseIf d1.Text = "Jammu And Kashmir" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jammu")
            d2.Items.Add("Srinagar")
            d2.Items.Add("Leh Ladakh")
            d2.Items.Add("Amarnath")
            d2.Items.Add("Gulmarg")
        ElseIf d1.Text = "Jharkhand" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jamshedpur")
            d2.Items.Add("Ranchi")
            d2.Items.Add("Dhanbad")
            d2.Items.Add("Mandu")
            d2.Items.Add("Giridih")
        ElseIf d1.Text = "Karnataka" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bengaluru")
            d2.Items.Add("Manglore")
            d2.Items.Add("Mysuru")
            d2.Items.Add("Vijayapura")
            d2.Items.Add("Ballari")
        ElseIf d1.Text = "Kerala" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Thiruvananthapuram")
            d2.Items.Add("Kochi")
            d2.Items.Add("Kovalam")
            d2.Items.Add("Kumarakom")
            d2.Items.Add("Munnar")
        ElseIf d1.Text = "Madhya Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Gwalior")
            d2.Items.Add("Bhopal")
            d2.Items.Add("Jabalpur")
            d2.Items.Add("Indore")
            d2.Items.Add("Rewa")
        ElseIf d1.Text = "Maharashtra" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Mumbai")
            d2.Items.Add("Pune")
            d2.Items.Add("Nagpur")
            d2.Items.Add("Nashik")
            d2.Items.Add("Thane")
        ElseIf d1.Text = "Manipur" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bishnupur")
            d2.Items.Add("Chandel")
            d2.Items.Add("Senapati")
            d2.Items.Add("Thoubal")
            d2.Items.Add("Ukhrul")
        ElseIf d1.Text = "Meghalaya" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("East Garo Hills")
            d2.Items.Add("East Khasi Hills")
            d2.Items.Add("Ribhoi")
            d2.Items.Add("South Garo Hills")
            d2.Items.Add("West Garo Hills")
        ElseIf d1.Text = "Mizoram" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Aizawl")
            d2.Items.Add("Bairabi")
            d2.Items.Add("Bilkhawthlir")
            d2.Items.Add("Champhai")
            d2.Items.Add("Kolasib")
        ElseIf d1.Text = "Nagaland" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kohima")
            d2.Items.Add("Chumukedima")
            d2.Items.Add("Dimapur")
            d2.Items.Add("Mon")
            d2.Items.Add("Peren")
        ElseIf d1.Text = "Odisha" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bhubaneshwar")
            d2.Items.Add("Konark")
            d2.Items.Add("Jeypore")
            d2.Items.Add("Balasore")
            d2.Items.Add("Chandipur")
        ElseIf d1.Text = "Rajasthan" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jaipur")
            d2.Items.Add("Jodhpur")
            d2.Items.Add("Ajmer")
            d2.Items.Add("Udaipur")
            d2.Items.Add("Bharatpur")
        ElseIf d1.Text = "Sikkim" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Gangtok")
            d2.Items.Add("Pelling")
            d2.Items.Add("Lachen")
            d2.Items.Add("Namchi")
            d2.Items.Add("Ravangla")
        ElseIf d1.Text = "Tamil Nadu" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Chennai")
            d2.Items.Add("Coimbatore")
            d2.Items.Add("Coonoor")
            d2.Items.Add("Kanchipuram")
            d2.Items.Add("Madurai")
        ElseIf d1.Text = "Telangana" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Hyderabad")
            d2.Items.Add("Warangai")
            d2.Items.Add("Adilabad")
            d2.Items.Add("Khammam")
            d2.Items.Add("Nalgonda")
        ElseIf d1.Text = "Tripura" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kailashahar")
            d2.Items.Add("Kamalpur")
            d2.Items.Add("Khowai")
            d2.Items.Add("Kumarghat")
            d2.Items.Add("Kunjaban")
        ElseIf d1.Text = "Uttar Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Mathura")
            d2.Items.Add("Moradabad")
            d2.Items.Add("Agra")
            d2.Items.Add("Aligarh")
            d2.Items.Add("Luckhnow")
        ElseIf d1.Text = "Uttarakhand" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Dehradun")
            d2.Items.Add("Haridwar")
            d2.Items.Add("Kashipur")
            d2.Items.Add("Roorkee")
            d2.Items.Add("Pantnagar")
        ElseIf d1.Text = "West Bengal" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kolkata")
            d2.Items.Add("Siliguri")
            d2.Items.Add("Durgapur")
            d2.Items.Add("Habra")
            d2.Items.Add("Darjeeling")
        Else
            
        End If
    End Sub
   

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from logintemp")
        comm.Connection = conn
        comm.ExecuteScalar()
        sql = "insert into logintemp values('" & "Null" & "')"
        adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
        adp.InsertCommand.ExecuteScalar()
        Response.Redirect("adminlogin.aspx")
        conn.Close()
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:687px;
	z-index:1;
	left: 0;
	top: 0;
}
#apDiv2 {
	position:absolute;
	width:80%;
	height:82px;
	z-index:1;
	left: 141px;
	top: 16px;
}
#apDiv3 {
	position:absolute;
	width:100%;
	height:14px;
	z-index:2;
	left: 0px;
	top: 0;
	background-color: #ff0000;
}
#apDiv4 {
	position:absolute;
	width:100%;
	height:31px;
	z-index:3;
	left: -12px;
	top: 100px;
	background-color: #27408b;
}
.style2 {color: #FF00FF}
.style4 {color: #0000FF; }
.style5 {color: #FFFFFF; }
.style6 {
	font-size: 24px;
	color: #FF0000;
	font-weight: bold;
}
.style7 {
	font-size: 18px
}
#apDiv5 {
	position:absolute;
	width:100%;
	height:490px;
	z-index:4;
	left: 2px;
	top: 128px;
}
.style19 {font-size: 16px; font-weight: bold; font-family: Calibri; }
#apDiv6 {
	position:absolute;
	width:18%;
	height:478px;
	z-index:1;
	left: 1px;
	top: 3px;
}
#apDiv7 {
	position:absolute;
	width:82%;
	height:478px;
	z-index:2;
	left: 234px;
	background-color: #CCCCCC;
	top: 3px;
}
#apDiv8 {
	position:absolute;
	width:80%;
	height:410px;
	z-index:1;
	left: 104px;
	top: 9px;
	background-color: #FFFFFF;
}
    .style30
    {
        height: 23px;
    }
    .style34
    {
        height: 34px;
    }
.style37 {color: #666666; font-weight: bold; }
a {
	font-family: Calibri;
	font-size: 16px;
	color: #333333;
	font-weight: bold;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #333333;
}
a:hover {
	text-decoration: underline;
	color: #27408B;
}
a:active {
	text-decoration: none;
	color: #27408B;
}
-->
</style>
</head>

<body>
    <form id="form1" runat="server">
      <div id="apDiv1">
  <div id="apDiv2">
    <table width="100%" height="71" border="0">
      <tr>
        <td width="9%" rowspan="2"><img src="../images/epf logo.png" width="75" height="74" /></td>
        <td class="style6">Employees' Provident Fund Organization, India</td>
        <td width="7%" rowspan="2"><div align="right"><img src="../images/logo.jpg" width="57" height="68" /></div></td>
      </tr>
      <tr>
        <td width="84%" height="37"><div align="left" class="style7">Ministry of Labour &amp; Employment, Government of India</div></td>
      </tr>
    </table>
  </div>
  <div id="apDiv3"></div>
  <div id="apDiv4">
    <table width="100%" border="0">
      <tr>
        <td width="6%" bgcolor="#27408b"><span class="style2"></span></td>
        <td width="9%" bgcolor="#27408B"><div align="center" class="style5"></div></td>
        <td width="16%" bgcolor="#27408B"><div align="center" class="style5">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div></td>
        <td width="18%" bgcolor="#27408B"><div align="center" class="style5">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </div></td>
        <td width="10%" bgcolor="#27408B"><div align="center" class="style5">
            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FFFF99" 
                onclick="LinkButton1_Click">LogOut</asp:LinkButton>
            </div></td>
        <td width="11%" bgcolor="#27408B"><div align="center" class="style5"></div></td>
        <td width="11%" bgcolor="#27408b"><div align="center" class="style5"></div></td>
        <td width="19%" bgcolor="#27408B"><span class="style4"></span></td>
      </tr>
    </table>
  </div>
  <div id="apDiv5">
    <div id="apDiv6">
      <table width="100%" border="0">
        <tr>
          <td height="53" colspan="2" bgcolor="#EEECED"><div align="center"><img src="../images/admin picture.jpg" width="130" height="95" /></div></td>
        </tr>
        <tr>
          <td colspan="2" bgcolor="#27408B"><span class="style5">WELCOME</span></td>
        </tr>
        <tr>
          <td width="15%"><img src="../images/home.png" width="25" height="19" /></td>
          <td width="85%"><span class="style19"><a href="admindashboard.aspx">Home</a></span></td>
        </tr>
        <tr>
          <td><img src="../images/org.png" width="25" height="25" /></td>
          <td><a href="adminorgconfirm.aspx"><span class="style19">Organization Confirmation</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/scheme.png" width="25" height="25" /></td>
          <td class="style19"><a href="adminpmsymschmes.aspx">PM-SYM Scheme</a></td>
        </tr>
        <tr>
          <td><img src="../images/aboutus.png" width="25" height="25" /></td>
          <td><a href="adminabout.aspx"><span class="style19">About us</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/news.png" width="25" height="21" /></td>
          <td><a href="adminnews.aspx"><span class="style19">News</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/services.png" width="25" height="28" /></td>
          <td><a href="adminservices.aspx"><span class="style19">Services</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/faq.png" width="25" height="17" /></td>
          <td><span class="style19"><a href="adminFaq.aspx">FAQ</a></span></td>
        </tr>
        <tr>
          <td><img src="../images/upload.png" width="25" height="25" /></td>
          <td><a href="adminformupload.aspx"><span class="style19">Form Upload</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/tenders.png" width="25" height="25" /></td>
          <td><a href="admintender.aspx"><span class="style19">Tender/Auctions</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/pf rate.png" width="25" height="23" /></td>
          <td><a href="adminpfrate.aspx"><span class="style19">PF-Rate</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/training.png" width="25" height="25" /></td>
          <td><a href="admintraning.aspx"><span class="style19">EPF Traning Institute</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/withdraw.png" width="25" height="15" /></td>
          <td><a href="adminpfwithdrawrpt.aspx"><span class="style19">PF Withdrawal Report</span></a></td>
        </tr>
        <tr>
          <td><img src="../images/emp.png" width="25" height="15" /></td>
          <td><a href="adminemprpt.aspx"><span class="style19">Employee Report</span></a></td>
        </tr>
      </table>
    </div>
    <div id="apDiv7">
      <div id="apDiv8" style="border:1px solid #27408B;border-radius:10px">
        <table width="100%" border="0">
          <tr>
            <td colspan="3" bgcolor="#27408B"><span class="style5"><strong>EPF Contact Detail</strong></span></td>
          </tr>
          <tr>
            <td colspan="3" class="style30"></td>
          </tr>
          <tr>
            <td width="16%"><span class="style37">State</span></td>
            <td width="75%">
                <asp:DropDownList ID="d1" runat="server" 
                    onselectedindexchanged="d1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Select Any One</asp:ListItem>
                    <asp:ListItem>Punjab</asp:ListItem>
                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                    <asp:ListItem>Assam </asp:ListItem>
                    <asp:ListItem>Bihar</asp:ListItem>
                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                    <asp:ListItem>Goa</asp:ListItem>
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Haryana</asp:ListItem>
                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                    <asp:ListItem>Jharkhand</asp:ListItem>
                    <asp:ListItem>Karnataka</asp:ListItem>
                    <asp:ListItem>Kerala</asp:ListItem>
                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Manipur</asp:ListItem>
                    <asp:ListItem>Meghalaya</asp:ListItem>
                    <asp:ListItem>Mizoram</asp:ListItem>
                    <asp:ListItem>Nagaland</asp:ListItem>
                    <asp:ListItem>Odisha</asp:ListItem>
                    <asp:ListItem>Rajasthan</asp:ListItem>
                    <asp:ListItem>Sikkim</asp:ListItem>
                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                    <asp:ListItem>Telangana</asp:ListItem>
                    <asp:ListItem>Tripura</asp:ListItem>
                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                    <asp:ListItem>Uttarakhand</asp:ListItem>
                    <asp:ListItem>West Bengal</asp:ListItem>
                </asp:DropDownList>
              </td>
            <td width="9%">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">City</span></td>
            <td>
                <asp:DropDownList ID="d2" runat="server">
                </asp:DropDownList>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">Office Name</span></td>
            <td>
                <asp:TextBox ID="t1" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td><span class="style37">Address</span></td>
            <td>
                <asp:TextBox ID="t2" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">Pincode</span></td>
            <td>
                <asp:TextBox ID="t3" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">Email</span></td>
            <td>
                <asp:TextBox ID="t4" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">Contact No</span></td>
            <td>
                <asp:TextBox ID="t5" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style37">Fax No</span></td>
            <td>
                <asp:TextBox ID="t6" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td colspan="2"><hr /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" bgcolor="#27408B"><span class="style5"><strong>Operations</strong></span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" />              </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Search" onclick="Button2_Click" />              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style34">
                <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" />              </td>
            <td class="style34">
                <asp:Button ID="Button4" runat="server" Text="Update" onclick="Button4_Click" />
&nbsp;</td>
            <td class="style34"></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
