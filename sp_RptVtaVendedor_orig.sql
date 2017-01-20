SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--  sp_RptVtaVendedor '01','2013','01','01/01/2013','31/07/2013','0','4'
ALTER                   PROC sp_RptVtaVendedor
@CodLocal char(2),
@Año char(4),
@Mes char(2),
@fechaini varchar(15),
@FechaFin varchar(15),
@CodVende char(6),
@Tipo char(2)
as

if @Tipo='x'--'1'  --Resumen por vendedor
begin

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tmpRptVendedor]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[tmpRptVendedor]  

select 
tb.vendedor,
tb.codop,
tb.nomcp,
tb.tipocambio,
tb.TotalSol,
tb.TotalDol

into TmpRptVendedor 
from(
Select --distinct
(select 
isnull((select p.nombres + ','  + p.APEPATERNO from per_personal p 
where p.codpersonal=v.codven),''))Vendedor,
vd.codop,
icp.nomcp,
v.tipoCambio,
case when v.codmoneda='0' then 
    case when v.tipdoc='NCR' then vd.total*-1 else vd.total end 
else  
     case when vd.tipdoc='NCR' then (vd.total*-1)*v.tipocambio else vd.total*v.tipocambio end 
end totalsol,
case when v.codmoneda<>'0' then 
     case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end 
else  
     case when v.tipocambio=0 then 0 else
       case when vd.tipdoc='NCR' then (vd.total*-1)/v.tipocambio else vd.total/v.tipocambio end 
end  end totaldol
from   vnt_doc v
left outer join vnt_doc_detalle vd 
on v.CodLocal=vd.CodLocal and
v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and
v.NumDoc =vd.NumDoc 
left outer join igt_clienProv icp
on v.CodCp=icp.Codcp

where
v.fecdoc between @fechaIni and @fechafin
and vd.anulado='0'
and  v.estado<>'003'
and v.CodLocal=case when @CodLocal ='0' then v.CodLocal else @CodLocal end
) tb
order by tb.vendedor


end

if @Tipo='2'    --- Detalle x Vendedor
begin
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpVntxVendedor]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpVntxVendedor]  


SELECT --DISTINCT
isnull((select p.nombres + ','  + p.APEPATERNO from per_personal p 
where p.codpersonal=v.codven),'')Vendedor,
convert(varchar(12),v.FecDoc,103)Fecha,
vd.TipDoc+'-'+vd.SerDoc+'-'+vd.NumDoc as Referencia,
v.Nom_Cp Cliente,
v.CodMoneda,
case when v.codMoneda='0' then 'S/.' else 'US$' end as Moneda,
vd.CodArt,
vd.DEsArt,
case when v.tipdoc='NCR' then vd.CanArt*-1 else vd.canart end as canart,
case when v.tipdoc='NCR' then vd.Precio_Unit*-1 else vd.Precio_unit end as precio_unit,
case when v.tipdoc='NCR' then vd.Total*-1 else vd.total end as total
into TmpVntxVendedor FROM 
VNT_DOC v, VNT_DOC_detalle vd
where 
v.CodLocal=vd.CodLocal and
v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and ---substring(vd.codart,1,3)<>'008' and
v.NumDoc =vd.NumDoc and--  v.tipdoc<>'NCR' and

/*
substring(vd.codart,1,3)<>'002' and
substring(vd.codart,1,3) in('004','006') and substring(vd.codart,1,6) not in('006005','006006','006009','006010','006011') and*/

(substring(vd.Codart,1,9) in('006011001','006001001','006001002','006001003','006024001','006024002','006024003','006024004','006024005') or
substring(vd.codart,1,6) in('006012','006016','006014','006015','006013') or
substring(vd.Codart,1,3) in('004') ) and
substring(vd.codart,1,3)<>'008' and
substring(vd.codart,1,3)<>'002' and
substring(vd.codart,1,6) not in('004002001','004004001') and

vd.anulado='0' and v.Anulado='0'  and v.Estado<>'003' and  v.Estado<>'001' AND
v.CodLocal= case when @CodLocal='0' then v.CodLocal else @CodLocal end and 
v.fecdoc >=case when @FechaIni='' then v.fecdoc else @FechaIni end  and
v.fecdoc <=case when @FechaFin='' then v.fecdoc else @FechaFin end and 
v.CodVen =case when @CodVende='0' then  v.CodVen else @CodVende end
ORDER BY vd.TipDoc+'-'+vd.SerDoc+'-'+vd.NumDoc 
select * from TmpVntxVendedor
end
--*******----
if @Tipo='3'   or @Tipo='1'-- DETALLE ventas vendedor x op
/*
sp_RptVtaVendedor '01','2010','01','15/02/2011','15/02/2011','03','1'
*/

