<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EPF | traning Detail</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from Training where zonal='" & d1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This Training Subject Already Exist")
            conn.Close()
            d1.Text = ""
        Else
            sql = "insert into training values('" & t1.Text & "','" & d1.Text & "','" & t2.Text & "','" & t3.Text & "','" & d2.Text & "','" & d3.Text & "','" & t4.Text & "','" & t5.Text & "','" & t6.Text & "','" & t7.Text & "','" & t8.Text & "','" & t9.Text & "','" & t10.Text & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("Training Detail Submitted Successfully")
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            d2.Text = ""
            d3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = ""
            t7.Text = ""
            t8.Text = ""
            t9.Text = ""
            t10.Text = ""
             
              
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from training where zonal='" & d1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            comm = New Data.SqlClient.SqlCommand("select cdate from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t1.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select ins   from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t2.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select ad from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t3.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select st  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            d2.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select ci  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            d3.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select pc  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t4.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select std  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t5.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select en  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t6.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select desi  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t7.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select em  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t8.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select cn  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t9.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select fn  from training where zonal='" & d1.Text & "'")
            comm.Connection = conn
            t10.Text = comm.ExecuteScalar
        Else
            MsgBox("This Training Not Exist")
            conn.Close()
            t1.Text = ""
            d1.Text = ""
            t2.Text = ""
            t3.Text = ""
            d2.Text = ""
            d3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = "'"
            t7.Text = ""
            t8.Text = ""
            t9.Text = ""
            t10.Text = ""
            
            
            
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from Training where zonal='" & d1.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("Training Detail Deleted Successfuylly")
        conn.Close()
        t1.Text = ""
        d1.Text = ""
        t2.Text = ""
        t3.Text = ""
        d2.Text = ""
        d3.Text = ""
        t4.Text = ""
        t5.Text = ""
        t6.Text = "'"
        t7.Text = ""
        t8.Text = ""
        t9.Text = ""
        t10.Text = ""
            
        
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("update Training set cdate ='" & t1.Text & "',zonal='" & d1.Text & "',ins='" & t2.Text & "',ad='" & t3.Text & "',st='" & d2.Text & "',ci='" & d3.Text & "',pc='" & t4.Text & "',std='" & t5.Text & "',en='" & t6.Text & "',desi='" & t7.Text & "',em='" & t8.Text & "',cn='" & t9.Text & "',fn='" & t10.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("Training Detail Updated Successfully")
        t1.Text = ""
        d1.Text = ""
        t2.Text = ""
        t3.Text = ""
        d2.Text = ""
        d3.Text = ""
        t4.Text = ""
        t5.Text = ""
        t6.Text = "'"
        t7.Text = ""
        t8.Text = ""
        t9.Text = ""
        t10.Text = ""
            
        
        
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

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
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

    Protected Sub d2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        d3.Items.Clear()
        If d2.Text = "Punjab" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Amritsar")
            d3.Items.Add("Sangur")
            d3.Items.Add("Ludhiana")
            d3.Items.Add("Beas")
            d3.Items.Add("gurdaspur")
        ElseIf d2.Text = "Andhra Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Visakhapatnam")
            d3.Items.Add("Vijayawada")
            d3.Items.Add("Tirupati")
            d3.Items.Add("chittor")
            d3.Items.Add("Amaravati")
        ElseIf d2.Text = "Arunachal Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Tawang")
            d3.Items.Add("Bomdila")
            d3.Items.Add("Deomali")
            d3.Items.Add("Hawai")
            d3.Items.Add("Pangin")
        ElseIf d2.Text = "Assam" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Guwahati")
            d3.Items.Add("Tezpur")
            d3.Items.Add("Lanka")
            d3.Items.Add("Silchar")
            d3.Items.Add("Jorhat")
        ElseIf d2.Text = "Bihar" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Patna")
            d3.Items.Add("Gaya")
            d3.Items.Add("Muzaffarpur")
            d3.Items.Add("Darbhanga")
            d3.Items.Add("Munger")
        ElseIf d2.Text = "Chhattisgarh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Raipur")
            d3.Items.Add("Bastar")
            d3.Items.Add("Drug")
            d3.Items.Add("Dhamtari")
            d3.Items.Add("Kanker")
        ElseIf d2.Text = "Goa" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Panaji")
            d3.Items.Add("Ponda")
            d3.Items.Add("Madgaon")
            d3.Items.Add("Mapuca")
            d3.Items.Add("Sancoale")
        ElseIf d2.Text = "Gujarat" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Ahmedabad")
            d3.Items.Add("Surat")
            d3.Items.Add("Gandhinagar")
            d3.Items.Add("Somnath")
            d3.Items.Add("Dwarka")
        ElseIf d2.Text = "Haryana" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Faridabad")
            d3.Items.Add("Panipat")
            d3.Items.Add("Ambala")
            d3.Items.Add("Karnal")
            d3.Items.Add("Sonipat")
        ElseIf d2.Text = "Himachal Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Shimla")
            d3.Items.Add("Manali")
            d3.Items.Add("Dharamshala")
            d3.Items.Add("Kufri")
            d3.Items.Add("Dalhousie")
        ElseIf d2.Text = "Jammu And Kashmir" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jammu")
            d3.Items.Add("Srinagar")
            d3.Items.Add("Leh Ladakh")
            d3.Items.Add("Amarnath")
            d3.Items.Add("Gulmarg")
        ElseIf d2.Text = "Jharkhand" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jamshedpur")
            d3.Items.Add("Ranchi")
            d3.Items.Add("Dhanbad")
            d3.Items.Add("Mandu")
            d3.Items.Add("Giridih")
        ElseIf d2.Text = "Karnataka" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bengaluru")
            d3.Items.Add("Manglore")
            d3.Items.Add("Mysuru")
            d3.Items.Add("Vijayapura")
            d3.Items.Add("Ballari")
        ElseIf d2.Text = "Kerala" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Thiruvananthapuram")
            d3.Items.Add("Kochi")
            d3.Items.Add("Kovalam")
            d3.Items.Add("Kumarakom")
            d3.Items.Add("Munnar")
        ElseIf d2.Text = "Madhya Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Gwalior")
            d3.Items.Add("Bhopal")
            d3.Items.Add("Jabalpur")
            d3.Items.Add("Indore")
            d3.Items.Add("Rewa")
        ElseIf d2.Text = "Maharashtra" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Mumbai")
            d3.Items.Add("Pune")
            d3.Items.Add("Nagpur")
            d3.Items.Add("Nashik")
            d3.Items.Add("Thane")
        ElseIf d2.Text = "Manipur" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bishnupur")
            d3.Items.Add("Chandel")
            d3.Items.Add("Senapati")
            d3.Items.Add("Thoubal")
            d3.Items.Add("Ukhrul")
        ElseIf d2.Text = "Meghalaya" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("East Garo Hills")
            d3.Items.Add("East Khasi Hills")
            d3.Items.Add("Ribhoi")
            d3.Items.Add("South Garo Hills")
            d3.Items.Add("West Garo Hills")
        ElseIf d2.Text = "Mizoram" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Aizawl")
            d3.Items.Add("Bairabi")
            d3.Items.Add("Bilkhawthlir")
            d3.Items.Add("Champhai")
            d3.Items.Add("Kolasib")
        ElseIf d2.Text = "Nagaland" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kohima")
            d3.Items.Add("Chumukedima")
            d3.Items.Add("Dimapur")
            d3.Items.Add("Mon")
            d3.Items.Add("Peren")
        ElseIf d2.Text = "Odisha" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bhubaneshwar")
            d3.Items.Add("Konark")
            d3.Items.Add("Jeypore")
            d3.Items.Add("Balasore")
            d3.Items.Add("Chandipur")
        ElseIf d2.Text = "Rajasthan" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jaipur")
            d3.Items.Add("Jodhpur")
            d3.Items.Add("Ajmer")
            d3.Items.Add("Udaipur")
            d3.Items.Add("Bharatpur")
        ElseIf d2.Text = "Sikkim" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Gangtok")
            d3.Items.Add("Pelling")
            d3.Items.Add("Lachen")
            d3.Items.Add("Namchi")
            d3.Items.Add("Ravangla")
        ElseIf d2.Text = "Tamil Nadu" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Chennai")
            d3.Items.Add("Coimbatore")
            d3.Items.Add("Coonoor")
            d3.Items.Add("Kanchipuram")
            d3.Items.Add("Madurai")
        ElseIf d2.Text = "Telangana" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Hyderabad")
            d3.Items.Add("Warangai")
            d3.Items.Add("Adilabad")
            d3.Items.Add("Khammam")
            d3.Items.Add("Nalgonda")
        ElseIf d2.Text = "Tripura" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kailashahar")
            d3.Items.Add("Kamalpur")
            d3.Items.Add("Khowai")
            d3.Items.Add("Kumarghat")
            d3.Items.Add("Kunjaban")
        ElseIf d2.Text = "Uttar Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Mathura")
            d3.Items.Add("Moradabad")
            d3.Items.Add("Agra")
            d3.Items.Add("Aligarh")
            d3.Items.Add("Luckhnow")
        ElseIf d2.Text = "Uttarakhand" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Dehradun")
            d3.Items.Add("Haridwar")
            d3.Items.Add("Kashipur")
            d3.Items.Add("Roorkee")
            d3.Items.Add("Pantnagar")
        ElseIf d2.Text = "West Bengal" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kolkata")
            d3.Items.Add("Siliguri")
            d3.Items.Add("Durgapur")
            d3.Items.Add("Habra")
            d3.Items.Add("Darjeeling")
        Else
            
        End If
    End Sub
   
    Protected Sub d1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

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
	left: 131px;
	top: 8px;
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
	height:25px;
	z-index:3;
	left: 0px;
	top: 95px;
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
	height:568px;
	z-index:4;
	left: 8px;
	top: 121px;
}
.style19 {font-size: 16px; font-weight: bold; font-family: Calibri; }
#apDiv6 {
	position:absolute;
	width:18%;
	height:478px;
	z-index:1;
	left: 0;
}
#apDiv7 {
	position:absolute;
	width:82%;
	height:529px;
	z-index:2;
	left: 239px;
	background-color: #CCCCCC;
	top: 41px;
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
        height: 26px;
    }
