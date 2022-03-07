<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EPF | FAQ Detail</title>
<script runat="server">
   
    Dim conn As New Data.SqlClient.SqlConnection
    Dim comm As New Data.SqlClient.SqlCommand
    Dim adp As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim currdate As String
    Dim dreg As String
    Dim oname As String
    Dim address As String
    Dim city As String
    Dim email As String
    Dim otype As String
    Dim state As String
    Dim pin As String
    Dim contact As String
    Dim pwd As String
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        currdate = Format(Now, "dd/MM/yyyy")
        dreg = GridView1.SelectedRow.Cells(1).Text
        oname = GridView1.SelectedRow.Cells(2).Text
        address = GridView1.SelectedRow.Cells(3).Text
        city = GridView1.SelectedRow.Cells(4).Text
        email = GridView1.SelectedRow.Cells(5).Text
        otype = GridView1.SelectedRow.Cells(6).Text
        state = GridView1.SelectedRow.Cells(7).Text
        pin = GridView1.SelectedRow.Cells(8).Text
        contact = GridView1.SelectedRow.Cells(9).Text
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select pwd from pwdtemp")
        comm.Connection = conn
        pwd = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select count(*) from orgconfirm where email='" & email & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This OrgReg Already Confirmed")
            conn.Close()
            
        Else
            comm = New Data.SqlClient.SqlCommand("delete from pwdtemp")
            comm.Connection = conn
            comm.ExecuteScalar()
            pwd = Val(pwd) + 456
            sql = "insert into pwdtemp values('" & pwd & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            pwd = Val(contact) + Val(pwd)
            sql = "insert into orgconfirm values('" & currdate & "','" & dreg & "','" & oname & "','" & address & "','" & city & "','" & email & "','" & otype & "','" & state & "','" & pin & "','" & contact & "','" & pwd & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("Organization Has been Confirmed ")
        End If
        
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
	left: -12px;
	top: 106px;
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
	left: 0px;
	top: 132px;
}
.style19 {font-size: 16px; font-weight: bold; font-family: Calibri; }
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
    .style34
    {
        height: 34px;
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
      <div id="apDiv8" style="border:1px solid #27408B;border-radius:10px">
        <table EPF Organization Confirmation</strong></span></td>
          </tr>
          <tr>
            <td class="style30">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Confirm" />
                        <asp:BoundField DataField="cdate" HeaderText="Date Of Reg." 
                            SortExpression="cdate" />
                        <asp:BoundField DataField="org" HeaderText="Organization Name" 
                            SortExpression="org" />
                        <asp:BoundField DataField="ad" HeaderText="Address" SortExpression="ad" />
                        <asp:BoundField DataField="ci" HeaderText="City" SortExpression="ci" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="ot" HeaderText="Organization Type" 
                            SortExpression="ot" />
                        <asp:BoundField DataField="st" HeaderText="State" SortExpression="st" />
                        <asp:BoundField DataField="pc" HeaderText="Pincode" SortExpression="pc" />
                        <asp:BoundField DataField="cn" HeaderText="Contact" SortExpression="cn" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [cdate], [org], [ad], [ci], [email], [ot], [st], [pc], [cn] FROM [orgreg]">
                </asp:SqlDataSource>
              </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
