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
      
        
    End Sub

    Protected Sub d3_4lectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
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
        ElseIf d1.Text = "Arunachal Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Tawang")
            d3.Items.Add("Bomdila")
            d3.Items.Add("Deomali")
            d3.Items.Add("Hawai")
            d3.Items.Add("Pangin")
        ElseIf d1.Text = "Assam" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Guwahati")
            d3.Items.Add("Tezpur")
            d3.Items.Add("Lanka")
            d3.Items.Add("Silchar")
            d3.Items.Add("Jorhat")
        ElseIf d1.Text = "Bihar" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Patna")
            d3.Items.Add("Gaya")
            d3.Items.Add("Muzaffarpur")
            d3.Items.Add("Darbhanga")
            d3.Items.Add("Munger")
        ElseIf d1.Text = "Chhattisgarh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Raipur")
            d3.Items.Add("Bastar")
            d3.Items.Add("Drug")
            d3.Items.Add("Dhamtari")
            d3.Items.Add("Kanker")
        ElseIf d1.Text = "Goa" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Panaji")
            d3.Items.Add("Ponda")
            d3.Items.Add("Madgaon")
            d3.Items.Add("Mapuca")
            d3.Items.Add("Sancoale")
        ElseIf d1.Text = "Gujarat" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Ahmedabad")
            d3.Items.Add("Surat")
            d3.Items.Add("Gandhinagar")
            d3.Items.Add("Somnath")
            d3.Items.Add("Dwarka")
        ElseIf d1.Text = "Haryana" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Faridabad")
            d3.Items.Add("Panipat")
            d3.Items.Add("Ambala")
            d3.Items.Add("Karnal")
            d3.Items.Add("Sonipat")
        ElseIf d1.Text = "Himachal Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Shimla")
            d3.Items.Add("Manali")
            d3.Items.Add("Dharamshala")
            d3.Items.Add("Kufri")
            d3.Items.Add("Dalhousie")
        ElseIf d1.Text = "Jammu And Kashmir" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jammu")
            d3.Items.Add("Srinagar")
            d3.Items.Add("Leh Ladakh")
            d3.Items.Add("Amarnath")
            d3.Items.Add("Gulmarg")
        ElseIf d1.Text = "Jharkhand" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jamshedpur")
            d3.Items.Add("Ranchi")
            d3.Items.Add("Dhanbad")
            d3.Items.Add("Mandu")
            d3.Items.Add("Giridih")
        ElseIf d1.Text = "Karnataka" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bengaluru")
            d3.Items.Add("Manglore")
            d3.Items.Add("Mysuru")
            d3.Items.Add("Vijayapura")
            d3.Items.Add("Ballari")
        ElseIf d1.Text = "Kerala" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Thiruvananthapuram")
            d3.Items.Add("Kochi")
            d3.Items.Add("Kovalam")
            d3.Items.Add("Kumarakom")
            d3.Items.Add("Munnar")
        ElseIf d1.Text = "Madhya Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Gwalior")
            d3.Items.Add("Bhopal")
            d3.Items.Add("Jabalpur")
            d3.Items.Add("Indore")
            d3.Items.Add("Rewa")
        ElseIf d1.Text = "Maharashtra" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Mumbai")
            d3.Items.Add("Pune")
            d3.Items.Add("Nagpur")
            d3.Items.Add("Nashik")
            d3.Items.Add("Thane")
        ElseIf d1.Text = "Manipur" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bishnupur")
            d3.Items.Add("Chandel")
            d3.Items.Add("Senapati")
            d3.Items.Add("Thoubal")
            d3.Items.Add("Ukhrul")
        ElseIf d1.Text = "Meghalaya" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("East Garo Hills")
            d3.Items.Add("East Khasi Hills")
            d3.Items.Add("Ribhoi")
            d3.Items.Add("South Garo Hills")
            d3.Items.Add("West Garo Hills")
        ElseIf d1.Text = "Mizoram" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Aizawl")
            d3.Items.Add("Bairabi")
            d3.Items.Add("Bilkhawthlir")
            d3.Items.Add("Champhai")
            d3.Items.Add("Kolasib")
        ElseIf d1.Text = "Nagaland" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kohima")
            d3.Items.Add("Chumukedima")
            d3.Items.Add("Dimapur")
            d3.Items.Add("Mon")
            d3.Items.Add("Peren")
        ElseIf d1.Text = "Odisha" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Bhubaneshwar")
            d3.Items.Add("Konark")
            d3.Items.Add("Jeypore")
            d3.Items.Add("Balasore")
            d3.Items.Add("Chandipur")
        ElseIf d1.Text = "Rajasthan" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Jaipur")
            d3.Items.Add("Jodhpur")
            d3.Items.Add("Ajmer")
            d3.Items.Add("Udaipur")
            d3.Items.Add("Bharatpur")
        ElseIf d1.Text = "Sikkim" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Gangtok")
            d3.Items.Add("Pelling")
            d3.Items.Add("Lachen")
            d3.Items.Add("Namchi")
            d3.Items.Add("Ravangla")
        ElseIf d1.Text = "Tamil Nadu" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Chennai")
            d3.Items.Add("Coimbatore")
            d3.Items.Add("Coonoor")
            d3.Items.Add("Kanchipuram")
            d3.Items.Add("Madurai")
        ElseIf d1.Text = "Telangana" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Hyderabad")
            d3.Items.Add("Warangai")
            d3.Items.Add("Adilabad")
            d3.Items.Add("Khammam")
            d3.Items.Add("Nalgonda")
        ElseIf d1.Text = "Tripura" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kailashahar")
            d3.Items.Add("Kamalpur")
            d3.Items.Add("Khowai")
            d3.Items.Add("Kumarghat")
            d3.Items.Add("Kunjaban")
        ElseIf d1.Text = "Uttar Pradesh" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Mathura")
            d3.Items.Add("Moradabad")
            d3.Items.Add("Agra")
            d3.Items.Add("Aligarh")
            d3.Items.Add("Luckhnow")
        ElseIf d1.Text = "Uttarakhand" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Dehradun")
            d3.Items.Add("Haridwar")
            d3.Items.Add("Kashipur")
            d3.Items.Add("Roorkee")
            d3.Items.Add("Pantnagar")
        ElseIf d1.Text = "West Bengal" Then
            d3.Items.Add("Select Any One")
            d3.Items.Add("Kolkata")
            d3.Items.Add("Siliguri")
            d3.Items.Add("Durgapur")
            d3.Items.Add("Habra")
            d3.Items.Add("Darjeeling")
        Else
            
        End If
        
    End Sub

    Protected Sub d2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        
            
            
            
            
            
            
            
                       
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
      
    End Sub
    
    
    
    Protected Sub Button3_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select count(*)from empreg where ee='" & t7.Text & "'")
        comm.Connection = conn
        count = comm.ExecuteScalar
        If count > 0 Then
            MsgBox("This Employee Registration Already Exist")
            conn.Close()
            t7.Text = ""
        Else
            sql = "insert into empreg values('" & d1.Text & "','" & d2.Text & "','" & d3.Text & "','" & t1.Text & "','" & t2.Text & "','" & t3.Text & "','" & t4.Text & "','" & t5.Text & "','" & t6.Text & "','" & t7.Text & "','" & t8.Text & "','" & t9.Text & "','" & d4.Text & "')"
            adp.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            adp.InsertCommand.ExecuteScalar()
            MsgBox("Employee Registration Record Has Been Saved")
            t1.Text = ""
            t2.Text = ""
            t3.Text = ""
            t4.Text = ""
            t5.Text = ""
            t6.Text = ""
            t7.Text = ""
            t8.Text = ""
            t9.Text = ""
            
        End If
    End Sub

    Protected Sub d1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        d2.Items.Clear()
        If d1.Text = "Punjab" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Amritsar")
            d2.Items.Add("Jalandhar")
            d2.Items.Add("Ludhiana")
            d2.Items.Add("Beas")
            d2.Items.Add("gurdaspur")
        ElseIf d1.Text = "Andhra Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Visakhapatnam")
            d2.Items.Add("Vijayawada")
            d2.Items.Add("Tirupati")
            d2.Items.Add("chittor")
            d2.Items.Add("Amaravati")
        ElseIf d1.Text = "Arunachal Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Tawang")
            d2.Items.Add("Bomdila")
            d2.Items.Add("Deomali")
            d2.Items.Add("Hawai")
            d2.Items.Add("Pangin")
        ElseIf d1.Text = "Assam" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Guwahati")
            d2.Items.Add("Tezpur")
            d2.Items.Add("Lanka")
            d2.Items.Add("Silchar")
            d2.Items.Add("Jorhat")
        ElseIf d1.Text = "Bihar" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Patna")
            d2.Items.Add("Gaya")
            d2.Items.Add("Muzaffarpur")
            d2.Items.Add("Darbhanga")
            d2.Items.Add("Munger")
        ElseIf d1.Text = "Chhattisgarh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Raipur")
            d2.Items.Add("Bastar")
            d2.Items.Add("Drug")
            d2.Items.Add("Dhamtari")
            d2.Items.Add("Kanker")
        ElseIf d1.Text = "Goa" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Panaji")
            d2.Items.Add("Ponda")
            d2.Items.Add("Madgaon")
            d2.Items.Add("Mapuca")
            d2.Items.Add("Sancoale")
        ElseIf d1.Text = "Gujarat" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Ahmedabad")
            d2.Items.Add("Surat")
            d2.Items.Add("Gandhinagar")
            d2.Items.Add("Somnath")
            d2.Items.Add("Dwarka")
        ElseIf d1.Text = "Haryana" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Faridabad")
            d2.Items.Add("Panipat")
            d2.Items.Add("Ambala")
            d2.Items.Add("Karnal")
            d2.Items.Add("Sonipat")
        ElseIf d1.Text = "Himachal Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Shimla")
            d2.Items.Add("Manali")
            d2.Items.Add("Dharamshala")
            d2.Items.Add("Kufri")
            d2.Items.Add("Dalhousie")
        ElseIf d1.Text = "Jammu And Kashmir" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jammu")
            d2.Items.Add("Srinagar")
            d2.Items.Add("Leh Ladakh")
            d2.Items.Add("Amarnath")
            d2.Items.Add("Gulmarg")
        ElseIf d1.Text = "Jharkhand" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jamshedpur")
            d2.Items.Add("Ranchi")
            d2.Items.Add("Dhanbad")
            d2.Items.Add("Mandu")
            d2.Items.Add("Giridih")
        ElseIf d1.Text = "Karnataka" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bengaluru")
            d2.Items.Add("Manglore")
            d2.Items.Add("Mysuru")
            d2.Items.Add("Vijayapura")
            d2.Items.Add("Ballari")
        ElseIf d1.Text = "Kerala" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Thiruvananthapuram")
            d2.Items.Add("Kochi")
            d2.Items.Add("Kovalam")
            d2.Items.Add("Kumarakom")
            d2.Items.Add("Munnar")
        ElseIf d1.Text = "Madhya Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Gwalior")
            d2.Items.Add("Bhopal")
            d2.Items.Add("Jabalpur")
            d2.Items.Add("Indore")
            d2.Items.Add("Rewa")
        ElseIf d1.Text = "Maharashtra" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Mumbai")
            d2.Items.Add("Pune")
            d2.Items.Add("Nagpur")
            d2.Items.Add("Nashik")
            d2.Items.Add("Thane")
        ElseIf d1.Text = "Manipur" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bishnupur")
            d2.Items.Add("Chandel")
            d2.Items.Add("Senapati")
            d2.Items.Add("Thoubal")
            d2.Items.Add("Ukhrul")
        ElseIf d1.Text = "Meghalaya" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("East Garo Hills")
            d2.Items.Add("East Khasi Hills")
            d2.Items.Add("Ribhoi")
            d2.Items.Add("South Garo Hills")
            d2.Items.Add("West Garo Hills")
        ElseIf d1.Text = "Mizoram" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Aizawl")
            d2.Items.Add("Bairabi")
            d2.Items.Add("Bilkhawthlir")
            d2.Items.Add("Champhai")
            d2.Items.Add("Kolasib")
        ElseIf d1.Text = "Nagaland" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kohima")
            d2.Items.Add("Chumukedima")
            d2.Items.Add("Dimapur")
            d2.Items.Add("Mon")
            d2.Items.Add("Peren")
        ElseIf d1.Text = "Odisha" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Bhubaneshwar")
            d2.Items.Add("Konark")
            d2.Items.Add("Jeypore")
            d2.Items.Add("Balasore")
            d2.Items.Add("Chandipur")
        ElseIf d1.Text = "Rajasthan" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Jaipur")
            d2.Items.Add("Jodhpur")
            d2.Items.Add("Ajmer")
            d2.Items.Add("Udaipur")
            d2.Items.Add("Bharatpur")
        ElseIf d1.Text = "Sikkim" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Gangtok")
            d2.Items.Add("Pelling")
            d2.Items.Add("Lachen")
            d2.Items.Add("Namchi")
            d2.Items.Add("Ravangla")
        ElseIf d1.Text = "Tamil Nadu" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Chennai")
            d2.Items.Add("Coimbatore")
            d2.Items.Add("Coonoor")
            d2.Items.Add("Kanchipuram")
            d2.Items.Add("Madurai")
        ElseIf d1.Text = "Telangana" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Hyderabad")
            d2.Items.Add("Warangai")
            d2.Items.Add("Adilabad")
            d2.Items.Add("Khammam")
            d2.Items.Add("Nalgonda")
        ElseIf d1.Text = "Tripura" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kailashahar")
            d2.Items.Add("Kamalpur")
            d2.Items.Add("Khowai")
            d2.Items.Add("Kumarghat")
            d2.Items.Add("Kunjaban")
        ElseIf d1.Text = "Uttar Pradesh" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Mathura")
            d2.Items.Add("Moradabad")
            d2.Items.Add("Agra")
            d2.Items.Add("Aligarh")
            d2.Items.Add("Luckhnow")
        ElseIf d1.Text = "Uttarakhand" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Dehradun")
            d2.Items.Add("Haridwar")
            d2.Items.Add("Kashipur")
            d2.Items.Add("Roorkee")
            d2.Items.Add("Pantnagar")
        ElseIf d1.Text = "West Bengal" Then
            d2.Items.Add("Select Any One")
            d2.Items.Add("Kolkata")
            d2.Items.Add("Siliguri")
            d2.Items.Add("Durgapur")
            d2.Items.Add("Habra")
            d2.Items.Add("Darjeeling")
        Else
            
        End If
    End Sub
    
    Protected Sub d3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EPFdatabase.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        comm = New Data.SqlClient.SqlCommand("select email from orgconfirm where oname='" & d3.Text & "' and city='" & d2.Text & "'")
        comm.Connection = conn
        t2.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select otype from orgconfirm where oname='" & d3.Text & "' and city='" & d2.Text & "'")
        comm.Connection = conn
        t1.Text = comm.ExecuteScalar
        comm = New Data.SqlClient.SqlCommand("select contact from orgconfirm where oname='" & d3.Text & "' and city='" & d2.Text & "'")
        comm.Connection = conn
        t3.Text = comm.ExecuteScalar
        conn.Close()
        
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
	left: 10px;
	top: 2px;
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
.style42 {color: #666666}
.style43 {
	color: #000000;
	font-weight: bold;
}
.style44 {color: #666666; font-weight: bold; }
#apDiv20 {
	position:absolute;
	width:100%;
	height:25px;
	z-index:8;
	left: 0px;
	top: 121px;
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
          <th colspan="4" bgcolor="#058383" scope="col"><span class="style43">Employee Registration</span></th>
        </tr>
        <tr>
          <td width="27%"><span class="style42"><strong>State</strong></span></td>
          <td width="21%"><span class="style42"></span>
              <asp:DropDownList ID="d1" runat="server" 
                  onselectedindexchanged="d1_SelectedIndexChanged" AutoPostBack="True">
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
          <td width="27%"><span class="style44">City</span></td>
          <td width="25%"><span class="style42"></span>
              <asp:DropDownList ID="d2" runat="server" AutoPostBack="True">
              </asp:DropDownList>
            </td>
        </tr>
        <tr>
          <td><span class="style42"><strong>Organization Name</strong></span></td>
          <td><span class="style42"></span>
              <asp:DropDownList ID="d3" runat="server" DataSourceID="SqlDataSource1" 
                  DataTextField="oname" DataValueField="oname" 
                  onselectedindexchanged="d3_SelectedIndexChanged" AutoPostBack="True">
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  SelectCommand="SELECT [oname] FROM [orgconfirm] WHERE ([city] = @city)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="d2" Name="city" PropertyName="SelectedValue" 
                          Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
            </td>
          <td><span class="style42"><strong>Organization Type</strong></span></td>
          <td>
              <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td><span class="style42"><strong>Organization Email</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t2" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>Organization Contact</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td><span class="style42"><strong>Employee Code</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t4" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>Employee Name</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td><span class="style42"><strong>Emp Father Name</strong></span></td>
          <td><span class="style42"></span>
              <asp:TextBox ID="t6" runat="server"></asp:TextBox>
            </td>
          <td><span class="style42"><strong>Employee Email</strong></span></td>
          <td id="t7" class="style42">
              <asp:TextBox ID="t7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td class="style44">Employee Contact No</td>
          <td class="style42">
              <asp:TextBox ID="t8" runat="server"></asp:TextBox>
            </td>
          <td class="style44">Designation</td>
          <td class="style42">
              <asp:TextBox ID="t9" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
          <td class="style44">Job Type</td>
          <td class="style42">
              <asp:DropDownList ID="d4" runat="server">
                  <asp:ListItem>Select Any One</asp:ListItem>
                  <asp:ListItem>Permanent</asp:ListItem>
                  <asp:ListItem>Adhoc</asp:ListItem>
              </asp:DropDownList>
            </td>
          <td class="style42">&nbsp;</td>
          <td class="style42">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" class="style42">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td class="style42">
              <asp:Button ID="Button3" runat="server" onclick="Button3_Click1" 
                  Text="Submit" />
            </td>
          <td class="style42">
              <asp:Button ID="Button4" runat="server" Text="Reset" />
            </td>
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
        <td bgcolor="#024040"><div align="center"><span class="style5">©2021. Designed &amp; Developed By Ashima Sharma</span></div></td>
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
