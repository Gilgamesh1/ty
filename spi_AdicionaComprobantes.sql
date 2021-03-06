USE [bdig]
GO
/****** Object:  StoredProcedure [dbo].[spi_AdicionaComprobantes]    Script Date: 04/10/2017 04:23:36 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec spi_AdicionaComprobantes  '20153270814', '07','F001', '00001873',36
ALTER PROCEDURE [dbo].[spi_AdicionaComprobantes]
	@Empresa VarChar(11),
	@TipoDoc Varchar(3),
    @Serie   Varchar(4),
    @Numero  Varchar(10),
	@IdFE    Int

AS 

insert into fe_cabecera (idFE,IdFacturacion,EmpresaTipoDocumento,EmpresaRUC,EmpresaRazonSocial,EmpresaCalle,EmpresaCodDistrito,EmpresaDistrito,EmpresaProvincia,EmpresaDepartamento,
  EmpresaCorreo,EmpresaTelefono,EmpresaWeb,ComprobanteTipo,ComprobanteSerie,ComprobanteNumero,ComprobanteMOneda,ComprobanteCorreoElectronico,ReceptorTipoDocumento,ReceptorRuc,ReceptorCodigoCliente,ReceptorEmail,ReceptorRazonSocial,
  ReceptorUbigeo,ReceptorDireccion,ReceptorUrbanizacion,ReceptorDistrito,ReceptorProvincia,ReceptorDepartamento,ReceptorCodPais,ReceptorTelefono,
  TipoCambioMonedaOrigen,TipoCambioMonedaDestino,TipoCambioValor,
  ComprobanteMontoGravado,ComprobanteMontoInafecto,ComprobanteMontoExonerado,ComprobanteCheckGratuito,ComprobanteMontoGratuito,ComprobanteMontoLetrasGratuito,
  ImpuestoTasaigv,ImpuestoIgv,ComprobanteImporteTotal,ComprobanteDescuentoGlobal,ComprobanteMontoLetras,DetraccionPorcentaje,DetraccionMonto,NroCuenta,
  ComprobanteRefTipo,ComprobanteRefSerie,ComprobanteRefNumero,ComprobanteRefCodigoMotivo,ComprobanteRefSusento,
  ComprobanteFechaEmision,FormaPagofechaVencimiento,FormaPagoNotaInstruccion,FormaPagoCodigo,
  ComprobanteNroOrdenCompra,GuiaRemisionSerie,GuiaRemisionNumero,
  PrepagoCodigo,PrepagoCodigoInstruccion,PrepagoRucEmisor,PrepagoTipoDocumentoIdentidad,PrepagoFechaRecepcion,PrepagoDescripcion,PrepagoEnvio,
  ComprobanteTotalPrepago,ComprobanteTotalCargo,
  ComprobanteTipoOperacion,
  ComercioExteriorMontoFlete,ComercioExteriorMontoSeguro,ComercioExteriorMontoFOB,
  ComercioExteriorMontoCIF,impuestoisc,impuestoIvap,impuestoOtros,
  PrepagoMonto ,PrepagoValor ,PrepagoMonto1,PrepagoValor1,PrepagoMonto2,PrepagoValor2,
  PrepagoMonto3,PrepagoValor3,PrepagoMonto4,PrepagoValor4,PrepagoMonto5,PrepagoValor5,
  Estado,MotivoAnulacion,ComprobanteMultiGlosa,Texto2,Texto1,ComprobanteRefFechaDoc,
  VendedorCodigo,VendedorCorreo,VendedorNombre,VendedorTelefono,
  ComprobanteGrillaDescripcion,ComprobanteGrillaValor1,ComprobanteGrillaValor2,ComprobanteGrillaValor3,ComprobanteGrillaFlag,
  ComprobanteGrillaDescripcion1,ComprobanteGrillaValor11,ComprobanteGrillaValor21,ComprobanteGrillaValor31,ComprobanteGrillaFlag1,
  ComprobanteGrillaDescripcion2,ComprobanteGrillaValor12,ComprobanteGrillaValor22,ComprobanteGrillaValor32,ComprobanteGrillaFlag2,
  ComprobanteGrillaDescripcion3,ComprobanteGrillaValor13,ComprobanteGrillaValor23,ComprobanteGrillaValor33,ComprobanteGrillaFlag3,
  CorreoTerceroToReceive,CorreoTerceroTemplate,CorreoTerceroSubject,CorreoTerceroEnvio,
  CorreoTerceroToReceive1,CorreoTerceroTemplate1,CorreoTerceroSubject1,CorreoTerceroEnvio1,
  CorreoTerceroToReceive2,CorreoTerceroTemplate2,CorreoTerceroSubject2,CorreoTerceroEnvio2)
 Select idFE,IdFacturacion,EmpresaTipoDocumento,EmpresaRuc,EmpresaRazonSocial,EmpresaCalle,EmpresaCodDistrito,EmpresaDistrito,EmpresaProvincia,EmpresaDepartamento,
  EmpresaCorreo,EmpresaTelefono,EmpresaWeb,ComprobanteTipo,ComprobanteSerie,ComprobanteNumero,ComprobanteMOneda,ComprobanteCorreoElectronico,ReceptorTipoDocumento,ReceptorRuc,ReceptorCodigoCliente,ReceptorEmail,ReceptorRazonSocial,
  ReceptorUbigeo,ReceptorDireccion,ReceptorUrbanizacion,ReceptorDistrito,ReceptorProvincia,ReceptorDepartamento,ReceptorCodPais,ReceptorTelefono,
  TipoCambioMonedaOrigen,TipoCambioMonedaDestino,TipoCambioValor,
  ComprobanteMontoGravado,ComprobanteMontoInafecto,ComprobanteMontoExonerado,ComprobanteCheckGratuito,ComprobanteMontoGratuito,ComprobanteMontoLetrasGratuito,
  ImpuestoTasaigv,ImpuestoIgv,ComprobanteImporteTotal,ComprobanteDescuentoGlobal,rtrim(ComprobanteMontoEnLetras),DetraccionPorcentaje,DetraccionMonto,NroCuenta,
  ComprobanteRefTipo,ComprobanteRefSerie,ComprobanteRefNumero,ComprobanteRefCodigoMotivo,ComprobanteRefSustento,
  ComprobanteFechaEmision,FormaPagofechaVencimiento,FormaPagoNotaInstruccion,FormaPagoCodigo,
  ComprobanteNroOrdenCompra,GuiaRemisionSerie,GuiaRemisionNumero,
  PrepagoCodigo,PrepagoCodigoInstruccion,PrepagoRucEmisor,PrepagoTipoDocumentoIdentidad,PrepagoFechaRecepcion,PrepagoDescripcion,PrepagoEnvio,
  ComprobanteTotalPrepago,ComprobanteTotalCargo,
  ComprobanteTipoOperacion,
  ComercioExteriorMontoFlete,ComercioExteriorMontoSeguro,ComercioExteriorMontoFOB,
  ComercioExteriorMontoCIF,impuestoisc,0,impuestoOtros,
  PrepagoMonto ,PrepagoValor ,PrepagoMonto1,PrepagoValor1,PrepagoMonto2,PrepagoValor2,
  PrepagoMonto3,PrepagoValor3,PrepagoMonto4,PrepagoValor4,PrepagoMonto5,PrepagoValor5,
  Estado,MotivoAnulacion,MultiGlosa,texto2,texto1,ComprobanteRefFechaDoc,
  VendedorCodigo,VendedorCorreo,VendedorNombre,VendedorTelefono,
  ComprobanteGrillaDescripcion,ComprobanteGrillaValor1,ComprobanteGrillaValor2,ComprobanteGrillaValor3,ComprobanteGrillaFlag,
  ComprobanteGrillaDescripcion1,ComprobanteGrillaValor11,ComprobanteGrillaValor21,ComprobanteGrillaValor31,ComprobanteGrillaFlag1,
  ComprobanteGrillaDescripcion2,ComprobanteGrillaValor12,ComprobanteGrillaValor22,ComprobanteGrillaValor32,ComprobanteGrillaFlag2,
  ComprobanteGrillaDescripcion3,ComprobanteGrillaValor13,ComprobanteGrillaValor23,ComprobanteGrillaValor33,ComprobanteGrillaFlag3,
  CorreoTerceroToReceive,CorreoTerceroTemplate,CorreoTerceroSubject,CorreoTerceroEnvio,
  CorreoTerceroToReceive1,CorreoTerceroTemplate1,CorreoTerceroSubject1,CorreoTerceroEnvio1,
  CorreoTerceroToReceive2,CorreoTerceroTemplate2,CorreoTerceroSubject2,CorreoTerceroEnvio2
  from fe_comprobantes...fe_cabecera
 Where EmpresaRUC=@Empresa
   And ComprobanteTipo=@TipoDoc
   And ComprobanteSerie=@Serie
   And ComprobanteNumero=@Numero
   
insert into fe_detalle(IdDetalle,IdFacturacion,detalleItem,DetalleCodigo,DetalleDescripcion,
  Detalleunidad,Detallecantidad,DetalleValorVUnitarioConIgv,DetalleValorVUnitario,
  DescuentoPorcentaje,DescuentoMonto,IgvPorcentaje,IgvMonto,DetalleTotal,
  IscMonto,IscPorcentaje,CargoMonto,CargoPorcentaje,
  DetalleDeterminante,DetalleCodigoTipoPrecio,DetalleMultidescripcion,AfectacionIGV,DetalleUnidadMedidaEmisor) 
 Select IdDetalle,IdFacturacion,DetalleItem,DetalleCodigo,DetalleDescripcion,
  Detalleunidad,Detallecantidad,DetalleValorVUnitarioConIgv,DetalleValorVUnitario,
  DescuentoPorcentaje,DescuentoMonto,IgvPorcentaje,IgvMonto,DetalleTotal,
  IscMonto,IscPorcentaje,CargoMonto,CargoPorcentaje,
  DetalleDeterminante,DetalleCodigoTipoPrecio,'',AfectacionIGV,DetalleUnidadMedidaEmisor
  from fe_comprobantes...fe_detalle
 Where IdFacturacion=@IdFE
