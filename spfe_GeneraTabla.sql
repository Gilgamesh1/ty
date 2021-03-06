SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO










--exec spfe_GeneraTabla '01', 'NCR','F01', '00001884','FAC'
ALTER         PROCEDURE [dbo].[spfe_GeneraTabla]
	@Empresa VarChar(2),
	@TipoDoc Varchar(3),
        @Serie   Varchar(3),
        @Numero  Varchar(10),
	@TDREF   Varchar(3)
	
AS

Declare @Id_Comprobante Int, 
        @ItemAnticipo   Int,
	@CierreAnticipo Int,
	@TotalDetalles  Int,
	@NCRGratuita	Int,
	@IGV		Int,
        @Detraccion	Int,
        @Anticipo       Varchar(1),
	@Codref		varchar(3),
	@SerRef		varchar(4),
	@NumRef		varchar(10),
        @PrepagoFecha	Datetime,
	@codCp		varchar(6),
	@codDir		varchar(3),
	@direccion	varchar(255),
	@ubigeo		varchar(12),
	@distrito       varchar(200),
	@provincia      varchar(200),
	@departamento   varchar(200),
	@pais		varchar(2)
--BEGIN TRANSACTION


  /* *******************************************
  -- Datos para la Facturacisn Electronica 
     *******************************************/

--  Declare @Numero Varchar(8)
--  Select @Serie=left(Serie,1)+'0'+Right(Serie,2),@Numero='0'+Documento From CabVentas Where Id_Ventas=@Id_Ventas

  If left(@Serie,1) in ('F','B') 
  Begin


   Select @Id_Comprobante=IdFE 
     From FE_Comprobantes...FE_Cabecera where EmpresaRuc='20153270814' 
      and ComprobanteTipo=Case When @TipoDoc='FAC' Then '01' Else Case When @TipoDoc='BOL' Then '03' Else 
                   Case When @TipoDoc='NCR' Then '07' Else '08' End End End
      and ComprobanteSerie=Case When @TipoDoc='NCR' Then Case When @TDREF='FAC' then 'F' else 'B' End else Left(@Serie,1) end+'0'+Right(@Serie,2)
      And ComprobanteNumero=@Numero

   If @Id_Comprobante>0
   Begin
      Delete from FE_Comprobantes...FE_Cabecera Where IdFE=@Id_Comprobante
      Delete from FE_Comprobantes...FE_Detalle  Where IdFacturacion=@Id_Comprobante
   End

   Set @Anticipo='N' 
   Select @Anticipo='S' 
     From VNT_DOC_DETALLE 
    Where CodEmp=@Empresa 
      And TipDoc=@TipoDoc 
      And SerDoc=@Serie 
      And NumDoc=@Numero
      And Isnull(Anulado,0)<>1
