SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




/*
--sp_ReporteVntDia '3','0','01','01/04/2009','31/05/2009','1','0'
--select * from vnt_doc_DETALLE where tipdoc='ncr'

*/

ALTER               PROC sp_ReporteVntDia
@TipoRpt char(2),
@CodLocal char(2),
@Mes  char(4),
@FechaIni varchar(12),
@FechaFin varchar(12),
@moneda char(1),
@Cp char(6)
as
--declare @TC decimal(18,2)
--set @TC=(select venta from CON_TIPOCAMBIO where convert(varchar(20),fechacambio,103)=convert(varchar(20),getdate(),103))
if @TipoRpt='1'
begin
select 
tbl.Tipo,
tbl.Referencia,
tbl.Fecha,
tbl.Cliente,
tbl.CodMoneda,
tbl.Moneda,
tbl.Total     --tbl.TotalNcr Total
from
(
SELECT 
DISTINCT
'Comercializacion' as Tipo,
V.TipDoc+'-'+V.SerDoc+'-'+V.NumDoc as Referencia,
convert(varchar(12),V.fecdoc,103) as Fecha,
V.Nom_Cp Cliente,
V.CodMoneda,
case when V.codMoneda='0' then 'Soles' else 'Dolares' end as Moneda,
convert(decimal(18,2),case when v.tipdoc='NCR'  then (V.m_base_imponible* -1) else  (V.m_base_imponible) end ) Total  --,
--case when v.TipDoc='NCR' then V.m_base_imponible else 0 end TotalNcr
FROM VNT_DOC V , VNT_DOC_DETALLE VD where
v.CodLocal=vd.CodLocal and
v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and
v.NumDoc =vd.NumDoc and  
VD.CODOP='' AND 
V.estado<>'003' and 
V.estado<>'001' and 
V.anulado='0' and 
vd.anulado='0' and -- v.tipdoc<>'NCR' and
--v.CODCP<>'011007' and
V.CodLocal= case when @CodLocal='0' then V.CodLocal else @CodLocal end and 
V.fecdoc >=case when @FechaIni='' then fecdoc else @FechaIni end  and
V.fecdoc <=case when @FechaFin='' then fecdoc else @FechaFin end  and
v.CodCp  = case when @Cp='0' then v.Codcp else @Cp end 
union all
select DISTINCT
'Imprenta'as Tipo,
VC.TipDoc+'-'+VC.SerDoc+'-'+VC.NumDoc as Referencia,
convert(varchar(12),VC.fecdoc,103) as Fecha,
VC.Nom_Cp Cliente,
CodMoneda,
case when VC.CodMoneda='0' then 'Soles' else 'Dolares' end as Moneda,

convert(decimal(18,2),case when vc.tipdoc='NCR' then (Vc.m_base_imponible*-1) else(Vc.m_base_imponible) end) Total   --,

--case when vc.TipDoc='NCR' then Vc.m_base_imponible else 0 end TotalNcr

from VNT_DOC_DETALLE VD ,VNT_DOC VC 
WHERE 
VC.CodEmp+VC.CodLocal+VC.TipDoc+VC.SerDoc+VC.NumDoc=VD.CodEmp+VD.CodLocal+VD.TipDoc+VD.SerDoc+VD.NumDoc AND 
vd.Anulado='0' and  
vc.cond_pago<>'023' and -- cesion de cobranza
--vc.CODCP<>'011962' and  discrimina la vta de deuda
vc.Anulado='0' and
VD.CODOP<>'' AND 
vd.NCompOP<>'' and
vc.Estado<>'003' and vc.estado<>'001' and 
vc.CodLocal= case when @CodLocal='0' then vc.CodLocal else @CodLocal end and 
vc.fecdoc >=case when @FechaIni='' then vc.fecdoc else @FechaIni end  and
vc.fecdoc <=case when @FechaFin='' then vc.fecdoc else @FechaFin end  and
vc.CodCp  = case when @Cp='0' then vc.Codcp else @Cp end 
)tbl order by Referencia
end
------ VENTAS X ARTICULO
if @TipoRpt='2'

begin
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpDetallexArt]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpDetallexArt]  


