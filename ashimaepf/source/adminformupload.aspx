<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EPF |form upload detail</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*) from upload where fo='" & t2.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This form subject already exist")
            conn.Close()
            t2.Text = ""
        Else
            sql = "insert into upload values('" & t1.Text & "','" & t2.Text & "','" & t3.Text & "','" & t4.Text & "','" & f1.FileName & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("upload detail submitted successfully")
          
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from upload where fo ='" & t2.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            comm = New Data.SqlClient.SqlCommand("select cdate from upload where fo='" & t2.Text & "'")
            comm.Connection = conn
            t1.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select fn from upload where fo='" & t2.Text & "'")
            comm.Connection = conn
            t3.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select fd from upload where fo='" & t2.Text & "'")
            comm.Connection = conn
            t4.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select pdf from upload where fo='" & t2.Text & "'")
            comm.Connection = conn
        Else
            MsgBox("this about not exist")
            conn.Close()
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from upload where fo='" & t2.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("upload detail deleted successfuylly")
        conn.Close()
        t1.Text = ""
        t2.Text = ""
        t3.Text = ""
        t4.Text = ""
        
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("update upload set cdate ='" & t1.Text & "',fn='" & t3.Text & "',fd='" & t4.Text & "',pdf='" & f1.FileName & "'where fo='" & t2.Text & "'")
        comm.Connection = conn
        comm.ExecuteScalar()
        MsgBox("upload detail updated successfully")
        conn.Close()
        t1.Text = ""
     
        t3.Text = ""
        t4.Text = ""
        
        
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
        
    
        t1.Text = Format(Now, "dd/MM/yyy")
        t1.Enabled=false
    
    
    
    
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
	height:25px;
	z-index:3;
	left: 0px;
	top: 95px;
	background-color: #27408b;
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
	height:490px;
	z-index:4;
	left: 0px;
	top: 120px;
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
	height:478px;
	z-index:2;
	left: 235px;
	background-color: #CCCCCC;
}
.style29 {font-size: 16px; font-weight: bold; font-family: Calibri; color: #666666; }
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
.style33 {color: #666666; font-weight: bold; }
    a {
	font-family: Calibri;
	font-size: 16px;
	color: #666666;
	font-style: italic;
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
      <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:LinkButton ID="LinkButton1" runat="server" BackColor="Yellow" 
          onclick="LinkButton1_Click">Logout</asp:LinkButton>
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
            <td colspan="3" bgcolor="#27408B"><span class="style5"><strong>EPF Form Upload Detail</strong></span></td>
          </tr>
          <tr>
            <td colspan="3" class="style30"></td>
          </tr>
          <tr>
            <td width="16%"><span class="style29">Current Date</span></td>
            <td width="75%">
                <asp:TextBox ID="t1" runat="server"></asp:TextBox>              </td>
            <td width="9%">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style33">Form No</span></td>
            <td>
                <asp:TextBox ID="t2" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style33">Form Name</span></td>
            <td>
                <asp:TextBox ID="t3" runat="server" ></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style33">Form Description</span></td>
            <td>
                <asp:TextBox ID="t4" runat="server"></asp:TextBox>
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="style33">PDF/Document</span></td>
            <td>
                <asp:FileUpload ID="f1" runat="server" />
              </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><hr /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" bgcolor="#27408B"><span class="style5"><strong>Operations   </tr>
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
                <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" />              </td>
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
