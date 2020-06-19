<%@ Page Title="EdytujUczniowie" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="EdytujUczniowie.aspx.cs" Inherits="MyWeb.EdytujUczniowie" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr style="background-color:#87cefa">
                <th align="left">Imie</th>
                <th align="left">Nazwisko</th>
                <th align="left">Adres</th>
                <th align="left">Nr tel</th>
                <th align="left">Klasa</th>
            </tr>
            <tr>
                <td><asp:TextBox ID="m_change_imie" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="m_change_nazwisko" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="m_change_adres" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="m_change_nr_tel" runat="server"></asp:TextBox></td>
                <td><asp:ListBox ID="m_change_klasa" runat="server" Rows="1"></asp:ListBox></td>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td style="color: red">
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1"
                        ControlToValidate="m_change_nr_tel" runat="server"
                        ErrorMessage="Wprowadź cyfry"
                        ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="m_anuluj" runat="server" Text="Anuluj" onclick="m_anuluj_przycisk" style="margin-right:20px;" />
                    <asp:Button ID="m_usun" runat="server" Text="Usun" onclick="m_usun_przycisk" style="margin-right:20px;" />
                    <asp:Button ID="m_zapisz" runat="server" Text="Zapisz" onclick="m_zapisz_przycisk" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
