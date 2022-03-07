<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Provident Funds | Admin DashBoard</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pass As String
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
	height:545px;
	z-index:4;
	left: 0px;
	top: 120px;
}
.style19 {font-size: 16px; font-weight: bold; font-family: Calibri; }
#apDiv6 {
	position:absolute;
	width:18%;
	height:494px;
	z-index:1;
	left: 0;
}
#apDiv7 {
	position:absolute;
	width:82%;
	height:478px;
	z-index:2;
	left: 235px;
}
.style25 {font-size: 16px; color: #333333; }
a {
	font-size: 16px;
	color: #333333;
	font-weight: bold;
	font-family: Calibri;
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
        <td width="9%" bgcolor="#27408B"><div align="center" class="style5">Our Services</div></td>
        <td width="16%" bgcolor="#27408B"><div align="center" class="style5">Status of Establishments</div></td>
        <td width="18%" bgcolor="#27408B"><div align="center" class="style5">EPFO Corner</div></td>
        <td width="10%" bgcolor="#27408B"><div align="center" class="style5">Miscellaneous</div></td>
        <td width="11%" bgcolor="#27408B"><div align="center" class="style5">Contact Us</div></td>
        <td width="11%" bgcolor="#27408b"><div align="center" class="style5">PM-SYM</div></td>
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
      <table width="100%" border="0">
        <tr>
          <td bgcolor="#27408B">
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Label"></asp:Label>
            </td>
          <td bgcolor="#27408B">
              <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FFFF66" 
                  onclick="LinkButton1_Click">Logout</asp:LinkButton>
            </td>
        </tr>
        <tr>
          <td bgcolor="#27408B" colspan="2"><span class="style5"><strong>What is Administrator?</strong></span></td>
        </tr>
        <tr>
          <td colspan="2"><span class="style25">Administration is a fast legal process that protects your limited company or partnership by order of the Court. Once the process has started, no legal action can be taken against the business or any assets removed without the Courts approval or that of the insolvency practitioner appointed as administrator to oversee the business.</span></td>
        </tr>
        <tr>
          <td colspan="2"><p class="style25">Administration should achieve one of three statutory objectives. These are:</p>
            <ul class="style25">
              <li>To rescue the company as a going concern (which means placing the business in short term protection until it can be handed back to the directors)</li>
              <li>To achieve a better result than the company being wound up (better than the business just going into liquidation first)</li>
              <li>To realise security to pay off preferential or secured creditors (the methods the banks use to appoint an administrator)</li>
          </ul>          </td>
        </tr>
        <tr>
          <td colspan="2"><span class="style25">Within eight weeks of the date of the Administration order, the administrator will write to all creditors and set out their proposals (in a written report). They may then call a meeting of creditors within two weeks of that report to discuss the proposals and vote on the outcome. The administrator has to call a meeting if more than 10% of creditors (by value) request one. The outcome of the meeting may be; carry on realising assets, move to liquidation or a company voluntary arrangement, dissolution or even a return to the directors if the business is now solvent.</span></td>
        </tr>
        <tr>
          <td colspan="2"><p class="style25">One of the most useful aspects of Administration is that it’s very fast to get into and can be done without notifying creditors or shareholders. Once the formal process has begun, the business is protected. It is then up to the appointed insolvency practitioner (usually with the help and input of the directors) to decide what to do next. In no particular order, this may be one or more of the following:</p>
            <ul class="style25">
              <li>Reduce the staff head count and close any unprofitable branches or divisions</li>
              <li>Keep trading to finish any incomplete work to maximise value</li>
              <li>Try to sell all or part of the business to a new owner.</li>
              <li>Sell assets and stock to realise funds to pay creditors.</li>
            </ul>          </td>
        </tr>
      </table>
    </div>
  </div>
</div>
    </form>
</body>
</html>
