@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zlyz_course_cds_p'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zlyz_course_cds_p
  provider contract transactional_query
  as projection on zlyz_course_cds
{
    key Id,
    Name,
    Description,
    Xbbbe,
    Xbbba,
    Xbbko
}
