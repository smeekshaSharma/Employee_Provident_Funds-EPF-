<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Provident Funds</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*) from orgreg where email='" & t4.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This OrgReg Already Exist")
            conn.Close()
            t4.Text = ""
        Else
            sql = "insert into orgreg values('" & t1.Text & "','" & t2.Text & "','" & t3.Text & "','" & d1.Text & "','" & t4.Text & "','" & d2.Text & "','" & d3.Text & "','" & t5.Text & "','" & t6.Text & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("OrgReg Has Been Saved")
            t2.Text = ""
            t3.Text = ""
          
            t4.Text = ""
           
           
            t5.Text = ""
            t6.Text = ""
            
           
                  
                   
            
        End If
        
        
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        t1.Text = Format(Now, "dd/mm/yyy")
        t1.Enabled = False
        
    End Sub

    Protected Sub d3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        d1.Items.Clear()
        If d3.Text = "Punjab" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Amritsar")
            d1.Items.Add("Jalandhar")
            d1.Items.Add("Ludhiana")
            d1.Items.Add("Beas")
            d1.Items.Add("gurdaspur")
        ElseIf d3.Text = "Andhra Pradesh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Visakhapatnam")
            d1.Items.Add("Vijayawada")
            d1.Items.Add("Tirupati")
            d1.Items.Add("Chittoor")
            d1.Items.Add("Amaravati")
        ElseIf d3.Text = "Arunachal Pradesh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Tawang")
            d1.Items.Add("Bomdila")
            d1.Items.Add("Deomali")
            d1.Items.Add("Hawai")
            d1.Items.Add("Pangin")
        ElseIf d3.Text = "Assam" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Guwahati")
            d1.Items.Add("Tezpur")
            d1.Items.Add("Lanka")
            d1.Items.Add("Silchar")
            d1.Items.Add("Jorhat")
        ElseIf d3.Text = "Bihar" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Patna")
            d1.Items.Add("Gaya")
            d1.Items.Add("Muzaffarpur")
            d1.Items.Add("Darbhanga")
            d1.Items.Add("Munger")
        ElseIf d3.Text = "Chhattisgarh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Raipur")
            d1.Items.Add("Bastar")
            d1.Items.Add("Drug")
            d1.Items.Add("Dhamtari")
            d1.Items.Add("Kanker")
        ElseIf d3.Text = "Goa" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Panaji")
            d1.Items.Add("Ponda")
            d1.Items.Add("Madgaon")
            d1.Items.Add("Mapuca")
            d1.Items.Add("Sancoale")
        ElseIf d3.Text = "Gujarat" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Ahmedabad")
            d1.Items.Add("Surat")
            d1.Items.Add("Gandhinagar")
            d1.Items.Add("Somnath")
            d1.Items.Add("Dwarka")
        ElseIf d3.Text = "Haryana" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Faridabad")
            d1.Items.Add("Panipat")
            d1.Items.Add("Ambala")
            d1.Items.Add("Karnal")
            d1.Items.Add("Sonipat")
        ElseIf d3.Text = "Himachal Pradesh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Shimla")
            d1.Items.Add("Manali")
            d1.Items.Add("Dharamshala")
            d1.Items.Add("Kufri")
            d1.Items.Add("Dalhousie")
        ElseIf d3.Text = "Jammu And Kashmir" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Jammu")
            d1.Items.Add("Srinagar")
            d1.Items.Add("Leh Ladakh")
            d1.Items.Add("Amarnath")
            d1.Items.Add("Gulmarg")
        ElseIf d3.Text = "Jharkhand" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Jamshedpur")
            d1.Items.Add("Ranchi")
            d1.Items.Add("Dhanbad")
            d1.Items.Add("Mandu")
            d1.Items.Add("Giridih")
        ElseIf d3.Text = "Karnataka" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Bengaluru")
            d1.Items.Add("Manglore")
            d1.Items.Add("Mysuru")
            d1.Items.Add("Vijayapura")
            d1.Items.Add("Ballari")
        ElseIf d3.Text = "Kerala" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Thiruvananthapuram")
            d1.Items.Add("Kochi")
            d1.Items.Add("Kovalam")
            d1.Items.Add("Kumarakom")
            d1.Items.Add("Munnar")
        ElseIf d3.Text = "Madhya Pradesh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Gwalior")
            d1.Items.Add("Bhopal")
            d1.Items.Add("Jabalpur")
            d1.Items.Add("Indore")
            d1.Items.Add("Rewa")
        ElseIf d3.Text = "Maharashtra" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Mumbai")
            d1.Items.Add("Pune")
            d1.Items.Add("Nagpur")
            d1.Items.Add("Nashik")
            d1.Items.Add("Thane")
        ElseIf d3.Text = "Manipur" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Bishnupur")
            d1.Items.Add("Chandel")
            d1.Items.Add("Senapati")
            d1.Items.Add("Thoubal")
            d1.Items.Add("Ukhrul")
        ElseIf d3.Text = "Meghalaya" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("East Garo Hills")
            d1.Items.Add("East Khasi Hills")
            d1.Items.Add("Ribhoi")
            d1.Items.Add("South Garo Hills")
            d1.Items.Add("West Garo Hills")
        ElseIf d3.Text = "Mizoram" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Aizawl")
            d1.Items.Add("Bairabi")
            d1.Items.Add("Bilkhawthlir")
            d1.Items.Add("Champhai")
            d1.Items.Add("Kolasib")
        ElseIf d3.Text = "Nagaland" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Kohima")
            d1.Items.Add("Chumukedima")
            d1.Items.Add("Dimapur")
            d1.Items.Add("Mon")
            d1.Items.Add("Peren")
        ElseIf d3.Text = "Odisha" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Bhubaneshwar")
            d1.Items.Add("Konark")
            d1.Items.Add("Jeypore")
            d1.Items.Add("Balasore")
            d1.Items.Add("Chandipur")
        ElseIf d3.Text = "Rajasthan" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Jaipur")
            d1.Items.Add("Jodhpur")
            d1.Items.Add("Ajmer")
            d1.Items.Add("Udaipur")
            d1.Items.Add("Bharatpur")
        ElseIf d3.Text = "Sikkim" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Gangtok")
            d1.Items.Add("Pelling")
            d1.Items.Add("Lachen")
            d1.Items.Add("Namchi")
            d1.Items.Add("Ravangla")
        ElseIf d3.Text = "Tamil Nadu" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Chennai")
            d1.Items.Add("Coimbatore")
            d1.Items.Add("Coonoor")
            d1.Items.Add("Kanchipuram")
            d1.Items.Add("Madurai")
        ElseIf d3.Text = "Telangana" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Hyderabad")
            d1.Items.Add("Warangai")
            d1.Items.Add("Adilabad")
            d1.Items.Add("Khammam")
            d1.Items.Add("Nalgonda")
        ElseIf d3.Text = "Tripura" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Kailashahar")
            d1.Items.Add("Kamalpur")
            d1.Items.Add("Khowai")
            d1.Items.Add("Kumarghat")
            d1.Items.Add("Kunjaban")
        ElseIf d3.Text = "Uttar Pradesh" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Mathura")
            d1.Items.Add("Moradabad")
            d1.Items.Add("Agra")
            d1.Items.Add("Aligarh")
            d1.Items.Add("Luckhnow")
        ElseIf d3.Text = "Uttarakhand" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Dehradun")
            d1.Items.Add("Haridwar")
            d1.Items.Add("Kashipur")
            d1.Items.Add("Roorkee")
            d1.Items.Add("Pantnagar")
        ElseIf d3.Text = "West Bengal" Then
            d1.Items.Add("Select Any One")
            d1.Items.Add("Kolkata")
            d1.Items.Add("Siliguri")
            d1.Items.Add("Durgapur")
            d1.Items.Add("Habra")
            d1.Items.Add("Darjeeling")
        Else
            
        End If
        
    End Sub

    Protected Sub d2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        
            
            
            
            
            
            
            
                       
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
      
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:936px;
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
	top: 39px;
}
#apDiv3 {
	position:absolute;
	width:100%;
	height:39px;
	z-index:2;
	left: 0px;
	top: 0px;
	background-color: #ff0000;
}
#apDiv4 {
	position:absolute;
	width:100%;
	height:25px;
	z-index:3;
	left: -2px;
	top: 123px;
	background-color: #035050;
}
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
	height:318px;
	z-index:4;
	left: 0px;
	top: 149px;
}
#apDiv6 {
	position:absolute;
	width:18%;
	height:478px;
	z-index:1;
	left: 0;
	top: 1px;
}
#apDiv7 {
	position:absolute;
	width:82%;
	height:478px;
	z-index:2;
	left: 235px;
	background-color: #CCCCCC;
	top: 2px;
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
.style35 {
	color: #FFFF66;
	font-size: 12px;
	font-weight: bold;
}
.style36 {
	font-size: 12px;
	font-weight: bold;
	color: #FFFFFF;
}
#apDiv9 {
	position:absolute;
	width:100%;
	height:37px;
	z-index:5;
	background-color: #ff0000;
}
#apDiv10 {
	position:absolute;
	width:100%;
	height:313px;
	z-index:1;
	left: 48px;
	top: -3px;
}
#apDiv11 {
	position:absolute;
	width:70%;
	height:301px;
	z-index:1;
	left: 0px;
	top: 2px;
}
#apDiv12 {
	position:absolute;
	width:25%;
	height:301px;
	z-index:2;
	left: 943px;
	top: 1px;
	background-color: #F2F2F2;
}
#apDiv13 {
	position:absolute;
	width:23px;
	height:23px;
	z-index:2;
	left: 80px;
	top: 2px;
}
#apDiv14 {
	position:absolute;
	width:100%;
	height:393px;
	z-index:6;
	left: 0px;
	top: 469px;
}
#apDiv15 {
	position:absolute;
	width:55%;
	height:384px;
	z-index:1;
	left: 9px;
	top: 1px;
}
#apDiv16 {
	position:absolute;
	width:74px;
	height:79px;
	z-index:3;
	left: 1081px;
	top: -19px;
}
#apDiv17 {
	position:absolute;
	width:35%;
	height:161px;
	z-index:2;
	left: 809px;
	top: 0px;
}
#apDiv18 {
	position:absolute;
	width:35%;
	height:189px;
	z-index:3;
	left: 809px;
	top: 203px;
	background-color: #fbf181;
}
.style38 {color: #FF0000}
#apDiv19 {
	position:absolute;
	width:100%;
	height:46px;
	z-index:7;
	left: 0px;
	top: 873px;
}
.style41 {color: #666666; font-weight: bold; }
.style42 {color: #666666}
#apDiv20 {
	position:absolute;
	width:100%;
	height:25px;
	z-index:8;
	top: 122px;
	background-color: #035050;
}
-->
</style>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body>
    <form id="form1" runat="server">
<div id="apDiv1">
  <div id="apDiv2">
    <table width="100%" height="71" border="0">
      <tr>
        <td width="9%" rowspan="2"><img src="../images/epf logo.png" width="75" height="74" /></td>
        <td class="style6">Employees' Provident Fund Organization, India.</td>
        <td width="7%" rowspan="2"><div align="right"><img src="../images/logo.jpg" width="57" height="68" /></div></td>
      </tr>
      <tr>
        <td width="84%" height="37"><div align="left" class="style7">Ministry of Labour &amp; Employment, Government of India.</div></td>
      </tr>
    </table>
  </div>
  <div id="apDiv5">
    <div id="apDiv10">
      <div id="apDiv11">
        <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','903','height','301','src','../animation/Movie2','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','../animation/Movie2' ); //end AC code
        </script>
        <noscript>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="903" height="301">
          <param name="movie" value="../animation/Movie2.swf" />
          <param name="quality" value="high" />
          <embed src="../animation/Movie2.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="903" height="301"></embed>
        </object>
        </noscript>
        </div>
      <div id="apDiv12" style="border:1px solid #035050;border-radius:10px">
        <table width="100%" border="0">
          <tr>
            <th colspan="2" scope="col">&nbsp;</th>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="35%"><strong>UAN No</strong></td>
            <td width="65%">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td><strong>Password</strong></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><div align="center"><strong>Forgot Password</strong></div></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="#058383" Font-Bold="True" 
                    ForeColor="White" Text="Login" />
                <asp:Button ID="Button2" runat="server" BackColor="#058383" Font-Bold="True" 
                    ForeColor="White" Text="Login" />
              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div>
      <div id="apDiv16"><img src="../images/users.png" width="75" height="75" /></div>
    </div>
  </div>
  <div id="apDiv9">
    <table width="100%" border="0">
      <tr>
        <th width="18%" scope="col"><div align="left"><span class="style35">Help Desk/Toll Free Number (1800118005)</span></div></th>
        <th scope="col"><div>
            <div><a href="https://pledge.cvc.nic.in/" target="_blank"><strong> </strong></a><span class="style36">
              <marquee direction="left">
                Please note-THERE IS NO APP, OTHER THAN 'UMANG', FOR EPFO RELATED SERVICES.
                </marquee>
               
              </span><br />
            </div>
        </div></th>
      </tr>
    </table>
  </div>
  <div id="apDiv14">
    <div id="apDiv15">
      <table width="100%" border="0">
        <tr>
          <th colspan="4" bgcolor="#058383" scope="col">Registration Organization </th>
        </tr>
        <tr>
          <td width="29%"><span class="style41">Current Date</span></td>
          <td width="13%"><span class="style42"></span>
              <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            </td>
          <td width="30%"><span class="style42"></span></td>
          <td width="28%"><span class="style42"></span></td>
        </tr>
        <tr>
          <td><span class="style41">Organization/Company Name</span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t2" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>Organization Type</strong></span></td>
          <td><span class="style42">
              <asp:DropDownList ID="d2" runat="server" 
                  onselectedindexchanged="d2_SelectedIndexChanged">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem>Government</asp:ListItem>
                  <asp:ListItem>Non Government</asp:ListItem>
                  <asp:ListItem>Others</asp:ListItem>
              </asp:DropDownList>
              </span>
            </td>
        </tr>
        <tr>
          <td><span class="style41">Addressss</span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t3" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>State</strong></span></td>
          <td><span class="style42"></span>
              <asp:DropDownList ID="d3" runat="server" AutoPostBack="True" 
                  onselectedindexchanged="d3_SelectedIndexChanged">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem>Punjab</asp:ListItem>
                  <asp:ListItem>Andhra Pradesh</asp:ListItem>
                  <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                  <asp:ListItem>Assam</asp:ListItem>
                  <asp:ListItem>Bihar</asp:ListItem>
                  <asp:ListItem>Chhattisgarh</asp:ListItem>
                  <asp:ListItem>Goa</asp:ListItem>
                  <asp:ListItem>Gujarat</asp:ListItem>
                  <asp:ListItem>Haryana</asp:ListItem>
                  <asp:ListItem>Himachal Pradesh</asp:ListItem>
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
                  <asp:ListItem>uttar Pradesh</asp:ListItem>
                  <asp:ListItem>Uttarakhand</asp:ListItem>
                  <asp:ListItem>West Bengal</asp:ListItem>
                  <asp:ListItem>Jammu and Kashmir</asp:ListItem>
              </asp:DropDownList>
            </td>
        </tr>
        <tr>
          <td><span class="style41">City</span></td>
          <td><span class="style42"></span>
              <asp:DropDownList ID="d1" runat="server">
              </asp:DropDownList>
            </td>
          <td><span class="style42"><strong>Pincode</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td><span class="style41">Email</span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t4" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>Contact No</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td colspan="4" class="style42">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Submit" 
                  style="height: 26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Button4" runat="server" Text="Reset" />
            </td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
      </table>
    </div>
    <div id="apDiv17">
      <table width="100%" border="0">
        <tr>
          <th colspan="2" bgcolor="#058383" scope="col">Important Links</th>
        </tr>
        <tr>
          <td><img src="../images/arrow.png" width="20" height="20" /></td>
          <td>Activate UAN</td>
        </tr>
        <tr>
          <td colspan="2"><hr /></td>
        </tr>
        <tr>
          <td><img src="../images/arrow.png" width="20" height="20" /></td>
          <td>Know Your UAN Status</td>
        </tr>
        <tr>
          <td colspan="2"><hr /></td>
        </tr>
        <tr>
          <td><img src="../images/arrow.png" width="20" height="20" /></td>
          <td>Employee Login</td>
        </tr>
        <tr>
          <td colspan="2"><hr /></td>
        </tr>
        <tr>
          <td><img src="../images/arrow.png" width="20" height="20" /></td>
          <td>Death claim filing by beneficiary</td>
        </tr>
        <tr>
          <td colspan="2"><hr /></td>
        </tr>
      </table>
    </div>
    <div id="apDiv18">
      <table width="100%" border="0">
        <tr>
          <th scope="col"><span class="style38">NOTE</span></th>
        </tr>
        <tr>
          <td><ul>
            <li> Members with authenticated Aadhaar and Bank details seeded against their UAN can now submit their PF Withdrawal/Settlement/Transfer claims online.</li>
            <li> One mobile number can be used for one registration only.</li>
            <li>A member can view the passbooks of the EPF accounts which has been tagged with UAN.</li>
            <li>The facility of passbook is not available for members of establishments having exemption under the EPF Scheme 1952.</li>
          </ul>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <div id="apDiv19">
    <table width="100%" border="0" bgcolor="#058383">
      <tr>
        <th bgcolor="#058383" scope="col">&nbsp;</th>
      </tr>
      <tr>
        <td bgcolor="#024040"><div align="center"><span class="style5">©2020. Designed &amp; Developed By Sumit Joshi</span></div></td>
      </tr>
    </table>
  </div>
  <div id="apDiv20">
    <table width="100%" border="0">
      <tr>
        <td>
            <asp:Menu ID="Menu1" runat="server" BackColor="#035050" 
                DynamicHorizontalOffset="2" Font-Bold="True" Font-Names="Times New Roman" 
                Font-Size="Medium" ForeColor="White" Orientation="Horizontal" 
                StaticSubMenuIndent="10px">
                <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#035050" />
                <DynamicSelectedStyle BackColor="#035050" />
                <Items>
                    <asp:MenuItem ImageUrl="~/images/homeico.png" Text="Home" Value="Home" 
                        NavigateUrl="~/source/index.aspx">
                    </asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/aboutlogo.png" Text="About" Value="About">
                        <asp:MenuItem Text="About Us" Value="About Us" 
                            NavigateUrl="~/source/about.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Training" Value="Training" 
                            NavigateUrl="~/source/training.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/userlogo.png" Text="Registartion" 
                        Value="Member Registration">
                        <asp:MenuItem NavigateUrl="~/source/empreg.aspx" Text="Member" Value="Member">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/source/orgreg.aspx" Text="Organization" 
                            Value="Organization"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/adminico.png" Text="Login" 
                        Value="Login">
                        <asp:MenuItem Text="Organization" Value="Organization" 
                            NavigateUrl="~/source/orglogin.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Admin" Value="Admin" NavigateUrl="~/source/adminlogin.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/serviceslogo.png" Text="Services" 
                        Value="Services">
                        <asp:MenuItem NavigateUrl="~/source/dform.aspx" Text="Download Form" 
                            Value="Download Form"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/source/schemes.aspx" Text="Schemes" 
                            Value="Schemes"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/source/services.aspx" Text="Services" 
                            Value="Services"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/source/tender.aspx" Text="Tender" Value="Tender">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/source/faq.aspx" Text="FAQ" Value="FAQ">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/contactico.png" 
                        NavigateUrl="~/source/contact.aspx" Text="Contact" Value="Contact">
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#035050" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#035050" />
            </asp:Menu>
        </td>
      </tr>
    </table>
  </div>
</div>
</form>
</body>
</html>
