<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="frmAlmacenSalVenta, App_Web_7x6j2q4o" theme="Formato" %>

<%@ Register Assembly="MBoxAsp" Namespace="MBoxAsp" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <table style="font-size: 9pt; font-family: arial">
        <tr>
            <td colspan="5" style="font-size: 12pt; color: white; height: 4px; background-color: #003399;
                text-align: center; font-weight: bold; font-family: Arial;">
                SALIDA X VENTA</td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center; height: 89px;">
                <table>
                    <tr>
                        <td style="width: 100px; text-align: right">
                <asp:Button ID="BtnNuevo" runat="server" BorderStyle="Solid" BorderWidth="1px" Text="Nuevo" CssClass="boton" /></td>
                        <td style="width: 90px; height: 5px; text-align: left">
                            <asp:Button ID="BtnOK" runat="server" BorderStyle="Solid" BorderWidth="1px" Text="Buscar" CssClass="boton" /></td>
                        <td style="width: 90px; height: 5px; text-align: left">
                            <asp:Button ID="Button1" runat="server" BorderWidth="1px"
                                Text="Exportar" CssClass="boton" /></td>
                        <td style="width: 105px">
                <asp:Button ID="btnVolver" runat="server" BorderWidth="1px" Text="Volver"
                    Width="89px" CssClass="boton" /></td>
                        <td style="width: 107px">
                        </td>
                        <td style="width: 39px">
                        </td>
                        <td style="width: 178px">
                            <cc1:MsgBox ID="MsgBox1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="False" Text="Pedido" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label></td>
                        <td style="width: 90px; height: 5px; text-align: left">
                            <asp:TextBox ID="txtSerie" runat="server" BorderWidth="1px" MaxLength="3" onblur="javascript:AgregarCeros(this,3);"
                                onkeyup="javascript:SoloDigitos(this,'DecNo');" Width="63px"></asp:TextBox>
                            </td>
                        <td style="width: 90px; height: 5px; text-align: left">
                            <asp:TextBox ID="txtNro" runat="server" BorderWidth="1px" MaxLength="6" onblur="javascript:AgregarCeros(this,8);"
                                onkeyup="javascript:SoloDigitos(this,'DecNo');" Width="104px"></asp:TextBox></td>
                        <td style="width: 105px">
                            <asp:Label ID="Label21" runat="server" Text="Fecha Inicio" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label>&nbsp;</td>
                        <td style="width: 107px">
                            <asp:TextBox ID="txtFechaIni" runat="server" BorderWidth="1px" Width="100px"></asp:TextBox></td>
                        <td style="width: 39px">
                            <img alt="" border="0" onclick="return showCalendar('ctl00_ContentPlaceHolder1_txtFechaIni', 'dd/mm/y');"
                                src="Images/btn_Calendario.gif" style="width: 37px; cursor: hand" id="IMG1" /></td>
                        <td style="width: 178px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: right">
                            <asp:Label ID="Label19" runat="server" Text="Estado" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label></td>
                        <td colspan="2" style="text-align: left">
                            <asp:DropDownList ID="ddlEstado" runat="server" Width="200px">
                            </asp:DropDownList></td>
                        <td style="width: 105px">
                            <asp:Label ID="Label22" runat="server" Text="Fecha Fin" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label></td>
                        <td style="width: 107px">
                            <asp:TextBox ID="txtFechaFin" runat="server" BorderWidth="1px" Width="100px"></asp:TextBox></td>
                        <td style="width: 39px">
                            <img alt="" border="0" onclick="return showCalendar('ctl00_ContentPlaceHolder1_txtFechaFin', 'dd/mm/y');"
                                src="Images/btn_Calendario.gif" style="width: 37px; cursor: hand" /></td>
                        <td style="width: 178px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: right">
                            <asp:Label ID="Label20" runat="server" Text="Guia" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label></td>
                        <td colspan="3" style="text-align: left">
                            <asp:TextBox ID="txtSerGuia" runat="server" BorderWidth="1px" Width="63px" onblur="javascript:AgregarCeros(this,3);"
                                onkeyup="javascript:SoloDigitos(this,'DecNo');" ></asp:TextBox>
                            <asp:TextBox ID="txtNroGuia" runat="server" BorderWidth="1px" Width="104px" onblur="javascript:AgregarCeros(this,8);"
                                onkeyup="javascript:SoloDigitos(this,'DecNo');" ></asp:TextBox></td>
                        <td colspan="1" style="text-align: left; width: 107px;">
                        </td>
                        <td colspan="1" style="text-align: left; width: 39px;">
                        </td>
                        <td colspan="1" style="text-align: left">
                        </td>
                    </tr>
                </table>
                <asp:Label ID="LBLMEN" runat="server" EnableTheming="False" Width="405px" CssClass="error" ></asp:Label></td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center; height: 141px;">
                <asp:DataGrid ID="dgListaSalxVenta" runat="server" AllowSorting="True"
                    AutoGenerateColumns="False"
                    CellPadding="4" EnableTheming="True" Font-Bold="False" Font-Italic="False"
                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="0px" Width="848px" PageSize="20" style="font-size: 9pt; font-family: Arial" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundColumn DataField="NroIngreso" HeaderText="Guia Remision"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FechaDoc" HeaderText="Fecha"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NroOC" HeaderText="Pedido">
                            <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Referencia" HeaderText="Referencia"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NomCP" HeaderText="Cliente">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Movimiento" HeaderText="Tipo" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TipoDoc" HeaderText="TipoDoc" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Estado" HeaderText="Estado"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Estadop" HeaderText="Estado" Visible="False"></asp:BoundColumn>
                        <asp:ButtonColumn CommandName="Select" Text="&lt;img src='Images/ico_edita.gif' border='0' alt='Modificar' &gt;">
                        </asp:ButtonColumn>
                        <asp:ButtonColumn CommandName="Anular"  Text="&lt;img src='Images/ico_borrar.gif' border='0' alt='Anular' &gt;">
                        </asp:ButtonColumn>
                        <asp:ButtonColumn CommandName="Imprimir" Text="&lt;img src='Images/ico_printer.gif' border='0' alt='Imprimir' &gt;">
                        </asp:ButtonColumn>
                    </Columns>
                    <EditItemStyle BackColor="#999999" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                </asp:DataGrid>
                </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 20px; text-align: center">
                
                   <table style="width: 864px" id="pnDetalle" runat="server" visible="False">
                        <tr>
                            <td colspan="5" style="font-size: 12pt; color: white; height: 4px; background-color: #003399;
                                text-align: center; font-weight: bold;">
                                DETALLE
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 103px; height: 42px; text-align: right">
                            </td>
                            <td style="width: 85px; height: 42px; text-align: left">
                                <table id="TABLE1" onclick="return TABLE1_onclick()">
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Pedido"></asp:Label></td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="txtSeriePED" runat="server" BorderWidth="1px" MaxLength="3" onblur="javascript:AgregarCeros(this,3);"
                                                onkeyup="javascript:SoloDigitos(this,'DecNo');"  Width="47px"></asp:TextBox></td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="txtNroPED" runat="server" BorderWidth="1px" MaxLength="8" onblur="javascript:AgregarCeros(this,8);"
                                                onkeyup="javascript:SoloDigitos(this,'DecNo');" ></asp:TextBox></td>
                                        <td style="width: 100px">
                                            <asp:Button ID="BtnBuscaOC" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" Text="OK" Width="42px" /></td>
                                    </tr>
                                </table>
                                <asp:Label ID="lblM" runat="server" EnableTheming="False" Font-Bold="True" ForeColor="Red"
                                    Width="400px"></asp:Label></td>
                            <td style="width: 223px; height: 42px; text-align: right">
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Estado" Width="54px"></asp:Label></td>
                            <td colspan="2" style="height: 42px; text-align: left">
                                <asp:TextBox ID="txtEstado" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="100px" BorderStyle="None"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; height: 1px; text-align: right">
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Codigo" Width="100px"></asp:Label></td>
                            <td style="width: 85px; height: 1px; text-align: left">
                                <asp:TextBox ID="txtCodigoProve" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Font-Bold="True" Width="66px" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 223px; height: 1px; text-align: right">
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Guia Remision" Width="106px"></asp:Label></td>
                            <td style="width: 36px; height: 1px; text-align: left">
                                <asp:TextBox ID="txtNotaSerie" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="37px" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 100px; height: 1px; text-align: left">
                                <asp:TextBox ID="txtNotaNro" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="87px" BorderStyle="None"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; height: 2px; text-align: right">
                                &nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Proveedor" Width="77px"></asp:Label></td>
                            <td style="width: 85px; height: 2px; text-align: left">
                                <asp:TextBox ID="txtProveedor" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Font-Bold="True" Width="363px" Enabled="False" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 223px; height: 2px; text-align: right">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Inicio Traslado"></asp:Label></td>
                            <td style="width: 36px; height: 2px; text-align: left">
                                <asp:TextBox ID="txtFechaIng" runat="server" onblur="DateFormat(this,this.value,event,true,'3')"
                                    onkeyup="DateFormat(this,this.value,event,false,'3')" Width="79px" BorderWidth="1px"></asp:TextBox></td>
                            <td style="width: 100px; height: 2px; text-align: left">
                                <img alt="" border="0" onclick="return showCalendar('ctl00_ContentPlaceHolder1_txtFechaIng', 'dd/mm/y');"
                                    src="Images/btn_Calendario.gif" style="width: 37px; cursor: hand" /></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Entregar En"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:TextBox ID="txtEntregar" runat="server" Width="400px" Enabled="False" BorderWidth="1px"></asp:TextBox></td>
                            <td style="width: 223px; text-align: right">
                                <asp:Label ID="Almacen" runat="server" Font-Bold="True" Text="Almacen" Width="54px"></asp:Label></td>
                            <td style="width: 36px; text-align: left">
                                <asp:TextBox ID="txtAlmacen" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="87px" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 100px; text-align: left">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Condiciones de Pago"
                                    Width="99px"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:DropDownList ID="ddlCondicionPago" runat="server" Width="203px">
                                </asp:DropDownList></td>
                            <td style="width: 223px; text-align: right">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Fecha Pedido" Width="93px"></asp:Label></td>
                            <td style="width: 36px; text-align: left">
                                <asp:TextBox ID="txtFecha" runat="server" BackColor="#FFFF80" BorderWidth="1px" Enabled="False"
                                    Font-Bold="True" MaxLength="10" Width="89px" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 100px; text-align: left">
                                <asp:TextBox ID="TxtIGV" runat="server" Width="77px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; height: 8px; text-align: right">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Pago" Width="100px"></asp:Label></td>
                            <td style="width: 85px; height: 8px; text-align: left">
                                <asp:DropDownList ID="ddlTDoc" runat="server" Width="131px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlNroSerie" runat="server" Width="94px">
                                </asp:DropDownList>
                                <asp:TextBox ID="txtNroRef" runat="server" BorderWidth="1px" MaxLength="6" Width="103px" Enabled="False"></asp:TextBox>
                                <asp:CheckBox ID="ChkGenera" runat="server" Checked="false" Width="210px" Visible="False" /></td>
                            <td style="width: 223px; height: 8px; text-align: right">
                                <asp:Label ID="lblMoneda" runat="server" Visible="False"></asp:Label></td>
                            <td style="width: 36px; height: 8px; text-align: left">
                                <asp:Label ID="lblVen" runat="server" Visible="False" Width="100px"></asp:Label>
                                <asp:Label ID="lblOC" runat="server" Visible="False" Width="100px"></asp:Label></td>
                            <td style="width: 100px; height: 8px; text-align: left">
                                <asp:Label ID="lblNrDias" runat="server" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; height: 5px; text-align: right">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Chofer" Width="100px" style="font-size: 9pt; font-family: Arial"></asp:Label></td>
                            <td style="width: 85px; height: 5px; text-align: left">
                                <asp:DropDownList ID="ddlChofer" runat="server" Width="400px">
                                </asp:DropDownList></td>
                            <td style="width: 223px; height: 5px; text-align: right">
                                <asp:Label ID="Label13" runat="server" Text="Vehiculo" Font-Bold="True"></asp:Label></td>
                            <td colspan="2" style="height: 5px; text-align: left">
                                <asp:DropDownList ID="ddlVehi" runat="server" Width="264px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Pedido" Width="101px"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:TextBox ID="txtPedido" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="57px" BorderStyle="None">0</asp:TextBox>
                            </td>
                            <td style="width: 223px; text-align: right">
                            </td>
                            <td style="width: 36px; text-align: right">
                                <asp:TextBox ID="txtCodigoVendedor" runat="server" BackColor="White" BorderStyle="None" BorderWidth="1px"
                                    Font-Bold="True" Visible="False" Width="66px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Despacho" Width="70px"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:TextBox ID="txtDespacho" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="59px" BorderStyle="None">0</asp:TextBox></td>
                            <td style="width: 223px; text-align: right">
                                </td>
                            <td style="width: 36px; text-align: left">
                            </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Salida" Width="79px"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:TextBox ID="txtIngreso" runat="server" BorderWidth="1px" Width="59px" onKeyUp="javascript:SoloDigitos(this,'DecNo');"  >0</asp:TextBox></td>
                            <td style="width: 223px">
                            </td>
                            <td style="width: 36px">
                                </td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtLargo" runat="server" Visible="False" Width="73px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 103px; text-align: right">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Codigo" Width="77px"></asp:Label></td>
                            <td style="width: 85px; text-align: left">
                                <asp:TextBox ID="txtCodArticulo" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" BorderStyle="None"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center">
                                </td>
                            <td style="width: 36px; text-align: left">
                                <asp:TextBox ID="txtAncho" runat="server" Visible="False" Width="77px"></asp:TextBox></td>
                            <td style="width: 100px; text-align: left">
                                <asp:TextBox ID="txtItem" runat="server" Enabled="False" Width="61px" Visible="False"></asp:TextBox></td>
                        </tr>
                       <tr>
                           <td style="width: 103px; text-align: right; height: 1px;">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Descripcion" Width="79px"></asp:Label></td>
                           <td style="width: 85px; text-align: left; height: 1px;">
                                <asp:TextBox ID="txtDescProducto" runat="server" BackColor="#FFFF80" BorderWidth="1px"
                                    Enabled="False" Font-Bold="True" Width="319px" BorderStyle="None"></asp:TextBox></td>
                           <td style="width: 100px; text-align: center; height: 1px;">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="boton" /></td>
                           <td style="width: 36px; text-align: left; height: 1px;">
                           </td>
                           <td style="width: 100px; text-align: left; height: 1px;">
                           </td>
                       </tr>
                        <tr>
                            <td colspan="5" style="width: 100px; text-align: center; height: 130px;">
                                <asp:DataGrid ID="dgDetalleSalxVenta" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" PageSize="8" Width="900px" style="font-size: 9pt; font-family: arial" ForeColor="#333333" GridLines="None">
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundColumn DataField="Item" HeaderText="Item" Visible="False"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="CodArticulo" HeaderText="CodArticulo" Visible="False">
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Descripcion" HeaderText="Descripcion">
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" HorizontalAlign="Left" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Largo" HeaderText="Ancho"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Ancho" HeaderText="Largo"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Cantidad" HeaderText="Cantidad" Visible="False"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="NroOp" HeaderText="Nro Op" Visible="False">
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" Wrap="False" />
                                            <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Pedido" HeaderText="Pedido"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Despacho" HeaderText="Despacho"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Ingreso" HeaderText="Salida"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="StockActual" HeaderText="StockActual">
                                            <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" ForeColor="Red" />
                                        </asp:BoundColumn>
                                          <asp:ButtonColumn ButtonType="PushButton" CommandName="Delete" HeaderText="Eliminar"
                                            Text="Eliminar" Visible="False"></asp:ButtonColumn>
                                        <asp:ButtonColumn ButtonType="PushButton" CommandName="Anular" Text="Anular" Visible="False">
                                        </asp:ButtonColumn>
                                        <asp:ButtonColumn CommandName="Select" DataTextFormatString="q" Text="&lt;img src='Images/ico_edita.gif' border='0' alt='Modificar' &gt;">
                                        </asp:ButtonColumn>
                                    </Columns>
                                    <EditItemStyle BackColor="#999999" />
                                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                </asp:DataGrid></td>
                        </tr>
                        <tr>
                            <td style="width: 103px">
                                <asp:Button ID="btnGrabar" runat="server" BorderStyle="Solid" Text="Generar Guia" CssClass="boton" /></td>
                            <td colspan="2">
                                <asp:Label ID="lblMensaje" runat="server" EnableTheming="False" CssClass="error" ></asp:Label></td>
                            <td style="width: 36px">
                                <asp:Button ID="btnImprimir" runat="server" BorderWidth="1px" Text="Imprimir"
                                    Visible="False" CssClass="boton" /></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                    </table>
                <asp:DataGrid ID="dgListaSalxVentaEx" runat="server" AllowSorting="True"
                    AutoGenerateColumns="False"
                    CellPadding="4" EnableTheming="True" Font-Bold="False" Font-Italic="False"
                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="0px" Width="848px" PageSize="20" Visible="False" style="font-size: 9pt; font-family: arial" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundColumn DataField="NroIngreso" HeaderText="Guia Remision"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FechaDoc" HeaderText="Fecha"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NroOC" HeaderText="Pedido">
                            <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Referencia" HeaderText="Referencia"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NomCP" HeaderText="Cliente">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Movimiento" HeaderText="Tipo" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TipoDoc" HeaderText="TipoDoc" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Estado" HeaderText="Estado"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Estadop" HeaderText="Estado" Visible="False"></asp:BoundColumn>
                    </Columns>
                    <EditItemStyle BackColor="#999999" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                </asp:DataGrid></td>
        </tr>
    </table>
</asp:Content>

