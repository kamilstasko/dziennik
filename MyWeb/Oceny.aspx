<%@ Page Title="Oceny" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Oceny.aspx.cs" Inherits="MyWeb.Oceny" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr>
                <td><asp:Button ID="m_add_button" runat="server" Text="Dodaj nową ocenę" OnClick="m_add_button_Click" /><br /><br /></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="m_search_uczen" runat="server" placeholder="Uczen"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_przedmiot" runat="server" placeholder="Przedmiot"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_nauczyciel" runat="server" placeholder="Nauczyciel"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_ocena" runat="server" placeholder="Ocena"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4"><asp:Button ID="m_search_button" runat="server" Text="Szukaj" /><br /></td>
            </tr>
        <asp:Repeater ID="m_rptOceny" runat="server">
    	    <HeaderTemplate>
                    <tr style="background-color:#87cefa">
                        <th align="left">Uczen</th>
                        <th align="left">Przedmiot</th>
                        <th align="left">Nauczyciel</th>
                        <th colspan="2" align="left">Ocena</th>                    
                    </tr>
            </HeaderTemplate>
		    <ItemTemplate>
                <tr valign="top">
                    <td ><%# DataBinder.Eval(Container.DataItem, "uczen")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "przedmiot")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nauczyciel")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "ocena")%></td>
                    <td><a href="EdytujOceny.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idWynik")%>">Modyfikuj</a></td>    
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr valign="top"  style="background-color:#87cefa"> 
                    <td ><%# DataBinder.Eval(Container.DataItem, "uczen")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "przedmiot")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nauczyciel")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "ocena")%></td>
                    <td><a href="EdytujOceny.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idWynik")%>">Modyfikuj</a></td>    
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        </table>
    </div>
</asp:Content>
