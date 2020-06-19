<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyWeb.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zaloguj sie</title>
</head>
<body style="background-color: #696969">
    <div style="font-family: Arial; position:absolute; left:38%; top:30%; text-align:center; background-color: #FFFFFF">      
        <form id="form1" runat="server">
            <table cellspacing="10" style="border: 1px solid black; padding:10px">
                <tr>
                    <td colspan="2" >
                        <p style="margin-bottom:30px"><b>Formularz logowania</b></p>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left">
                        Login
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left">
                        Hasło
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="margin-top:30px"></div>
                        <asp:CheckBox ID="chkBoxRememberMe" Text="Remember Me" runat="server" />
                    </td>
                    <td style="float:right">
                        <div style="margin-top:30px"></div>
                        <asp:Button ID="Button1" runat="server" Text="Zaloguj" onclick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <div style="margin-top:20px"></div>
                        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor ="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </form>

        <!--
        <div style="background-color: #4b6c9e; height: 50px; text-align:center">
            <p style="margin:0; position:relative; top: 30%"><a href="Account/Register.aspx">Zarejestruj</a>  się jeżeli nie posiadasz konta</p>
        </div>
        -->

    </div>
</body>
</html>
