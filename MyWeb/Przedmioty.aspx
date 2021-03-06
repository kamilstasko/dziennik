﻿<%@ Page Title="Przedmioty" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Przedmioty.aspx.cs" Inherits="MyWeb.Przedmioty" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr>
                <td><asp:Button ID="m_add_button" runat="server" Text="Dodaj nowy przedmiot" OnClick="m_add_button_Click" /><br /><br /></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="m_search_przedmiot" runat="server" placeholder="Przedmiot"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="m_search_button" runat="server" Text="Szukaj" /><br /></td>
            </tr>
        <asp:Repeater ID="m_rptPrzedmioty" runat="server">
    	    <HeaderTemplate>
                    <tr style="background-color:#87cefa">
                        <th colspan="2" align="left">Przedmiot</th>
                    </tr>
            </HeaderTemplate>
		    <ItemTemplate>
                <tr valign="top">
                    <td ><%# DataBinder.Eval(Container.DataItem, "nazwa")%></td>
                    <td><a href="EdytujPrzedmioty.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idPrzedmiot")%>">Modyfikuj</a></td>    
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr valign="top"  style="background-color:#87cefa"> 
                    <td ><%# DataBinder.Eval(Container.DataItem, "nazwa")%></td>
                    <td><a href="EdytujPrzedmioty.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idPrzedmiot")%>">Modyfikuj</a></td>    
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        </table>
    </div>
</asp:Content>