--    And Left(DesArt,10)='- ADELANTO'
      And flgadelanto='1'

   -- Cabecera
   Insert into FE_Comprobantes...FE_Cabecera(idFacturacion,EmpresaTipoDocumento,EmpresaRUC,EmpresaRazonSocial,EmpresaCodDistrito,
        EmpresaCalle,EmpresaDistrito,EmpresaProvincia,EmpresaDepartamento,EmpresaTelefono,EmpresaWeb,EmpresaCorreo,texto2,
        ComprobanteTipo,ComprobanteSerie,ComprobanteNumero,ComprobanteMoneda,ComprobanteCorreoElectronico,
        Receptoremail,ReceptorTipoDocumento,ReceptorRuc,ReceptorCodigoCliente,ReceptorRazonSocial,
	ReceptorDireccion,ReceptorUrbanizacion,ReceptorDistrito,ReceptorProvincia,ReceptorDepartamento,ReceptorCodPais,ReceptorTelefono,
        TipoCambioMonedaOrigen,TipoCambioMonedaDestino,TipoCambioValor,
        ComprobanteMontoGravado,ComprobanteMontoInafecto,ComprobanteMontoExonerado,
        ComprobanteMontoGratuito,
        ImpuestoTasaIgv,ImpuestoIgv,ComprobanteImporteTotal,ComprobanteDescuentoGlobal,
	ComprobanteMontoEnLetras,
        -- Linea adicionada para comprobantes gratuitos
        ComprobanteCheckGratuito,ComprobanteMontoLetrasGratuito,
        -- 
	DetraccionPorcentaje,DetraccionMonto,NroCuenta,
	ComprobanteRefTipo,ComprobanteRefSerie,ComprobanteRefNumero,ComprobanteRefCodigoMotivo,ComprobanteRefSustento,
	ComprobanteFechaEmision,FormaPagoFechaVencimiento,FormaPagoNotaInstruccion,FormaPagoCodigo,
        ComprobanteNroOrdenCompra,Texto1,GuiaRemisionSerie,GuiaRemisionNumero,
        ComprobanteTipoOperacion,
        -- Valores con 0
        ComprobanteTotalPrepago,ComprobanteTotalCargo,
        ComercioExteriorMontoFlete,ComercioExteriorMontoSeguro,ComercioExteriorMontoFOB,
        ComercioExteriorMontoCIF,impuestoisc,impuestoOtros,
        PrepagoMonto ,PrepagoValor ,PrepagoMonto1,PrepagoValor1,PrepagoMonto2,PrepagoValor2,
        PrepagoMonto3,PrepagoValor3,PrepagoMonto4,PrepagoValor4,PrepagoMonto5,PrepagoValor5,
	Estado,MultiGlosa,
        VendedorCodigo,VendedorCorreo,VendedorNombre,VendedorTelefono,
        ComprobanteGrillaDescripcion,ComprobanteGrillaValor1,ComprobanteGrillaValor2,ComprobanteGrillaValor3,ComprobanteGrillaFlag,
        ComprobanteGrillaDescripcion1,ComprobanteGrillaValor11,ComprobanteGrillaValor21,ComprobanteGrillaValor31,ComprobanteGrillaFlag1,
        ComprobanteGrillaDescripcion2,ComprobanteGrillaValor12,ComprobanteGrillaValor22,ComprobanteGrillaValor32,ComprobanteGrillaFlag2,
        ComprobanteGrillaDescripcion3,ComprobanteGrillaValor13,ComprobanteGrillaValor23,ComprobanteGrillaValor33,ComprobanteGrillaFlag3,
	CorreoTerceroToReceive,CorreoTerceroTemplate,CorreoTerceroSubject,CorreoTerceroEnvio)
--	CorreoTerceroToReceive1,CorreoTerceroTemplate1,CorreoTerceroSubject1,CorreoTerceroEnvio1,
--	CorreoTerceroToReceive2,CorreoTerceroTemplate2,CorreoTerceroSubject2,CorreoTerceroEnvio2)
   Select Null,'6','20153270814','EXITUNO SA','150121' As Ubigeo,'AV. MANUEL CIPRIANO DULANTO NRO. 211','PUEBLO LIBRE','LIMA','LIMA',
	  '(511)2611930' AS Telefono,'http://www.exituno.com.pe' as EmpresaWeb,'ventas@exituno.com.pe' as EmpresaCorreo,case when @TipoDoc='NCR' then '' else 'Cuenta de Bancos:' end as texto2,
          Case When C.TipDoc='FAC' Then '01' Else Case When C.TipDoc='BOL' Then '03' Else 
               Case When C.TipDoc='NCR' Then '07' Else '08' End End End,

          Case When C.TipDoc='NCR' Then Case When C.CodDocRef='FAC' then 'F' else 'B' End else Left(c.SerDoc,1) end+'0'+Right(c.SerDoc,2),
          c.NumDoc,Case When C.codmoneda='1' Then 'USD' else 'PEN' End,Cte.MailCP as ComprobanteCorreoElectronico,--'finanzas@exituno.com.pe' as ComprobanteCorreoElectronico,
	  Cte.MailCP as Receptoremail,   --'finanzas@exituno.com.pe'
          Case When left(Cte.TipDoc,3)='104' then '0' else Case When Cte.TipDoc='101' Then '6' else Case When Cte.TipDoc='102' Then '1' else '0' end  end end as TipoDocumento,
          Case When left(Cte.TipDoc,3)='104' then '-' else case When @TipoDoc='BOL' then
	  case when (C.M_Base_Imponible+C.m_Trans_Gratuita+C.ImporteIgv)>=700 then rtrim(cte.RucCP)
	  else case when cte.RucCP='' then '-' else rtrim(cte.RucCP) end end else rtrim(cte.RucCP) end end as ReceptorRuc,
	  C.CodCP as CodigoCliente,C.Nom_CP,
          Case When Isnull(Cte.DirCP,'')='' then 'LIMA' else Cte.DirCP end,c.coddir As ReceptorUrbanizacion,'' as Distrito,'' as Provincia,'' as Departamento,'' as ReceptorCodPais,Cte.TelCP,
	  Case When C.codMoneda=0 then 'PEN' else 'USD' end asTipoCambioMonedaOrigen,
	  Case When C.codMoneda=0 then 'USD' else 'PEN' end as TipoCambioMonedaDestino,C.TipoCambio,
          Case When C.ImporteIgv=0 Then Case When C.TipDoc='NDB' Then 0 else 0 end else Round(C.M_Base_Imponible,2) end as ComprobanteMontoGravado,          
	  Case When C.TipDoc='NDB' and C.ImporteIgv=0 Then Round(C.M_Base_Imponible,2) else 
	  Case When C.ImporteIgv=0 Then Round(C.M_Base_Imponible,2) else 0 end
	  end as ComprobanteMontoInafecto,0 as ComprobanteMontoExonerado,
          Case When C.m_Trans_Gratuita>0 then C.m_Trans_Gratuita+C.ImporteIgv else C.m_Trans_Gratuita end as ComprobanteMontoGratuito,
          PIGV as ImpuestoTasaIgv,Case When C.m_Trans_Gratuita>0 Then 0 else Round(C.ImporteIgv,2) end,
