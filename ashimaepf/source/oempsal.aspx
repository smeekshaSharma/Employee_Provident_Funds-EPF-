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
        
        t7.Text = Format(Now, "dd/MM/yyyy")
        t7.Enabled = False
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        
          
        
    End Sub

    Protected Sub t7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("Select count(*)from salary where eemail='" & D1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This Employee Salary Already Exist")
            conn.Close()
            D1.Text = ""
        Else
            sql = "insert into salary values('" & D1.Text & "','" & t1.Text & "','" & t2.Text & "','" & t3.Text & "','" & t4.Text & "','" & t5.Text & "','" & t6.Text & "','" & t7.Text & "','" & c1.SelectedDate & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("Employee Salary Record Has Been Saved")
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = ""
            t7.Text = ""
            c1.SelectedDate = ""
        End If
    End Sub

    Protected Sub D1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        
        comm = New Data.SqlClient.SqlCommand("select ename from oempconfirm where eemail='" & D1.Text & "'")
        comm.Connection = conn
        t1.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select efathername from oempconfirm where eemail='" & D1.Text & "'")
        comm.Connection = conn
        t2.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select econtact from oempconfirm where eemail='" & D1.Text & "'")
        comm.Connection = conn
        t3.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select jt from oempconfirm where eemail='" & D1.Text & "'")
        comm.Connection = conn
        t5.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select desi from oempconfirm where ee='" & D1.Text & "'")
        comm.Connection = conn
        t4.Text = comm.ExecuteScalar
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
	height:447px;
	z-index:1;
	left: 46px;
	top: -42px;
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
    .style42
    {
        height: 26px;
    }
    .style43
    {
        width: 18%;
    }
    .style44
    {
        height: 26px;
        width: 18%;
        text-align: left;
        color: #666666;
        font-weight: bold;
    }
    .style45
    {
        width: 18%;
        text-align: left;
        color: #666666;
        font-weight: bold;
    }
    .style46
    {
        height: 26px;
        color: #666666;
        font-weight: bold;
        width: 14%;
        text-align: left;
    }
    .style47
    {
        width: 18%;
        text-align: left;
        color: #666666;
        font-weight: bold;
        height: 40px;
    }
    .style48
    {
        height: 40px;
    }
    .style49
    {
        color: #666666;
        font-weight: bold;
        height: 40px;
        width: 14%;
        text-align: left;
    }
    .style50
    {
        width: 14%;
    }
    .style51
    {
        color: #666666;
        font-weight: bold;
        width: 14%;
        text-align: left;
    }
.style52 {
	color: #666666;
	font-weight: bold;
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
          <th colspan="2" scope="row">
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>            </th>
          <td width="11%" class="style50">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>            </td>
          <td colspan="3">
              <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red" 
                  onclick="LinkButton1_Click">Logout</asp:LinkButton>            </td>
        </tr>
        <tr>
          <th colspan="6" bgcolor="#058383" scope="row"><div align="left" class="style39">Organization Employee Salary Detail</div></th>
          </tr>
        <tr>
          <th colspan="6" scope="row"><hr /></th>
          </tr>
        <tr>
          <th width="16%" class="style47" scope="row">Employee Email</th>
          <th width="14%" scope="row" class="style48">
            <asp:DropDownList ID="D1" runat="server" Height="16px" Width="123px" 
                  DataSourceID="SqlDataSource1" DataTextField="eemail" DataValueField="eemail" 
                  onselectedindexchanged="D1_SelectedIndexChanged" AutoPostBack="True">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem></asp:ListItem>
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  SelectCommand="SELECT [eemail] FROM [oempconfirm] WHERE ([oemail] = @oemail)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="Label1" Name="oemail" PropertyName="Text" 
                          Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
            </th>
          <th scope="row" class="style49">Employee Name</th>
          <th width="13%" scope="row" class="style48">
              <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            </th>
          <th width="30%" scope="row" class="style48"></th>
          <th width="16%" scope="row" class="style48"></th>
        </tr>
        <tr>
          <th scope="row" class="style45">Employee Father Name</th>
          <th scope="row">
              <asp:TextBox ID="t2" runat="server"></asp:TextBox>
            </th>
          <th scope="row" class="style51">Contact</th>
          <th scope="row">
              <asp:TextBox ID="t3" runat="server"></asp:TextBox>
            </th>
          <th scope="row">&nbsp;</th>
          <th scope="row">&nbsp;</th>
        </tr>
        <tr>
          <th scope="row" class="style44">Designation</th>
          <th scope="row" class="style42">
              <asp:TextBox ID="t4" runat="server"></asp:TextBox>
            </th>
          <th scope="row" class="style46">Job Type</th>
          <th scope="row" class="style42">
                <asp:DropDownList ID="t5" runat="server">
                    <asp:ListItem>Select Any One</asp:ListItem>
                    <asp:ListItem>Permanent</asp:ListItem>
                    <asp:ListItem>Adhoc</asp:ListItem>
                </asp:DropDownList>
            </th>
          <th scope="row" class="style42"></th>
          <th scope="row" class="style42"></th>
        </tr>
        <tr>
          <th scope="row" class="style45">Salary</th>
          <th scope="row">
              <asp:TextBox ID="t6" runat="server"></asp:TextBox>
            </th>
          <th scope="row" class="style51">Current Date</th>
          <th scope="row">
              <asp:TextBox ID="t7" runat="server" ontextchanged="t7_TextChanged"></asp:TextBox>
            </th>
          <th scope="row">&nbsp;</th>
          <th scope="row">&nbsp;</th>
        </tr>
        <tr>
          <th height="192" class="style43" scope="row"><div align="left" class="style52">DOJ</div></th>
          <th scope="row">
              <asp:Calendar ID="c1" runat="server"></asp:Calendar>
            </th>
          <th scope="row" class="style50">&nbsp;          </th>
          <th scope="row">&nbsp;          </th>
          <th scope="row">&nbsp;</th>
          <th scope="row">&nbsp;</th>
        </tr>
        <tr>
          <th height="54" class="style43" scope="row">&nbsp;</th>
          <th scope="row">&nbsp;</th>
          <th scope="row" class="style50">
              <asp:Button ID="Button1" runat="server" Text="Submit" 
                  onclick="Button1_Click1" />
            </th>
          <th scope="row">
              <asp:Button ID="Button2" runat="server" Text="Reset" />
            </th>
          <th scope="row">&nbsp;</th>
          <th scope="row">&nbsp;</th>
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
