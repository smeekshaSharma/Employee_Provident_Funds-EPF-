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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select uname from ologintemp")
        comm.Connection = conn
        Label1.Text = comm.ExecuteScalar
        If Label1.Text = "Null" Then
            MsgBox("Login Your Account")
            Response.Redirect("adminlogin.aspx")
        Else
            comm = New Data.SqlClient.SqlCommand("select oname from orgconfirm where email='" & Label1.Text & "'")
            comm.Connection = conn
            fname = comm.ExecuteScalar
            Label2.Text = "Welcome: " & fname
        End If
        conn.Close()
        
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("delete from ologintemp")
        comm.Connection = conn
        comm.ExecuteScalar()
        sql = "insert into ologintemp values('" & "Null" & "')"
        adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
        adp.InsertCommand.ExecuteScalar()
        Response.Redirect("orglogin.aspx")
        conn.Close()
    End Sub
    Dim oemail As String
    Dim ot As String
    Dim oname As String
    Dim ecode As String
    Dim ename As String
    Dim efather As String
    Dim eemail As String
    Dim econ As String
    Dim jt As String
    Dim pwd As String
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        oemail = Label1.Text
        ot = GridView1.SelectedRow.Cells(4).Text
        oname = GridView1.SelectedRow.Cells(3).Text
        ecode = GridView1.SelectedRow.Cells(7).Text
        ename = GridView1.SelectedRow.Cells(8).Text
        efather = GridView1.SelectedRow.Cells(9).Text
        eemail = GridView1.SelectedRow.Cells(10).Text
        econ = GridView1.SelectedRow.Cells(11).Text
        jt = GridView1.SelectedRow.Cells(13).Text
        pwd = Val(econ) + 123
        
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        
        comm = New Data.SqlClient.SqlCommand("select count(*) from oempconfirm where eemail='" & eemail & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This Employee Already Confirmed")
            conn.Close()
            
        Else
            sql = "insert into oempconfirm values('" & oemail & "','" & ot & "','" & oname & "','" & ecode & "','" & ename & "','" & efather & "','" & eemail & "','" & econ & "','" & jt & "','" & pwd & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("Employee Has been Confirmed ")
        End If
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
	top: 166px;
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
    .style40
    {
        width: 9%;
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
        <td width="3%" bgcolor="#058383" class="style2"><a href="orgdashboard.aspx">Home</a></td>
        <td bgcolor="#058383" class="style40"><a href="oempcomfirm.aspx">Employee Confirmation</a></td>
        <td width="6%" bgcolor="#058383"><a href="oempsal.aspx">Employee Salary</a></td>
        <td width="6%" bgcolor="#058383"><a href="oempregrpt.aspx">Employee Registration Report</a></td>
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
          <td>
              <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
          <td>
              <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red" 
                  onclick="LinkButton1_Click">Logout</asp:LinkButton>
            </td>
Organization Employee Confirmation</div></th>
          </tr>
        <tr>
          <th colspan="3" scope="row"><hr /></th>
          </tr>
        <tr>
          <th colspan="3" scope="row">
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" 
                  onselectedindexchanged="GridView1_SelectedIndexChanged">
                  <Columns>
                      <asp:CommandField ShowSelectButton="True" />
                      <asp:BoundField DataField="st" HeaderText="State" SortExpression="st" />
                      <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                      <asp:BoundField DataField="org" HeaderText="org" SortExpression="org" />
                      <asp:BoundField DataField="ot" HeaderText="ot" SortExpression="ot" />
                      <asp:BoundField DataField="oe" HeaderText="oe" SortExpression="oe" />
                      <asp:BoundField DataField="oc" HeaderText="oc" SortExpression="oc" />
                      <asp:BoundField DataField="ec" HeaderText="ec" SortExpression="ec" />
                      <asp:BoundField DataField="en" HeaderText="en" SortExpression="en" />
                      <asp:BoundField DataField="emp" HeaderText="emp" SortExpression="emp" />
                      <asp:BoundField DataField="ee" HeaderText="ee" SortExpression="ee" />
                      <asp:BoundField DataField="ecn" HeaderText="ecn" SortExpression="ecn" />
                      <asp:BoundField DataField="desi" HeaderText="desi" SortExpression="desi" />
                      <asp:BoundField DataField="jt" HeaderText="jt" SortExpression="jt" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  SelectCommand="SELECT [st], [ci], [org], [ot], [oe], [oc], [ec], [en], [emp], [ee], [ecn], [desi], [jt] FROM [empreg] WHERE ([oe] = @oe)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="Label1" Name="oe" PropertyName="Text" 
                          Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
            </th>
          </tr>
      </table>
    </div>
  </div>
  <div id="apDiv9">
    <table width="100%" border="0">
      <tr>
        <th width="18%" scope="col"><div align="left"><span class="style35">Help Desk/Toll Free Number (1800118005)tr>
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
