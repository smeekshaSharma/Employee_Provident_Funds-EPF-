<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Provident Fund | Admin Login</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If t4.Text <> "EPF123" Then
            MsgBox("Admin Code Not Match")
            t4.Text = ""
            Exit Sub
        End If
        If t5.Text <> t6.Text Then
            MsgBox("Password & Reenter Password Not Match With Each Other")
            t5.Text = ""
            t6.Text = ""
            Exit Sub
        End If
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*) from reg where email='" & t3.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This Registration Already Exist")
            conn.Close()
            t3.Text = ""
        Else
            sql = "insert into reg values('" & t1.Text & "','" & d1.Text & "','" & t2.Text & "','" & t3.Text & "','" & t4.Text & "','" & t5.Text & "','" & d2.Text & "','" & t6.Text & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("User Created Succeesfully")
            t1.Text = ""
          
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            t5.Text = ""
           
            t6.Text = ""
            
            
        End If
        
        
        
        
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        t1.Text = ""
        t2.Text = ""
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:557px;
	z-index:1;
	left: 0;
	top: 0;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:129px;
	z-index:1;
	left: 0;
}
.style1 {
	font-size: 16px;
	color: #ef6e08;
	font-weight: bold;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
	font-family: Calibri;
	color: #0955a1;
}
#apDiv3 {
	position:absolute;
	width:100%;
	height:9px;
	z-index:2;
	top: 129px;
	background-color: #0955A1;
}
#apDiv4 {
	position:absolute;
	width:70%;
	height:398px;
	z-index:3;
	left: 232px;
	top: 153px;
}
#apDiv5 {
	position:absolute;
	width:400px;
	height:391px;
	z-index:1;
	left: -3px;
	top: -1px;
}
#apDiv6 {
	position:absolute;
	width:382px;
	height:32px;
	z-index:1;
	left: 14px;
	top: 4px;
}
#apDiv7 {
	position:absolute;
	width:223px;
	height:67px;
	z-index:2;
	left: 12px;
	top: 44px;
}
#apDiv8 {
	position:absolute;
	width:148px;
	height:27px;
	z-index:3;
	left: 21px;
	top: 120px;
}
#apDiv9 {
	position:absolute;
	width:113px;
	height:142px;
	z-index:4;
	left: 27px;
	top: 187px;
}
#apDiv10 {
	position:absolute;
	width:195px;
	height:115px;
	z-index:5;
	left: 251px;
	top: 85px;
}
#apDiv11 {
	position:absolute;
	width:485px;
	height:329px;
	z-index:2;
	left: 404px;
	top: 53px;
	background-color: #EF6E08;
}
.style3 {
	font-size: 24px;
	font-weight: bold;
	font-family: Calibri;
	color: #0955A1;
}
.style4 {
	color: #FFFFFF;
	font-weight: bold;
}
.style5 {
	color: #EF6E08;
	font-weight: bold;
}
-->
</style>
</head>

<body>
    <form id="form1" runat="server">
<div id="apDiv1">
  <div id="apDiv2">
    <table width="100%" height="93" border="0">
      <tr>
        <td width="10%" rowspan="2"><img src="../images/logo.png" width="124" height="123" /></td>
        <td width="42%" height="66"><span class="style2">EMPLOYEES' PROVIDENT FUND ORGANIZATION, INDIA</span></td>
        <td width="23%" rowspan="2">&nbsp;</td>
        <td width="25%" rowspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td><div align="left"><span class="style1">MINISTRY OF LABOUR &amp; EMPLOYMENT,GOVERMENT OF INDIA</span></div></td>
      </tr>
    </table>
  </div>
  <div id="apDiv3"></div>
  <div id="apDiv4">
    <div id="apDiv5">
      <div class="style3" id="apDiv6">EPF ADMINISTRATION LOGIN</div>
      <div id="apDiv7">Use a valid username and password to gain access to the administrator backend</div>
      <div id="apDiv8">Go to site home page</div>
      <div id="apDiv9"><img src="../images/adminlock.jpg" width="117" height="149" /></div>
    </div>
    <div id="apDiv11">
      <table width="100%" border="0">
        <tr>
          <td colspan="3" bgcolor="#FFFFFF"><span class="style5">Admin Registration</span></td>
          </tr>
        <tr>
          <td><div align="left"><span class="style4">Full Name</span></div></td>
          <td><asp:TextBox ID="t1" runat="server"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">Gender</span></div></td>
          <td>
              <asp:DropDownList ID="d1" runat="server">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem>Male</asp:ListItem>
                  <asp:ListItem>Female</asp:ListItem>
              </asp:DropDownList>
            </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="28%"><p align="left" class="style4">Mobile No</p>          </td>
          <td width="47%"><asp:TextBox ID="t2" runat="server"></asp:TextBox></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right" class="style4">
            <div align="left">Email</div>
          </div></td>
          <td><asp:TextBox ID="t3" runat="server"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">Admin Code</span></div></td>
          <td><asp:TextBox ID="t4" runat="server" TextMode="Password"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">New Password</span></div></td>
          <td><asp:TextBox ID="t5" runat="server" TextMode="Password"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">ReenterPassword</span></div></td>
          <td><asp:TextBox ID="t6" runat="server" TextMode="Password"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">Security Questions</span></div></td>
          <td>
              <asp:DropDownList ID="d2" runat="server">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem>What is Your Fav. Colour</asp:ListItem>
                  <asp:ListItem>Best Friend name</asp:ListItem>
                  <asp:ListItem>what is your last school attend</asp:ListItem>
                  <asp:ListItem>what is your DOB</asp:ListItem>
                  <asp:ListItem>What is Your Favourite  Fruit</asp:ListItem>
                  <asp:ListItem>What is Your Favourite Hobby</asp:ListItem>
                  <asp:ListItem>What is your Mother Tongue</asp:ListItem>
                  <asp:ListItem>What is your Nationality</asp:ListItem>
                  <asp:ListItem></asp:ListItem>
              </asp:DropDownList>
            </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="left"><span class="style4">Answer</span></div></td>
          <td><asp:TextBox ID="t7" runat="server"></asp:TextBox></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
              <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Signup" />            </td>
          <td>
              <asp:Button ID="Button2" runat="server" Text="Reset" onclick="Button2_Click" />            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </div>
  </div>
</div>
    </form>
</body>
</html>
