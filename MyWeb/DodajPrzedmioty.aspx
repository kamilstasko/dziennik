﻿<%@ Page Title="DodajPrzedmioty" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="DodajPrzedmioty.aspx.cs" Inherits="MyWeb.DodajPrzedmioty" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr style="background-color:#87cefa">
                <th align="left">Przedmiot</th>
            </tr>
            <tr>
                <td><asp:TextBox ID="m_add_przedmiot" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="m_anuluj" runat="server" Text="Anuluj" onclick="m_anuluj_przycisk" style="margin-right:20px;" />
                    <asp:Button ID="m_zapisz" runat="server" Text="Zapisz" onclick="m_zapisz_przycisk" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