--	  Case When C.TipDoc='NDB' and  C.ImporteIgv=0 then 0 else no desdocumentar
--	  Case When C.ImporteIgv=0 then case when C.TipDoc='NDB' then Round(C.M_Base_Imponible+C.ImporteIgv,2) else 0 end else
          Case When C.m_Trans_Gratuita>0 Then 0 else Round(C.M_Base_Imponible+C.ImporteIgv,2) end
--	  end
	  as ComprobanteImporteTotal,
          ImporteTotalDscto,
	  Case When C.m_Trans_Gratuita>0 Then 'TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE'
          else dbo.numero_a_letras(Round(C.M_Base_Imponible+Case When C.m_Trans_Gratuita>0 Then 0 else Round(C.ImporteIgv,2) end,2),Case When C.codmoneda='1' Then 'DOLARES AMERICANOS' else 'SOLES' End)  end,
	  -- Linea adicionada en referencia para transferencia gratuita
	  Case When C.m_Trans_Gratuita=0 then 0 else 1 end, -- ComprobanteCheckGratuito
	  Case When C.m_Trans_Gratuita=0 then NULL else case When C.codmoneda='1' Then 'CERO CON 00/100 DOLARES AMERICANOS' else 'CERO CON 00/100 SOLES' end end, -- ComprobanteMontoLetrasGratuito
          --
          0 as DetraccionPorcentaje,   -- tasa de detraccisn
          0 as DetraccionMonto,
          '' as NroCuenta,
	  case When @TipoDoc IN ('NCR','NDB')
	  then case when upper(substring(Isnull(c.Observacion,''),1,9))='PENALIDAD' then '' else Case When C.CodDocRef='FAC'
			Then '01' Else	Case When C.CodDocRef='BOL' then '03' Else '08' end end end Else '' End as ComprobanteRefTipo,
	  case When @TipoDoc IN ('NCR','NDB') then case when upper(substring(Isnull(c.Observacion,''),1,9))='PENALIDAD'
		then ''	else upper(Left(SerDocRef,1)+'0'+Right(SerDocRef,2)) end Else ''  End  as ComprobanteRefSerie,
	  case When @TipoDoc IN ('NCR','NDB') then case when upper(substring(Isnull(c.Observacion,''),1,9))='PENALIDAD' then '' else  convert(nvarchar ,cast(C.NumDocRef as int)) end else '' end as ComprobanteRefNumero,
	  case When @TipoDoc IN ('NCR') then Case When C.TipoNCR='XD' Then '07' else C.TipoNCR end Else case When @TipoDoc IN ('NDB') then case when upper(Isnull(c.Observacion,''))='PENALIDAD' then '03' else '01' end else '' end end as ComprobanteRefCodigoMotivo,
          case When @TipoDoc IN ('NCR','NDB') then Case When Isnull(c.Observacion,'')='' Then 'DESCUENTO' else c.Observacion end else null end as ComprobanteRefSustento,
	  C.FecDoc,C.FecVen,ip.descr_parametro as Instruccion,Case When C.TipDoc='FAC' or C.TipDoc='BOL' Then '10' Else '1' end as FormaPagoCodigo,
          case when C.TipDoc='FAC' or C.TipDoc='BOL' then c.oc else '' end as ComprobanteNroOrdenCompra,
          case when C.TipDoc='FAC' or C.TipDoc='BOL' then c.oc else '' end as texto1,
	  '' as Serieguia,'' as NumeroGuia,  -- Left(Observacion,30) as NumeroGuia,
          Case When @Anticipo='S' Then '04' Else Case When left(Cte.TipDoc,3)='104' then '02' else 
						 Case When left(Cte.TipDoc,3)='103' then '03' else '01' end end end As TipoOperacion,
          --
	  0,0,
	  0,0,0,
	  0,0,0,
	  0,0,0,0,0,0,
	  0,0,0,0,0,0,
          -1,c.Observacion,
          p.codpersonal as VendedorCodigo,'' as VendedorCorreo,
	  rtrim(p.nombres)+' '+rtrim(p.apepaterno)+' '+rtrim(p.apematerno) as VendedorNombre,
	  '(01)261-1930 ' as VendedorTelefono,
          'BANCO DE CREDITO DEL PERU' as ComprobanteGrillaDescripcion,
	  'Soles' as ComprobanteGrillaValor1,
	  '193-1415354004' as ComprobanteGrillaValor2,
	  '002-193 001415 354004-13' as ComprobanteGrillaValor3,
          case when @TipoDoc='NCR' then 0 else 1 end as ComprobanteGrillaFlag,
	  'BANCO DE CREDITO DEL PERU' as ComprobanteGrillaDescripcion1,
	  'Dólares' as ComprobanteGrillaValor11,
	  '193-1126022169' as ComprobanteGrillaValor21,
	  '002-193-001126022169-19' as ComprobanteGrillaValor31,
          case when @TipoDoc='NCR' then 0 else 1 end as ComprobanteGrillaFlag1,
          'BANCO CONTINENTAL' as ComprobanteGrillaDescripcion2,
	  'Soles' as ComprobanteGrillaValor12,
	  '164-0100023345' as ComprobanteGrillaValor22,
	  '011-164-000100023345-10' as ComprobanteGrillaValor32,
	  case when @TipoDoc='NCR' then 0 else 1 end as ComprobanteGrillaFlag2,
          'BANCO CONTINENTAL' as ComprobanteGrillaDescripcion3,
	  'Dólares' as ComprobanteGrillaValor13,
	  '164-0100023353' as ComprobanteGrillaValor23,
	  '011-164-000100023353-14' as ComprobanteGrillaValor33,
	  case when @TipoDoc='NCR' then 0 else 1 end as ComprobanteGrillaFlag3,
	  Cte.emailOtrosFE as CorreoTerceroToReceive,'EST' as CorreoTerceroTemplate,'Comprobante Electrónico' as CorreoTerceroSubject,
	  case when Isnull(Cte.emailOtrosFE,'')='' then 0 else 1 end as CorreoTerceroEnvio
