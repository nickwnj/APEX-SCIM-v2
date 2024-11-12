DECLARE
  l_roles     OWA.VC_ARR;
  l_modules   OWA.VC_ARR;
  l_patterns  OWA.VC_ARR;

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'scim',
      p_base_path      => '/v2/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Users/:id',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users/:id',
      p_method         => 'DELETE',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_USERS);
 pkg_p.addvc(pkg_p.PID,:id);

 lresp:=pkg_server.processReq;

 :status_code:=lresp.respcode;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'DELETE',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users/:id',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_USERS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);
 pkg_p.addvc(pkg_p.PATTRIBUTES,:attributes);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'GET',
      p_name               => 'attributes',
      p_bind_variable_name => 'attributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'GET',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users/:id',
      p_method         => 'PUT',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => 'application/scim+json',
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_USERS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);

 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'PUT',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users/:id',
      p_method             => 'PUT',
      p_name               => 'Etag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Groups',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_GROUPS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);

 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'POST',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_GROUPS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);
 pkg_p.addvc(pkg_p.PEXATTRIBUTES,:excludedAttributes);
 pkg_p.addvc(pkg_p.PATTRIBUTES,:attributes);
 pkg_p.addvc(pkg_p.PSORTBY,:sortBy);
 pkg_p.addvc(pkg_p.PSORTORDER,:sortOrder);
 pkg_p.addNum(pkg_p.PSTARTIDX,:startIndex);
 pkg_p.addNum(pkg_p.PROWSCOUNT,:count);
 pkg_p.addvc(pkg_p.PFILTER,:filter);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'sortBy',
      p_bind_variable_name => 'sortBy',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'excludedAttributes',
      p_bind_variable_name => 'excludedAttributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'attributes',
      p_bind_variable_name => 'attributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'sortOrder',
      p_bind_variable_name => 'sortOrder',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'count',
      p_bind_variable_name => 'count',
      p_source_type        => 'URI',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'startIndex',
      p_bind_variable_name => 'startIndex',
      p_source_type        => 'URI',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups',
      p_method             => 'GET',
      p_name               => 'filter',
      p_bind_variable_name => 'filter',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/:id',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/:id',
      p_method         => 'DELETE',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_GROUPS);
 pkg_p.addvc(pkg_p.PID,:id);

 lresp:=pkg_server.processReq;

 :status_code:=lresp.respcode;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'DELETE',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/:id',
      p_method         => 'PUT',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_GROUPS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);
 
 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'PUT',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'PUT',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/:id',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_GROUPS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);
 pkg_p.addvc(pkg_p.PATTRIBUTES,:attributes);
 pkg_p.addvc(pkg_p.PEXATTRIBUTES,:excludedAttributes);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'GET',
      p_name               => 'attributes',
      p_bind_variable_name => 'attributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'GET',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'GET',
      p_name               => 'excludedAttributes',
      p_bind_variable_name => 'excludedAttributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Groups/:id',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/.search',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Groups/.search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_SEARCH);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);

 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Schemas/:id',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Schemas/:id',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_SCHEMAS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);
 pkg_p.addvc(pkg_p.PATTRIBUTES,:attributes);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Schemas/:id',
      p_method             => 'GET',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Schemas/:id',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Schemas',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Schemas',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_SCHEMAS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Schemas',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'ServiceProviderConfig',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'ServiceProviderConfig',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_SERV_PROV_CONF);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'ServiceProviderConfig',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Users',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_USERS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);
 pkg_p.addvc(pkg_p.PEXATTRIBUTES,:excludedAttributes);
 pkg_p.addvc(pkg_p.PATTRIBUTES,:attributes);
 pkg_p.addvc(pkg_p.PSORTBY,:sortBy);
 pkg_p.addvc(pkg_p.PSORTORDER,:sortOrder);
 pkg_p.addNum(pkg_p.PSTARTIDX,:startIndex);
 pkg_p.addNum(pkg_p.PROWSCOUNT,:count);
 pkg_p.addvc(pkg_p.PFILTER,:filter);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'sortOrder',
      p_bind_variable_name => 'sortOrder',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'startIndex',
      p_bind_variable_name => 'startIndex',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'sortBy',
      p_bind_variable_name => 'sortBy',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'excludedAttributes',
      p_bind_variable_name => 'excludedAttributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'attributes',
      p_bind_variable_name => 'attributes',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'filter',
      p_bind_variable_name => 'filter',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'Users',
      p_method             => 'GET',
      p_name               => 'count',
      p_bind_variable_name => 'count',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 100,
      p_mimes_allowed  => 'application/scim+json',
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_USERS);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);

 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'ResourceTypes',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'ResourceTypes',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 50,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_RESOURCE_TYPES);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'ResourceTypes',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'ResourceTypes/:id',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'ResourceTypes/:id',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_RESOURCE_TYPES);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_OBJECT);
 pkg_p.addvc(pkg_p.PID,:id);

 lresp:=pkg_server.processReq;

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'ResourceTypes/:id',
      p_method             => 'GET',
      p_name               => 'ETag',
      p_bind_variable_name => 'etag',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'scim',
      p_pattern            => 'ResourceTypes/:id',
      p_method             => 'GET',
      p_name               => 'id',
      p_bind_variable_name => 'id',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'scim',
      p_pattern        => 'Users/.search',
      p_priority       => 0,
      p_etag_type      => 'NONE',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'scim',
      p_pattern        => 'Users/.search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
 lresp scimresp_typ;
begin
 pkg_p.initDefault;
 
 pkg_p.addvc(pkg_p.PENDPOINT,pkg_endpoint.EP_SEARCH);
 pkg_p.addvc(pkg_p.PRESFORMAT,pkg_c.RES_FMT_JSON_LIST);

 lresp:=pkg_server.processReq(:body);

 htp.p(lresp.respbody);

 :status_code:=lresp.respcode;
 :etag:=lresp.etag;
 pkg_server.updateReq(pkg_p.getvc(pkg_p.PREQUESTID),lresp.respcode);
end;
');

    
  ORDS.CREATE_ROLE(p_role_name => 'SCIMCLIENT');
    
  l_roles(1) := 'OAuth2 Client Developer';
  l_roles(2) := 'RESTful Services';
  l_roles(3) := 'SCIMCLIENT';
  l_modules(1) := 'scim';

  ORDS.DEFINE_PRIVILEGE(
      p_privilege_name => 'SCIMCLIENT',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => 'SCIMCLIENT',
      p_description    => NULL,
      p_comments       => NULL);

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;
        
COMMIT;

END;