.style35 {
	height: 26px;
	color: #666666;
	font-weight: bold;
}
.style38 {color: #666666; font-weight: bold; }
.style39 {
	font-family: Calibri;
	color: #666666;
	font-size: 16px;
	font-weight: bold;
}
    .style40
    {
        height: 25px;
    }
a {
	font-family: Calibri;
	font-size: 16px;
	color: #666666;
	font-weight: bold;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #666666;
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
            <asp:LinkButton ID="LinkButton1" runat="server" BackColor="Yellow" 
                onclick="LinkButton1_Click">Logout</asp:LinkButton>
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
            <td colspan="3" bgcolor="#27408B"><span class="style5"><strong>EPF Training Institute Detail</strong></span></td>
          </tr>
          <tr>
            <td colspan="3" class="style30"></td>
          </tr>
          <tr>
            <td width="16%" class="style39">Current Date</td>
            <td width="75%"><asp:TextBox ID="t1" runat="server"></asp:TextBox></td>
            <td width="9%">&nbsp;</td>
          </tr>
          <tr>
            <td class="style35">Zonal</td>
            <td class="style34">
                <asp:DropDownList ID="d1" runat="server" 
                    onselectedindexchanged="d1_SelectedIndexChanged">
                    <asp:ListItem>Select Any One</asp:ListItem>
                    <asp:ListItem>North Zone</asp:ListItem>
                    <asp:ListItem>South Zone</asp:ListItem>
                    <asp:ListItem>East Zone</asp:ListItem>
                    <asp:ListItem>West Zone</asp:ListItem>
                </asp:DropDownList>
              </td>
            <td class="style34"></td>
          </tr>
          <tr>
            <td><span class="style38">Institute Name</span></td>
            <td>
                <asp:TextBox ID="t2" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style38">Address</span></td>
            <td>
                <asp:TextBox ID="t3" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style38">State</span></td>
            <td>
                <asp:DropDownList ID="d2" runat="server" 
                    onselectedindexchanged="d2_SelectedIndexChanged" AutoPostBack="True">
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
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style38">City</span></td>
            <td>
                <asp:DropDownList ID="d3" runat="server">
                </asp:DropDownList>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style38">Pincode</span></td>
            <td>
                <asp:TextBox ID="t4" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><p class="style38">STD Code</p>              </td>
            <td>
                <asp:TextBox ID="t5" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style34"><span class="style38">Employee Name</span></td>
            <td class="style34">
                <asp:TextBox ID="t6" runat="server"></asp:TextBox>
              </td>
            <td class="style34"></td>
          </tr>
          <tr>
            <td class="style30"><span class="style38">Designation</span></td>
            <td class="style30">
                <asp:TextBox ID="t7" runat="server"></asp:TextBox>
              </td>
            <td class="style30"></td>
          </tr>
          <tr>
            <td><span class="style38">Email</span></td>
            <td>
                <asp:TextBox ID="t8" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="style40"><span class="style38">Contact No</span></td>
            <td class="style40">
                <asp:TextBox ID="t9" runat="server"></asp:TextBox>
              </td>
            <td class="style40"></td>
          </tr>
          <tr>
            <td><span class="style38">Fax No</span></td>
            <td>
                <asp:TextBox ID="t10" runat="server"></asp:TextBox>
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
            <td>
                <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" 
                    style="height: 26px" />              </td>
            <td>
                <asp:Button ID="Button4" runat="server" Text="Update" onclick="Button4_Click" />
&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
