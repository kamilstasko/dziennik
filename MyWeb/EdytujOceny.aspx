<%@ Page Title="EdytujOceny" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="EdytujOceny.aspx.cs" Inherits="MyWeb.EdytujOceny" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr style="background-color:#87cefa">
                <th align="left">Uczen</th>
                <th align="left">Przedmiot</th>
                <th align="left">Nauczyciel</th>
                <th align="left">Ocena</th> 
            </tr>
            <tr>
                <td><asp:ListBox ID="m_change_uczen" runat="server" Rows="1"></asp:ListBox></td>
                <td><asp:ListBox ID="m_change_przedmiot" runat="server" Rows="1"></asp:ListBox></td>
                <td><asp:ListBox ID="m_change_nauczyciel" runat="server" Rows="1"></asp:ListBox></td>
                <td><asp:ListBox ID="m_change_ocena" runat="server" Rows="1"></asp:ListBox></td>
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