begin
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RptVendedorComImpre]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                	drop table [dbo].[RptVendedorComImpre]   
select *
into RptVendedorComImpre 
from (
select 
tbl.Referencia,
tbl.odtvnd,
tbl.FecOp,
tbl.odtvventa as VventaCotizado,
tbl.odtmon,
tbl.codven,
isnull(tbl.Fecha,'') fecha,
tbl.NroOP,
tbl.Descripcion,
tbl.Vendedor,
tbl.Cliente,
tbl.Cantidad,
moneda = case when tbl.Moneda='x' then tbl.odtmon else tbl.moneda end,
sum(isnull(tbl.Total,0)) Total,
tbl.Comision,
isnull(tbl.estado,'EN proceso') estado,
tbl.cobrado,
isnull(tbl.anulado,'0') anulado

from(
---  Orden de Produccion
SELECT 
'' Referencia ,
op.odtvnd,
op.odtvventa,
case when op.odtmon='N' then 'S/.' else 'US$' end odtmon,
convert(varchar(12),op.odtfecacep,103) FecOP,
'' codven,
'' Fecha,
op.odtcod NroOP,
descripcion=op.odtdescrip,
isnull((select p.nombres + ','  + p.APEPATERNO from per_personal p 
where p.codpersonal=op.odtvnd),'')Vendedor,
op.odtCliente Cliente,
isnull(op.odtcant ,0) Cantidad,
case when op.odtmon='N' then 'S/.' else 'US$' end Moneda,
0 as total,
0 Comision,
Estado='',
Cobrado=0,
anulado=''
FROM produccion.dbo.ordt op
WHERE  
op.odtFecAcep>=case when @FechaIni='' then 
op.odtFecAcep
else @FechaIni end  and
op.odtFecAcep<=case when @FechaFin='' then 
op.odtFecAcep
else @FechaFin end and 
op.odtvnd =case when @CodVende='0' then  op.odtvnd 
else @CodVende end
union all
---  Facturacion
SELECT 

isnull(v.TipDoc+'-'+v.SerDoc+'-'+v.NumDoc,'') Referencia ,
op.odtvnd,
0 odtvventa,
case when op.odtmon='N' then 'S/.' else 'US$' end odtmon,
convert(varchar(12),op.odtfecacep,103) FecOP,
isnull(v.codven,'') codven,
convert(varchar(15),v.fecdoc,103) Fecha,
op.odtcod NroOP,
descripcion=op.odtdescrip,
isnull((select p.nombres + ','  + p.APEPATERNO from per_personal p 
where p.codpersonal=op.odtvnd),'')Vendedor,
op.odtCliente Cliente,
0 Cantidad,
case when codmoneda='0' then 'S/.' else
   case when codmoneda='1' then 'US$' else 'x' end end Moneda,
case when vd.tipdoc='NCR'  then vd.Total*-1 else vd.total end as total,
0 Comision,
Estado=(select DesCr_parametro from igt_parametro where cod_dominio='00010' and cod_parametro=v.estado),
Cobrado=isnull((Select Acta from cob_cobranza where v.serdoc=serie_cp and v.numdoc=nro_Cp and v.tipdoc=tipo_Cp),0),
vd.anulado
FROM produccion.dbo.ordt op
left outer join VNT_DOC_detalle vd
on vd.Codop= op.odtcod
left outer join VNT_DOC V  
on v.CodLocal=vd.CodLocal and v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and v.NumDoc=vd.NumDoc 
WHERE  
/*op.odtFecAcep>=case when @FechaIni='' then 
op.odtFecAcep
else @FechaIni end  and
op.odtFecAcep<=case when @FechaFin='' then 
op.odtFecAcep
else @FechaFin end and */
v.fecdoc>=case when @FechaIni='' then 
v.fecdoc
else @FechaIni end  and
v.fecdoc<=case when @FechaFin='' then 
v.fecdoc
else @FechaFin end and  substring(vd.codop,1,6)<>'000000' 
and v.estado<>'003'  and vd.anulado='0'  and

op.odtvnd =case when @CodVende='0' then  op.odtvnd -- v.CodVen 
else @CodVende end



)tbl
group by tbl.referencia, tbl.odtvnd, tbl.FecOp, tbl.odtvventa, tbl.odtmon, tbl.codven,
tbl.fecha, tbl.nroop, tbl.descripcion, tbl.vendedor, tbl.cliente,tbl.cantidad,tbl.moneda, tbl.comision,tbl.estado,tbl.cobrado,tbl.anulado
)tbb
where tbb.estado<>'Anulada' and tbb.Anulado='0'
order by vendedor,Nroop,referencia
select * from RptVendedorComImpre 
end
/*
VENTAS POR VENDEDOR - COMPROBANTE

*/
if @Tipo='4'
begin
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpVntxVendeComi]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpVntxVendeComi]  

