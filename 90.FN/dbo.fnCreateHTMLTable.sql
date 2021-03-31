--liquibase formatted sql
--changeset none:none enddelimiter:\nGO runOnChange:true

if exists( select 1 from sys.objects where object_id = object_id( N'[dbo].[fnCreateHTMLTable]' ) and type in ( N'FN', N'IF', N'TF', N'FS', N'FT' ) )
  drop function [dbo].[fnCreateHTMLTable]
GO
CREATE FUNCTION [dbo].[fnCreateHTMLTable]
(
    @SelectForXmlRawElementsXsinil XML
)
RETURNS XML
AS
BEGIN
RETURN
(
   SELECT  
    @SelectForXmlRawElementsXsinil.query('let $first:=/row[1]
                return 
                <tr> 
                {
                for $th in $first/*
                return <th>{local-name($th)}</th>
                }
                </tr>') AS thead
    ,@SelectForXmlRawElementsXsinil.query('for $tr in /row
                 return 
                 <tr>
                 {
                 for $td in $tr/*
                 return <td>{string($td)}</td>
                 }
                 </tr>') AS tbody
    FOR XML PATH('table'),TYPE
 );
END
GO