--	  Cte.emailOtrosFE_1 as CorreoTerceroToReceive1,'EST' as CorreoTerceroTemplate1,'Comprobante Electrónico' as CorreoTerceroSubject1,
--	  case when Isnull(Cte.emailOtrosFE_1,'')='' then 0 else 1 end as CorreoTerceroEnvio1,
--	  Cte.emailOtrosFE_2 as CorreoTerceroToReceive2,'EST' as CorreoTerceroTemplate2,'Comprobante Electrónico' as CorreoTerceroSubject2,
--	  case when Isnull(Cte.emailOtrosFE_2,'')='' then 0 else 1 end as CorreoTerceroEnvio2
     From VNT_DOC  C lEFT Join IGT_ClienProv Cte on C.CodEmp=Cte.CodEmp And C.CodCP=Cte.CodCP 
	left join igt_parametro ip on c.cond_pago=ip.cod_parametro

	left join PER_PERSONAL p on c.codven=p.codpersonal
   --                             left Join Concepto Con on C.Concepto=Con.Concepto
    Where C.CodEmp=@Empresa 
      And C.TipDoc=@TipoDoc 
      And C.SerDoc=@Serie 
      And C.NumDoc=@Numero and ip.cod_dominio='00008' 
			
   -- REasignar el nuevo valor de @Id_Comprobante			   
   Select @Id_Comprobante=IdFE, 
	  @codCp=ReceptorCodigoCliente,
	  @codDir=ReceptorUrbanizacion 
     From FE_Comprobantes...FE_Cabecera 
    where EmpresaRUC='20153270814' 
      and ComprobanteTipo=Case When @TipoDoc='FAC' Then '01' Else Case When @TipoDoc='BOL' Then '03' Else 
                   Case When @TipoDoc='NCR' Then '07' Else '08' End End End
      and ComprobanteSerie=Case When @TipoDoc='NCR' Then Case When @TDREF='FAC' then 'F' else 'B' End else Left(@Serie,1) end+'0'+Right(@Serie,2)
      And ComprobanteNumero=@Numero

  --
   Update FE_Comprobantes...FE_Cabecera Set IdFacturacion=@id_Comprobante where idFE=@Id_Comprobante

   -- Busqueda de Anticipos
  Select @ItemAnticipo=COUNT(*) From VNT_DOC_DETALLE 
    Where CodEmp=@Empresa 
      And TipDoc=@TipoDoc And SerDoc=@Serie 
      And NumDoc=@Numero And Isnull(Anulado,0)<>1
      And flgadelanto='1'

   -- Busqueda de Cierre de Anticipos
   Select @Codref=coddocref,
	@SerRef=serdocref,
	@NumRef=numdocref,
	@PrepagoFecha=fecha,
        @CierreAnticipo=COUNT(*) From VNT_DOC_DETALLE 
    Where CodEmp=@Empresa 
      And TipDoc=@TipoDoc And SerDoc=@Serie 
      And NumDoc=@Numero And Isnull(Anulado,0)<>1
      And precio_unit<0 group by coddocref,serdocref,numdocref,fecha

   -- 
   If ISNULL(@CierreAnticipo,0)>0 
   Begin
    DECLARE @PrepagoMonto float,
            @PrepagoValor Float,
            @PrepagoSerieNumero Varchar(30),
            @PrepagoDescripcion Varchar(100)

    Select Top 1 @PrepagoMonto=Round(Abs(Total*(1+c.Pigv/100)),2),@PrepagoValor=Round(Abs(Total),2),
                @PrepagoSerieNumero=upper(left(d.SerDocRef,1))+'0'+Right(d.SerDocRef,2)+'-'+convert(nvarchar ,cast(d.NumDocref as int)), -- '000000-00     - ADELANTO  FAC-F01-00046436'
                @PrepagoDescripcion=DesArt
    From VNT_DOC_DETALLE D Inner Join VNT_DOC c on d.codEmp=c.CodEmp And D.TipDoc=c.TipDoc and D.SerDoc=C.SerDoc And D.NumDoc=C.NumDoc
    Where d.CodEmp=@Empresa 
      And d.TipDoc=@TipoDoc 
      And d.SerDoc=@Serie 
      And d.NumDoc=@Numero
      And Isnull(d.Anulado,0)<>1
      And precio_unit<0
              
    Update FE_Comprobantes...FE_Cabecera 
       Set PrepagoCodigo=Case When ComprobanteTipo='01' Then '02' else '03' End,
           ComprobanteTotalPrepago=@PrepagoValor,PrepagoMonto=@PrepagoMonto,PrepagoValor=@PrepagoValor,
           PrepagoCodigoInstruccion=@PrepagoSerieNumero,
           PrepagoRucEmisor=EmpresaRUC,PrepagoTipoDocumentoIdentidad=EmpresaTipoDocumento,
           PrepagoFechaRecepcion=@PrepagoFecha,PrepagoDescripcion=@PrepagoDescripcion,
           PrepagoEnvio=1
     Where idFE=@Id_Comprobante
   End
   ---

   --NCR con Operaciones Gratuitas
   Select @Codref=coddocref,@SerRef=serdocref,@NumRef=numdocref,@IGV=pigv From VNT_DOC 
    Where CodEmp=@Empresa And TipDoc=@TipoDoc And SerDoc=@Serie And NumDoc=@Numero

   select @NCRGratuita=count(*) from vnt_doc v where
    v.tipdoc=@Codref and v.serdoc=@SerRef and v.numdoc=@NumRef and cond_pago='021'

   --Fecha de Referencia
   If @TipoDoc='NCR' or @TipoDoc='NDB'
   Begin
	declare @fechaRef datetime;
	select @fechaRef=fecdoc from vnt_doc where tipdoc=@Codref and serdoc=@SerRef and numdoc=@NumRef;
	Update FE_Comprobantes...FE_Cabecera Set ComprobanteRefFechaDoc=@fechaRef Where idFE=@Id_Comprobante;
   End

   --Calculo de total Detalles
   select @TotalDetalles=count(*)+1 
     From VNT_DOC_DETALLE D where d.CodEmp=@Empresa And d.TipDoc=@TipoDoc And d.SerDoc=@Serie And d.NumDoc=@Numero
     and d.anulado<>1 And d.Total>0

   -- Detalle
   Insert into FE_Comprobantes...FE_Detalle(idFacturacion,DetalleItem,DetalleCodigo,DetalleDescripcion,
          DetalleUnidad,DetalleCantidad,DetalleValorVUnitarioConIGV,DetalleValorVUnitario,
          DescuentoPorcentaje,DescuentoMonto,IGVPorcentaje,IGVMonto,DetalleTotal,
          ISCMonto,ISCPorcentaje,CargoMonto,CargoPorcentaje,
          DetalleDeterminante,DetalleCodigoTipoPrecio,AfectacionIGV,DetalleUnidadMedidaEmisor)
   Select @Id_Comprobante,
         -- 1 as item,
