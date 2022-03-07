<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Provident Funds</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pass As String
    Dim fname As String
    Dim jtype As String
    Dim pf As New Double
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select uname from emplogintemp")
        comm.Connection = conn
        Label1.Text = comm.ExecuteScalar
        If Label1.Text = "Null" Then
            MsgBox("Login Your Account")
            Response.Redirect("index.aspx")
        Else
            comm = New Data.SqlClient.SqlCommand("select ename from oempconfirm where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            fname = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select orgname from oempconfirm where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            Label4.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select desi from salary where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            Label5.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select doj from salary where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            Label6.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select salary from salary where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            Label7.Text = comm.ExecuteScalar
            comm = New Data.SqlClient.SqlCommand("select jtype  from salary where eemail='" & Label1.Text & "'")
            comm.Connection = conn
            jtype = comm.ExecuteScalar
          
            comm = New Data.SqlClient.SqlCommand("select pro  from pfrate where ot='" & jtype & "'")
            comm.Connection = conn
            pf = comm.ExecuteScalar
            
            Label2.Text = "Welcome: " & fname
            Label3.Text = Label2.Text
            Dim d1 As DateTime = Label6.Text
            Dim d2 As DateTime = Format(Now, "MM/dd/yyyy")
            Dim M As Integer = Math.Abs((d1.Year - d2.Year))
            Dim months As Integer = ((M * 12) + Math.Abs((d1.Month - d2.Month)))
                                
            pf = (Val(Label7.Text) * pf) / 100
             msgbox(pf)
            Label8.Text=pf*months
        End If
        conn.Close()
        
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from emplogintemp")
        comm.Connection = conn
        comm.ExecuteScalar()
        sql = "insert into emplogintemp values('" & "Null" & "')"
        adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
        adp.InsertCommand.ExecuteScalar()
        Response.Redirect("index.aspx")
        conn.Close()
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:628px;
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
.style2 {color: #FF00FF}
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
	height:403px;
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
	color: #000000;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #FFFFCC;
}
a:active {
	text-decoration: none;
	color: #FFFFCC;
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
	width:90%;
	height:313px;
	z-index:1;
	left: 45px;
	top: 2px;
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
	height:240px;
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
#apDiv19 {
	position:absolute;
	width:100%;
	height:46px;
	z-index:7;
	left: 0px;
	top: 563px;
}
.style39 {
	color: #000000
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
        <td class="style6">Employees' Provident Fund Organization, India.</td>
        <td width="7%" rowspan="2"><div align="right"><img src="../images/logo.jpg" width="57" height="68" /></div></td>
      </tr>
      <tr>
        <td width="84%" height="37"><div align="left" class="style7">Ministry of Labour &amp; Employment, Government of India.</div></td>
      </tr>
    </table>
  </div>
  <div id="apDiv4">
    <table width="100%" border="0" bgcolor="#058383">
      <tr>
        <td width="3%" bgcolor="#058383" class="style2"><a href="memdashboard.aspx">Home</a></td>
        <td width="3%" bgcolor="#058383"><a href="mempbook.aspx">PassBook</a></td>
        <td width="6%" bgcolor="#058383"><a href="memwithreq.aspx">Withdraw Request</a></td>
        <td width="6%" bgcolor="#058383">&nbsp;</td>
        <td width="6%" bgcolor="#058383">&nbsp;</td>
        <td width="6%" bgcolor="#058383">&nbsp;</td>
      </tr>
    </table>
  </div>
  <div id="apDiv5">
    <div id="apDiv10">
      <table width="100%" border="0">
        <tr>
          <th scope="row">
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </th>
          <td colspan="2">
              <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
          <td>
              <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red" 
                  onclick="LinkButton1_Click">Logout</asp:LinkButton>
            </td>
        </tr>
        <tr>
          <th colspan="4" bgcolor="#058383" scope="row"><div align="left" class="style39">Member PassBook</div></th>
          </tr>
        <tr>
          <th colspan="4" scope="row"><hr /></th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Employee Name</th>
          <th colspan="2" scope="row">
              <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Organization Name</th>
          <th colspan="2" scope="row">
              <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Designation</th>
          <th colspan="2" scope="row">
              <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Date of Joining</th>
          <th colspan="2" scope="row">
              <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Salary</th>
          <th colspan="2" scope="row">&nbsp;<asp:Label ID="Label7" runat="server" 
                  Text="Label"></asp:Label>
&nbsp; Per Month</th>
          </tr>
        <tr>
          <th colspan="2" scope="row">Total PF</th>
          <th colspan="2" scope="row">
              <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
      </table>
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
  <div id="apDiv19">
    <table width="100%" border="0" bgcolor="#058383">
      <tr>
        <th bgcolor="#058383" scope="col">&nbsp;</th>
      </tr>
      <tr>
        <td bgcolor="#024040"><div align="center"><span class="style5">©2021. Designed &amp; Developed By Ashima Sharma</span></div></td>
      </tr>
    </table>
  </div>
</div>
</form>
</body>
</html>
