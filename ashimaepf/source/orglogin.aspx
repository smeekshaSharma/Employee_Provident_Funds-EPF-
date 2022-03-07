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
   

   
      
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        t1.Text = ""
        t2.Text = ""
    End Sub
    Dim pass As String
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*) from orgconfirm where email='" & t1.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            comm = New Data.SqlClient.SqlCommand("select pwd from orgconfirm where email='" & t1.Text & "'")
            comm.Connection = conn
            pass = comm.ExecuteScalar
            If pass = t2.Text Then
                comm = New Data.SqlClient.SqlCommand("delete from ologintemp")
                comm.Connection = conn
                comm.ExecuteScalar()
                sql = "insert into ologintemp values('" & t1.Text & "')"
                adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
                adp.InsertCommand.ExecuteScalar()
                Response.Redirect("orgdashboard.aspx")
            Else
                MsgBox("Wrong Password")
                
            End If
        Else
            MsgBox("Wrong User Name")
            t1.Text = ""
            
        End If
        conn.Close()
        
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:567px;
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
	height:361px;
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
	left: 16px;
	top: 28px;
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
	left: 365px;
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
	left: 10px;
	top: 2px;
}
#apDiv16 {
	position:absolute;
	width:74px;
	height:79px;
	z-index:3;
	left: 482px;
	top: -13px;
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
	top: 513px;
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
  <div id="apDiv5">
    <div id="apDiv10">
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
            <td colspan="2" bgcolor="#058383"><span class="style5"><strong>Organization Login</strong></span></td>
            </tr>
          <tr>
            <td colspan="2"><hr /></td>
            </tr>
          <tr>
            <td width="35%"><strong>Email</strong></td>
            <td width="65%">
                <asp:TextBox ID="t1" runat="server"></asp:TextBox>              </td>
          </tr>
          <tr>
            <td><strong>Password</strong></td>
            <td>
                <asp:TextBox ID="t2" runat="server" TextMode="Password"></asp:TextBox>              </td>
          </tr>
          
          <tr>
            <td colspan="2"><div align="center"><strong>Forgot Password</strong></div></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="#058383" Font-Bold="True" 
                    ForeColor="White" Text="Login" onclick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" BackColor="#058383" Font-Bold="True" 
                    ForeColor="White" Text="Reset" onclick="Button2_Click" />              </td>
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
