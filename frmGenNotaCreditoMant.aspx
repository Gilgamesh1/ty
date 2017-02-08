<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="frmGenNotaCreditoMant, App_Web_p3ao-uwf" theme="Formato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="pnRegistro" runat="server" Width="100%">
    <table>
        <tr>
            <td colspan="1" style=" text-align: center; height: 4px; background-color: #003399; font-weight: bold; font-size: 12pt; color: white;">
                <strong><span style="font-size: 12pt; color: white; background-color: #003399; text-align: center; font-weight: bold; height: 4px;">
                    <asp:Label ID="lblTitulo" runat="server" EnableTheming="False" Visible="False"></asp:Label><span
                        style="font-family: Arial">NOTA
                    DE CREDITO</span></span></strong></td>
        </tr>
        <tr>
            <td style="width: 1000px;">
                <table>
                    <tr>
                        <td style="direction: rtl; height: 24px; text-align: right; vertical-align: middle; color: #003399;" align="left">
                            <asp:Label ID="Label19" runat="server" Text="Tipo de Cambio"></asp:Label></td>
                        <td style="height: 24px; width: 339px;" align="left">
                            <asp:Label ID="lblTipCam" runat="server" EnableTheming="False" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="lblMondCliente" runat="server" Visible="False"></asp:Label><asp:Label
                                ID="lblSerRef" runat="server" Visible="False"></asp:Label><asp:Label ID="lblNroRef" runat="server" Visible="False"></asp:Label></td>
                        <td style="height: 24px; text-align: right; direction: rtl; vertical-align: middle; color: #003399; width: 80px;" align="right">
                            <asp:Label ID="Label10" runat="server" Text="Estado"></asp:Label></td>
                        <td style="height: 24px; text-align: left; width: 309px;">
                            <asp:DropDownList ID="cbxEstado" runat="server" Width="133px" Font-Bold="True" ForeColor="Red" Enabled="False" EnableTheming="True">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="direction: rtl; height: 18px; text-align: right; vertical-align: middle; color: #003399;" align="left">
                            <asp:Label ID="Label8" runat="server" Text="Documento"></asp:Label></td>
                        <td style="text-align: left; width: 339px;">
                            &nbsp;<asp:Label ID="LblNroSerie" runat="server" EnableTheming="False" Font-Bold="True" Font-Size="Larger" ForeColor="Maroon"></asp:Label>-<asp:Label
                                ID="lblNroFactura" runat="server" EnableTheming="False" Font-Bold="True" Font-Size="Larger" ForeColor="Maroon"></asp:Label></td>
                        <td style="height: 18px; text-align: right; direction: rtl; vertical-align: middle; color: #003399; width: 80px;" align="right">
                            <asp:Label ID="Label3" runat="server" Text="F.Emision" Width="74px"></asp:Label></td>
                        <td style="text-align: left; width: 309px;">
                            <asp:TextBox ID="txtFecEntrega" runat="server" Width="80px" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="DateFormat(this,this.value,event,true,'3')"></asp:TextBox>
										<img onclick="return showCalendar('ctl00_ContentPlaceHolder1_txtFecEntrega', 'dd/mm/y');" src="Images/btn_Calendario.gif" border="0" alt="" style="cursor:hand;"/></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl; height: 24px;
                            text-align: right">
                            <asp:Label ID="Label1" runat="server" Text="Cliente - RUC" Visible="False"></asp:Label></td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 339px;">
                            <asp:TextBox ID="txtRut" runat="server" Width="100px" Visible="False"></asp:TextBox><asp:Button ID="btnRut" runat="server" Text=" ... " BorderWidth="1px" Visible="False" /></td>
                        <td align="right" style="vertical-align: middle; width: 80px; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                            <asp:Label ID="Label5" runat="server" Text="Pedido" Visible="False" Width="72px"></asp:Label></td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 309px;">
                            <asp:Label ID="LblSerPed" runat="server" EnableTheming="False" Font-Bold="True" ForeColor="Maroon"></asp:Label><asp:Label
                                ID="LblNroPed" runat="server" EnableTheming="False" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="lblDocTipo" runat="server" Visible="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl; height: 24px;
                            text-align: right">
                            <asp:Label ID="Label21" runat="server" Text="TipoDoc"></asp:Label></td>
                        <td style="width: 339px; direction: ltr; height: 24px; text-align: left">
                            <asp:DropDownList ID="ddlCompPago" runat="server" Width="200px">
                            </asp:DropDownList>
                            <asp:Label ID="lblCodCp" runat="server"></asp:Label></td>
                        <td align="right" style="vertical-align: middle; width: 80px; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                            <asp:Label ID="Label6" runat="server" Text="IGV" Width="78px"></asp:Label></td>
                        <td style="width: 309px; direction: ltr; height: 24px; text-align: left">
                            <asp:TextBox ID="txtIGV" runat="server" Width="30px" onKeyUp="javascript:SoloDigitos(this,'DecOk')"></asp:TextBox>%</td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl; height: 24px;
                            text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="Referencia" Width="72px"></asp:Label></td>
                        <td style="width: 339px; direction: ltr; height: 24px; text-align: left">
                            <asp:TextBox ID="txtSerie" runat="server" Width="120px" onKeyUp="javascript:SoloDigitos(this,'DecNo');" onBlur="javascript:AgregarCeros(this,3);" BorderWidth="1px"></asp:TextBox>
                            <asp:TextBox ID="txtNroDoc" runat="server" onKeyUp="javascript:SoloDigitos(this,'DecNo');" onBlur="javascript:AgregarCeros(this,8);" BorderWidth="1px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" BorderWidth="1px" Text="..." /></td>
                        <td align="right" style="vertical-align: middle; width: 80px; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                            <asp:Label ID="Label16" runat="server" Text="Direccion"></asp:Label></td>
                        <td style="width: 309px; direction: ltr; height: 24px; text-align: left">
                            <asp:Label ID="lblDireccion" runat="server" EnableTheming="False" Font-Bold="True"
                                ForeColor="Maroon" Width="200px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="direction: rtl; text-align: right; vertical-align: middle; color: #003399; height: 24px;" align="left">
                            &nbsp;<asp:Label ID="lbl" runat="server" Text="Cliente - Nombre"></asp:Label></td>
                        <td style="direction: ltr; text-align: left; height: 24px; width: 339px;">
                            <asp:Label ID="lblNomCp" runat="server" EnableTheming="False" Font-Bold="True" ForeColor="Maroon"
                                Width="400px"></asp:Label></td>
                        <td style="direction: rtl; text-align: right; vertical-align: middle; color: #003399; height: 24px; width: 80px;" align="right">
                            <asp:Label ID="Label9" runat="server" Text="Moneda" Width="75px"></asp:Label></td>
                        <td style="direction: ltr; text-align: left; height: 24px; width: 309px;">
                            <asp:DropDownList ID="cbxMoneda" runat="server" Width="95px">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                            <asp:Label ID="Label7" runat="server" Text="Tipo"></asp:Label></td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 339px;">
                            <asp:DropDownList ID="ddlTipo" runat="server" Width="300px" AutoPostBack="True">
                                <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                <asp:ListItem Value="XD">X DEVOLUCION</asp:ListItem>
                                <asp:ListItem Value="XO">X OTROS</asp:ListItem>
                            </asp:DropDownList></td>
                        <td align="right" style="vertical-align: middle; color: #003399; direction: rtl;
                            height: 24px; text-align: right; width: 80px;">
                            <input type="hidden" runat="server" id="hdValCondPago" style="width: 100px" /></td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 309px;">
                            &nbsp;<input type="hidden" runat="server" id="hdCondPago" style="width: 100px" />
                            <asp:DropDownList ID="cbxClienProv" runat="server" Width="100px" AutoPostBack="True" Visible="False">
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl; height: 24px;
                            text-align: right">
                            <asp:Label ID="lblGl" runat="server" Text="Glosa"></asp:Label></td>
                        <td style="width: 339px; direction: ltr; height: 24px; text-align: left">
                            <asp:TextBox ID="txtGlosa" runat="server" BorderWidth="1px" TextMode="MultiLine"
                                Width="300px"></asp:TextBox>
                        </td>
                        <td align="right" style="vertical-align: middle; width: 80px; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                        </td>
                        <td style="width: 309px; direction: ltr; height: 24px; text-align: left">
                            <asp:Label ID="lblVendedor" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl; height: 24px;
                            text-align: right">
                            </td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 339px;">
                            <asp:DropDownList ID="ddlDir" runat="server" Width="300px" Visible="False">
                            </asp:DropDownList></td>
                        <td align="right" style="vertical-align: middle; width: 80px; color: #003399; direction: rtl;
                            height: 24px; text-align: right">
                            <asp:Label ID="Label4" runat="server" Text="Cond.Pago" Visible="False"></asp:Label></td>
                        <td style="direction: ltr; height: 24px; text-align: left; width: 309px;">
                            <asp:DropDownList ID="cbxCondPago" runat="server" Width="271px" AutoPostBack="True" Visible="False">
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style=" direction: rtl; text-align: right; vertical-align: middle; color: #003399; height: 24px;" align="left">
                            <asp:Button ID="btnAgregar" runat="server" Font-Bold="True" Text="Agregar" Width="85px" Visible="False" BorderWidth="1px" /></td>
                        <td style="direction: ltr; text-align: left; height: 24px; width: 339px;">
                            <input type="button" id="BtnContinuar" name="BtnContinuar" runat="server" value="Continuar" visible="False" onclick="javascript:funNuevo();"/>
                            <asp:Button ID="btnBuscarCliente" runat="server" Text=" ... " BorderWidth="1px" Visible="False" />
                            <asp:Label ID="lblCodDir" runat="server"></asp:Label>
                            </td>
                        <td style="direction: rtl; text-align: right; vertical-align: middle; color: #003399; height: 24px; width: 80px;" align="right">
                            </td>
                        <td style="direction: ltr; text-align: left; height: 24px; width: 309px;">
                            <asp:Label ID="lblcoddocref" runat="server"></asp:Label><asp:Label ID="lblserdocref"
                                runat="server"></asp:Label><asp:Label ID="lblnumdocref" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="direction: rtl; text-align: right; height: 26px; vertical-align: middle; color: #003399;" align="left">
                            <img src="Imagenes/btn_regresar.gif" style="cursor:hand;" onclick="javascript:funRegresar();" alt="Regresar" id="IMG1" height="22" width="85"/></td>
                        <td style="direction: ltr; text-align: center; height: 26px; width: 339px;">
                            &nbsp;
                            <asp:Button ID="btnGrabar" runat="server" BorderWidth="1px" Font-Bold="True" Text="Grabar"
                                Width="100px" /></td>
                        <td style="height: 26px; vertical-align: middle; color: #003399; direction: rtl; text-align: center; width: 80px;" align="right">
                            </td>
                        <td style="direction: ltr; text-align: center; height: 26px; width: 309px;">
                            <asp:Button ID="btnImprimir" runat="server" BorderWidth="1px" Text="Imprimir" Visible="False"
                                Width="100px" Font-Bold="True" /></td>
                    </tr>
                    <tr>
                        <td align="left" style="vertical-align: middle; color: #003399; direction: rtl;
                            text-align: right">
                            &nbsp;</td>
                        <td style="height: 24px; text-align: left" colspan="3">
                            <asp:Label ID="lblMensaje" runat="server" ForeColor="#C00000" EnableTheming="False" Font-Size="Larger" Font-Bold="True"></asp:Label>
                         </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4" >
                <asp:DataGrid ID="dtgDetalle" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None">
                 <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
                 <Columns>
                    <asp:TemplateColumn Visible="False">
                    <ItemTemplate><asp:label ID="lblFila" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.NroFila")%>'></asp:label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                    <ItemStyle Width="400px" HorizontalAlign="Left" />
                    <HeaderTemplate>Producto</HeaderTemplate>
                    <ItemTemplate><asp:label ID="lblProd" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PRODUCTO")%>'></asp:label>
                    </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn Visible="False">
                    <ItemStyle Wrap="False" />
                    <HeaderTemplate>Formato</HeaderTemplate>
                    <ItemTemplate>
                    <asp:label ID="lblForm" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ancho")%>'></asp:label>&nbsp;x&nbsp;
                    <asp:label ID="Label26" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.largo")%>'></asp:label>
                    </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn Visible="False">
                    <HeaderTemplate>U.Med</HeaderTemplate>
                    <ItemTemplate><asp:label ID="lblUMed" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UNIDADMEDIDA")%>'></asp:label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                    <HeaderTemplate>Cantidad</HeaderTemplate>
                    <ItemTemplate><asp:label ID="lblCant" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CanArt")%>'></asp:label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                    <HeaderTemplate>Precio</HeaderTemplate>
                    <ItemTemplate><asp:label ID="lblPrec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Precio_unit")%>'></asp:label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                    <HeaderTemplate>Total</HeaderTemplate>
                    <ItemTemplate><asp:label ID="lblTot" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Total")%>'></asp:label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn Visible="False">
                    <ItemTemplate><a href="#" onclick="javascript:funEliminar('<%#DataBinder.Eval(Container, "DataItem.Total")%>')"><img src='Images/ico_borrar.gif' border='0' alt=''/></a></ItemTemplate>
                    </asp:TemplateColumn>
                     <asp:EditCommandColumn CancelText="Cancelar" EditText="&lt;img src=&quot;Images/ico_edita.gif&quot; border='0' alt=&quot;Editar Item&quot;/&gt;"
                         UpdateText="Actualizar"></asp:EditCommandColumn>
                     <asp:ButtonColumn CommandName="Delete" Text="&lt;img src=&quot;Images/ico_borrar.gif&quot; border='0' alt=&quot;Eliminar Item&quot;/&gt;">
                     </asp:ButtonColumn>
                 </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditItemStyle BackColor="#999999" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                 </asp:DataGrid></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 1000px">
                <table width="100%">
                    <tr>
                        <td align="right" width="50%" style="height: 23px">
                        </td>
                        <td style="width: 100px; height: 23px;" align="right" bgcolor="activeborder">
                            <asp:Label ID="Label14" runat="server" Text="SubTotal" Width="55px"></asp:Label></td>
                        <td style="height: 23px; width: 106px;" align="right" bgcolor="activeborder">
                            <asp:Label ID="LblSubTotal" runat="server">0</asp:Label></td>
                        <td style="width: 100px; height: 23px;" align="right" bgcolor="activeborder">
                            <asp:Label ID="Label13" runat="server" Text="IGV"></asp:Label></td>
                        <td style=" height: 23px; width: 106px;" align="right" bgcolor="activeborder">
                            <asp:Label ID="LblIGV" runat="server">0</asp:Label></td>
                        <td style="width:100px; height: 23px;" align="right" bgcolor="activeborder">
                            &nbsp;<asp:Label ID="laben14" runat="server" Text="Total"></asp:Label></td>
                        <td style="height: 23px; width: 106px;" align="right" bgcolor="activeborder">
                            <asp:Label ID="lblSm" runat="server">.</asp:Label>
                            &nbsp;<asp:Label ID="LblTotal" runat="server">0</asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="text" name="txtEliminar" id="txtEliminar" value="" style="display:none;" />
    <input type="hidden" id="hdNuevo" value="N" runat="server" />
    <input type="hidden" id="hdTotReg" value="0" runat="server" />
    <input type="hidden" id="hdGenerar" value="N" runat="server" />
    <script language="javascript" type="text/javascript">
        var name2 = "ctl00_ContentPlaceHolder1_"
        
        function funGuardar()
        {
             var vrCodcp = document.getElementById(name2+"cbxClienProv").value;
             var vrNomcp = document.getElementById(name2+"txtNomCliente").value;
             var vrTip_Cp = '<%=Session("factTipo") %>';
             var vrMoneda = document.getElementById(name2+"cbxMoneda").value;
             var vrCond_Pago = document.getElementById(name2+"cbxCondPago").value;
             var vrFec_Ent_Pedi = document.getElementById(name2+"txtFecEntrega").value;
             var vrEstado = document.getElementById(name2+"cbxEstado").value;
            
            if (vrEstado!='001')
            {
                document.getElementById(name2+"lblMensaje").innerHTML = '¡ No se puede guardar, el documento esta <%=Session("DesEstDoc") %> !'
                return;
            }
             
            if (vrCodcp == "0")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Cliente !"
                return;
            }
            
            if (vrCodcp == "000000")
            {
                if(vrNomcp=="")
                {
                    document.getElementById(name2+"lblMensaje").innerHTML = "¡ Ingresar nombre de Cliente !"
                    return;
                }
            }

            if (vrTip_Cp == "0")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Comprobante de Pago !"
                return;
            }

            if (vrMoneda == "-1")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la moneda en que se realizara el Pago !"
                return;
            }

            if (vrCond_Pago == "0" || vrCond_Pago == "")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la Condicion en que se realizara el Pago !"
                return;
            }

            if (vrFec_Ent_Pedi == "")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Ingresar fecha de entrega  !"
                return;
            }
            
            document.getElementById(name2+"lblMensaje").innerHTML = ""
            document.getElementById(name2+"hdGenerar").value="G";
            document.forms['aspnetForm'].submit()
        }
        
        function funAgregarItems()
        {
        alert('dada');
//           document.getElementById(name2+"pnAgregar").style.visibility="visible";
         
//            var vrCodcp = document.getElementById(name2+"cbxClienProv").value;
//            var vrNomcp = document.getElementById(name2+"txtNomCliente").value;
//            var vrTip_Cp = '<%=Session("factTipo") %>';
//            var vrMoneda = document.getElementById(name2+"cbxMoneda").value;
//            var vrCond_Pago = document.getElementById(name2+"cbxCondPago").value;
//            var vrFec_Ent_Pedi = document.getElementById(name2+"txtFecEntrega").value;
//            var vrEstado = document.getElementById(name2+"cbxEstado").value;
            
                        
//            if (vrEstado!='001')
//            {
//                document.getElementById(name2+"lblMensaje").innerHTML = '¡ No se puede agregar, el documento esta <%=Session("DesEstDoc") %> !'
//                return;
//            }
//            
//            if (vrCodcp == "0")
//            {
//                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Cliente !"
//                return;
//            }
//            
//            if (vrCodcp == "000000")
//            {
//                if(vrNomcp=="")
//                {
//                    document.getElementById(name2+"lblMensaje").innerHTML = "¡ Ingresar nombre de Cliente !"
//                    return;
//                }
//            }

//            if (vrTip_Cp == "0")
//            {
//                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Comprobante de Pago !"
//                return;
//            }

//            if (vrMoneda == "-1")
//            {
//                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la moneda en que se realizara el Pago !"
//                return;
//            }

//            if (vrCond_Pago == "0" || vrCond_Pago == "")
//            {
//                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la Condicion en que se realizara el Pago !"
//                return;
//            }
//            
//            document.getElementById(name2+"lblMensaje").innerHTML = ""
           document.getElementById(name2+"hdGenerar").value="AI";
           document.forms['aspnetForm'].submit()
        }
        
        function funGenerarFactura()
        {
            var vrCodcp = document.getElementById(name2+"cbxClienProv").value;
             var vrNomcp = document.getElementById(name2+"txtNomCliente").value;
             var vrTip_Cp = '<%=Session("factTipo") %>';
             var vrMoneda = document.getElementById(name2+"cbxMoneda").value;
             var vrCond_Pago = document.getElementById(name2+"cbxCondPago").value;
             var vrFec_Ent_Pedi = document.getElementById(name2+"txtFecEntrega").value;
             var vrTotReg = parseInt(document.getElementById(name2+"hdTotReg").value);
             var vrEstado = document.getElementById(name2+"cbxEstado").value;
            
            if (vrEstado!='001')
            {
                document.getElementById(name2+"lblMensaje").innerHTML = '¡ No se puede generar, el documento esta <%=Session("DesEstDoc") %> !'
                return;
            }
             
            if (vrCodcp == "0")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Cliente !"
                return;
            }
            
            if (vrCodcp == "000000")
            {
                if(vrNomcp=="")
                {
                    document.getElementById(name2+"lblMensaje").innerHTML = "¡ Ingresar nombre de Cliente !"
                    return;
                }
            }

            if (vrTip_Cp == "0")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccionar Comprobante de Pago !"
                return;
            }

            if (vrMoneda == "-1")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la moneda en que se realizara el Pago !"
                return;
            }

            if (vrCond_Pago == "0" || vrCond_Pago == "")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Seleccione la Condicion en que se realizara el Pago !"
                return;
            }

            if (vrFec_Ent_Pedi == "")
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Ingresar fecha de entrega  !"
                return;
            }
            
            if (vrTotReg < 1)
            {
                document.getElementById(name2+"lblMensaje").innerHTML = "¡ Para generar la Factura debe haber al menos un Item !"
                return;
            }
            
            document.getElementById(name2+"lblMensaje").innerHTML = ""
            document.getElementById(name2+"hdGenerar").value="OK";
            document.forms['aspnetForm'].submit()
        }
        function funEliminar(val)
        {
            if(Confirm("¡ Desea Eliminar el Item Seleccionado!"))
            {
                //alert("Eliminado"+val);
            }
        }
        function funRegresar()
        {
            var vrCodEst = document.getElementById(name2+"cbxEstado").value;
            if (vrCodEst=='001')
            {
               abrirPopup("frmRegresar.aspx?p=Debe guardar los cambios antes de salir ?",250,100);
            }else{
                funRegresarOk()
            }
        }
        function funRegresarOk()
        {
            window.location.href="frmGenNotaCreditoBusca.aspx";
        }
        function funNuevo()
        {
            abrirPopup("frmNuevo.aspx?p=Debe guardar los cambios antes de Continuar ?",250,100);
        }
        function funNuevoOk()
        {
            document.forms['aspnetForm'].ctl00_ContentPlaceHolder1_hdNuevo.value="S";
            document.forms['aspnetForm'].submit();
            
        }
        
    </script>
    </asp:Panel>
    <div id="pnAgregar" runat="server" visible="false" style="width:100%">
    <table width="100%">
        <tr>
            <td colspan="1" style="text-align: center; height: 4px; background-color: #003399; font-weight: bold; font-size: 12pt; color: white;">
                <strong><span style="font-size: 12pt; color: white; background-color: #003399; text-align: center; font-weight: bold; height: 4px;">
                    DETALLE</span></strong></td>
        </tr>
        <tr>
            <td style="height: 42px">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                <td align="right" style="height: 20px">
                    &nbsp;
                </td>
                <td style="height: 20px" align="left">
                    &nbsp;
                </td>
                </tr>
                </table>
            <script type="text/javascript" language="javascript">
                function mostrarOpcion(op)
                {
                    if (op==1)
                    {
                    document.getElementById("TrConGuias").style.visibility=false;
                    document.getElementById("TrSinGuias").style.visibility=true;
                    }
                    
                }
            </script>
                    <asp:Label ID="lblMensajeGuia" runat="server" EnableTheming="False" Font-Bold="True" Font-Size="Larger"
                        ForeColor="#C00000"></asp:Label>
                        <asp:Label ID="lblMensaje2" runat="server" ForeColor="#C00000" EnableTheming="False" Font-Size="Larger" Font-Bold="True"></asp:Label>
                <asp:Label ID="lblFila" runat="server" Visible="False"></asp:Label></td>
        </tr>
        <tr><td>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr id="TrConGuias" runat="server" visible="false"><td style="height: 224px">
        <input type="hidden" id="hdtGuias" runat="server" />
        <input type="hidden" id="hdGuias" runat="server" />
        <input type="hidden" id="hdPedido" runat="server" />
        <input type="hidden" id="hdAccGuias" runat="server" />
        <script language="javascript" type="text/javascript">
        var name3 = "ctl00_ContentPlaceHolder1_"
        function funElegir(check)
        {
            var tot = document.getElementById(name3+'hdtGuias').value;
            var guia = ""
            for(i=1;i<=tot;i++)
                {
                var table = document.getElementById(i)
                var td = table.getElementsByTagName("TD")
                var ch = td[3].getElementsByTagName("input")
                var v1 = alltrim(td[2].innerText)
                var v2 = alltrim(check.valor)
                
                if (v1==v2 && check.checked==true)
                    {
                    td[0].className='tbGridItemSel0'; td[1].className='tbGridItemSel1';
                    td[2].className='tbGridItemSel2'; td[3].className='tbGridItemSel3';
                    ch[0].checked=true;
                    guia = guia + alltrim(td[0].innerText) + "," 
                    }else{
                    td[0].className='tbGridItem0'; td[1].className='tbGridItem1';
                    td[2].className='tbGridItem2'; td[3].className='tbGridItem3';
                    ch[0].checked=false;
                    }
                }
            document.getElementById(name3+'hdGuias').value=guia;
            document.getElementById(name3+'hdPedido').value=alltrim(check.valor);
        }
        </script>
        </td></tr>
        <tr id="TrSinGuias" runat="server" style="Width:100%"><td style="height: 127px">
        <table cellpadding="0" cellspacing="0" border="0"> 
        <tr><td style="height: 22px">Tipo de Venta</td><td style="height: 22px; width: 235px;" align="left"><asp:DropDownList ID="ddlTipoVenta" runat="server" onchange="javascript:funTipoVenta(this.value);">
            <asp:ListItem Value="0">Directa</asp:ListItem>
            <asp:ListItem Value="1">Otra</asp:ListItem>
        </asp:DropDownList></td></tr>
        <tr><td style="height: 25px">O.P.</td><td style="width: 235px; text-align: left; height: 25px;"><asp:TextBox ID="txtOP" runat="server" MaxLength="6" Width="80px" onKeyPress="javascript:SoloDigitos(this,'DecNo');" onBlur="javascript:AgregarCeros(this,6);"></asp:TextBox>-<asp:TextBox
                ID="txtNC" runat="server" MaxLength="2" Width="30px" onKeyPress="javascript:SoloDigitos(this,'DecNo');" onBlur="javascript:AgregarCeros(this,2);"></asp:TextBox>
            <input type="button" id="btnOP" value=" ... " onclick="javascript:funBuscarOP();" /></td></tr>
        <tr><td style="height: 24px">Descripcion:</td><td colspan="3" align="left" style="height: 24px"><asp:TextBox ID="txtDescripcion" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
            <img src="Imagenes/btn_adelanto.gif" alt="Adelanto." style="cursor:hand;" onclick="javascript:funAdelanto();" id="IMG2" /></td></tr>
        <tr>
            <td style="height: 23px">Cantidad:</td>
            <td style="height: 23px; width: 235px; text-align: left;"><asp:TextBox ID="txtCant" runat="server" onkeypress="javascript:SoloDigitos(this,'DecNo');" onkeyup="javascript:fnTotal(this);"></asp:TextBox></td>
            <td style="height: 23px">Und.Med:</td><td style="height: 23px"><asp:TextBox ID="txtUndMed" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 24px">Precio:</td><td style="height: 24px; width: 235px; text-align: left;"><asp:TextBox ID="txtPrec" runat="server" Visible="False" Width="100px"></asp:TextBox>
                <asp:Label ID="lblPrecio" runat="server" Width="75px" Visible="false"></asp:Label>
                <asp:TextBox ID="txtPrecAdel" runat="server" Width="100px" style="display:none"></asp:TextBox></td>
            <td style="height: 24px; text-align: right;">
                <asp:Label ID="Label20" runat="server" Text="Total"></asp:Label></td><td style="height: 24px; text-align: left;">
                &nbsp;<asp:TextBox ID="txtTotal" runat="server"></asp:TextBox></td>
        </tr>
            <tr>
                <td style="height: 20px">
                </td>
                <td colspan="3" style="height: 20px; text-align: left;">
                    &nbsp;&nbsp;<input type="hidden" runat="server" id="hdCP" />
                    <input type="hidden" runat="server" id="hdM" />
                    <asp:Label ID="lblMoneda" runat="server" Width="75px" Visible="False"></asp:Label></td>
            </tr>
        </table>
            <asp:TextBox ID="txtTipRef" runat="server" Style="display: none" Width="100px"></asp:TextBox>
            <asp:TextBox ID="txtSerRef" runat="server" Style="display: none" Width="100px"></asp:TextBox>
            <asp:TextBox ID="txtNumRef" runat="server" Style="display: none" Width="100px"></asp:TextBox></td></tr>
        <tr><td style="height: 24px">&nbsp;
            <img src="Imagenes/btn_aceptar.gif" alt="Aceptar." style="cursor:hand;" onclick="javascript:agregarItem();" id="IMG4" />&nbsp;
            <img src="Imagenes/btn_cancelar.gif" alt="Cancelar." style="cursor:hand;" onclick="javascript:fnCancelar();" />&nbsp;&nbsp;
            </td></tr>
        </table>
        
        </td></tr>
     </table>
     <input type="hidden" runat="server" id="hdCodClase" />
     <input type="hidden" runat="server" id="hdCodGrupo" />
     <input type="hidden" runat="server" id="hdCodSubGrupo" />
     <input type="hidden" runat="server" id="hdCodArticulo" />
     <input type="hidden" runat="server" id="hdGramaje" />
     <input type="hidden" runat="server" id="hdAncho" />
     <input type="hidden" runat="server" id="hdLargo" />
     <input type="hidden" runat="server" id="hdPrecio" />
     <input type="hidden" runat="server" id="hdUnMed" />
     <input type="hidden" runat="server" id="hdtipo" />
     <input type="hidden" runat="server" id="hdTotal" />
     <input type="hidden" runat="server" id="hdAccion" />
     <input type="hidden" runat="server" id="hdLoad" />
     <input type="hidden" runat="server" id="hdTotLocal" />
     <input type="hidden" runat="server" id="hdAdelanto" />
     <input type="hidden" runat="server" id="hdPrecUnit" />
     <input type="hidden" runat="server" id="hdDescPrec" />
     <script language="javascript" type="text/javascript">
        var name = "ctl00_ContentPlaceHolder1_"
        
        function funAdelanto()
        {
            
            var vOP = document.getElementById(name+"txtOP").value;
            var vNC = document.getElementById(name+"txtNC").value;
            var vCant = document.getElementById(name+"txtCant").value;
            
            if (vOP=='' && vNC=='')
            {
                alert('No ha ingresado Nro de Orden Producción');
                return false;
            }
            
            if (vCant==1)
            {
                alert('Ya se Ingreso Adelanto');
                return false;
            }
            var oArticulo = document.getElementById(name+"txtDescripcion");
            oArticulo.value = alltrim(oArticulo.value) +" - ADELANTO"
            document.getElementById(name+"txtCant").value = "1"
            document.getElementById(name+"hdAdelanto").value = "1"
            document.getElementById(name+"txttotal").value = "0"
             
            if(document.getElementById(name+"txtPrec")!=null)
                {document.getElementById(name+"txtPrec").style.display='none';}
            if(document.getElementById(name+"lblPrecio")!=null)
                {document.getElementById(name+"lblPrecio").style.display='none';}
            if(document.getElementById(name+"txtPrecAdel")!=null)
                {document.getElementById(name+"txtPrecAdel").style.display='';
                document.getElementById(name+"txtPrecAdel").value="0";
                document.getElementById(name+"txtPrecAdel").focus(); }    
        }
        function funBuscarOP()
        {
            var vOP = document.getElementById(name+"txtOP").value;
            var vNC = document.getElementById(name+"txtNC").value;
            
            if(alltrim(vOP)=='')
            {
                document.getElementById(name+"lblMensajeGuia").innerHTML="Ingresar Nro de OP";
                document.getElementById(name+"txtOP").focus();
                return;
            }
            
            if(alltrim(vNC)=='')
            {
                document.getElementById(name+"lblMensajeGuia").innerHTML="Ingresar Nro de OP";
                document.getElementById(name+"txtNC").focus();
                return;
            }
            
            document.getElementById(name+"lblMensajeGuia").innerHTML="";
            document.getElementById(name+"hdAccion").value="BOP";
            document.forms['aspnetForm'].submit()
        }
        
        function funTipoVenta(val)
        {
            document.getElementById(name+"lblMensajeGuia").innerHTML="";
            if (val=='1')
            {
            document.getElementById(name+"pnDetalle").style.visibility="hidden";
            }else{
            //document.getElementById(name+"pnDetalle").style.visibility="visible";
            }
        }
        function fnCancelar()
        {
            document.getElementById(name+"hdAccion").value="C";
            document.getElementById(name+"hdLoad").value="";
            document.forms['aspnetForm'].submit()
        }
        
        function fnAgregarArticulo()
        {
            var check = document.getElementById(name+"rdConGuia")
            
            if(check.checked==true)
            {
                document.getElementById(name+"lblMensajeGuia").innerHTML="Sólo se puede agregar Sin Guias.";
                return;
            }
            
            var vTvnt = document.getElementById(name+"ddlTipoVenta").value;
            if (vTvnt=='1')
            {
                document.getElementById(name+"lblMensajeGuia").innerHTML="El tipo de venta debe se directa";
                return false;
            }
            
            document.getElementById(name+"lblMensajeGuia").innerHTML="";
            document.getElementById(name+"pnDetalle").style.visibility="visible";
            document.getElementById(name+"hdAccion").value="AA";
            //document.forms['aspnetForm'].submit()
        }
        
        function agregarItem()
        {
        
//            var preci = document.getElementById(name+"txtPrec").value;
//           document.getElementById(name+"txtTotal").value =0;
//            var check = document.getElementById(name+"rdConGuia")
//            if(check.checked!=true)
//            {
//            var cant = document.getElementById(name+"txtCant").value
//           
//            var desc = document.getElementById(name+"txtDescripcion").value
//            var OP = document.getElementById(name+"txtOP").value
//            var total = document.getElementById(name+"hdTotLocal").value
//            var vTvnt = document.getElementById(name+"ddlTipoVenta").value;
//            var clase = document.getElementById(name+"hdCodClase").value
//            
//           
//            if (preci==0)
//            {
//                document.getElementById(name+"lblMensajeGuia").innerHTML="¡ Debe de Ingresar Precio !";
//                                     return false;
//            }
//            
//            if (vTvnt=='1')
//            {
//                if (desc=='' || OP=='')
//                   {
//                       document.getElementById(name+"lblMensajeGuia").innerHTML="¡ Debe Ingresar la Descripcion del articulo, o el nro de O.P. !";
//                       return false;
//                   }
//            }
//            if(parseInt(cant))
//            {
//                if ((parseInt(cant,10)>parseInt(total,10) || parseInt(total,10)==0) && clase!='008')
//                {
//                    document.getElementById(name+"lblMensajeGuia").innerHTML="¡ No hay stock disponible !";
//                    return false;
//                }
//                if (parseInt(cant,10)==0)
//                {
//                    document.getElementById(name+"lblMensajeGuia").innerHTML="¡ Debe Ingresar la Cantidad !";
//                    return false;
//                }
//            }else{
//                document.getElementById(name+"lblMensajeGuia").innerHTML="¡ Debe Ingresar la Cantidad !";
//                return false;
//            }
//           if (desc=='')
//           {
//               document.getElementById(name+"lblMensajeGuia").innerHTML="¡ Debe Ingresar la Descripcion del articulo !";
//               return false;
//           }
//           document.getElementById(name+"pnDetalle").style.visibility="hidden";
//           document.getElementById(name+"lblMensajeGuia").innerHTML="";
           document.getElementById(name+"hdAccion").value="A"
           document.getElementById(name+"hdLoad").value="";
           document.forms['aspnetForm'].submit()
//           }else{
//           document.getElementById(name3+'hdAccGuias').value="OK";
//           document.forms['aspnetForm'].submit()
//           }
        }
        
        function selArticulo(oDiv)
        {
            var table = document.getElementById(name+"dtgDetPedido")
            //var table = document.getElementById("dtgDetPedido")
            //var table = document.getElementById(name+"GVArticulos")
            var Igv = document.getElementById(name+"hdIGV").value
            var oRows = table.getElementsByTagName("TR")
            var tStock = 0;
            for(x=1;x<oRows.length;x++)
            {
                var oTDs = oRows[x].getElementsByTagName("TD")
                var oImg = oRows[x].getElementsByTagName("img")
                var oElements = oTDs[7].getElementsByTagName("DIV")
                var rutaImg = oImg[0].src
                //btn_seleccionar_on.gif-btn_seleccionar.gif
                oTDs[0].className='trGrid';oTDs[1].className='trGrid';
                oTDs[2].className='trGrid';oTDs[3].className='trGrid';
                oTDs[4].className='trGrid';oTDs[5].className='trGrid';
                oTDs[6].className='trGrid';oTDs[7].className='trGrid';
                
                rutaImg=rutaImg.replace(/btn_seleccionar_on/,'btn_seleccionar')
                for(y=0;y<oElements.length;y++)
                {
                    if(oElements[y].id==oDiv.id)
                    {
                        oTDs[0].className='trGridSel';oTDs[1].className='trGridSel';
                        oTDs[2].className='trGridSel';oTDs[3].className='trGridSel';
                        oTDs[4].className='trGridSel';oTDs[5].className='trGridSel';
                        oTDs[6].className='trGridSel';oTDs[7].className='trGridSel';
                        rutaImg=rutaImg.replace(/btn_seleccionar/,'btn_seleccionar_on')

                        if('<%=Session("SUCURSAL") %>'=="04")
                        {
                            tStock = parseInt(oTDs[5].innerText,10)
                        }
                        if('<%=Session("SUCURSAL") %>'=="03")
                        {
                            tStock = parseInt(oTDs[4].innerText,10)
                        }
                        if('<%=Session("SUCURSAL") %>'=="01")
                        {
                            tStock = parseInt(oTDs[2].innerText,10) + parseInt(oTDs[6].innerText,10)
                        }
                        if('<%=Session("SUCURSAL") %>'=="02")
                        {
                            tStock = parseInt(oTDs[3].innerText,10)
                        }
                        break;
                    }
                }
                oImg[0].src=rutaImg;
            }
            
            var identificador = oDiv.id
            var CodArt = document.getElementById(identificador+"CodArt").innerHTML;
            var Tipo = document.getElementById(identificador+"Tipo").innerHTML;
            var DimAncho = document.getElementById(identificador+"DimAncho").innerHTML;
            var DimLargo = document.getElementById(identificador+"DimLargo").innerHTML;
            var CodCla = document.getElementById(identificador+"CodCla").innerHTML;
            var NomCla = document.getElementById(identificador+"NomCla").innerHTML;
            var CodGrp = document.getElementById(identificador+"CodGrp").innerHTML;
            var NomGrp = document.getElementById(identificador+"NomGrp").innerHTML;
            var CodSgr = document.getElementById(identificador+"CodSgr").innerHTML;
            var NomSgr = document.getElementById(identificador+"NomSgr").innerHTML;
            var CodCorr = document.getElementById(identificador+"CodCorr").innerHTML;
            var Gramaje = document.getElementById(identificador+"Gramaje").innerHTML;
            var valorPrecio = document.getElementById(identificador+"valorPrecio").innerHTML;
            var Medida = document.getElementById(identificador+"Medida").innerHTML;
            var CodMoneda = document.getElementById(identificador+"CodMoneda").innerHTML;
            var DesLarga = document.getElementById(identificador+"DesLarga").innerHTML;
            var TotStock = document.getElementById(identificador+"TotStock").innerHTML;
            var PrecUnit = document.getElementById(identificador+"PrecUnit").innerHTML;
            var DescPrec = document.getElementById(identificador+"DescPrec").innerHTML;
            var total = 0;



            if (valorPrecio==''){valorPrecio=0}
            if (valorPrecio!=0 && Igv!=0){valorPrecio=redondear(parseFloat(valorPrecio) + parseFloat(valorPrecio*Igv*0.01),7)}
            
            document.getElementById(name+"hdTotLocal").value=tStock;

            document.getElementById(name+"lblMenStock").innerHTML="";
            
            if (tStock==0)  
            {
            document.getElementById(name+"lblMenStock").innerHTML="¡ No hay Stock Suficiente para el Local  :   " +  '<%=Session.Item("SUCURSAL_DESC") %>';
            document.getElementById(name+"txtPrec").value=0;
            document.getElementById(name+"txttotal").value=0;
            
            return;
            }
            
               
            document.getElementById(name+"txtDescripcion").value=DesLarga+" "+DimLargo+"x"+DimAncho+" "+Gramaje+"GR";//+" - "+Tipo;
            document.getElementById(name+"txtCant").value="";//TotStock
            document.getElementById(name+"txtUndMed").value=Medida;
            if(document.getElementById(name+"txtPrec")!=null)
                {document.getElementById(name+"txtPrec").value=valorPrecio;}
            if(document.getElementById(name+"lblPrecio")!=null)
                {document.getElementById(name+"lblPrecio").innerHTML=valorPrecio;}
            //document.getElementById(name+"lblMoneda").innerHTML=""
            
            document.getElementById(name+"hdCodClase").value=CodCla;
            document.getElementById(name+"hdCodGrupo").value=CodGrp;
            document.getElementById(name+"hdCodSubGrupo").value=CodSgr;
            document.getElementById(name+"hdCodArticulo").value=CodArt;
            document.getElementById(name+"hdGramaje").value=Gramaje;
            document.getElementById(name+"hdAncho").value=DimAncho;
            document.getElementById(name+"hdLargo").value=DimLargo;
            document.getElementById(name+"hdPrecio").value=valorPrecio;
            document.getElementById(name+"hdUnMed").value=Medida;
            document.getElementById(name+"hdtipo").value=Tipo;
            document.getElementById(name+"hdPrecUnit").value=PrecUnit;
            document.getElementById(name+"hdDescPrec").value=DescPrec;

            //valorPrecio = redondear(valorPrecio,2)
            total = valorPrecio * TotStock;
            document.getElementById(name+"hdTotal").value = total;
            //document.getElementById(name+"pnDetalle").style.visibility="hidden";
            document.getElementById(name+"txtCant").focus();

        }
        function fnTotal(texto)
        {
            var total = 0, cant = 0, prec = 0
            if(parseInt(texto.value))
            {
                prec = document.getElementById(name+"hdPrecio").value
                cant = texto.value
                total = prec * cant
                document.getElementById(name+"hdTotal").value  = total
                document.getElementById(name+"txtTotal").value  = total
            }else{
                document.getElementById(name+"hdTotal").value  = 0
                document.getElementById(name+"txtTotal").value  = 0
            }
        }
        function fnReplace(texto,s1,s2){
            return texto.split(s1).join(s2);
        }
        
        function fnBuscarArticulo()
        {
            //doAjax("frmListaArticulos.aspx","",'fnDatosArticulo','get','0');
            var e = "<%=Session("prCodEmp") %>"
            var cp = document.getElementById(name+"hdCP").value;
            var cc = document.getElementById(name+"cbxClase").value;
            var cg = document.getElementById(name+"cbxFamilia").value;
            var csg = document.getElementById(name+"cbxSubFamilia").value;
            var da = document.getElementById(name+"TxtArticulo").value;
            var g = document.getElementById(name+"txtGramaje").value;
            var t
            if (document.getElementsByName(name+"rdFormato")){t='F'}
            if (document.getElementsByName(name+"rdRecorte")){t='R'}
            if (document.getElementsByName(name+"rdTodo")){t='0'}
            var m = document.getElementById(name+"hdM").value;
            
            var oCon = document.getElementById(name+"contenido")
            oCon.innerHTML = "<span style='color:#C00000;font-size:Larger;font-weight:bold;'>procesando información de busqueda.<br>espere unos minutos.</span>"
            doAjax("frmListaArticulos.asp","e="+e+"&cp="+cp+"&cc="+cc+"&cg="+cg+"&csg="+csg+"&da="+da+"&g="+g+"&t="+t+"&m="+m,'fnDatosArticulo','get','0');
        }
        function fnDatosArticulo2(cadena)
        {
            alert(cadena)
        }
        function fnDatosArticulo(cadena)
        {
            if (cadena!='')
            {
                var oCon = document.getElementById(name+"contenido")
                oCon.innerHTML = ""
                oCon.innerHTML = cadena
            }
        }
     </script><input type="hidden" runat="server" id="hdIGV" /></div>
    <div id="pnDetalle" runat="server" style="visibility:hidden;width:100%">
    <table width="100%">
        <tr>
            <td colspan="1" style="text-align: center; height: 4px; background-color: #003399; font-weight: bold; font-size: 12pt; color: white;">
                <strong><span style="font-size: 12pt; color: white; background-color: #003399; text-align: center; font-weight: bold; height: 4px;">
                    BUSQUEDA - ITEM</span></strong></td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="height: 23px"></td>
                        <td style="width: 701px; direction: ltr; height: 23px; text-align: left">
                            &nbsp; &nbsp; &nbsp;
                            <input type="radio" id="rdFormato" name="rdTipo" value="F" runat="server" checked />&nbsp;Formato
                            <input type="radio" id="rdRecorte" name="rdTipo" value="R" runat="server" />&nbsp;Recorte
                            <input type="radio" id="rdTodo"  name="rdTipo" value="0" runat="server" />&nbsp;Todo</td>
                        <td style="width: 1092px; direction: rtl; height: 23px; text-align: right" align="left">
                            <asp:Label ID="lblSerie" runat="server" Visible="False"></asp:Label></td>
                        <td style="width: 1px; height: 23px; text-align: left">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 544px; direction: rtl; height: 23px; text-align: right">
                            <asp:Label ID="Label11" runat="server" Text="Clase"></asp:Label></td>
                        <td style="width: 701px; height: 23px; text-align: left; direction: ltr;">
                        <asp:DropDownList ID="cbxClase" runat="server" Width="272px" AutoPostBack="True">
                        </asp:DropDownList></td>
                        <td style="width: 1092px; height: 23px; text-align: right; direction: rtl;" align="left">
                            <asp:Label ID="Label12" runat="server" Text="Familia"></asp:Label></td>
                        <td style="width: 1px; height: 23px; text-align: left">
                            <asp:DropDownList ID="cbxFamilia" runat="server" Width="271px" AutoPostBack="True">
                            </asp:DropDownList>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 544px; direction: rtl; height: 28px; text-align: right">
                            <asp:Label ID="Label15" runat="server" Text="Sub Familia"></asp:Label></td>
                        <td style="width: 701px; height: 28px; text-align: left">
                            <asp:DropDownList ID="cbxSubFamilia" runat="server" Width="272px">
                            </asp:DropDownList></td>
                        <td style="width: 1092px; height: 28px; text-align: right; direction: rtl;" align="left">
                            <asp:Label ID="Label17" runat="server" Text="Artículo" Width="102px"></asp:Label></td>
                        <td style="width: 1px; height: 28px; text-align: left">
                            <asp:TextBox ID="TxtArticulo" runat="server" Width="263px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 544px; direction: rtl; text-align: right; height: 24px;">
                            <asp:Label ID="Label18" runat="server" Text="Gramaje" Width="102px"></asp:Label></td>
                        <td style="width: 701px; direction: ltr; text-align: left; height: 24px;">
                            <asp:TextBox ID="txtGramaje" runat="server" Width="85px" onKeyUp="javascript:SoloDigitos(this,'DecNo')"></asp:TextBox></td>
                        <td align="left" style="width: 1092px; direction: rtl; text-align: right; height: 24px;">
                            </td>
                        <td style="width: 1px; direction: ltr; text-align: left; height: 24px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4" style="height: 8px">
                            &nbsp;
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" BorderWidth="1px" />
                            <input id="Button1" type="button" value="Buscar" onclick="javascript:fnBuscarArticulo();" style="display:none;"/></td>
                    </tr>
                </table>
                <asp:Label ID="lblMenStock" runat="server" EnableTheming="False" Font-Bold="True"
                    ForeColor="Red" Width="600px"></asp:Label></td>
        </tr>
        <tr>
            <td>
            <div id="contenido" class="divGridII" runat="server">
            <table cellspacing="1" cellpadding="1" rules="all" border="0" style="background-color:#DEBA84;border-color:#DEBA84;border-width:0px;border-style:Solid;width:100%;display:none">
	        <tr align="center" style="color:White;background-color:#A55129;font-weight:bold;">
	        <td style="height: 21px">Producto</td><td style="height: 21px">Stock</td><td style="white-space:nowrap; height: 21px;">San Isidro</td><td style="height: 21px">Surquillo</td><td style="height: 21px">Puno</td><td style="height: 21px">Caylloma</td><td style="height: 21px">Recorte</td><td style="height: 21px">&nbsp;</td></tr>
	        </table>
                <asp:DataGrid ID="dtgDetPedido" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="0px" CellPadding="1" CellSpacing="1"
                    Width="100%" PageSize="5">
                    <SelectedItemStyle ForeColor="White" Font-Bold="True" BackColor="#738A9C"/>
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemStyle Width="350px" HorizontalAlign="Left" />
                            <HeaderTemplate>Producto</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.NomCompuesto")%></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderTemplate>Stock</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.TotStock") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderStyle Wrap="False" />
                            <HeaderTemplate>San Isidro</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.StockAlm1") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderTemplate>Surquillo</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.StockAlm2") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderTemplate>Puno</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.StockAlm3") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderTemplate>Caylloma</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.StockAlm4") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <HeaderTemplate>Recorte</HeaderTemplate>
                            <ItemTemplate><%# DataBinder.Eval(Container, "DataItem.StockRec") %></ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <div id="divCodArt" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.CodArt") %></div>
                                <div id="divTotStock" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.TotStock") %></div>
                                <div id="divTipo" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.Tipo") %></div>
                                <div id="divDimAncho" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.DimAncho") %></div>
                                <div id="divDimLargo" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.DimLargo") %></div>
                                <div id="divCodCla" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.CodCla") %></div>
                                <div id="divNomCla" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.NomCla") %></div>
                                <div id="divCodGrp" runat="server" style="display:none"><%# DataBinder.Eval(Container, "DataItem.CodGrp") %></div>
                                <div id="divNomGrp" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.NomGrp")%></div>
                                <div id="divCodSgr" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.CodSgr")%></div>
                                <div id="divNomSgr" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.NomSgr")%></div>
                                <div id="divCodCorr" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.CodCorr")%></div>
                                <div id="divGramaje" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.Gramaje")%></div>
                                <div id="divvalorPrecio" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.valorPrecio2")%></div>
                                <div id="divMedida" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.Medida")%></div>
                                <div id="divCodMoneda" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.CodMoneda")%></div>
                                <div id="divDesLarga" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.DesLarga")%></div>
                                <div id="divPrecUnit" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.valorPrecioUnit")%></div>
                                <div id="divDescPrec" runat="server" style="display:none"><%#DataBinder.Eval(Container, "DataItem.DscPrecio")%></div>
                                <div id="div" runat="server" onclick="javascript:selArticulo(this);"><img src="Imagenes/btn_seleccionar.gif" alt="seleccionar." style="cursor:hand;"/></div>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn Visible="False" ButtonType="PushButton" CommandName="Select" Text="Seleccionar">
                        </asp:ButtonColumn>
                    </Columns>
                    <PagerStyle Mode="NumericPages" HorizontalAlign="Center" ForeColor="#8C4510" />
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                </asp:DataGrid></div>
            <div class="divGridIII">
                &nbsp;</div>
        </td>
        </tr>
    </table>
    </div>
    <asp:Panel ID="pnScript" runat="server"></asp:Panel>
</asp:Content>