select 
tbl.Vendedor,
tbl.Fecha,
tbl.Referencia,
tbl.Cliente,
tbl.CodMoneda,
tbl.Moneda,
tbl.TSoles,
tbl.tDolar,
total_dolar = case when tbl.codmoneda='0' then tbl.tsoles/tc.venta else
              tbl.tdolar end ,
tc=tc.venta,
tbl.f_pago, tbl.estadocob, tbl.A_cta

into TmpVntxVendeComi 
from (
SELECT DISTINCT
isnull((select p.nombres + ','  + p.APEPATERNO from per_personal p where p.codpersonal=v.codven),'')Vendedor,
convert(varchar(12),v.FecDoc,103)Fecha,
v.TipDoc+'-'+v.SerDoc+'-'+v.NumDoc as Referencia,
v.Nom_Cp Cliente,
v.CodMoneda,case when v.codMoneda='0' then 'S/.' else 'US$' end as Moneda,
CASE when v.codmoneda='0' then
      CASE when v.tipdoc='NCR' then  isnull(convert(decimal(18,2),sum(vd.total)*-1),0) 
      else  isnull(convert(decimal(18,2),sum(vd.total) ),0)  end else 0 end tSoles,
Case When v.codmoneda='1' then
      CASE when v.tipdoc='NCR' then  isnull(convert(decimal(18,2),sum(vd.total)*-1),0) 
      else  isnull(convert(decimal(18,2),sum(vd.total) ),0)  end else 0 end tDolar,
isnull((select max(f_pago) from cob_cobranza_detalle where tipo_cp=v.tipdoc and serie_cp=v.serdoc
and nro_cp=v.numdoc),'') f_pago,
isnull((select estado from cob_cobranza where tipo_cp=v.tipdoc and serie_cp=v.serdoc
and nro_cp=v.numdoc),'TG') estadoCOB,
isnull((select acta from cob_cobranza where tipo_cp=v.tipdoc and serie_cp=v.serdoc
and nro_cp=v.numdoc),0) A_cta
 
FROM 
VNT_DOC v, VNT_DOC_detalle vd
--left outer join con_tipocambio tc with (nolock)
--on v.Fecdoc=tc.FEchacambio and tc.Codmonext='1'
where 
v.CodLocal=vd.CodLocal and
v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and --substring(vd.codart,1,3)<>'008' and
v.NumDoc =vd.NumDoc and 
vd.anulado='0' and v.Anulado='0' 
and v.Estado<>'003' and  v.Estado<>'001' AND
v.tipDoc<>'NDB' and     -- 24/6/09  prm   no debe incluir notas de debito
v.CodLocal= case when @CodLocal='0' then v.CodLocal else @CodLocal end and v.fecdoc >=case when @FechaIni='' then v.fecdoc else @FechaIni end  and
v.fecdoc <=case when @FechaFin='' then v.fecdoc else @FechaFin end and 
v.CodVen =case when @CodVende='0' then  v.CodVen else @CodVende end 
group by v.codmoneda,
v.codven,
v.numdoc,
v.fecdoc,
v.tipdoc,
v.serdoc,
v.nom_cp
)tbl
left outer join con_tipoCAmbio tc
on tc.FechaCambio=tbl.fecha and tc.codmonExt='1'  --- verificando tipo de cambio solo para dolares
order by referencia
select * from TmpVntxVendeComi 
order by vendedor, referencia
end




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

