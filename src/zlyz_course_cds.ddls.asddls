@AbapCatalog.sqlViewName: 'ZLYZCOURSECDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zlyz_course_cds'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view zlyz_course_cds
  as select from zlyz_course
{
  key id          as Id,
      name        as Name,
      description as Description,
      xbbbe       as Xbbbe,
      xbbba       as Xbbba,
      xbbko       as Xbbko
}