--select * from vnt_doc_detalle where tipdoc='ncr'
select 
tbl.Clase,
tbl.Codop,
tbl.Fecha,
tbl.Referencia,
tbl.Cliente,
tbl.CodArt,
tbl.CanArt,
tbl.DesArt,
tbl.CodMoneda,
tbl.Moneda,
tbl.Precio_unit,
tbl.tipocAMBIO,
tbl.totalsol,
tbl.totaldol
into TmpDetallexArt from
(
select DISTINCT
/*
isnull((select rtrim(g.NomGrp) + ' ' +  rtrim(s.NomSgr)
from log_clases c, LOG_GRUPOS g , LOG_SUBGRUPO s where 
c.Codcla=substring(vd.CodArt,1,3) and
c.Codcla=g.CodCla and g.Codcla=substring(vd.CodArt,1,3) and g.CodGrp=substring(vd.CodArt,4,3)and
c.CodCla=s.Codcla and s.CodCla=g.CodCla and s.CodGrp=g.CodGrp and s.CodCla=substring(vd.CodArt,1,3)
and s.CodGrp=substring(vd.CodArt,4,3) and s.CodSgr=substring(vd.CodArt,7,3)
),'')Clase,
*/
clase='005',
convert(varchar(12),VC.fecdoc,103) as Fecha,
VC.TipDoc+'-'+VC.SerDoc+'-'+VC.NumDoc as Referencia,
UPPER(VC.Nom_Cp) Cliente,
CODART=VD.CODOP,  ---vd.CodArt,
case when vd.tipdoc='NCR' then vd.canart*-1 else vd.CanArt end Canart,
vd.DesArt,
CodMoneda,vd.Codop,
case when VC.CodMoneda='0' then 'Soles' else 'Dolares' end as Moneda,
vd.Precio_unit ,
vc.tipoCambio,
case when vc.codmoneda='0' then 
case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end 
else  
case when vd.tipdoc='NCR' then (vd.total*-1)*vc.tipocambio else vd.total*vc.tipocambio end 
end totalsol,
case when vc.codmoneda<>'0' then 
case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end 
else  
case when vc.tipocambio=0 then
0 else
case when vd.tipdoc='NCR' then (vd.total*-1)/vc.tipocambio else vd.total/vc.tipocambio end 
end  end totaldol

/*
case When Vc.Codmoneda='0' then 
case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end else 0 end total,
case When Vc.Codmoneda='1' then 
case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end else 0 end totalDol*/
--case when vd.TipDoc='NCR' then vd.total else 0 end TotalNcr

 from VNT_DOC_DETALLE VD ,VNT_DOC VC --,
WHERE  
VC.CodEmp+VC.CodLocal+VC.TipDoc+VC.SerDoc+VC.NumDoc=VD.CodEmp+VD.CodLocal+VD.TipDoc+VD.SerDoc+VD.NumDoc
and vd.Anulado='0' and vc.Estado<>'003' and vc.estado<>'001' 
and vc.cond_pago<>'023'  -- cesion de cobranza
--and vd.codArt<>'' and   --len(vd.codArt)='12'
and  
vc.CodLocal= case when @CodLocal='0' then vc.CodLocal else @CodLocal end and 
vc.fecdoc >=case when @FechaIni='' then vc.fecdoc else @FechaIni end  and
vc.fecdoc <=case when @FechaFin='' then vc.fecdoc else @FechaFin end  and
vc.CodCp  = case when @Cp='0' then vc.Codcp else @Cp end 
) tbl  order by tbl.Referencia
select *  from TmpDetallexArt 
order by codop
end
/*---Cliente---*/
if @TipoRpt='3'

BEGIN
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpVntxCp]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpVntxCp]  


