<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="frmSerieUsuario, App_Web_p3ao-uwf" theme="Formato" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table style="width: 900px">
        <tr>
            <td colspan="5" style="font-weight: bold; font-size: 12pt; color: white; height: 4px;
                background-color: #a55129; text-align: center">
                LISTA DE SERIE X USUARIO</td>
        </tr>
        <tr>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label1" runat="server" Text="Usuario" Width="200px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlLogin" runat="server" Width="200px">
                </asp:DropDownList></td>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label6" runat="server" Text="TipoDoc" Width="100px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlTipoDoc" runat="server" Width="300px">
                </asp:DropDownList></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label5" runat="server" Text="Local" Width="200px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlLocal" runat="server" Width="200px">
                </asp:DropDownList></td>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label4" runat="server" Text="Serie" Width="100px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:TextBox ID="txtSerie" runat="server" BorderWidth="1px" Width="80px" onBlur="javascript:AgregarCeros(this,3);"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label3" runat="server" Text="TipoMov" Width="200px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlTipoMov" runat="server" Width="300px">
                </asp:DropDownList></td>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label2" runat="server" Text="NroCorrelativo" Width="100px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:TextBox ID="txtNroDoc" runat="server" BorderWidth="1px" onKeyUp="javascript:SoloDigitos(this,'DecNo');" onBlur="javascript:AgregarCeros(this,8);"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label7" runat="server" Text="Permiso Ajustes" Width="200px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlAjuste" runat="server" Width="100px">
                    <asp:ListItem Value="T">TODOS</asp:ListItem>
                    <asp:ListItem Value="0">NO</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label8" runat="server" Text="Precio Fac" Width="100px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlPrecFac" runat="server">
                    <asp:ListItem>TODOS</asp:ListItem>
                    <asp:ListItem Value="0">NO</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 100px; text-align: right">
                <asp:Label ID="Label9" runat="server" Text="Linea de Credito, Precio Pedido" Width="200px"></asp:Label></td>
            <td style="width: 100px; text-align: left">
                <asp:DropDownList ID="ddlPrePed" runat="server">
                    <asp:ListItem Value="T">TODOS</asp:ListItem>
                    <asp:ListItem Value="0">NO</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 100px; text-align: right">
            </td>
            <td style="width: 100px; text-align: left">
                <asp:Button ID="btnBuscar" runat="server" BorderWidth="1px" Font-Bold="True" Text="Buscar"
                    Width="100px" /></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label ID="lblMensaje" runat="server" EnableTheming="False" Font-Bold="True"
                    ForeColor="Red" Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnGrabar" runat="server" BorderWidth="1px" Font-Bold="True" Text="Grabar y Actualizar"
                    Width="200px" /></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="5">
            <div id="contenido" class="divGridII" runat="server" style="width: 400px; height: 150px; text-align: left">
                <asp:DataGrid ID="dgDetalle" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="1" CellSpacing="1"
                    Width="900px">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" Mode="NumericPages" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundColumn DataField="CodLocal" HeaderText="Local"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Usuario" HeaderText="Usuario"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TipoDoc" HeaderText="TipoDoc"></asp:BoundColumn>
                        <asp:BoundColumn DataField="SerieDoc" HeaderText="SerieDoc"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TipoMov" HeaderText="TipoMov"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NroDoc" HeaderText="NroDoc"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AjusteAlm" HeaderText="AjusteAlm"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CodUsuario" HeaderText="CodUsuario" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecioPed" HeaderText="Pedido/Linea"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecioFac" HeaderText="Precio Fact"></asp:BoundColumn>
                        <asp:ButtonColumn CommandName="Select" Text="&lt;img src='Images/ico_edita.gif' border='0' alt='Modificar' &gt;">
                        </asp:ButtonColumn>
                    </Columns>
                </asp:DataGrid></div></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 21px;">
            </td>
            <td style="width: 100px; height: 21px;">
            </td>
            <td style="width: 100px; height: 21px;">
            </td>
            <td style="width: 100px; height: 21px;">
            </td>
            <td style="width: 100px; height: 21px;">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
</asp:Content>

