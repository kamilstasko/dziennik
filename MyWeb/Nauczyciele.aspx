<%@ Page Title="Nauczyciele" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Nauczyciele.aspx.cs" Inherits="MyWeb.Nauczyciele" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr>
                <td><asp:Button ID="m_add_button" runat="server" Text="Dodaj nowego nauczyciela" OnClick="m_add_button_Click" /><br /><br /></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="m_search_imie" runat="server" placeholder="Imie"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_nazwisko" runat="server" placeholder="Nazwisko"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_adres" runat="server" placeholder="Adres"></asp:TextBox></td>
                <td><asp:TextBox ID="m_search_nr_tel" runat="server" placeholder="Nr tel"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4"><asp:Button ID="m_search_button" runat="server" Text="Szukaj" /><br /></td>
            </tr>
        <asp:Repeater ID="m_rptNauczyciele" runat="server">
    	    <HeaderTemplate>
                    <tr style="background-color:#87cefa">
                        <th align="left">Imie</th>
                        <th align="left">Nazwisko</th>
                        <th align="left">Adres</th>
                        <th colspan="2" align="left">Nr tel</th>
                    </tr>
            </HeaderTemplate>
		    <ItemTemplate>
                <tr valign="top">
                    <td ><%# DataBinder.Eval(Container.DataItem, "imie")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nazwisko")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "adres")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nr_tel")%></td>
                    <td><a href="EdytujNauczyciele.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idNauczyciel")%>">Modyfikuj</a></td> 
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr valign="top"  style="background-color:#87cefa"> 
                    <td ><%# DataBinder.Eval(Container.DataItem, "imie")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nazwisko")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "adres")%></td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "nr_tel")%></td>
                    <td><a href="EdytujNauczyciele.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idNauczyciel")%>">Modyfikuj</a></td> 
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        </table>
    </div>
</asp:Content>