--ROW_NUMBER() OVER(PARTITION BY D.Id_Almacen ORDER BY d.Item ASC) AS Item, -- Antes era 1, 26/07/2016
          (SELECT @TotalDetalles-COUNT(i.CodArt) FROM VNT_DOC_DETALLE i
            Where i.CodEmp=@Empresa 
              And i.TipDoc=@TipoDoc 
              And i.SerDoc=@Serie 
              And i.NumDoc=@Numero
              And Isnull(i.Anulado,0)<>1
              And Isnull(i.Total,0)>0

              And i.Item>=d.Item) AS Item,  --     And i.CodArt>=d.CodArt) AS Item, or D.TipDoc='NDB'
	  D.CodArt,
          Case When D.TipDoc in ('NCR','NDB') Then Left(Isnull(D.DesArt,''),100) else Left(D.DesArt,100) end,
          'NIU',d.CanArt as DetalleCantidad,
          Round(d.Precio_Unit*(1+c.Pigv/100),2) as DetalleValorVUnitarioConIGV, --9
          Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0 Then 0 else Round(d.Precio_Unit,9) end as DetalleValorVUnitario,
          0,0,c.pigv,
          Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0 Then 0 else Round(d.Total*(c.Pigv/100),2) end as IGVMonto,
          Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0 Then 0 else Round(d.Total,2) end as DetalleTotal,
          0,0,0,0,
          Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0 Then '2' else '1' end as DetalleDeterminante, -- Determinante
          Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0 Then '02' else '01' end as DetalleCodigoTipoPrecio,  --- Solo en gratuitos va 02 Tipo Precio
	  Case When left(Cte.TipDoc,3)='104' then
		Case When @TipoDoc='BOL' Then
		 '10'
		else
		 '40'
		end
	  else
	        Case When C.m_Trans_Gratuita>0 or @NCRGratuita>0  Then
		 '13'
		else
			Case When D.TipDoc='NDB' and @IGV=0 then
			 '30' 
			else
			 '10'
			end
		end
	  end,  -- Tipo de Afectacion-- Decia '32'  21=Inafecto - Retiro  13-Gravado retiro
	'NIU'
     From VNT_DOC_DETALLE D Inner Join VNT_DOC c on d.codEmp=c.CodEmp And D.TipDoc=c.TipDoc and D.SerDoc=C.SerDoc And D.NumDoc=C.NumDoc
                            Left  Join IGT_ClienProv Cte on C.CodEmp=Cte.CodEmp And C.CodCP=Cte.CodCP
    Where d.CodEmp=@Empresa 
      And d.TipDoc=@TipoDoc 
      And d.SerDoc=@Serie 
      And d.NumDoc=@Numero
      And Isnull(D.Anulado,0)<>1
      And Isnull(d.Total,0)>0
