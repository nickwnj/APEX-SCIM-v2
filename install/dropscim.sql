drop FUNCTION F_BUILDREF;
drop FUNCTION F_ETAG;
drop FUNCTION F_GETGUID;
drop FUNCTION F_ISO8601;
drop FUNCTION F_TSATUTC;
drop INDEX GRP_MEMBER_IDX;
drop INDEX GRP_UNQ;
drop INDEX SCHEMA_ATTR_HIER_IDX;
drop INDEX USR_ADDRESS_IDX;
drop INDEX USR_EMAIL_IDX;
drop INDEX USR_PHONE_IDX;
drop PACKAGE PKG_C;
drop PACKAGE PKG_E;
drop PACKAGE PKG_ENDPOINT;
drop PACKAGE PKG_FILTER;
drop PACKAGE PKG_GRP;
drop PACKAGE PKG_GUID;
drop PACKAGE PKG_LOG;
drop PACKAGE PKG_P;
drop PACKAGE PKG_SCHEMA;
drop PACKAGE PKG_SERVER;
drop PACKAGE PKG_SERVER_CONF;
drop PACKAGE PKG_USR;
drop PACKAGE XUTL_JSON;
drop PROCEDURE TEST_USER_DELETE;
drop PROCEDURE TEST_USER_GET;
drop TYPE SCIMRESP_TYP;
drop VIEW V_GRP;
drop VIEW V_GRP_MEMBER;
drop VIEW V_RESOURCE_SCHEMA;
drop VIEW V_RESOURCE_TYPE;
drop VIEW V_SCHEMA_ATTR;
drop VIEW V_SCHEMA_ATTR_CHILD_PAR;
drop VIEW V_SCHEMA_ATTR_HIER;
drop VIEW V_SCHEMA_ATTR_PATH;
drop VIEW V_SCHEMA_ATTR_PATH_BAK;
drop VIEW V_SERVICE_PROVIDER_CONFIG;
drop VIEW V_USR;
drop TABLE CONF_STORE;
drop TABLE ENDPOINT;
drop TABLE FILTER_PREDICATE;
drop TABLE GRP_MEMBER;
drop TABLE HTMLDB_PLAN_TABLE;
drop TABLE REQ_STORE;
drop TABLE SCHEMA_ATTR_FLAT;
drop TABLE SCHEMA_ATTR_HIER;
drop TABLE SCIM_LOG;
drop TABLE SERVER_CONF;
drop TABLE USR_ADDRESS;
drop TABLE USR_EMAIL;
drop TABLE USR_PHONE;
drop TABLE GRP;
drop TABLE USR;


declare
 lgroupid varchar2(100); 
begin
 lgroupid:=apex_util.get_group_id('APEXSCIM');
 if lgroupid is not null then
  apex_util.delete_user_group(lgroupid);
 end if; 
end;
/