SELECT
tbl.Fecha,
tbl.Referencia,
tbl.Cliente,
tbl.CodMoneda,
tbl.Moneda,
tbl.CodArt,
tbl.DesArt,
tbl.CanArt,
tbl.Precio_Unit,
tbl.Total,                  
TCambio=tbl.venta,
tbl.codven
into TmpVntxCp 
from(
SELECT 
convert(varchar(12),v.FecDoc,103)Fecha,
vd.TipDoc+'-'+vd.SerDoc+'-'+vd.NumDoc as Referencia,
v.Nom_Cp Cliente,
v.CodMoneda,
case when v.codMoneda='0' then 'Soles' else 'Dolares' end as Moneda,
vd.CodArt,
vd.DEsArt,
case when vd.tipdoc='NCR' then vd.CanArt *-1 else vd.CanArt end CanArt,
case when vd.tipdoc='ncr' then  vd.precio_unit*-1 else vd.Precio_Unit end precio_unit,
case when vd.tipdoc='NCR' then vd.total*-1 else vd.total end Total,
tc.venta,
v.codven
--case when vd.TipDoc='NCR' THEN VD.Total else 0 end TotalNcr
FROM 
VNT_DOC v
left outer join VNT_DOC_detalle vd
on v.CodLocal=vd.CodLocal and v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and v.NumDoc =vd.NumDoc 
left outer join Con_TipoCambio tc
on v.FecDoc= tc.FechaCambio 
where vd.anulado='0' and v.Anulado='0'  
and v.Estado<>'003' and  v.Estado<>'001' AND
v.CodLocal= case when @CodLocal='0' then v.CodLocal else @CodLocal end and 
v.fecdoc >=case when @FechaIni='' then v.fecdoc else @FechaIni end  and
v.fecdoc <=case when @FechaFin='' then v.fecdoc else @FechaFin end  and
v.CodCp  = case when @Cp='0' then v.Codcp else @Cp end 
) tbl  order by tbl.Referencia
select distinct * from TmpVntxCp order by referencia
END
/*-----------------*/
IF @TipoRpt='4'    --- Reporte venta diaria comercializacion e imprentA
BEGIN
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpVtaGen]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpVtaGen]  
select 
'Stock' as Tipo,
isnull(convert(decimal(18,2),sum(TotalSoles)),0) TotalSoles,
isnull(convert(decimal(18,2),sum(TotalDolares)),0) TotalDolares
into TmpVtaGen from
(
SELECT 
DISTINCT
'Stock' as Tipo,
V.TipDoc+'-'+V.SerDoc+'-'+V.NumDoc as Referencia,
convert(varchar(12),V.fecdoc,103) as Fechaconsumo,
V.Nom_Cp Cliente,
V.CodMoneda,
case when V.codMoneda='0' then 'Soles' else 'Dolares' end as Moneda,

case when V.codMoneda='0' then
convert(decimal(18,2),(V.m_base_imponible))end  TotalSoles ,

case when V.codMoneda='1' then
case when v.tipdoc='ncr' then convert(decimal(18,2),(V.m_base_imponible)*-1) else convert(decimal(18,2),(V.m_base_imponible)) end end  TotalDolares
 FROM VNT_DOC V , VNT_DOC_DETALLE VD where
v.CodLocal=vd.CodLocal and
v.TipDoc = vd.TipDoc and 
v.SerDoc = vd.SerDoc and
v.NumDoc =vd.NumDoc and  
VD.CODOP='' AND 
V.estado<>'003' and 
V.estado<>'001' and 
V.anulado='0' and 
vd.anulado='0' and
v.cond_pago<>'023' and
--and  v.tipdoc<>'NCR'
--and v.CODCP<>'011962'
V.CodLocal= case when @CodLocal='0' then V.CodLocal else @CodLocal end and 
V.fecdoc >=case when @FechaIni='' then fecdoc else @FechaIni end  and
V.fecdoc <=case when @FechaFin='' then fecdoc else @FechaFin end  and
v.CodCp=case when @cp='0' then v.codCp else @cp end

)tbl
union all
select 
'x OP'as Tipo,
isnull(convert(decimal(18,2),sum(TotalSoles)),0) Total,
isnull(convert(decimal(18,2),sum(TotalDolares)),0) TotalD

from
(
select DISTINCT
'x OP'as Tipo,
VC.TipDoc+'-'+VC.SerDoc+'-'+VC.NumDoc as Referencia,
convert(varchar(12),VC.fecdoc,103) as FechaImprenta,
VC.Nom_Cp Cliente,
CodMoneda,
case when VC.CodMoneda='0' then 'Soles' else 'Dolares' end as Moneda,
case when VC.CodMoneda='0' then convert(decimal(18,2),(Vc.m_base_imponible)) end TotalSoles,
case when VC.CodMoneda='1' then convert(decimal(18,2),(Vc.m_base_imponible)) end TotalDolares
from VNT_DOC_DETALLE VD ,VNT_DOC VC 
WHERE 
VC.CodEmp+VC.CodLocal+VC.TipDoc+VC.SerDoc+VC.NumDoc=VD.CodEmp+VD.CodLocal+VD.TipDoc+VD.SerDoc+VD.NumDoc AND 
vd.Anulado='0' and 
vc.Anulado='0' and
VD.CODOP<>'' and  --vc.tipdoc<>'NCR' and 
--vc.CODCP<>'011962' and
--vc.cond_pago<>'023' and  -- cesion de cobranza
--vd.NCompOP<>'' and
vc.Estado<>'003' and vc.estado<>'001' and
vC.codcp= case when @cp='0' then vC.codcp else @cp end and 
vc.CodLocal= case when @CodLocal='0' then vc.CodLocal else @CodLocal end and 
vc.fecdoc >=case when @FechaIni='' then vc.fecdoc else @FechaIni end  and
vc.fecdoc <=case when @FechaFin='' then vc.fecdoc else @FechaFin end  
)tbl1

exec sp_TmpResumenDia @CodLocal,'2008',@Mes,@FechaIni,@FechaFin,@moneda
exec sp_TmpResumenConsumoDia @CodLocal,'2008',@Mes,@FechaIni,@FechaFin,@moneda

select * from TmpVtaGen 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpResumenGeneralVnt]') 
	and OBJECTPROPERTY(id, N'IsUserTable') = 1)                
	drop table [dbo].[TmpResumenGeneralVnt]  

select * into TmpResumenGeneralVnt from TmpResumenComercial
union all
select * from TmpResumenConsumo

select * from TmpResumenGeneralVnt
END















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