--      And Left(d.DesArt,24)<>'000000-00     - ADELANTO'
    Order By d.Item


    END

    IF @NCRGratuita>0 
    begin
	declare @MontoTotal float
    	PRINT N'Entro a revisar comprobante gratuito de nota de credito'; 
	select @MontoTotal=ComprobanteImporteTotal from FE_Comprobantes...FE_Cabecera Where idFE=@Id_Comprobante 
    	PRINT N'@MontoTotal: '+ cast(@MontoTotal as nvarchar(30)); 
	Update FE_Comprobantes...FE_Cabecera 
        Set 
--      ComprobanteMontoGratuito=0,
	ComprobanteMontoGravado =0,
--	ComprobanteMontoInafecto=0,
	ImpuestoIgv=0,
	ComprobanteMontoEnLetras= case When ComprobanteMoneda='USD' Then 'CERO CON 00/100 DOLARES AMERICANOS' else 'CERO CON 00/100 SOLES' end,
	ComprobanteImporteTotal=0 Where idFE=@Id_Comprobante 
    end

    select @Detraccion=count(*) from VNT_DOC_DETALLE D where upper(d.desart) like 'SERVICIO%' and d.CodEmp=@Empresa 
      And d.TipDoc=@TipoDoc And d.SerDoc=@Serie And d.NumDoc=@Numero

    IF @Detraccion>0 
    begin
	Update FE_Comprobantes...FE_Cabecera 
        Set 
          DetraccionPorcentaje=Case When ComprobanteTipo='07' then 0 else 10.00 end,
	  DetraccionMonto = Case When ComprobanteTipo='07' then 0 else Round(Round(Case When ComprobanteMontoGratuito>0 Then 0 else ComprobanteImporteTotal end,2)*0.10,0) end,
	  NroCuenta='00-000-372978'
	Where idFE=@Id_Comprobante 
    end

   select @ubigeo=codubigeo,@direccion=desdireccion from igt_direcciones where codcp=@codcp and corrdir=@coddir
   select @pais=codSunat from IGT_PAISES where codpais=substring(@ubigeo,1,3)
   select @departamento=nomdep from IGT_DEPARTAMENTOS where codpais=substring(@ubigeo,1,3) and coddep=substring(@ubigeo,4,3)
   select @provincia=nompro from IGT_PROVINCIAS where codpais=substring(@ubigeo,1,3) and coddep=substring(@ubigeo,4,3) and codpro=substring(@ubigeo,7,3)
   select @distrito=nomdis from IGT_DISTRITOS where codpais=substring(@ubigeo,1,3) and coddep=substring(@ubigeo,4,3) and codpro=substring(@ubigeo,7,3) and coddis=substring(@ubigeo,10,3)
   
   Update FE_Comprobantes...FE_Cabecera Set ReceptorDireccion=@direccion,ReceptorUrbanizacion='',ReceptorDistrito=@distrito,
     ReceptorProvincia=@provincia,ReceptorDepartamento=@departamento,ReceptorCodPais=@pais
     Where idFE=@Id_Comprobante 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

