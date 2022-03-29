--PEP new field addition to QP and PDT template

Select * from MasterFields Where Fieldname='ACPromoIncentive'

Select Distinct ClientID, CategoryCodeID from SiteCOntrol..vw_catinfo Where FVCCType in (2,6)
and ClientPDT=1 and CategoryCodeID not in (Select CategoryCodeID from vw_QvfcFields Where FieldID=299)

Select Top 10 * from QueryViewTemplatesDetail Where DisplaySeq is null

--QP Page
--Insert into QueryViewTemplatesDetail (QueryTemplateID,FieldId,DisplayName,SelectionPage,HelpMeSelect)
Select Distinct Q.QueryTemplateID,299,'Ad Block Incentive Type',1,0 
from QueryViewTemplatesDetail D
Join QueryViewControl Q
On D.QueryTemplateID = Q.QueryTemplateID 
Where CategoryCodeID in 
(Select Distinct CategoryCodeID from SiteCOntrol..vw_catinfo Where FVCCType in (2,6)
and ClientPDT=1 and CategoryCodeID not in (Select CategoryCodeID from vw_QvfcFields Where FieldID=299))

--PDT template
--Insert into ReportFormatTemplatesDetail 
Select Distinct RptTemplateID,299 FieldID,MaxDisplaySeq +1 DisplaySeq,'Ad Block Incentive Type' DisplayName,1 Filter,0 Link,NULL AdsDisplaySeq,NULL IsPage
from (
Select Distinct D.RptTemplateID,MAX(displayseq) as MaxDisplaySeq  
from ReportFormatTemplatesDetail D
Join ReportFormatControl R
On R.RptTemplateID = D.RptTemplateID 
Where R.RptTemplateID in (Select RptTemplateID  from vw_ReportFields Where IsPDTTemplate=1 
and CategoryCodeID in (Select Distinct CategoryCodeID from SiteCOntrol..vw_catinfo Where FVCCType in (2,6)
and ClientPDT=1))  
Group By D.RptTemplateID ) X Order by 1

--CWM template
--Insert into ReportFormatTemplatesDetail 
Select Distinct RptTemplateID,299 FieldID,MaxDisplaySeq +1 DisplaySeq,'Ad Block Incentive Type' DisplayName,1 Filter,0 Link,NULL AdsDisplaySeq,NULL IsPage
from (
Select Distinct D.RptTemplateID,MAX(displayseq) as MaxDisplaySeq  
from ReportFormatTemplatesDetail D
Join ReportFormatControl R
On R.RptTemplateID = D.RptTemplateID 
Where R.RptTemplateID in (Select RptTemplateID  from vw_ReportFields Where IsPDTTemplate=0 
and CategoryCodeID in (Select Distinct CategoryCodeID from SiteCOntrol..vw_catinfo Where FVCCType in (2,6)
and (CWMFUll=1 or ClientPDT=1)))  
Group By D.RptTemplateID ) X Order by 1
