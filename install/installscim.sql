CREATE TABLE "CONF_STORE" 
   (	"ID" NVARCHAR2(32), 
	"DOCNAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"CHILDDOCID" NVARCHAR2(32), 
	"ENDPOINTNAME" VARCHAR2(100), 
	"CONFTYPE" VARCHAR2(10) NOT NULL ENABLE, 
	"DOCSTORE" CLOB, 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "CONF_STORE_TYP_CK" CHECK ( "CONFTYPE" in ('SCHEMA','CONFIG') ) ENABLE, 
	 CONSTRAINT "CONF_STORE_PK" PRIMARY KEY ("ID")
  USING INDEX ENABLE);

  CREATE TABLE "REQ_STORE" 
   (	"ID" VARCHAR2(32) NOT NULL ENABLE, 
	"ENDPOINT" VARCHAR2(50) NOT NULL ENABLE, 
	"METHOD" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"PATH" VARCHAR2(1000) NOT NULL ENABLE, 
	"REQTS" TIMESTAMP (6) NOT NULL ENABLE, 
	"BODY" BLOB, 
	"RESHTTPCODE" NUMBER, 
	"RESTS" TIMESTAMP (6), 
	 CONSTRAINT "REQUEST_STORE_CON" CHECK ( "BODY" IS JSON ) ENABLE, 
	 CONSTRAINT "REQ_STORE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE);
    
  CREATE TABLE "SERVER_CONF" 
   (	"ITEMNAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"VCVAL" VARCHAR2(500 CHAR), 
	"NUMVAL" NUMBER, 
	"JSONVAL" CLOB
   ) ;

  CREATE TABLE "ENDPOINT" 
   (	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"PATH" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100), 
	"URN" NVARCHAR2(100), 
	"READONLY" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"ISENABLED" VARCHAR2(5) NOT NULL ENABLE, 
	"ISRESOURCETYPE" VARCHAR2(5) NOT NULL ENABLE, 
	"RESOURCETYPE" VARCHAR2(50), 
	"RESPVIEW" VARCHAR2(30), 
	"SORTCOLDEFAULT" VARCHAR2(30), 
	 CONSTRAINT "ENDPOINT_PK" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "FILTER_PREDICATE" 
   (	"SCIMEXPRESSION" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"SQLEXPRESSION" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"ISENABLED" VARCHAR2(5) NOT NULL ENABLE, 
	"PARTCOUNT" NUMBER
   ) ;

  CREATE TABLE "GRP" 
   (	"ID" VARCHAR2(32) NOT NULL ENABLE, 
	"EXTERNALID" VARCHAR2(200), 
	"DISPLAYNAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(500), 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "GROUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "GRP_MEMBER" 
   (	"ID" VARCHAR2(32) NOT NULL ENABLE, 
	"GROUPID" VARCHAR2(32) NOT NULL ENABLE, 
	"MEMBERID" VARCHAR2(32) NOT NULL ENABLE, 
	"MEMBERTYPE" VARCHAR2(10) NOT NULL ENABLE, 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "GRP_MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "GRP_MEMBER_TYPE_CK" CHECK ( "MEMBERTYPE" IN ('User','Group') ) ENABLE
   ) ;

  CREATE TABLE "HTMLDB_PLAN_TABLE" 
   (	"STATEMENT_ID" VARCHAR2(30), 
	"PLAN_ID" NUMBER, 
	"TIMESTAMP" DATE, 
	"REMARKS" VARCHAR2(4000), 
	"OPERATION" VARCHAR2(30), 
	"OPTIONS" VARCHAR2(255), 
	"OBJECT_NODE" VARCHAR2(128), 
	"OBJECT_OWNER" VARCHAR2(128), 
	"OBJECT_NAME" VARCHAR2(128), 
	"OBJECT_ALIAS" VARCHAR2(261), 
	"OBJECT_INSTANCE" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(128), 
	"OPTIMIZER" VARCHAR2(255), 
	"SEARCH_COLUMNS" NUMBER, 
	"ID" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"DEPTH" NUMBER(*,0), 
	"POSITION" NUMBER(*,0), 
	"COST" NUMBER(*,0), 
	"CARDINALITY" NUMBER(*,0), 
	"BYTES" NUMBER(*,0), 
	"OTHER_TAG" VARCHAR2(255), 
	"PARTITION_START" VARCHAR2(255), 
	"PARTITION_STOP" VARCHAR2(255), 
	"PARTITION_ID" NUMBER(*,0), 
	"OTHER" LONG, 
	"DISTRIBUTION" VARCHAR2(30), 
	"CPU_COST" NUMBER(*,0), 
	"IO_COST" NUMBER(*,0), 
	"TEMP_SPACE" NUMBER(*,0), 
	"ACCESS_PREDICATES" VARCHAR2(4000), 
	"FILTER_PREDICATES" VARCHAR2(4000), 
	"PROJECTION" VARCHAR2(4000), 
	"TIME" NUMBER(*,0), 
	"QBLOCK_NAME" VARCHAR2(128)
   ) ;

  CREATE TABLE "SCHEMA_ATTR_FLAT" 
   (	"PATH" VARCHAR2(500 CHAR) NOT NULL ENABLE, 
	"VALUE" VARCHAR2(4000 CHAR) NOT NULL ENABLE, 
	"SCHEMA" VARCHAR2(50 CHAR), 
	 CONSTRAINT "ATTR_FLAT_CON" PRIMARY KEY ("SCHEMA", "PATH")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SCHEMA_ATTR_HIER" 
   (	"ID" VARCHAR2(32) NOT NULL ENABLE, 
	"PARENTID" VARCHAR2(32), 
	"NAME" VARCHAR2(500 CHAR), 
	"JSONTYPENAME" VARCHAR2(10), 
	"VALUE" VARCHAR2(4000 CHAR), 
	"SCHEMA" VARCHAR2(50 CHAR), 
	"SEQ" NUMBER
   ) ;

  CREATE TABLE "SCIM_LOG" 
   (	"REQID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LVL" NUMBER NOT NULL ENABLE, 
	"TS" TIMESTAMP (6) NOT NULL ENABLE, 
	"LOCATION" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"ENTRYNAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"ENTRYDETAIL" VARCHAR2(4000 CHAR)
   ) ;

  CREATE TABLE "USR" 
   (	"ID" VARCHAR2(32) NOT NULL ENABLE, 
	"EXTERNALID" VARCHAR2(200), 
	"USERNAME" VARCHAR2(100 CHAR), 
	"NAMEFAMILY" VARCHAR2(100), 
	"NAMEGIVEN" VARCHAR2(100), 
	"NAMEMIDDLE" VARCHAR2(100), 
	"NAMEDISPLAY" VARCHAR2(100 CHAR), 
	"HONORIFICPREFIX" VARCHAR2(100), 
	"HONORIFICSUFFIX" VARCHAR2(100), 
	"TITLE" VARCHAR2(100 CHAR), 
	"USERTYPE" VARCHAR2(100 CHAR), 
	"PREFERREDLANGUAGE" VARCHAR2(100 CHAR), 
	"LOCALE" VARCHAR2(100 CHAR), 
	"TIMEZONE" VARCHAR2(100 CHAR), 
	"ACTIVE" VARCHAR2(100 CHAR), 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	"DELETED" VARCHAR2(5), 
	 CONSTRAINT "USR_EXTID_UNQ" UNIQUE ("EXTERNALID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "USR_USERNAME_UNQ" UNIQUE ("USERNAME")
  USING INDEX  ENABLE, 
	 CONSTRAINT "USR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "USR_ADDRESS" 
   (	"USRID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FORMATTED" VARCHAR2(250 CHAR), 
	"STREET" VARCHAR2(50 CHAR), 
	"LOCALITY" VARCHAR2(50 CHAR), 
	"REGION" VARCHAR2(50 CHAR), 
	"POSTALCODE" VARCHAR2(50 CHAR), 
	"COUNTRY" VARCHAR2(50 CHAR), 
	"TYPE" VARCHAR2(10 CHAR), 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "USR_ADDRESS_TYPE_CK" CHECK ( "TYPE" in ('work','home','other') ) ENABLE
   ) ;

  CREATE TABLE "USR_EMAIL" 
   (	"USRID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VALUE" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"TYPE" VARCHAR2(10 CHAR), 
	"PRIMARY" VARCHAR2(5 CHAR), 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "USR_EMAIL_TYPE_CK" CHECK ( "TYPE" IN ('work','home','other') ) ENABLE, 
	 CONSTRAINT "USR_EMAIL_PRIMARY_CK" CHECK ( "PRIMARY" in ('true','false') ) ENABLE
   ) ;

  CREATE TABLE "USR_PHONE" 
   (	"USRID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VALUE" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"TYPE" VARCHAR2(10 CHAR), 
	"PRIMARY" VARCHAR2(5 CHAR), 
	"CREATED" TIMESTAMP (6) NOT NULL ENABLE, 
	"LASTMODIFIED" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "USR_PHONE_TYPE_CK" CHECK ( "TYPE" in ('work','home','mobile','fax','pager','other') ) ENABLE, 
	 CONSTRAINT "USR_PHONE_PRIMARY_CK" CHECK ( "PRIMARY" in ('true','false') ) ENABLE
   ) ;

  ALTER TABLE "CONF_STORE" ADD CONSTRAINT "CONF_STORE_CON" FOREIGN KEY ("CHILDDOCID")
	  REFERENCES "CONF_STORE" ("ID") ENABLE;

  CREATE UNIQUE INDEX "GRP_UNQ" ON "GRP" ("DISPLAYNAME") 
  ;

  ALTER TABLE "GRP_MEMBER" ADD CONSTRAINT "GRP_MEMBER_GROUP_FK" FOREIGN KEY ("GROUPID")
	  REFERENCES "GRP" ("ID") ON DELETE CASCADE ENABLE;

  CREATE INDEX "GRP_MEMBER_IDX" ON "GRP_MEMBER" ("GROUPID") 
  ;

  CREATE INDEX "SCHEMA_ATTR_HIER_IDX" ON "SCHEMA_ATTR_HIER" ("PARENTID", "ID") 
  ;

  ALTER TABLE "USR_ADDRESS" ADD CONSTRAINT "USR_ADDRESS_FK" FOREIGN KEY ("USRID")
	  REFERENCES "USR" ("ID") ON DELETE CASCADE ENABLE;

  CREATE INDEX "USR_ADDRESS_IDX" ON "USR_ADDRESS" ("USRID") 
  ;

  ALTER TABLE "USR_EMAIL" ADD CONSTRAINT "USR_EMAIL_FK" FOREIGN KEY ("USRID")
	  REFERENCES "USR" ("ID") ON DELETE CASCADE ENABLE;

  CREATE INDEX "USR_EMAIL_IDX" ON "USR_EMAIL" ("USRID") 
  ;

  ALTER TABLE "USR_PHONE" ADD CONSTRAINT "USR_PHONE_FK" FOREIGN KEY ("USRID")
	  REFERENCES "USR" ("ID") ON DELETE CASCADE ENABLE;

  CREATE INDEX "USR_PHONE_IDX" ON "USR_PHONE" ("USRID") 
  ;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GRP" ("ENDPOINTNAME", "ENDPOINTPATH", "EXTERNALID", "RESOURCEPATH", "URN", "ID", "LASTMODIFIED", "RESPJSON") AS 
  select a.name endpointname
       , a.path endpointpath
       , b.externalid
       , concat('/', b.id) resourcepath
       , a.urn
       , b.id
       , b.lastmodified
       , json_object(key 'schemas' value json_array(a.urn)
                   ,key 'id' value b.id
                   ,key 'displayName' value b.displayname
                   ,key 'externalId' value b.externalid
                   ,key 'members' value (select json_arrayagg(json_object(key 'id' value c.memberid
                                                                  ,key 'displayName' value c.memberdisplayname
                                                                  ,key '$ref' value f_buildref(c.path,c.memberid)
                                                                  ,key 'type' value c.membertype 
                                                                 )  FORMAT JSON ABSENT ON NULL
                                                     ) from v_grp_member c where b.id=c.groupid
                                           )
                   ,key 'meta' value json_object(key 'resourceType' value a.resourceType
                                                 ,key 'created' value b.created
                                                 ,key 'lastModified' value b.lastModified
                                                 ,key 'location' value f_buildref(a.path,b.id)
                                                 ,key 'version' value f_etag(b.lastmodified)
                                                )
                  ) respjson
 from endpoint a, grp b
 where a.name='Groups';

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GRP_MEMBER" ("GROUPMEMBERID", "GROUPID", "GROUPDISPLAYNAME", "GROUPCREATED", "GROUPLASTMODIFIED", "MEMBERID", "MEMBERTYPE", "MEMBERCREATED", "MEMBERLASTMODIFIED", "DIRECTINDIRECTTYPE", "MEMBERDISPLAYNAME", "PATH") AS 
  with resources as(
    select id, 'Group' membertype, displayname from grp
    union all
    select id, 'User' membertype, namedisplay from usr where deleted='false'
)  select a.id groupmemberid, b.id groupid, b.displayname groupdisplayname, b.created groupcreated, b.lastmodified grouplastmodified  
  , a.memberid, a.membertype, a.created membercreated, a.lastmodified memberlastmodified
  , decode(rootmemberid, memberid, 'direct','indirect') directindirecttype, c.displayname memberdisplayname, d.path
 from (
    select id, connect_by_root groupid groupid, connect_by_root memberid rootmemberid, memberid, membertype, lastmodified, created
  from grp_member a
  connect by prior memberid=groupid 
  and prior membertype='Group'
  ) a, grp b, resources c, endpoint d
 where a.groupid=b.id(+)
  and a.memberid=c.id(+)
  and a.membertype=c.membertype(+)
  and a.membertype=d.resourcetype(+);

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RESOURCE_SCHEMA" ("ENDPOINTNAME", "ENDPOINTPATH", "ENDPOINTURN", "ID", "RESOURCEPATH", "RESOURCEURN", "RESOURCETYPE", "SCHEMANAME", "LASTMODIFIED", "RESPJSON") AS 
  select a.name endpointname
   , a.path endpointpath
   , a.urn endpointurn
   , c.resourcetype id
   , c.path resourcepath
   , c.urn resourceurn
   , c.resourcetype 
   , b.docname schemaname
   , b.lastmodified   
   , JSON_MERGEPATCH(
                     json_object(key 'id' value c.urn
                                ,key 'name' value c.resourcetype
                                ,key 'description' value c.description
                                  returning clob
                                )
                                 ,JSON_MERGEPATCH(json_query(b.docstore,'$' returning clob)
                                 ,json_object(key 'meta' value json_object(key 'location' value f_buildref(a.path,c.resourcetype)
                                              ,key 'resourceType' value a.resourceType
                                              ,key 'created' value b.created
                                              ,key 'lastModified' value b.lastmodified
                                               returning clob
                               )
                                               )
                                               returning clob

                          
      )
         returning clob) respjson     
 from endpoint a, conf_store b, endpoint c
 where a.name=b.endpointname
 and b.docname=c.resourcetype
 and a.name='Schemas';

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RESOURCE_TYPE" ("ENDPOINTNAME", "ENDPOINTPATH", "ID", "RESOURCEPATH", "LASTMODIFIED", "RESPJSON") AS 
  select a.name endpointname, a.path endpointpath,b.resourceType id,b.path resourcepath,null
   ,json_object(key 'schemas' value json_array(a.urn)
               ,key 'id' value b.resourcetype
               ,key 'name' value b.resourcetype
               ,key 'endpoint' value b.path
               ,key 'description' value b.description
               ,key 'schema' value b.urn
               ,key 'meta' value json_object(key 'location' value F_BUILDREF(a.path,b.resourceType)
                                             ,key 'resourceType' value a.resourceType
                                            )
              ) respjson
from endpoint a, endpoint b
where a.name='ResourceTypes'
and b.isresourcetype='true';

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SCHEMA_ATTR" ("SCHEMA", "ATTRID", "ATTRPATH", "ATTRSEQ", "NAME", "UNIQUENESS", "RETURNED", "MUTABILITY", "CASEEXACT", "REQUIRED", "DESCRIPTION", "MULTIVALUED", "TYPE") AS 
  with schemahier as 
(
 select schema, prior id attrid, prior sys_connect_by_path(name||seq,'.') attrpath, prior seq attrseq, a.name, a.value, sys_connect_by_path(name||seq,'.') path, seq
 from schema_attr_hier a
 where value is not null
 and seq is null
 connect by a.parentid=prior a.id
 start with a.parentid is null
)
, xmlgroup as (
 select b.schema, b.attrid, b.attrpath, b.attrseq, xmlelement("cols", xmlagg(xmlelement(evalname(b.name), b.value))) xmlvals
 from schemahier b
 group by b.schema, b.attrid, b.attrpath, b.attrseq
) 
select a.schema, a.attrid, a.attrpath, a.attrseq, b."NAME",b."UNIQUENESS",b."RETURNED",b."MUTABILITY",b."CASEEXACT",b."REQUIRED",b."DESCRIPTION",b."MULTIVALUED",b."TYPE" 
from xmlgroup a ,
xmltable('/cols' passing xmlvals columns 
name varchar2(100) path 'name',
uniqueness varchar2(50) path 'uniqueness',
returned varchar2(50) path 'returned',
mutability varchar2(50) path 'mutability',
caseExact varchar2(50) path 'caseExact',
required varchar2(50) path 'required',
description varchar2(4000) path 'description',
multiValued varchar2(50) path 'multiValued',
type varchar2(50) path 'type') b;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SCHEMA_ATTR_CHILD_PAR" ("SCHEMA", "CHILDID", "CHILDNAME", "PARENTID", "PARENTNAME") AS 
  select a.schema, a.attrid childid, a.name childname, c.attrid parentid, c.name parentname
from v_schema_attr a, 
(
 select connect_by_root id rootid, id 
 from schema_attr_hier 
 connect by prior parentid=id
 ) b,
 v_schema_attr c
where a.attrid=b.rootid
and b.id=c.attrid
and a.attrid<>c.attrid;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SCHEMA_ATTR_HIER" ("SCHEMA", "JSONID", "JSONPARENTID", "PARENTJSONNAME", "JSONNAME", "JSONTYPENAME", "VALUE", "SEQ") AS 
  select schema, id jsonid, parentid jsonparentid, prior name parentjsonname, name jsonname, jsontypename, value, seq
from schema_attr_hier a
connect by a.parentid=prior a.id
start with a.parentid is null
order by id;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SCHEMA_ATTR_PATH" ("SCHEMA", "ATTRID", "NAME", "ATTRPATH", "JSONPATH") AS 
  select b.schema, attrid, b.name
, (select listagg(d.name,'.') 
   within group (order by d.attrid) 
   from v_schema_attr d,
    (select * from schema_attr_hier f connect by prior f.parentid=f.id start with f.id=b.attrid) e
   where d.attrid=e.id
  )  attrpath
  ,(select listagg(
     case when c.parentid is null then '$'
     when d.name is not null then d.name
     when c.jsontypename='Object' then '.'
     when c.jsontypename='Array' then '[*].'     
     end
     ) within group (order by c.id) 
     from schema_attr_hier c, v_schema_attr d 
     where c.id=d.attrid(+)
     connect by prior parentid=id 
     start with c.id=b.attrid
   ) jsonpath
from v_schema_attr b;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SCHEMA_ATTR_PATH_BAK" ("SCHEMA", "ATTRID", "NAME", "ATTRPATH") AS 
  select schema, attrid, name
, (select listagg(b.name,'.') 
   within group (order by b.attrid) 
   from v_schema_attr b,
    (select * from schema_attr_hier c connect by prior c.parentid=c.id start with c.id=a.attrid) c
   where b.attrid=c.id
  )  
from v_schema_attr a;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SERVICE_PROVIDER_CONFIG" ("ENDPOINTNAME", "ENDPOINTPATH", "ID", "RESOURCEPATH", "URN", "LASTMODIFIED", "RESPJSON") AS 
  select a.name,a.path,a.resourcetype,a.path,a.urn,b.lastmodified,JSON_MERGEPATCH(
                                            json_object(key 'schemas' value json_array(a.urn))
                                                        ,JSON_MERGEPATCH(json_query(b.docstore,'$')
                                                        ,json_object(key 'meta' value json_object(key 'location' value f_buildref(a.path)
                                                                                                 ,key 'resourceType' value a.resourceType
                                                                                                 ,key 'created' value b.created
                                                                                                 ,key 'lastModified' value b.lastmodified
                                                                                                ))
                                             )
                                            ) respjson
 from endpoint a, conf_store b
 where a.name=b.endpointname
 and a.name='ServiceProviderConfig';

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_USR" ("RESPJSON", "LASTMODIFIED", "ENDPOINTNAME", "ENDPOINTPATH", "RESOURCEPATH", "SCHEMAS", "ID", "EXTERNALID", "USERNAME", "DISPLAYNAME", "TITLE", "USERTYPE", "PREFERREDLANGUAGE", "LOCALE", "TIMEZONE", "ACTIVE", "NAME", "ADDRESSES", "PHONENUMBERS", "EMAILS", "GROUPS", "META") AS 
  with usrrows as
  (
    select a.name endpointname
       , a.path endpointpath
       , concat('/',b.id) resourcepath
       , json_array(a.urn) schemas
       , b.username
       , b.id
       , b.externalid
       , b.namedisplay displayname
       , b.title
       , b.usertype
       , b.preferredlanguage
       , b.locale
       , b.timezone
       , b.active
       , b.lastmodified       
       , json_object(key 'familyName' value b.namefamily
                                                 ,key 'givenName' value b.namegiven
                                                 ,key 'middleName' value b.namemiddle
                                                 ,key 'honorificPrefix' value b.honorificprefix
                                                 ,key 'honorificSuffix' value b.honorificsuffix 
                                                 ) name
       , (select json_arrayagg(json_object(key 'type' value c.type
                                                 ,key 'streetAddress' value c.street
                                                 ,key 'locality' value c.locality
                                                 ,key 'region' value c.region
                                                 ,key 'postalCode' value c.postalcode
                                                 ,key 'country' value c.country
                                                 ,key 'formatted' value c.formatted FORMAT JSON ABSENT ON NULL
                                                 ) FORMAT JSON ABSENT ON NULL) 
                                                 from usr_address c
                                                 where c.usrid=b.id) addresses
       , (select json_arrayagg(json_object(key 'value' value c.value
                                                 ,key 'type' value c.type
                                                 ,key 'primary' value c.primary FORMAT JSON ABSENT ON NULL
                                                 ) FORMAT JSON ABSENT ON NULL) 
                                                 from usr_phone c
                                                 where c.usrid=b.id) phonenumbers
              , (select json_arrayagg(json_object(key 'value' value c.value
                                                 ,key 'type' value c.type
                                                 ,key 'primary' value c.primary FORMAT JSON ABSENT ON NULL
                                                 ) FORMAT JSON ABSENT ON NULL) 
                                                 from usr_email c
                                                 where c.usrid=b.id
                                                 ) emails     
              , (select json_arrayagg(json_object(key 'value' value c.groupid  
                                                 ,key 'displayName' value c.groupdisplayname 
                                                 ,key 'type' value c.directindirecttype    
                                                 ,key '$ref' value F_BUILDREF('/Groups',c.groupid)
                                                 ) FORMAT JSON ABSENT ON NULL) groups
                                                 from v_grp_member c
                                                 where c.memberid=b.id) groups                                          
       , json_object(key 'resourceType' value a.resourceType
                                                 ,key 'created' value b.created
                                                 ,key 'lastModified' value b.lastModified
                                                 ,key 'location' value f_buildref(a.path,b.id)
                                                 ,key 'version' value f_etag(b.lastmodified)
                                                ) meta
 from endpoint a, usr b
 where a.name='Users'
 and b.deleted='false'
  ) 
  select json_object(schemas,id,externalid,userName,name,displayName,title,userType,preferredLanguage,locale,timezone,active,emails,phoneNumbers,addresses,groups,meta FORMAT JSON ABSENT ON NULL) respjson, 
  a.lastmodified, a.endpointname,a.endpointpath,a.resourcepath,a.schemas,a.id,a.externalid,a.username,a.displayname,
  a.title,a.usertype,a.preferredlanguage,a.locale,a.timezone,a.active,a.name,a.addresses,a.phonenumbers,a.emails,a.groups,a.meta
from usrrows a;

create or replace TYPE scimresp_typ AS OBJECT ( 
   respcode        NUMBER,
   etag            VARCHAR2(20),
   respbody        CLOB)
/


create or replace function "F_BUILDREF"(pendpoint varchar2, presourceid varchar2:=null)
return varchar2 deterministic
as
begin
    return pkg_c.CONF_MODULE_PREFIX||pendpoint||case when presourceid is null then null else '/'||presourceid end;
end "F_BUILDREF";
/

create or replace function "F_ETAG"(pts timestamp) return varchar2
DETERMINISTIC
as
 letag varchar2(14);
begin
 select to_char(pts,'YYMMDDHH24MISSFF2') into letag from dual;
 return 'W/"'||letag||'"' ;
end "F_ETAG";
/

create or replace function "F_GETGUID"
return varchar2
as
begin
    return sys_guid();
end "F_GETGUID";
/

create or replace function "F_ISO8601"(pts timestamp)
return varchar2
as
begin
    return to_char(pts,'yyyy-mm-dd"T"hh24:mi:ss"Z"');
end "F_ISO8601";
/

create or replace function "F_TSATUTC"
return timestamp
as
begin
    return systimestamp AT TIME ZONE 'UTC' ;
end "F_TSATUTC";
/

--   CREATE UNIQUE INDEX "ATTR_FLAT_CON" ON "SCHEMA_ATTR_FLAT" ("SCHEMA", "PATH");
--   CREATE UNIQUE INDEX "CONF_STORE_PK" ON "CONF_STORE" ("ID");
--   CREATE UNIQUE INDEX "ENDPOINT_PK" ON "ENDPOINT" ("NAME");
--   CREATE UNIQUE INDEX "GROUP_PK" ON "GRP" ("ID");
--   CREATE INDEX "GRP_MEMBER_IDX" ON "GRP_MEMBER" ("GROUPID");
--   CREATE UNIQUE INDEX "GRP_MEMBER_PK" ON "GRP_MEMBER" ("ID");
--   CREATE UNIQUE INDEX "GRP_UNQ" ON "GRP" ("DISPLAYNAME");
--   CREATE UNIQUE INDEX "REQ_STORE_PK" ON "REQ_STORE" ("ID");
--   CREATE INDEX "SCHEMA_ATTR_HIER_IDX" ON "SCHEMA_ATTR_HIER" ("PARENTID", "ID");
--   CREATE INDEX "USR_ADDRESS_IDX" ON "USR_ADDRESS" ("USRID");
--   CREATE INDEX "USR_EMAIL_IDX" ON "USR_EMAIL" ("USRID");
--   CREATE UNIQUE INDEX "USR_EXTID_UNQ" ON "USR" ("EXTERNALID");
--   CREATE INDEX "USR_PHONE_IDX" ON "USR_PHONE" ("USRID");
--   CREATE UNIQUE INDEX "USR_PK" ON "USR" ("ID");
--   CREATE UNIQUE INDEX "USR_USERNAME_UNQ" ON "USR" ("USERNAME");

create or replace package "PKG_GUID" as
 subtype guid is varchar2(32);
end "PKG_GUID";
/

create or replace package "PKG_C" as
 /*CONSTANTS*/
 
 METHOD_DELETE              CONSTANT varchar2(10):='DELETE';
 METHOD_GET                 CONSTANT varchar2(10):='GET';
 METHOD_POST                CONSTANT varchar2(10):='POST';
 METHOD_PUT                 CONSTANT varchar2(10):='PUT';

 HEADER_IF_MATCH            CONSTANT varchar2(20):='If-Match';
 HEADER_IFNONE_MATCH        CONSTANT varchar2(20):='xIf-None-Match';
 HEADER_REQUEST_METHOD      CONSTANT varchar2(20):='REQUEST_METHOD';
 HEADER_PATH_INFO           CONSTANT varchar2(20):='PATH_INFO';
 HEADER_SCRIPT_NAME         CONSTANT varchar2(20):='SCRIPT_NAME';

 RES_CODE_OK                CONSTANT NUMBER:=200;
 RES_CODE_CREATED           CONSTANT NUMBER:=201;
 RES_CODE_DELETE            CONSTANT NUMBER:=204;
 RES_CODE_NOT_MODIFIED      CONSTANT NUMBER:=304;
 RES_CODE_BAD_REQ           CONSTANT NUMBER:=400;
 RES_CODE_NOT_FOUND         CONSTANT NUMBER:=404;
 RES_CODE_CONFLICT          CONSTANT NUMBER:=409;
 RES_CODE_PRECOND_FAIL      CONSTANT NUMBER:=412;
 RES_CODE_SERVER_ERROR      CONSTANT NUMBER:=500;

 RES_FMT_JSON_OBJECT        CONSTANT varchar2(10):='OBJECT';
 RES_FMT_JSON_LIST          CONSTANT varchar2(10):='LIST'; 

 CONF_ITEMS_PER_PAGE        CONSTANT VARCHAR2(50):='ITEMS_PER_PAGE';
 CONF_LOG_LEVEL             CONSTANT VARCHAR2(50):='LOG_LEVEL';
 CONF_MODULE_PREFIX         CONSTANT varchar2(10):='/v2'; 

 QUERY_DEFAULT_ORDER        CONSTANT VARCHAR2(10):='asc';
 QUERY_DEFAULT_COL          CONSTANT VARCHAR2(30):='respjson';
 QUERY_LAST_MOD_COL         CONSTANT VARCHAR2(30):='lastmodified';
 QUERY_BINDS_PREFIX         CONSTANT VARCHAR2(10):='V'; 
 QUERY_DOLLAR_SIGN          CONSTANT VARCHAR2(10):='$';
 QUERY_COLON                CONSTANT VARCHAR2(10):=':'; 

 ETAG_ANY                   CONSTANT VARCHAR2(1):='*';

end "PKG_C";
/
create or replace package "PKG_E" as
 /*EXCEPTIONS*/

 sort_invalid   EXCEPTION;    
 sort_invalid_en  PLS_INTEGER := -20100;    
 PRAGMA EXCEPTION_INIT (sort_invalid, -20100);  

 method_invalid     exception;    
 method_invalid_en  PLS_INTEGER := -20101;    
 PRAGMA EXCEPTION_INIT (sort_invalid, -20101);      

 endpoint_invalid   exception;    
 endpoint_invalid_en  PLS_INTEGER := -20102;    
 PRAGMA EXCEPTION_INIT (sort_invalid, -20102);   

 schema_not_found   exception;
 schema_not_found_en number:=-20103;
 pragma exception_init(schema_not_found,-20103);

 attr_not_found     exception;
 attr_not_found_en number:=-20104;
 pragma exception_init(attr_not_found,-20104);

 resource_not_found exception;
 resource_not_found_en number:=-20105;
 pragma exception_init(resource_not_found,-20105);

 search_parse       exception;
 search_parse_en number:=-20106;
 pragma exception_init(search_parse,-20106);

 resource_type_invalid       exception;
 resource_type_invalid_en number:=-20107;
 pragma exception_init(resource_type_invalid,-20107);

 resource_exists      exception;
 resource_exists_en number:=-20108;
 pragma exception_init(resource_exists,-20108);

 required_attr_missing      exception;
 required_attr_missing_en number:=-20109;
 pragma exception_init(required_attr_missing,-20109);

 body_parse      exception;
 body_parse_en number:=-20110;
 pragma exception_init(body_parse,-20110);

 filter_invalid      exception;
 filter_invalid_en number:=-20111;
 pragma exception_init(filter_invalid,-20111);

 function lookupResponseCode(psqlcode number) return number;
 function generateErrorResponse(prescode number, pdetail varchar2:=null) return json_object_t;

end "PKG_E";
/
create or replace package "PKG_ENDPOINT" as

 EP_SERV_PROV_CONF          CONSTANT VARCHAR2(30):='ServiceProviderConfig';
 EP_SCHEMAS                 CONSTANT VARCHAR2(30):='Schemas';
 EP_GROUPS                  CONSTANT VARCHAR2(30):='Groups';
 EP_ME                      CONSTANT VARCHAR2(30):='Me';
 EP_USERS                   CONSTANT VARCHAR2(30):='Users';
 EP_BULK                    CONSTANT VARCHAR2(30):='Bulk';
 EP_RESOURCE_TYPES          CONSTANT VARCHAR2(30):='ResourceTypes';
 EP_SEARCH                  CONSTANT VARCHAR2(30):='Search';

 subtype t_endpoint is endpoint%rowtype;
 
 function isValidEndpoint(pname varchar2) return boolean DETERMINISTIC;
 function getEndpointByName(pname varchar2) return t_endpoint;
 function getEndpointRespView(pname varchar2) return varchar2;
 function getResourceTypeSchema(pname varchar2) return varchar2;

end "PKG_ENDPOINT";
/
create or replace package "PKG_FILTER" as
 
 PREDICATE_ATTR_PLACEHOLDER      CONSTANT varchar2(10):='$attr';
 PREDICATE_VALUE_PLACEHOLDER     CONSTANT varchar2(10):='$bind';

 BLANK_SPACE                     CONSTANT varchar2(1):=chr(32);
 
 PREDICATE_OPER_EQUALS           CONSTANT varchar2(2):='eq';
 PREDICATE_OPER_NOT_EQUALS       CONSTANT varchar2(2):='ne';
 PREDICATE_OPER_CONTAINS         CONSTANT varchar2(2):='co';
 PREDICATE_OPER_STARTS_WITH      CONSTANT varchar2(2):='sw';
 PREDICATE_OPER_ENDS_WITH        CONSTANT varchar2(2):='ew';
 PREDICATE_OPER_PRESENT          CONSTANT varchar2(2):='pr';
 PREDICATE_OPER_GREATER_THAN     CONSTANT varchar2(2):='gt';
 PREDICATE_OPER_GREATER_OR_EQUAL CONSTANT varchar2(2):='ge';
 PREDICATE_OPER_LESS_THAN        CONSTANT varchar2(2):='lt';
 PREDICATE_OPER_LESS_OR_EQUAL    CONSTANT varchar2(2):='le';

 QUOTED_STRING_REPLACEMENT  CONSTANT varchar2(50):='QUOTED_STRING';

 type tab_filterbind is table of varchar2(200) index by varchar2(10);

 subtype t_predicate is filter_predicate%rowtype;
 type tab_predicate is table of varchar2(50) index by varchar2(10);
 
 function getQuotedStrings(pfilter varchar2) return tab_filterbind;
 function replaceQuotedStrings(pfilter varchar2) return varchar2;
 function splitIntoTokens(pfilter varchar2) return apex_t_varchar2;
 function getPredicate(pscimexpression varchar2) return t_predicate;

 procedure parseFilter(pschema varchar2, pfilter varchar2, psql out clob, pbinds in out tab_filterbind);

end "PKG_FILTER";
/
create or replace package "PKG_GRP" as

procedure mergeUserMemberships(puserid pkg_guid.guid, preq pkg_server.t_req);
procedure merge(pid pkg_guid.guid, preq pkg_server.t_req);

procedure remove(pid pkg_guid.guid);

end "PKG_GRP";
/

create or replace package "PKG_LOG" as

LEVEL_E CONSTANT NUMBER:=1;
LEVEL_W CONSTANT NUMBER:=2;
LEVEL_I CONSTANT NUMBER:=3;
LEVEL_D CONSTANT NUMBER:=4;
LEVEL_V CONSTANT NUMBER:=5;

procedure loge(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null);
procedure logw(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null);
procedure logi(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null);
procedure logd(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null);
procedure logv(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null);

procedure dumpParameters;

end "PKG_LOG";
/
create or replace package "PKG_P" as
 /*REQUEST PARAMETERS*/

 PREQUESTID     CONSTANT VARCHAR2(25):='requestid';
 PID            CONSTANT VARCHAR2(25):='id';
 PMETHOD        CONSTANT VARCHAR2(25):='method';
 PPATH          CONSTANT VARCHAR2(25):='path';
 PSCRIPTNAME    CONSTANT VARCHAR2(25):='scriptname';
 PIFMATCH       CONSTANT VARCHAR2(25):='ifmatch';
 PIFNONEMATCH   CONSTANT VARCHAR2(25):='ifnonematch';
 PENDPOINT      CONSTANT VARCHAR2(25):='endpoint';
 PRESFORMAT     CONSTANT VARCHAR2(25):='resfmt';
 PATTRIBUTES    CONSTANT VARCHAR2(25):='attributes';
 PEXATTRIBUTES  CONSTANT VARCHAR2(25):='excludedAttributes';
 PFILTER        CONSTANT VARCHAR2(25):='filter';
 PSORTBY        CONSTANT VARCHAR2(25):='sortBy';
 PSORTORDER     CONSTANT VARCHAR2(25):='sortOrder';
 PSTARTIDX      CONSTANT VARCHAR2(25):='startIndex';
 PROWSCOUNT     CONSTANT VARCHAR2(25):='count';

type tabReqParam is table of anydata index by varchar2(50);

function getVC(pname varchar2) return varchar2;
function getNum(pname varchar2) return number;
function getAll return tabReqParam;

procedure addVC(pname varchar2, pval varchar2);
procedure addNum(pname varchar2, pval number);
procedure initDefault;
procedure initEmpty;

end "PKG_P";
/
create or replace package "PKG_SCHEMA" as
 

 URN_EP_SEARCH      CONSTANT VARCHAR2(100):='urn:ietf:params:scim:api:messages:2.0:SearchRequest';
 URN_EP_USER        CONSTANT VARCHAR2(100):='urn:ietf:params:scim:schemas:core:2.0:User';
 URN_EP_GROUP       CONSTANT VARCHAR2(100):='urn:ietf:params:scim:schemas:core:2.0:Group';
 URN_EP_SP_CONFIG   CONSTANT VARCHAR2(100):='urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig';
 URN_EP_RES_TYPES   CONSTANT VARCHAR2(100):='urn:ietf:params:scim:schemas:core:2.0:ResourceType';
 URN_LIST_RES       CONSTANT VARCHAR2(100):='urn:ietf:params:scim:api:messages:2.0:ListResponse';
 URN_ERROR          CONSTANT VARCHAR2(100):='urn:ietf:params:scim:api:messages:2.0:Error';

 SCHEMA_USER        CONSTANT VARCHAR2(10):='User';
 SCHEMA_GROUP       CONSTANT VARCHAR2(10):='Group';
 
 TYPE_STRING         CONSTANT VARCHAR2(10):='string';
 TYPE_BOOLEAN        CONSTANT VARCHAR2(10):='boolean';
 TYPE_DECIMAL        CONSTANT VARCHAR2(10):='decimal';
 TYPE_INTEGER        CONSTANT VARCHAR2(10):='integer';
 TYPE_DATETIME       CONSTANT VARCHAR2(10):='datetime';
 TYPE_BINARY         CONSTANT VARCHAR2(10):='binary';
 TYPE_REFERENCE      CONSTANT VARCHAR2(10):='reference';
 TYPE_COMPLEX        CONSTANT VARCHAR2(10):='complex';

 RETURNED_ALWAYS     CONSTANT VARCHAR2(10):='always';
 RETURNED_DEFAULT    CONSTANT VARCHAR2(10):='default';
 RETURNED_NEVER      CONSTANT VARCHAR2(10):='never';
 RETURNED_REQUEST    CONSTANT VARCHAR2(10):='request';

 subtype t_attr is v_schema_attr%rowtype;
 type tab_attr is table of t_attr;

 procedure flattenToTable(pname varchar2);
 procedure populateHierTable(pschemaname varchar2);

 function getSchemaAttrPaths(pschema varchar2) return apex_t_varchar2;
 function getAttrByPath(pschema varchar2, ppath varchar2:=null) return t_attr;
 function getAttrsByProperty(pschema varchar2, preturned varchar2:=null) return tab_attr;
 function getAttrPathForAttr(pschema varchar2, pid pkg_guid.guid) return varchar2;
 function getJsonPathForAttr(pschema varchar2, pid pkg_guid.guid) return varchar2;
 function isValidAttrPath(pschema varchar2, ppath varchar2) return boolean;

 function resolveOrderByCol(pschema varchar2, ppath varchar2) return varchar2;

 function resolveSelectCol(pschema varchar2, ppath varchar2) return varchar2;
 function resolveExclCol(pschema varchar2, ppath varchar2) return varchar2;

 function urnArray(purn varchar2) return json_array_t;
 
 
end "PKG_SCHEMA";
/
create or replace package "PKG_SERVER" as

 subtype t_req is req_store%rowtype;

 type t_resource is record (respjson clob, lastmodified timestamp);

 procedure updateReq(preqid pkg_guid.guid, prescode number);

 function processReq(pbody blob:=null) return scimresp_typ;

end "PKG_SERVER";
/
create or replace package "PKG_SERVER_CONF" as

 function getNum(pitemname varchar2) return number;

 procedure setNum(pitemname varchar2, pnumval number);

end "PKG_SERVER_CONF";
/
create or replace package "PKG_USR" as

procedure merge(pid pkg_guid.guid, preq pkg_server.t_req);
procedure remove(pid pkg_guid.guid);

end "PKG_USR";
/
create or replace package "XUTL_JSON" as

JSON_TYPE_OBJECT    constant VARCHAR2(10):='Object';
JSON_TYPE_ARRAY     constant VARCHAR2(10):='Array';
JSON_TYPE_SCALAR    constant VARCHAR2(10):='Scalar';
JSON_TYPE_STRING    constant VARCHAR2(10):='String';
JSON_TYPE_NUMBER    constant VARCHAR2(10):='Number';
JSON_TYPE_BOOLEAN   constant VARCHAR2(10):='Boolean';
JSON_TYPE_TRUE      constant VARCHAR2(10):='True';
JSON_TYPE_FALSE     constant VARCHAR2(10):='False';
JSON_TYPE_NULL      constant VARCHAR2(10):='Null';
JSON_TYPE_DATE      constant VARCHAR2(10):='Date';
JSON_TYPE_TIMESTAMP constant VARCHAR2(10):='Timestamp';

SEPARATOR           constant VARCHAR2(1):='.';

type recflatjson is record(path varchar2(500), value varchar2(4000));
type tabflatjson is table of recflatjson;

subtype recjsonhier is schema_attr_hier%rowtype;--(id number, parentid number, name varchar2(500), jsontypename, value varchar2(4000));
type tabjsonhier is table of recjsonhier;

-- function flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null) return tabflatjson pipelined;
--  procedure flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null);
 procedure flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null, ptabjson in out tabflatjson);
 procedure buildHier(pjson json_element_t, 
                    pkey varchar2:=null, 
                    pparentid varchar2:=null, 
                    pschema varchar2, 
                    pseq number:=null,
                    ptabjson in out tabjsonhier);

   function createMeta(presourceType varchar2,
                  plocation varchar2,
                  pcreated date:=null,
                  plastModified date:=null,
                  pversion varchar2:=null
                  ) return json_object_t;
end "XUTL_JSON";
/
--   CREATE UNIQUE INDEX "CONF_STORE_PK" ON "CONF_STORE" ("ID");
--   CREATE UNIQUE INDEX "SYS_IL0330519357C00006$$" ON "CONF_STORE" (  ;


--   CREATE UNIQUE INDEX "ENDPOINT_PK" ON "ENDPOINT" ("NAME")   ;

--   CREATE UNIQUE INDEX "GROUP_PK" ON "GRP" ("ID")   ;
--   CREATE UNIQUE INDEX "GRP_UNQ" ON "GRP" ("DISPLAYNAME")   ;

--   CREATE INDEX "GRP_MEMBER_IDX" ON "GRP_MEMBER" ("GROUPID")   ;
--   CREATE UNIQUE INDEX "GRP_MEMBER_PK" ON "GRP_MEMBER" ("ID")   ;

--   CREATE UNIQUE INDEX "REQ_STORE_PK" ON "REQ_STORE" ("ID")   ;
--   CREATE UNIQUE INDEX "SYS_IL0317577859C00006$$" ON "REQ_STORE" (  ;

--   CREATE UNIQUE INDEX "ATTR_FLAT_CON" ON "SCHEMA_ATTR_FLAT" ("SCHEMA", "PATH") 
--   ;

--   CREATE INDEX "SCHEMA_ATTR_HIER_IDX" ON "SCHEMA_ATTR_HIER" ("PARENTID", "ID") 
--   ;

--   CREATE UNIQUE INDEX "SYS_IL0318638786C00004$$" ON "SERVER_CONF" (
--   ;

--   CREATE UNIQUE INDEX "USR_EXTID_UNQ" ON "USR" ("EXTERNALID") 
--   ;
--   CREATE UNIQUE INDEX "USR_PK" ON "USR" ("ID") 
--   ;
--   CREATE UNIQUE INDEX "USR_USERNAME_UNQ" ON "USR" ("USERNAME") 
--   ;

--   CREATE INDEX "USR_ADDRESS_IDX" ON "USR_ADDRESS" ("USRID") 
--   ;

--   CREATE INDEX "USR_EMAIL_IDX" ON "USR_EMAIL" ("USRID") 
--   ;

--   CREATE INDEX "USR_PHONE_IDX" ON "USR_PHONE" ("USRID") 
--   ;

create or replace package body "PKG_E" as

 function lookupResponseCode(psqlcode number) return number
 as
 begin
  return case psqlcode
   when -1 then 100
   else 400
  end;
 end;

 function generateErrorResponse(prescode number, pdetail varchar2:=null) return json_object_t
 as
  lresp json_object_t:=json_object_t();
 begin

  lresp.put('schemas',json_array_t.parse('["'||pkg_schema.URN_ERROR||'"]'));
  lresp.put('status',prescode);
   
  if pdetail is null then
   lresp.put('detail','error processing request');
  else
   lresp.put('detail',pdetail);
  end if;
  

  return lresp;
 end;

end "PKG_E";
/
create or replace package body "PKG_ENDPOINT" as

function isValidEndpoint(pname varchar2) return boolean
 DETERMINISTIC
as 
 lvalid char(1);
begin
 select case when exists(select * from endpoint where name=pname) then 'Y'
  else 'N'
  end
 into lvalid
 from dual;

 return lvalid='Y';
end;

function getEndpointByName(pname varchar2) return t_endpoint
as 
 lendpoint t_endpoint;
begin
 select * 
  into lendpoint
  from endpoint 
  where name=pname;

  return lendpoint;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.endpoint_invalid_en,'endpoint not found '||pname);
 when others then 
  raise; 
end;

function getEndpointRespView(pname varchar2) return varchar2
as 
begin
 return getEndpointByName(pname).respview;
end;

function getResourceTypeSchema(pname varchar2) return varchar2
as
 lschema conf_store.docname%type;
begin
 
 select schemaname 
  into lschema 
  from v_resource_schema where resourcetype=pname;

 return lschema;
end;

end "PKG_ENDPOINT";
/
create or replace package body "PKG_FILTER" as

function getAttrOperators return tab_predicate
as
 lops tab_predicate:=tab_predicate();
begin
 null;
end;

function splitPredicates1(pfilter varchar2) return apex_t_varchar2 
as
 lpredicates apex_t_varchar2;
begin
 select regexp_substr(pfilter,'\(+|\)+|[[:graph:]]+\[[[:graph:]]+|\]|[^][:space:])]+',1,level) 
 bulk collect into lpredicates
 from dual
 connect by level<=regexp_count(pfilter, '\(+|\)+|\[|\]|[^][:space:])]+')
 order by level;

 return lpredicates;
end;

procedure parseFilter(pschema varchar2, pfilter varchar2, psql out clob, pbinds in out tab_filterbind)
as
--  lstring varchar2(1000):='(userType eq "Employee") and (emails[type eq "work" and value co "@example.com"])';
 ltokens        apex_t_varchar2;
 lcomplexname   varchar2(100);
 lattrtoken     varchar2(100);
 loperatortoken varchar2(50);
 lvaluetoken    varchar2(100);
 lsubcount      number:=0;
 lpredicate     t_predicate;

 procedure reinitTokens
 as
 begin
  pkg_log.logi('pkg_filter.reinitTokens', 'starting');
  lsubcount:=0;
  lattrtoken:=null;
  loperatortoken:=null;
  lvaluetoken:=null;
 end;

 procedure predicateSubstitute(psql in out clob, pbinds in out tab_filterbind, psqlexpression varchar2, pattrpath varchar2, pvaluetoken varchar2:=null)
 as 
  lpredicateres varchar2(500);
  lbindscount   number;
  lbindname     varchar2(10);
 begin
  lbindscount:=pbinds.count;
  lbindname:=pkg_c.QUERY_BINDS_PREFIX||lbindscount;

  lpredicateres:=replace(psqlexpression,PREDICATE_ATTR_PLACEHOLDER,pattrpath);

  if pvaluetoken is not null then
   pkg_log.logd('pkg_filter.predicateSubstitute', lbindname, pvaluetoken);
   lpredicateres:=replace(lpredicateres,PREDICATE_VALUE_PLACEHOLDER,lbindname);
   pbinds(lbindname):=pvaluetoken;
  end if;
   
  pkg_log.logd('pkg_filter.predicateSubstitute', 'lpredicateres',lpredicateres);
  
  psql:=psql||lpredicateres; 
 end predicateSubstitute;  

begin
 pkg_log.logi('pkg_filter.parseFilter', 'starting');
 pkg_log.logd('pkg_filter.parseFilter', 'filter', pfilter);

 psql:=' and ';

 ltokens:=pkg_filter.splitPredicates1(pfilter);
 pkg_log.logd('pkg_filter.parseFilter', 'tokens count', ltokens.count);

 for i in 1..ltokens.count loop
  pkg_log.logd('pkg_filter.parseFilter', 'tokens '||i, ltokens(i));
  lsubcount:=lsubcount+1;
  pkg_log.logd('pkg_filter.parseFilter', 'lsubcount ', lsubcount);
 
  if lsubcount>3 then 
   raise_application_error(pkg_e.filter_invalid_en,'invalid filter predicate');
  end if; 

  if regexp_like(ltokens(i),'\(+|\)+') then --(,)  
   reinitTokens;
   psql:=psql||ltokens(i);
   continue;
  elsif regexp_like(ltokens(i),'^and|^or') then --and,or
   reinitTokens;
   psql:=psql||BLANK_SPACE||ltokens(i)||BLANK_SPACE;
   pkg_log.logd('pkg_filter.parseFilter', 'ending complex attr');
  elsif regexp_like(ltokens(i),'\]') then --]
   reinitTokens;
   pkg_log.logd('pkg_filter.parseReqAttrPaths', 'setting complexname to null');
   lcomplexname:=null;
   continue;
  elsif regexp_like(ltokens(i),'[[:graph:]]+\[[[:graph:]]+') then --eg emails[type
   lcomplexname:=regexp_substr(ltokens(i),'[^[]+',1);
   pkg_log.logd('pkg_filter.parseFilter', 'starting complex attr', lcomplexname);
   lattrtoken:=regexp_substr(ltokens(i),'[^\[]+\[([[:graph:]]+)',1,1,'i',1);
  end if;

  if lsubcount=1 then
    if lcomplexname is not null and lattrtoken is not null then
     lattrtoken:=lcomplexname||'.'||lattrtoken;
    elsif lcomplexname is not null then
     lattrtoken:=lcomplexname||'.'||ltokens(i);    
    else 
     lattrtoken:=ltokens(i);
    end if; 
   
   pkg_log.logd('pkg_filter.parseFilter', 'validate attr', lattrtoken);
   if not pkg_schema.isValidAttrPath(pschema,lattrtoken) then
    raise_application_error(pkg_e.filter_invalid_en,'invalid attr');
   end if;
  end if;

  if lsubcount=2 then
   loperatortoken:=ltokens(i);
   pkg_log.logd('pkg_filter.parseFilter', 'getting operator', loperatortoken);
   lpredicate:=getPredicate(loperatortoken);
  end if;

  if lsubcount=3 then
   pkg_log.logd('pkg_filter.parseFilter', 'setting filter value', ltokens(i));
   --validate
   lvaluetoken:=regexp_substr(ltokens(i),'^"(.*)"$',1,1,'i',1);
  end if;  

  if lpredicate.partcount=lsubcount then
   pkg_log.logd('pkg_filter.parseReqAttrPaths', 'doing substitution');
   predicateSubstitute(psql, pbinds, lpredicate.sqlexpression, lattrtoken, lvaluetoken);
   reinitTokens;
  end if; 

 end loop;

 end parseFilter; 

function getQuotedStrings(pfilter varchar2) return tab_filterbind 
as
 lstrings tab_filterbind;
begin
 
 for x in (select QUOTED_STRING_REPLACEMENT||level key, regexp_substr(pfilter,'"[^"]*"',1,level) val
 from dual
 connect by level<=regexp_count(pfilter, '"[^"]*"')
 order by level) loop
  lstrings(x.key):=x.val;
 end loop;

 return lstrings;
end;

function replaceQuotedStrings(pfilter varchar2) return varchar2
as
 lcnt number;
 lstring varchar2(500);
begin
 lcnt:=regexp_count(pfilter, '"[^"]*"');
 if lcnt=0 then
  return pfilter;
 end if;

 lstring:=pfilter;

 for i in 1..lcnt loop
  lstring:=regexp_replace(lstring,'"[^"]*"',QUOTED_STRING_REPLACEMENT||i,1,i);
 end loop;

--  select regexp_replace(pfilter,'"[^"]*"',QUOTED_STRING_REPLACEMENT||level,1,level) 
--  into lstring
--  from dual
--  connect by level<=regexp_count(pfilter, '"[^"]*"')
--  order by level;
 
 return lstring;
end;

function splitIntoTokens(pfilter varchar2) return apex_t_varchar2 
as
 ltokens apex_t_varchar2;
begin
 select regexp_substr(pfilter,'[^[:space:]]+',1,level) 
 bulk collect into ltokens
 from dual
 connect by level<=regexp_count(pfilter, '[^[:space:]]+')
 order by level;

 return ltokens;
end; 

function splitPredicates(pfilter varchar2) return apex_t_varchar2 
as
 lpredicates apex_t_varchar2;
begin
 select regexp_substr(pfilter,'(.*?)([[:space:]](and|or)[[:space:]]|$)',1,level,'i',1) 
 bulk collect into lpredicates
 from dual
 connect by level<regexp_count(pfilter, '(.*?)([[:space:]](and|or)[[:space:]]|$)');

 return lpredicates;
end splitPredicates; 

function getPredicate(pscimexpression varchar2) return t_predicate
as
 lpredicate t_predicate;
begin
 select *
 into lpredicate
 from filter_predicate
 where scimexpression=pscimexpression
 and isenabled='true';

 return lpredicate;
 exception 
 when no_data_found then
  raise_application_error(pkg_e.filter_invalid_en, 'operator not supported');
 when others then
  raise;
end;

end "PKG_FILTER";
/


create or replace package body "PKG_LOG" as
 server_log_level number;

procedure log(plvl number, plocation varchar2, pentryname varchar2, pentrydetail varchar2)
as
pragma autonomous_transaction;
begin

 if server_log_level>=plvl then
  insert into scim_log (reqid,lvl,ts,location,entryname,entrydetail)
  values (pkg_p.getvc(pkg_p.PREQUESTID),plvl,f_tsatutc,plocation,pentryname,pentrydetail);
 end if; 
 commit;
 exception
 when others then
  insert into scim_log (reqid,lvl,ts,location,entryname,entrydetail)
  values (pkg_p.getvc(pkg_p.PREQUESTID),plvl,f_tsatutc,'PKG_LOG.log','error',dbms_utility.format_error_stack);
  commit;
end log;

procedure loge(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null)
as
begin
 log(LEVEL_E, plocation, pentryname, pentrydetail);
end;

procedure logw(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null)
as
begin
 log(LEVEL_W, plocation, pentryname, pentrydetail);
end;

procedure logi(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null)
as
begin
 log(LEVEL_I, plocation, pentryname, pentrydetail);
end;

procedure logd(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null)
as
begin
 log(LEVEL_D, plocation, pentryname, pentrydetail);
end;

procedure logv(plocation varchar2, pentryname varchar2, pentrydetail varchar2:=null)
as
begin
 log(LEVEL_V, plocation, pentryname, pentrydetail);
end;

 procedure dumpParameters
 as
  lParamsTab    pkg_p.tabReqParam;
  ltp           anytype;
  lindx         varchar2(50);
 begin
  lParamsTab:=pkg_p.getAll;
  log(LEVEL_D, 'pkg_log.dumpParameters', 'starting parameter dump', lParamsTab.count);

  lindx:=lParamsTab.first;

  while (lindx is not null) loop
        if lParamsTab(lindx).getType(ltp)=dbms_types.TYPECODE_VARCHAR2 then
         log(LEVEL_V, 'pkg_log.dumpParameters', lindx, lParamsTab(lindx).accessVarchar2);
        elsif lParamsTab(lindx).getType(ltp)=dbms_types.TYPECODE_NUMBER then
         log(LEVEL_V, 'pkg_log.dumpParameters', lindx, lParamsTab(lindx).accessNumber);
        else 
         raise_application_error(-20000,'unsupported type '||lParamsTab (lindx).getType(ltp));
        end if; 
  lindx:=lParamsTab.next(lindx);
  end loop;

 end; 

begin
 server_log_level:=pkg_server_conf.getNum(PKG_C.CONF_LOG_LEVEL);
end "PKG_LOG";
/
create or replace package body "PKG_P" as

reqParam tabReqParam;

function getVC(pname varchar2) return varchar2
as 
begin
  return anydata.accessvarchar2(reqParam(pname));
exception
when no_data_found then
 return null;   
end;

function getNum(pname varchar2) return number
as 
begin
  return anydata.accessnumber(reqParam(pname));
exception
when no_data_found then
 return null;
end;

function getAll return tabReqParam
as
begin
 return reqParam;
end;

procedure addVC(pname varchar2, pval varchar2)
as 
begin
--  if pval is not null then 
  reqParam(pname):=ANYDATA.Convertvarchar2(pval);
--  end if; 
end;

procedure addNum(pname varchar2, pval number)
as 
begin
--  if pval is not null then 
  reqParam(pname):=ANYDATA.Convertnumber(pval);
--  end if; 
end;

procedure initDefault
as
begin
 reqParam:=tabReqParam();
 addVC(PREQUESTID,f_getguid);
 addVC(PMETHOD,OWA_UTIL.get_cgi_env(pkg_c.HEADER_REQUEST_METHOD));
 addVC(PPATH,OWA_UTIL.get_cgi_env(pkg_c.HEADER_PATH_INFO));
 addVC(PSCRIPTNAME,OWA_UTIL.get_cgi_env(pkg_c.HEADER_SCRIPT_NAME));
 addVC(PIFMATCH,OWA_UTIL.get_cgi_env(pkg_c.HEADER_IF_MATCH));
 addVC(PIFNONEMATCH,OWA_UTIL.get_cgi_env(pkg_c.HEADER_IFNONE_MATCH));

end initDefault;

procedure initEmpty
as
begin
 reqParam:=tabReqParam();
end initEmpty;

end "PKG_P";
/
create or replace package body "PKG_SCHEMA" as

procedure flattenToTable(pname varchar2)
as
 lschema clob;
 lbodyjson JSON_OBJECT_T ;
 ptabjson xutl_json.tabflatjson;
begin
 select docstore into lschema from conf_store where docname=pname;
 lbodyjson:=JSON_OBJECT_T.parse(lschema);
 
 xutl_json.flatten(pjson=>lbodyjson,ptabjson=>ptabjson);
  
 for lcnt in 1..ptabjson.count loop
  insert into schema_attr_flat(schema,path,value)
  values (pname,ptabjson(lcnt).path,ptabjson(lcnt).value); 
 end loop;
 exception
 when no_data_found then
 raise_application_error(-20000,'Could not find schema with name '||pname);
end;

function getSchemaFromDocStore(pid pkg_guid.guid) return clob
as
 lschema clob;
begin
 select docstore
 into lschema
 from conf_store 
 where id=pid;
 
 return lschema;

 exception
 when no_data_found then
  raise_application_error(pkg_e.schema_not_found_en,'Could not find schema with id '||pid);
 when others then 
  raise;
end;

procedure populateHierTable(pschemaname varchar2)
as
 lschema        clob;
 lbodyjson      JSON_OBJECT_T;
 ptabjson       xutl_json.tabjsonhier;
 ldocid         pkg_guid.guid;
 lchilddocid    pkg_guid.guid;
begin
 select id, childdocid into ldocid, lchilddocid from conf_store where docname=pschemaname;
 
 lschema:=getSchemaFromDocStore(ldocid);
 lbodyjson:=JSON_OBJECT_T.parse(lschema);

 xutl_json.buildHier(pjson=>lbodyjson,ptabjson=>ptabjson, pschema=>pschemaname);
  
 for lcnt in 1..ptabjson.count loop
  insert into schema_attr_hier
  values ptabjson(lcnt);
 end loop;
 
 if lchilddocid is not null then
 lschema:=getSchemaFromDocStore(lchilddocid);
 lbodyjson:=JSON_OBJECT_T.parse(lschema);
 ptabjson:=null;

 xutl_json.buildHier(pjson=>lbodyjson, ptabjson=>ptabjson, pschema=>pschemaname);
  
  for lcnt in 1..ptabjson.count loop
   insert into schema_attr_hier
   values ptabjson(lcnt);
  end loop;
 end if; 
 
 exception
 when no_data_found then
  raise_application_error(pkg_e.schema_not_found_en,'Could not find schema with name '||pschemaname);
 when others then 
  raise;
end;

function getAttrByName(pschema varchar2, pname varchar2) return t_attr
as
 lattr t_attr;
begin
 select a.* 
 into lattr
 from v_schema_attr a,v_schema_attr_child_par b
 where lower(a.name)=lower(pname)
 and a.attrid=b.childid(+)
 and b.childid is null
 and a.schema=pschema;

 return lattr;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found '||pname);
 when others then 
  raise;
end getAttrByName;

function getAttrPathForAttr(pschema varchar2, pid pkg_guid.guid) return varchar2
as
 lattrpath varchar2(200);
begin
  select attrpath 
    into lattrpath
  from v_schema_attr_path a
  where a.schema=pschema
   and a.attrid=pid;

  return lattrpath;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found');
 when others then 
  raise;
end getAttrPathForAttr;

function getJsonPathForAttr(pschema varchar2, pid pkg_guid.guid) return varchar2
as
 ljsonpath varchar2(200);
begin
  select jsonpath 
    into ljsonpath
  from v_schema_attr_path a
  where a.schema=pschema
   and a.attrid=pid;

  return ljsonpath;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found');
 when others then 
  raise;
end getJsonPathForAttr;

function isValidAttrPath(pschema varchar2, ppath varchar2) return boolean
as
 lcount number;
begin
  select count(*) 
    into lcount
  from v_schema_attr_path a
  where a.schema=pschema
   and a.attrpath=ppath;

  return lcount=1;
end isValidAttrPath;

function getSchemaAttrPaths(pschema varchar2) return apex_t_varchar2
as
 lschemaattrs       pkg_schema.tab_attr;
 lschemaattrpaths   apex_t_varchar2:=apex_t_varchar2();
begin
 lschemaattrs:=pkg_schema.getAttrsByProperty(pschema,pkg_schema.RETURNED_DEFAULT);

 for i in 1..lschemaattrs.count loop
  lschemaattrpaths.extend;
  lschemaattrpaths(i):=lschemaattrs(i).attrid;
 end loop;
 
 return lschemaattrpaths;
end getSchemaAttrPaths;

function getAttrByPath(pschema varchar2, ppath varchar2) return t_attr
as
 lattr t_attr;
begin
  select b.*
  into lattr
  from v_schema_attr_path a, v_schema_attr b
  where lower(a.attrpath)=lower(ppath)
  and a.attrid=b.attrid
  and a.schema=pschema;

 return lattr;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found '||ppath);
 when others then 
  raise;
end getAttrByPath;

function getAttrById(pid pkg_guid.guid) return t_attr
as
 lattr t_attr;
begin
 select a.* 
 into lattr
 from v_schema_attr a
 where a.attrid=pid;

 return lattr;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found '||pid);
 when others then 
  raise;
end getAttrById;


function getFirstChildAttr(pid varchar2) return t_attr
as
 lattr t_attr;
begin

 select b.* 
 into lattr
 from schema_attr_hier a, v_schema_attr b
 connect by prior a.id=a.parentid 
  and a.id=b.attrid
 start with a.id=pid 
 order by a.seq 
 fetch first 1 rows only;

 return lattr;
  exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'child attr not found');
 when others then 
  raise;
end getFirstChildAttr;

function isAttrChild(pschema varchar2, pattrid varchar2) return boolean
as
 lchildcnt      number:=0;
begin
  select count(*)
  into lchildcnt
  from v_schema_attr_child_par
  where childid=pattrid
  and schema=pschema;

  return lchildcnt>0;
end;

function getParentAttr(pschema varchar2, pattrid varchar2) return t_attr
as
 lparentattr      t_attr;
begin
  select a.*
  into lparentattr
  from v_schema_attr a, v_schema_attr_child_par b
  where b.childid=pattrid
  and b.parentid=a.attrid
  and a.schema=pschema;

  return lparentattr;
end;

function getAttrsByProperty(pschema varchar2, preturned varchar2:=null) return tab_attr
as
 lattrtab tab_attr;
begin
 select * 
 bulk collect into lattrtab
 from v_schema_attr 
 where returned=preturned
 and schema=pschema;

 return lattrtab;
end getAttrsByProperty;

function resolveOrderByCol(pschema varchar2, ppath varchar2) return varchar2
as
 lattrid    pkg_guid.guid;
 lattr      t_attr;
begin
 select nvl(b.parentid,a.attrid)
 into lattrid
 from v_schema_attr_path a, v_schema_attr_child_par b
 where lower(a.attrpath)=lower(ppath)
 and a.attrid=b.childid(+)
 and a.schema=pschema;

 lattr:=getAttrById(lattrid);

 return lattr.name;
 exception 
 when no_data_found 
 then raise_application_error(pkg_e.attr_not_found_en,'attr not found '||ppath);
 when others then 
  raise;
end resolveOrderByCol;

function resolveSelectCol(pschema varchar2, ppath varchar2) return varchar2
as
 lcolname      varchar2(30);
 lselattr      t_attr;
begin
 lselattr:=getAttrByName(pschema, ppath);

 if isAttrChild(pschema, lselattr.attrid) then
  lselattr:=getParentAttr(pschema, lselattr.attrid);
 end if;
 
 return lselattr.name;
end resolveSelectCol;

function resolveExclCol(pschema varchar2, ppath varchar2) return varchar2
as
 lcolname      varchar2(30);
 lselattr      t_attr;
begin
 lselattr:=getAttrByName(pschema, ppath);

 return lselattr.name;
end resolveExclCol;

function urnArray(purn varchar2) return json_array_t
as
begin
 return json_array_t('["'||purn||'"]');
end;


end "PKG_SCHEMA";
/
create or replace package body "PKG_SERVER" as

 procedure updateReq(preqid pkg_guid.guid, prescode number)
 as
 begin
  update req_store 
  set reshttpcode=prescode,
  rests=f_tsatutc
  where id=updateReq.preqid;
 end updateReq;

function insertReq(pendpoint varchar2, pbody blob:=null) return t_req
as 
  lreqInfo t_req;
begin

 lreqInfo.id:=pkg_p.getvc(pkg_p.PREQUESTID);
 lreqInfo.endpoint:=pendpoint;
 lreqInfo.method:=pkg_p.getvc(pkg_p.PMETHOD);
 lreqInfo.body:=pbody;
 lreqInfo.path:=pkg_p.getvc(pkg_p.PSCRIPTNAME)||pkg_p.getvc(pkg_p.PPATH);
 lreqInfo.reqts:=systimestamp;

 insert into req_store values lreqInfo;
 
 return lreqInfo;

 exception
 when others then 
  if sqlcode=-2290 then
   raise_application_error(pkg_e.body_parse_en,'error parsing request body');
  else
   raise;
  end if;  
end;

function parseReqAttrPaths(pschema varchar2, preqattrstring varchar2) return apex_t_varchar2
as
 lreqattrs      apex_t_varchar2:=apex_t_varchar2();
 lattr          pkg_schema.t_attr;
begin
 for i in (select column_value reqattr from table(apex_string.split(preqattrstring,','))) loop
  pkg_log.logi('pkg_server.parseReqAttrPaths', 'starting loop');
  pkg_log.logd('pkg_server.parseReqAttrPaths', 'reqattr', i.reqattr);
  lattr:=pkg_schema.getAttrByPath(pschema, i.reqattr);
  
  lreqattrs.extend;
  lreqattrs(lreqattrs.count):=lattr.attrid;
 
 end loop;

 pkg_log.logd('pkg_server.parseReqAttrPaths', 'returning count', lreqattrs.count);

 return lreqattrs;
end parseReqAttrPaths;

function buildSelectTransform(presourcetype varchar2) return varchar2
as
 ltransform         varchar2(4000):=pkg_c.QUERY_DEFAULT_COL;
 lschemaname        conf_store.docname%type;
 lreqattrs          apex_t_varchar2;
 lschemaattrpaths   apex_t_varchar2;
 lremovecnt         number:=0;
 lattrjsonpath      varchar2(200);
begin

 pkg_log.logi('pkg_server.buildSelectTransform', 'starting');
 pkg_log.logd('pkg_server.buildSelectTransform', 'PATTRIBUTES', pkg_p.getvc(pkg_p.PATTRIBUTES));
 pkg_log.logd('pkg_server.buildSelectTransform', 'PEXATTRIBUTES', pkg_p.getvc(pkg_p.PEXATTRIBUTES));

 if pkg_p.getvc(pkg_p.PATTRIBUTES) is null and pkg_p.getvc(pkg_p.PEXATTRIBUTES) is null then
  return ltransform;
 end if;

 lschemaname:=pkg_endpoint.getResourceTypeSchema(presourcetype);
 ltransform:='json_transform('||ltransform||' FORMAT JSON,';

 --get list of default attrs
 lschemaattrpaths:=pkg_schema.getSchemaAttrPaths(presourcetype);

 if pkg_p.getvc(pkg_p.PATTRIBUTES) is not null then
  lreqattrs:=parseReqAttrPaths(lschemaname,pkg_p.getvc(pkg_p.PATTRIBUTES));
  lschemaattrpaths:=lschemaattrpaths multiset except lreqattrs;
 elsif pkg_p.getvc(pkg_p.PEXATTRIBUTES) is not null then
  lreqattrs:=parseReqAttrPaths(lschemaname,pkg_p.getvc(pkg_p.PEXATTRIBUTES));
  lschemaattrpaths:=lschemaattrpaths multiset intersect lreqattrs;
 end if; 

 pkg_log.logd('pkg_server.buildSelectTransform', 'lreqattrs count', lreqattrs.count);
 pkg_log.logd('pkg_server.buildSelectTransform', 'lschemaattrs count', lschemaattrpaths.count);

--  build transform 
 for i in 1..lschemaattrpaths.count loop
  lremovecnt:=lremovecnt+1;
  
  pkg_log.logd('pkg_server.buildSelectTransform', 'starting loop', i);
  pkg_log.logd('pkg_server.buildSelectTransform', 'name', lschemaattrpaths(i));
  
  lattrjsonpath:=pkg_schema.getJsonPathForAttr(lschemaname,lschemaattrpaths(i));

  if instr(lattrjsonpath,'$',2)>0 then--issue with $ in key
   continue;
  end if;

  ltransform:=ltransform ||
   case lremovecnt when 1 then null else ',' end ||
   'REMOVE ''' || lattrjsonpath || '''';
 end loop;

 ltransform:=ltransform||') ';
 
  return ltransform;
end buildSelectTransform;

function getValidateSortOrder return varchar2
as
 lsortorderparam  varchar2(10);
 lsortorderreturn varchar2(10);
begin
 pkg_log.logi('pkg_server.getValidateSortOrder', 'starting');
 pkg_log.logi('pkg_server.getValidateSortOrder', 'PSORTORDER', pkg_p.getvc(pkg_p.PSORTORDER));

 if lower(pkg_p.getvc(pkg_p.PSORTORDER)) in ('asc', 'desc', 'ascending','descending') then
  return pkg_p.getvc(pkg_p.PSORTORDER);
 end if; 
 
 return pkg_c.QUERY_DEFAULT_ORDER;
end getValidateSortOrder;

function buildOrderBy(presourcetype varchar2, pdeforderby varchar2) return varchar2
as
 lsortby varchar2(200);
 lprefix varchar2(10):=' order by ';
 lschemaname varchar2(50);
begin
 pkg_log.logi('pkg_server.buildOrderBy', 'starting');
 pkg_log.logd('pkg_server.buildOrderBy', 'presourcetype',presourcetype);
 pkg_log.logd('pkg_server.buildOrderBy', 'pdeforderby',pdeforderby);

 if pkg_p.getvc(pkg_p.PSORTBY) is null then
  pkg_log.logd('pkg_server.buildOrderBy', 'sortBy is null');
  lsortby:=lprefix||pdeforderby;
 else
  pkg_log.logd('pkg_server.buildOrderBy', 'PSORTBY', pkg_p.getvc(pkg_p.PSORTBY));
  lschemaname:=pkg_endpoint.getResourceTypeSchema(presourcetype);
  lsortby:=pkg_schema.resolveOrderByCol(lschemaname,pkg_p.getvc(pkg_p.PSORTBY));
  pkg_log.logd('pkg_server.buildOrderBy', 'resolved sortby'||lsortby);
  lsortby:=lprefix||lsortby;
 end if;

 lsortby:=lsortby||' '||getValidateSortOrder;
 
 return lsortby;
end buildOrderBy;

function getStartIndex return number
as
begin
 if pkg_p.getNum(pkg_p.PSTARTIDX) is null then
  return 1;
 end if;
 
 return pkg_p.getNum(pkg_p.PSTARTIDX);
end getStartIndex;

function getRowStartOffset return number
as
begin
 
 return getStartIndex-1;
end getRowStartOffset;

function getItemsPerPage return number
as
 litemscnt number;
begin
 if pkg_p.getNum(pkg_p.PROWSCOUNT) is null then
  litemscnt:=pkg_server_conf.getNum(pkg_c.CONF_ITEMS_PER_PAGE);
 else
  litemscnt:=pkg_p.getNum(pkg_p.PROWSCOUNT);
 end if;
  return litemscnt;
end;

function getRownumEnd return number
as
begin
 return getRowStartOffset+getItemsPerPage;
end;

procedure appSql(psql in out nocopy varchar2,pappend varchar2) 
as
begin
 psql:=psql||pappend;
end;

procedure buildFilter(pschema varchar2, psql in out clob, pbinds in out pkg_filter.tab_filterbind)
as
 lfilter            varchar2(1000);
begin
 pkg_log.logi('pkg_server.buildFilter', 'starting');
 pkg_log.logd('pkg_server.buildFilter', 'pschema', pschema);

 lfilter:=pkg_p.getvc(pkg_p.PFILTER);

 pkg_Filter.parseFilter(pschema, lfilter, lfilter, pbinds);
 appSql(psql,lfilter);
end buildFilter;

function buildTopN return varchar2
as
 ltopn varchar2(100);
begin
 pkg_log.logi('pkg_server.buildTopN', 'starting');

 if pkg_p.getNum(pkg_p.PSTARTIDX) is null and pkg_p.getNum(pkg_p.PROWSCOUNT) is null then
  return null;
 end if; 
  
 ltopn:='  offset '||getRowStartOffset||' rows';

 ltopn:=ltopn||' fetch next '||getRownumEnd||' rows only';

 return ltopn;
end;

function resolveSearchEndpointParent return pkg_endpoint.t_endpoint
as
 lscriptpath        varchar2(200);
 lsearchparent      varchar2(200); 
begin
 pkg_log.logi('pkg_server.resolveSearchEndpointParent', 'starting');
 lsearchparent:=regexp_substr(pkg_p.getvc(pkg_p.PSCRIPTNAME),'[a-zA-z]+$');

 pkg_log.logd('pkg_server.resolveSearchEndpointParent', 'lsearchparent', lsearchparent);

 if lsearchparent in (pkg_endpoint.EP_USERS,pkg_endpoint.EP_GROUPS) then
  return pkg_endpoint.getEndpointByName(lsearchparent);
 else 
  raise_application_error(pkg_e.resource_type_invalid_en,'unsupported search type');
 end if;
end;

procedure buildSelect(pendpoint varchar2, psql out clob, pbinds out pkg_filter.tab_filterbind)
as
 lrescursor     sys_refcursor;
 lsqlendpoint   pkg_endpoint.t_endpoint;
begin
 pkg_log.logi('pkg_server.buildSelect', 'starting');
 psql:='select ';

 if pendpoint=pkg_endpoint.EP_SEARCH then
  pkg_log.logd('pkg_server.buildSelect', 'resolving resource type endpoint', pendpoint);
  lsqlendpoint:=resolveSearchEndpointParent;
 else
  lsqlendpoint:=pkg_endpoint.getEndpointByName(pendpoint);
 end if;

 if lsqlendpoint.resourcetype in (pkg_schema.SCHEMA_USER,pkg_schema.SCHEMA_GROUP) then
  pkg_log.logd('pkg_server.buildSelect', 'PATTRIBUTES', pkg_p.getvc(pkg_p.PATTRIBUTES));
  appSql(psql,buildSelectTransform(lsqlendpoint.resourcetype));
 else
  appSql(psql,pkg_c.QUERY_DEFAULT_COL);
 end if;
 pkg_log.logd('pkg_server.buildSelect','psql cols',psql);

 appSql(psql,','||pkg_c.QUERY_LAST_MOD_COL);
 pkg_log.logd('pkg_server.buildSelect','psql lastmod col',psql);

 appSql(psql,' from '||lsqlendpoint.respview);
 pkg_log.logd('pkg_server.buildSelect','psql from',psql);

 appSql(psql,' where id=nvl(:id,id)');
 pkg_log.logd('pkg_server.buildSelect','psql where',psql);

 if pkg_p.getvc(pkg_p.PFILTER) is not null then
  buildFilter(lsqlendpoint.resourcetype, psql, pbinds);
  pkg_log.logd('pkg_server.buildSelect','psql filter',psql);
 end if;

 appSql(psql,buildOrderBy(lsqlendpoint.resourcetype,lsqlendpoint.sortcoldefault));
 pkg_log.logd('pkg_server.buildSelect','psql order by',psql);

 psql:='select * from ('||psql||')';
 pkg_log.logd('pkg_server.buildSelect','psql wrapper',psql);

 appSql(psql,buildTopN);
 pkg_log.logd('pkg_server.buildSelect','rows topn',psql);

end buildSelect; 

procedure buildRes(lres in out nocopy scimresp_typ)
as
 lsql           clob;
 lbinds         pkg_filter.tab_filterbind;
 lindex         varchar2(10);
 lcurid         integer;
 lresprow       t_resource;
 lrescnt        number:=0;
 lcolcnt        number:=2;
 llistres       json_array_t;
 lobjres        json_object_t;
 lrescursor     sys_refcursor;
 lgreatestts    timestamp;
 ltab dbms_sql.desc_tab2;
 ldb number;
begin
 pkg_log.logi('pkg_server.buildRes', 'starting');
 
 buildSelect(pkg_p.getvc(pkg_p.PENDPOINT), lsql, lbinds);
--  open lrescursor for psql using pkg_p.getvc(pkg_p.PID);

 lcurid:=dbms_sql.open_Cursor;
 dbms_sql.parse(lcurid,lsql,dbms_sql.native);
 dbms_sql.bind_variable(c=>lcurid,name=>':id',value=>pkg_p.getvc(pkg_p.PID));

 lindex:=lbinds.first;

 while lindex is not null loop
  for i in 1..lbinds.count loop
   dbms_sql.bind_variable(lcurid,pkg_c.QUERY_COLON||lindex,lbinds(lindex));
  end loop;
  lindex := lbinds.NEXT(lindex);
 end loop;

 dbms_sql.describe_columns2(lcurid,lcolcnt,ltab);
 
 dbms_sql.define_column(lcurid,1,lresprow.respjson);
 dbms_sql.define_column(lcurid,2,lresprow.lastmodified);
 
 ldb:=dbms_sql.execute(lcurid);

 while (dbms_sql.fetch_rows(lcurid)>0) loop

    pkg_log.logv('pkg_server.buildRes', 'starting loop count', lrescnt);

    dbms_sql.column_value(lcurid,1,lresprow.respjson);
    dbms_sql.column_value(lcurid,2,lresprow.lastmodified);

     if lrescnt=0 then
      lres.respbody := lresprow.respjson;
      lgreatestts := lresprow.lastmodified;
     else
      lres.respbody := lres.respbody ||','|| lresprow.respjson;
     end if;

     if lresprow.lastmodified>lgreatestts then
      lgreatestts:=lresprow.lastmodified;
     end if;
     
     lresprow:=null;
     lrescnt:=lrescnt+1;
  end loop;

  lres.etag:=f_etag(lgreatestts);
  
  if dbms_sql.is_open(lcurid) then
   dbms_sql.close_cursor(lcurid);
  end if;

  if pkg_p.getVC(pkg_p.PRESFORMAT)=pkg_c.RES_FMT_JSON_LIST then
   llistres:=json_array_t.parse('['||lres.respbody||']');
   lobjres:=json_object_t();
   lobjres.put('schemas',pkg_schema.urnArray(pkg_schema.URN_LIST_RES));
   lobjres.put('totalResults',lrescnt);
   lobjres.put('startIndex',getStartIndex);
   lobjres.put('itemsPerPage',getItemsPerPage);  
   lobjres.put('Resources',llistres);
   lres.respbody:=lobjres.to_clob;
  end if;

  exception
  when others then
   if dbms_sql.is_open(lcurid) then
    dbms_sql.close_cursor(lcurid);
   end if;
   raise;
end buildRes;

procedure setId
as
 lid pkg_guid.guid;
begin
 pkg_log.logi('pkg_server.setId', 'starting');

 lid:=f_getguid;

 pkg_log.logd('pkg_server.setId', 'lid', lid);
 pkg_p.addvc(pkg_p.PID,lid);
end setId;

function validateEtag(pendpoint varchar2, pmethod varchar2) return number
as
  lrespview     endpoint.respview%type;
  lheader       varchar2(50);
  lhttpcode     number;
  lreturncode   number;
  lsql          varchar2(200):='select case when f_etag(lastmodified)';
begin
 pkg_log.logi('pkg_server.ValidateEtag', 'starting');

 case 
 when pmethod=pkg_c.METHOD_GET
 then 
  lhttpcode:=pkg_c.RES_CODE_NOT_MODIFIED;
  pkg_log.logd('pkg_server.ValidateEtag', 'validating', pkg_p.PIFNONEMATCH);
  lheader:=pkg_p.getvc(pkg_p.PIFNONEMATCH);
  appSql(lsql,'=');
 when pmethod in (pkg_c.METHOD_PUT, pkg_c.METHOD_DELETE) 
 then 
  lhttpcode:=pkg_c.RES_CODE_PRECOND_FAIL;
  pkg_log.logd('pkg_server.ValidateEtag', 'validating', pkg_p.PIFMATCH);
  lheader:=pkg_p.getvc(pkg_p.PIFMATCH);
  appSql(lsql,'<>');
 end case;
 
 pkg_log.logd('pkg_server.ValidateEtag', 'header', lheader);
 
 if lheader is null or lheader=pkg_c.ETAG_ANY then
  return null;
 end if;

 appSql(lsql,':header then :httpcode else null end from ');
 
 lrespview:=pkg_endpoint.getEndpointRespView(pendpoint);

 appSql(lsql,lrespview||' where id=nvl(:id,id)');
 pkg_log.logd('pkg_server.ValidateEtag', 'lsql', lsql);

 execute immediate lsql into lreturncode using lheader,lhttpcode,pkg_p.getvc(pkg_p.PID);
 
 return lreturncode;
exception
 when no_data_found then
  raise_application_error(pkg_e.resource_not_found_en, 'error validating etag');
 when others then
  raise;
end validateEtag;

function validateId(pendpoint varchar2, pid varchar2) return number
as
  lrespview     endpoint.respview%type;
  lcount        number;
  lsql          varchar2(200):='select count(*) from ';
begin
 pkg_log.logi('pkg_server.validateId', 'starting');

 if PID is null then
  pkg_log.logi('pkg_server.validateId', 'null PID');
  return null;
 end if; 

 pkg_log.logd('pkg_server.validateId', 'PID', PID);

 if not regexp_like(PID,'[[:alnum:]]{32,32}') and PID NOT IN (pkg_schema.SCHEMA_USER,pkg_schema.SCHEMA_GROUP) then
  return pkg_c.RES_CODE_NOT_FOUND;
 end if;
  
 lrespview:=pkg_endpoint.getEndpointRespView(pendpoint);
 appSql(lsql,lrespview);

 appSql(lsql,' where id=:id');
 pkg_log.logd('pkg_server.validateId', 'lsql', lsql);

 execute immediate lsql into lcount using pkg_p.getvc(pkg_p.PID);
  pkg_log.logd('pkg_server.validateId', 'lcount', lcount);

 return case when lcount=0 then pkg_c.RES_CODE_NOT_FOUND else null end;
end validateId;

procedure processSearch(pbody in out nocopy blob) 
as
 lsearchbody        json_object_t;
 lurn               json_array_t;
 lattributes        json_array_t;
 lexclattributes    json_array_t;
 lfilter            varchar2(1000); 
 lsortBy            varchar2(200); 
 lsortOrder         varchar2(10);
 lstartIndex        number;  
 lcount             number;

begin
 pkg_log.logi('pkg_server.processSearch', 'starting');
 
 begin
  lsearchbody:=json_object_t.parse(pbody);
  lurn:=lsearchbody.get_Array('schemas');

  lattributes:=lsearchbody.get_Array(pkg_p.PATTRIBUTES);
  if lattributes is not null then
   pkg_p.addvc(pkg_p.PATTRIBUTES,regexp_replace(lattributes.stringify,'[[]|[]|"]',''));
  end if;

  lexclattributes:=lsearchbody.get_Array(pkg_p.PEXATTRIBUTES);
  if lexclattributes is not null then
   pkg_p.addvc(pkg_p.PEXATTRIBUTES,regexp_replace(lexclattributes.stringify,'[[]|[]|"]',''));
  end if;

  lfilter:=lsearchbody.get_String(pkg_p.PFILTER);
  pkg_p.addvc(pkg_p.PFILTER,lfilter);
  lsortBy:=lsearchbody.get_String(pkg_p.PSORTBY);
  pkg_p.addvc(pkg_p.PSORTBY,lsortBy);
  lsortOrder:=lsearchbody.get_String(pkg_p.PSORTORDER);
  pkg_p.addvc(pkg_p.PSORTORDER,lsortOrder);
  lstartIndex:=lsearchbody.get_Number(pkg_p.PSTARTIDX);
  pkg_p.addNum(pkg_p.PSTARTIDX,lstartIndex);
  lcount:=lsearchbody.get_Number(pkg_p.PROWSCOUNT);
  pkg_p.addNum(pkg_p.PROWSCOUNT,lcount);

 exception
 when others then
  pkg_log.loge('pkg_server.processSearch','error',dbms_utility.format_error_stack);
 raise_application_error(pkg_e.search_parse_en,'search parse error');
 end;

end processSearch;

function processReq(pbody blob:=null) return scimresp_typ
 as
 lresp          scimresp_typ:=scimresp_typ(null,null,null);
 lrespbody      clob;
 lreq           t_req;
 lnewid         pkg_guid.guid;
begin
 pkg_log.logi('pkg_server.processReq', 'starting');
 pkg_log.logd('pkg_server.processReq', 'endpoint', pkg_p.getvc(pkg_p.PENDPOINT));
 pkg_log.logd('pkg_server.processReq', 'method', pkg_p.getvc(pkg_p.PMETHOD));

 --store request
 lreq:=insertReq(pkg_p.getvc(pkg_p.PENDPOINT), pbody);

 --validate etag and id
 if pkg_p.getvc(pkg_p.PMETHOD)<>pkg_c.METHOD_POST then
  lresp.respcode:=validateId(lreq.endpoint,pkg_p.getvc(pkg_p.PID));
  pkg_log.logd('pkg_server.processReq','validateId',lresp.respcode);                         
  if lresp.respcode is not null then 
   lresp.respbody:=pkg_e.generateErrorResponse(lresp.respcode).to_clob;
   return lresp;
  end if;

  lresp.respcode:=validateEtag(lreq.endpoint,pkg_p.getvc(pkg_p.PMETHOD));
  pkg_log.logd('pkg_server.processReq','validateEtag',lresp.respcode);                         
  if lresp.respcode is not null then 
   lresp.respbody:=pkg_e.generateErrorResponse(lresp.respcode).to_clob;
   return lresp;
  end if;
 end if;

 case pkg_p.getvc(pkg_p.PMETHOD)
 when pkg_c.METHOD_POST then
  case lreq.endpoint
  when pkg_endpoint.EP_GROUPS then 
   setId;
   pkg_grp.merge(pkg_p.getvc(pkg_p.PID),lreq);
   lresp.respcode:=pkg_c.RES_CODE_CREATED;
  when pkg_endpoint.EP_USERS then
   setId;
   pkg_usr.merge(pkg_p.getvc(pkg_p.PID),lreq);
   lresp.respcode:=pkg_c.RES_CODE_CREATED;
  when pkg_endpoint.EP_SEARCH then
   processSearch(lreq.body);
   lresp.respcode:=pkg_c.RES_CODE_OK;
  else 
   raise_application_error(pkg_e.endpoint_invalid_en,'invalid endpoint '||lreq.endpoint);
  end case; 
 when pkg_c.METHOD_PUT then
  case lreq.endpoint
  when pkg_endpoint.EP_GROUPS then 
   pkg_grp.merge(pkg_p.getvc(pkg_p.PID),lreq);
  when pkg_endpoint.EP_USERS then
   pkg_usr.merge(pkg_p.getvc(pkg_p.PID),lreq);
  else
   raise_application_error(pkg_e.endpoint_invalid_en,'invalid endpoint '||lreq.endpoint);
  end case; 
  lresp.respcode:=pkg_c.RES_CODE_OK;
 when pkg_c.METHOD_DELETE then
  case lreq.endpoint
  when pkg_endpoint.EP_GROUPS then 
   pkg_grp.remove(pkg_p.getvc(pkg_p.PID));
  when pkg_endpoint.EP_USERS then
   pkg_usr.remove(pkg_p.getvc(pkg_p.PID));
  else
   raise_application_error(pkg_e.endpoint_invalid_en,'invalid endpoint '||lreq.endpoint);
  end case;       
  lresp.respcode:=pkg_c.RES_CODE_DELETE;
  when pkg_c.METHOD_GET then
   lresp.respcode:=pkg_c.RES_CODE_OK;
  else
   raise_application_error(pkg_e.method_invalid_en,'invalid method '||pkg_p.getvc(pkg_p.PMETHOD));
 end case;
 
 if pkg_p.getvc(pkg_p.PMETHOD)<>pkg_c.METHOD_DELETE then
  buildRes(lresp);
 end if; 

  pkg_log.logd('pkg_server.processReq','res code',lresp.respcode);
  return lresp;
 exception 
 when others then
  pkg_log.loge('pkg_server.processReq',sqlcode,dbms_utility.format_error_stack);
--   rollback;
 
  if sqlcode between -21000 and -20000 then 
   lresp.respbody:=pkg_e.generateErrorResponse(pkg_c.RES_CODE_BAD_REQ,sqlerrm).to_clob;
  else
   lresp.respbody:=pkg_e.generateErrorResponse(pkg_c.RES_CODE_SERVER_ERROR,'server error').to_clob;
  end if;

  lresp.respcode:=pkg_c.RES_CODE_BAD_REQ;
  return lresp;
end processReq;

begin
 pkg_log.dumpParameters;
end "PKG_SERVER";
/
create or replace package body "PKG_SERVER_CONF" as

 function getNum(pitemname varchar2) return number
 as
  lnum number;
 begin
  select numval into lnum from server_conf where itemname=pitemname;

  return lnum;
 end;

 procedure setNum(pitemname varchar2, pnumval number)
 as
 begin
  delete server_conf where itemname=pitemname;

  insert into server_conf(itemname,numval)  
  values (pitemname,pnumval);
 end;

end "PKG_SERVER_CONF";
/
create or replace package body "PKG_USR" as

procedure merge(pid pkg_guid.guid, preq pkg_server.t_req)
as 
 lts timestamp:=f_tsatutc;
begin
 pkg_log.logi('pkg_usr.merge','Starting merge',pid);

 merge into usr a using 
 (select * from json_table(preq.body format json,'$'
     columns (externalId path '$.externalId',
     username path '$.userName',
     nameFamily path '$.name.familyName',
     nameGiven path '$.name.givenName',
     nameMiddle path '$.name.middleName',
     honorificPrefix path '$.name.honorificPrefix',
     honorificSuffix path '$.name.honorificSuffix',
     nameDisplay path '$.displayName',
     title path '$.title',
     usertype path '$.userType',
     preferredlanguage path '$.preferredLanguage',
     locale path '$.locale',
     timezone path '$.timezone',
     active path '$.active'
     ))) b
  on (a.id=pid)   
  when matched then update
  set a.externalid=b.externalid, a.username=b.username
      ,a.nameFamily=b.nameFamily, a.nameGiven=b.nameGiven, a.nameMiddle=b.nameMiddle
      ,a.honorificPrefix=b.honorificPrefix, a.honorificSuffix=b.honorificSuffix
      ,a.nameDisplay=b.nameDisplay, a.title=b.title, a.usertype=b.usertype
      ,a.preferredlanguage=b.preferredlanguage, a.locale=b.locale
      ,a.timezone=b.timezone, a.active=b.active, a.deleted='false',lastmodified=lts
  when not matched then insert 
  (id,externalId,username,nameFamily,nameGiven,nameMiddle,honorificPrefix,honorificSuffix
   ,nameDisplay,title,usertype,preferredlanguage,timezone,locale,active,deleted,created,lastmodified)
  values (pid,b.externalid,b.username,b.nameFamily,b.nameGiven,b.nameMiddle,b.honorificPrefix,b.honorificSuffix
   ,b.nameDisplay,b.title,b.usertype,b.preferredlanguage,b.timezone,b.locale,b.active,'false',lts,lts);

 merge into usr_address a using 
 (select formatted, street, locality, region, postalcode, country, type
  from json_table(preq.body format json,'$.addresses[*]'
      columns (formatted path '$.formatted',
               street path '$.streetAddress',
               locality path '$.locality',
               region path '$.region',
               postalcode path '$.postalCode',
               country path '$.country',
               type path '$.type'))) b
  on (a.usrid=pid and a.type=b.type)   
  when matched then update
  set a.formatted=b.formatted, a.street=b.street
      ,a.locality=b.locality, a.region=b.region, a.postalcode=b.postalcode
      ,a.country=b.country,lastmodified=lts
  when not matched then insert 
  (usrid,formatted,street,locality,region,postalcode,country,type,created,lastmodified)
  values (pid,b.formatted,b.street,b.locality,b.region,b.postalcode,b.country,b.type,lts,lts);

  delete usr_address where usrid=pid and lastmodified<lts;

  merge into usr_email a using 
 (select value,type,decode(rn,1,'true','false') primary from
  (select value, type, row_number() over (order by decode(primary,'true',1,2), value) rn
  from json_table(preq.body format json,'$.emails[*]'
      columns (value path '$.value',
               type path '$.type',
               primary path '$.primary'
               )))) b
  on (a.usrid=pid and a.type=b.type)   
  when matched then update
  set a.value=b.value, a.primary=b.primary,lastmodified=lts
  when not matched then insert 
  (usrid,value,primary,type,created,lastmodified)
  values (pid,b.value,b.primary,b.type,lts,lts);

  delete usr_email where usrid=pid and lastmodified<lts;

  merge into usr_phone a using 
 (select value,type,decode(rn,1,'true','false') primary from
  (select value, type, row_number() over (order by decode(primary,'true',1,2), value) rn
  from json_table(preq.body format json,'$.phoneNumbers[*]'
      columns (value path '$.value',
               type path '$.type',
               primary path '$.primary'
               )))) b
  on (a.usrid=pid and a.type=b.type)   
  when matched then update
  set a.value=b.value,a.primary=b.primary,lastmodified=lts
  when not matched then insert 
  (usrid,value,type,primary,created,lastmodified)
  values (pid,b.value,b.type,b.primary,lts,lts);

  delete usr_phone where usrid=pid and lastmodified<lts;
  
  exception
  when others then
  if sqlcode=-1 then
   pkg_log.loge('pkg_usr.merge','unique constraint violated',dbms_utility.format_error_backtrace);
   raise_application_error(pkg_e.resource_exists_en, 'resource exists');
  elsif sqlcode=-1400 then
   pkg_log.loge('pkg_grp.merge','required attr missing',dbms_utility.format_error_backtrace);
   raise_application_error(pkg_e.required_attr_missing_en, 'required attr missing');
  else
   raise;
  end if;
end merge;

procedure remove(pid pkg_guid.guid)
as
begin
 pkg_log.logi('pkg_usr.remove','Starting remove',pid);
 
 update usr set deleted='true' where id=pid;
 pkg_log.logi('pkg_usr.remove','update count',sql%rowcount);

 delete grp_member where memberid=pid;
 pkg_log.logi('pkg_usr.remove','delete count',sql%rowcount);
end;


end "PKG_USR";
/
create or replace package body "XUTL_JSON" as

function getJsonType(pjson json_element_t) return varchar2
 as
 ltype varchar2(10);
 begin

  ltype:=case 
  when pjson.is_Object then
   JSON_TYPE_OBJECT
  when pjson.is_Array then
   JSON_TYPE_ARRAY
  when pjson.is_Scalar then
   JSON_TYPE_SCALAR
  when pjson.is_String then
   JSON_TYPE_STRING
  when pjson.is_Number then
   JSON_TYPE_NUMBER
  when pjson.is_Boolean then
   JSON_TYPE_BOOLEAN
  when pjson.is_True then
   JSON_TYPE_TRUE
  when pjson.is_False then
   JSON_TYPE_FALSE
  when pjson.is_Null then
   JSON_TYPE_NULL
  when pjson.is_Date then
   JSON_TYPE_DATE
  when pjson.is_Timestamp then 
   JSON_TYPE_TIMESTAMP
  end;
    
  return ltype;
 end;

procedure addJsonResRow(ppath varchar2, pvalue varchar2, ptabjson in out tabflatjson)
as 
 llrecjson recflatjson;
begin
 if ptabjson is null then
  ptabjson:=tabflatjson();
 end if;

 llrecjson.path:=ppath;
 llrecjson.value:=pvalue;

 ptabjson.extend(1);
 ptabjson(ptabjson.count):=llrecjson;
end;

-- function flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null) return tabflatjson pipelined
--  procedure flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null)
 procedure flatten(pjson json_element_t,pkey varchar2:=null, ppath varchar2:=null,pidx number:=null, ptabjson in out tabflatjson)
 as
  lobject JSON_OBJECT_T;
  larray JSON_ARRAY_T;
  lkeys JSON_KEY_LIST;
  lkey VARCHAR2(4000);
  lpath VARCHAR2(4000);
  lrec recflatjson;

 begin
    
  IF pjson.is_object THEN
   lobject:=JSON_OBJECT_T(pjson);
   lkeys := lobject.get_keys;

   FOR i IN lkeys.FIRST..lkeys.LAST LOOP
    lkey := lkeys(i);
        
    IF lobject.get(lkey).is_array THEN
     lpath:=ppath||SEPARATOR||lkey;

     flatten(pjson=>lobject.get(lkey),pkey=>lkey,ppath=>lpath,ptabjson=>ptabjson);

    ELSIF lobject.get(lkey).is_object THEN
     lpath:=ppath||SEPARATOR||lkey;
     flatten(pjson=>lobject.get(lkey),pkey=>lkey,ppath=>lpath,ptabjson=>ptabjson);
    ELSE 
     lpath:=ppath||SEPARATOR||lkey;
    --  dbms_output.put_line(lpath||'='||lobject.get(lkey).to_clob);
    addJsonResRow(lpath,lobject.get(lkey).to_clob,ptabjson=>ptabjson);
    END IF;
   END LOOP;

  ELSIF pjson.is_array THEN
   larray:=JSON_Array_T(pjson);
   
   FOR lcnt IN 0..larray.get_size-1 LOOP
    if larray.get(lcnt).is_array 
     or larray.get(lcnt).is_object then
     flatten(pjson=>larray.get(lcnt),ppath=>ppath||'['||lcnt||']',pidx=>lcnt,ptabjson=>ptabjson);
    else
     lpath:=ppath||'['||lcnt||']';
    --  dbms_output.put_line(lpath||'='||larray.get(lcnt).to_clob); 
     addJsonResRow(lpath,larray.get(lcnt).to_clob,ptabjson=>ptabjson);
    end if; 
   END LOOP;  
 END IF;
 exception when others then
  dbms_output.put_line(sqlerrm);
  dbms_output.put_line(ppath);
  dbms_output.put_line(pjson.to_Clob);
 end;

procedure addJsonHierRow(pid varchar2, 
                         pparentid varchar2, 
                         pname varchar2, 
                         pjsontypename varchar2, 
                         pvalue varchar2:=null, 
                         pseq number:=null,
                         pschema varchar2, 
                         ptabjson in out tabjsonhier)
as 
 llrecjson recjsonhier;
begin
 if ptabjson is null then
  ptabjson:=tabjsonhier();
 end if;

 llrecjson.id:=pid;
 llrecjson.parentid:=pparentid;
 llrecjson.name:=pname;
 llrecjson.jsontypename:=pjsontypename;
 llrecjson.value:=pvalue;
 llrecjson.seq:=pseq;
 llrecjson.schema:=pschema;

 ptabjson.extend(1);
 ptabjson(ptabjson.count):=llrecjson;
end;

procedure buildHier(pjson json_element_t, 
                    pkey varchar2:=null, 
                    pparentid varchar2:=null, 
                    pschema varchar2, 
                    pseq number:=null,
                    ptabjson in out tabjsonhier)
 as
  lobject JSON_OBJECT_T;
  larray JSON_ARRAY_T;
  lkeys JSON_KEY_LIST;
  lkey VARCHAR2(4000);
  lpath VARCHAR2(4000);
  lrec recjsonhier;
  lelemguid pkg_guid.guid;
  lattrguid pkg_guid.guid;
  lmemberguid pkg_guid.guid;
 begin
  lelemguid:=f_getguid;

  addJsonHierRow(pid=>lelemguid, 
    pparentid=>pparentid,
    pname=>pkey,
    pjsontypename=>getJsonType(pjson),
    pschema=>pschema,
    pseq=>pseq,
    ptabjson=>ptabjson);

  IF pjson.is_object THEN
   lobject:=JSON_OBJECT_T(pjson);
   lkeys := lobject.get_keys;

   FOR i IN lkeys.FIRST..lkeys.LAST LOOP
    lkey := lkeys(i);
    lattrguid:=f_getguid;

    IF lobject.get(lkey).is_array 
     OR  lobject.get(lkey).is_object THEN
    --  addJsonHierRow(pid=>lattrguid, 
    --             pparentid=>lelemguid,
    --             pname=>lkey,
    --             pjsontypename=>getJsonType(lobject.get(lkey)),
    --             pschema=>pschema,
    --             pseq=>pseq,
    --             ptabjson=>ptabjson);
     buildHier(pjson=>lobject.get(lkey),pkey=>lkey,pparentid=>lelemguid,pschema=>pschema,ptabjson=>ptabjson);
    -- ELSIF lobject.get(lkey).is_object THEN
    --  addJsonHierRow(pid=>lattrguid, 
    --             pparentid=>lobjguid,
    --             pname=>lkey,
    --             pjsontypename=>getJsonType(lobject.get(lkey)),
    --             pschema=>pschema,
    --             ptabjson=>ptabjson);
    --  buildHier(pjson=>lobject.get(lkey),pkey=>lkey,pparentid=>lobjguid,pschema=>pschema,ptabjson=>ptabjson);
    ELSE 
    addJsonHierRow(pid=>lattrguid, 
                    pparentid=>lelemguid,
                    pname=>lkey,
                    pjsontypename=>getJsonType(lobject.get(lkey)),
                    pvalue=>lobject.get(lkey).to_clob,
                    pschema=>pschema,
                    ptabjson=>ptabjson);
    END IF;
   END LOOP;

  ELSIF pjson.is_array THEN
   larray:=JSON_Array_T(pjson);
   
   FOR lcnt IN 0..larray.get_size-1 LOOP
    if larray.get(lcnt).is_array 
     or larray.get(lcnt).is_object then
     buildHier(pjson=>larray.get(lcnt),
                pkey=>lkey,
                pparentid=>lelemguid,
                pschema=>pschema,
                pseq=>lcnt,
                ptabjson=>ptabjson);
    else
     lmemberguid:=f_getguid;
    --  dbms_output.put_line(lpath||'='||larray.get(lcnt).to_clob); 
     addJsonHierRow(pid=>lmemberguid,
                    pparentid=>lelemguid,
                    pname=>pkey,
                    pjsontypename=>getJsonType(larray.get(lcnt)),
                    pvalue=>larray.get(lcnt).to_clob,
                    pseq=>lcnt,
                    pschema=>pschema,
                    ptabjson=>ptabjson);
    end if; 
   END LOOP;  
 END IF;
 exception when others then
  dbms_output.put_line(sqlerrm);
  dbms_output.put_line(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  dbms_output.put_line(pjson.to_Clob);
 end buildHier;

 function createMeta(presourceType varchar2,
                  plocation varchar2,
                  pcreated date:=null,
                  plastModified date:=null,
                  pversion varchar2:=null
                  ) return json_object_t
 as
  lmeta json_object_t:=json_object_t;
 begin
  lmeta.put('resourceType',presourceType);
  lmeta.put('location',plocation);
  if pcreated is not null then
   lmeta.put('created',pcreated);
  end if;
  if plastModified is not null then
   lmeta.put('lastModified',plastModified);
  end if; 
  if pversion is not null then
   lmeta.put('version',pversion);
  end if; 
 end;                  

end "XUTL_JSON";
/

create or replace package body "PKG_GRP" as

procedure deleteMembersByGroup(pid pkg_guid.guid)
as 
begin
 delete grp_member where groupid=pid;
end;

procedure deleteMembersByUser(puserid pkg_guid.guid)
as 
begin
 delete grp_member where memberid=puserid;
end;

function getIdByDisplayName(pdisplayname varchar2) return pkg_guid.guid
as
 lid pkg_guid.guid;
begin
 select id into lid from grp where displayname=pdisplayname;
 return lid;
 exception 
 when no_data_found then
  raise_application_error(pkg_e.resource_not_found_en, 'group not found '||pdisplayname);
 when others then raise;
end;

procedure mergeUserMemberships(puserid pkg_guid.guid, preq pkg_server.t_req)
as 
 lts timestamp:=f_tsatutc;
begin

 merge into grp_member a using 
 (select groupid, puserid memberid,'User' membertype
 from json_Table(preq.body format json, '$.groups[*]'
 columns (groupid varchar2(200) path '$.value'))) b
 on (a.memberid=b.memberid and a.groupid=b.groupid)    
 when matched then update 
 set a.membertype=b.membertype, a.lastmodified=lts
 when not matched then insert
 (id,groupid,memberid,membertype,created,lastmodified)
 values (f_getguid,b.groupid,b.memberid,b.membertype,lts,lts);       

 delete grp_member where memberid=puserid and lastmodified<lts;
 
end mergeUserMemberships;

procedure mergeMembers(pid pkg_guid.guid, preq pkg_server.t_req)
as 
 lts timestamp:=f_tsatutc;
begin

 merge into grp_member a using 
 (select pid groupid, value memberid, nvl(membertype,'User') membertype
 from json_Table(preq.body format json, '$.members[*]'
 columns (value varchar2(100) path '$.value',
          membertype varchar2(100) path '$.type'))) b
 on (a.groupid=b.groupid and a.membertype=b.membertype and a.memberid=b.memberid)    
 when matched then update 
 set a.lastmodified=lts
 when not matched then insert
 (id,groupid,memberid,membertype,created,lastmodified)
 values (f_getguid,b.groupid,b.memberid,b.membertype,lts,lts);       

 delete grp_member where groupid=pid and lastmodified<lts;
 
end mergeMembers;

procedure merge(pid pkg_guid.guid, preq pkg_server.t_req)
as 
 lname grp.displayname%type;
 lts timestamp:=f_tsatutc;
 lid pkg_guid.guid;
 ldisplayName varchar2(200);
begin

 lid:=pid;
 
 begin
 merge into grp a using 
 (select externalid,displayname,description from json_table(preq.body format json,'$'
     columns (
     externalid varchar2(100) path '$.externalId',
     displayname varchar2(100) path '$.displayName',
     description varchar2(500) path '$.description'
     ))) b
  on (a.id=lid)   
  when matched then update
  set a.displayname=b.displayname, a.externalid=b.externalid, a.description=b.description, lastmodified=lts
  when not matched then insert 
  (id,externalid,displayname,description,created,lastmodified)
  values (lid,b.externalid,b.displayname,b.description,lts,lts);
  exception
  when others then 
   if sqlcode=-1 then
    -- pkg_log.loge('pkg_grp.merge','unique constraint violated',dbms_utility.format_error_backtrace);
    -- raise_application_error(pkg_e.resource_exists_en, 'resource exists');
    ldisplayName:=json_value(preq.body, '$.displayName');
    lid:=getIdByDisplayName(ldisplayName);
    pkg_p.addvc(pkg_p.PID,lid);
   else
    raise;
   end if;  
  end; 

  mergeMembers(lid, preq);

  exception
  when others then
  if sqlcode=-1400 then
   pkg_log.loge('pkg_grp.merge','required attr missing',dbms_utility.format_error_backtrace);
   raise_application_error(pkg_e.required_attr_missing_en, 'required attr missing');
--   elsif sqlcode=-1 then
--    pkg_log.loge('pkg_grp.merge','unique constraint violated',dbms_utility.format_error_backtrace);
--    raise_application_error(pkg_e.resource_exists_en, 'resource exists');
  else
   raise;
  end if;  
end merge;

procedure remove(pid pkg_guid.guid)
as
begin
 deleteMembersByGroup(pid);

 delete grp where id=pid;
end;

end "PKG_GRP";
/

INSERT INTO SERVER_CONF (ITEMNAME,VCVAL,NUMVAL,JSONVAL) VALUES ('LOG_LEVEL','',5,5);
INSERT INTO SERVER_CONF (ITEMNAME,VCVAL,NUMVAL,JSONVAL) VALUES ('ITEMS_PER_PAGE','',50,50);

INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Users','/Users','User Account','User Account','false','true','true','User','v_usr','id');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('ServiceProviderConfig','/ServiceProviderConfig','','','true','true','false','ServiceProviderConfig','v_service_provider_config','1');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Search','.search','','','true','true','false','','','');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Schemas','/Schemas','','','true','true','false','Schema','v_resource_schema','id');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Bulk','/Bulk','','','false','false','false','','','');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('ResourceTypes','/ResourceTypes','','','true','true','false','ResourceType','v_resource_type','id');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Groups','/Groups','Group','Group','false','true','true','Group','v_grp','id');
INSERT INTO ENDPOINT (NAME,PATH,DESCRIPTION,URN,READONLY,ISENABLED,ISRESOURCETYPE,RESOURCETYPE,RESPVIEW,SORTCOLDEFAULT) VALUES ('Me','/Me','','','true','false','false','','','');

INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('lt','json_exists(respjson,''$?(@.$attr < $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('le','json_exists(respjson,''$?(@.$attr <= $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('pr','json_exists(respjson,''$.$attr'')','true',2);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('eq','json_exists(respjson,''$?(@.$attr == $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('sw','json_exists(respjson,''$?(@.$attr starts with $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('ge','json_exists(respjson,''$?(@.$attr >= $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('ne','json_exists(respjson,''$?(@.$attr <> $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('co','json_exists(respjson,''$?(@.$attr has substring $$bind)'' passing :$bind as "$bind")','true',3);
INSERT INTO FILTER_PREDICATE (SCIMEXPRESSION,SQLEXPRESSION,ISENABLED,PARTCOUNT) VALUES ('gt','json_exists(respjson,''$?(@.$attr > $$bind)'' passing :$bind as "$bind")','true',3);

DECLARE
  ldoc varchar2(32767):='{
    "attributes" : [
      {
        "name" : "meta",
        "type" : "complex",
        "multiValued" : false,
        "description" : "The components of the user''s real name. Providers MAY return just the full name as a single string in the formatted sub-attribute, or they MAY return just the individual component attributes using the other sub-attributes, or they MAY return both.  If both variants are returned, they SHOULD be describing the same name, with the formatted name indicating how the component attributes should be combined.",
        "required" : false,
        "subAttributes" : [
      {
        "name" : "resourceType",
        "type" : "string",
        "multiValued" : false,
        "description" : "none",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },
      {
        "name" : "created",
        "type" : "dateTime",
        "multiValued" : false,
        "description" : ". readOnly.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },
      {
        "name" : "lastModified",
        "type" : "dateTime",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },
      {
        "name" : "version",
        "type" : "string",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },
              {
        "name" : "location",
        "type" : "string",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      }
        ],
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "none"
      }
    ]
  }';
  begin
INSERT INTO CONF_STORE (CONFTYPE,DOCSTORE,CREATED,LASTMODIFIED,ID,DOCNAME,CHILDDOCID,ENDPOINTNAME) VALUES ('SCHEMA',ldoc,SYSTIMESTAMP,SYSTIMESTAMP,f_getguid,'Meta','','');
end;
/

DECLARE
  ldoc varchar2(32767):='{
    "attributes" : [
      {
        "name" : "userName",
        "type" : "string",
        "multiValued" : false,
        "description" : "Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non-empty userName value.  This identifier MUST be unique across the service provider''s entire set of Users. REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "server"
      },
{
        "name" : "id",
        "type" : "string",
        "multiValued" : false,
        "description" : ". readOnly.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },
{
        "name" : "externalId",
        "type" : "string",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "immutable",
        "returned" : "always",
        "uniqueness" : "server"
      },
      {
        "name" : "name",
        "type" : "complex",
        "multiValued" : false,
        "description" : "The components of the user''s real name. Providers MAY return just the full name as a single string in the formatted sub-attribute, or they MAY return just the individual component attributes using the other sub-attributes, or they MAY return both.  If both variants are returned, they SHOULD be describing the same name, with the formatted name indicating how the component attributes should be combined.",
        "required" : false,
        "subAttributes" : [
          {
            "name" : "familyName",
            "type" : "string",
            "multiValued" : false,
            "description" : "The family name of the User, or last name in most Western languages (e.g., ''Jensen'' given the full name ''Ms. Barbara J Jensen, III'').",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "givenName",
            "type" : "string",
            "multiValued" : false,
            "description" : "The given name of the User, or first name in most Western languages (e.g., ''Barbara'' given the full name ''Ms. Barbara J Jensen, III'').",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "middleName",
            "type" : "string",
            "multiValued" : false,
            "description" : "The middle name(s) of the User (e.g., ''Jane'' given the full name ''Ms. Barbara J Jensen, III'').",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "honorificPrefix",
            "type" : "string",
            "multiValued" : false,
            "description" : "The honorific prefix(es) of the User, or title in most Western languages (e.g., ''Ms.'' given the full name ''Ms. Barbara J Jensen, III'').",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "honorificSuffix",
            "type" : "string",
            "multiValued" : false,
            "description" : "The honorific suffix(es) of the User, or suffix in most Western languages (e.g., ''III'' given the full name ''Ms. Barbara J Jensen, III'').",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          }
        ],
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "displayName",
        "type" : "string",
        "multiValued" : false,
        "description" : "The name of the User, suitable for display to end-users.  The name SHOULD be the full name of the User being described, if known.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "title",
        "type" : "string",
        "multiValued" : false,
        "description" : "The user''s title, such as \"Vice President.\"",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "userType",
        "type" : "string",
        "multiValued" : false,
        "description" : "Used to identify the relationship between the organization and the user.  Typical values used might be ''Contractor'', ''Employee'', ''Intern'', ''Temp'', ''External'', and ''Unknown'', but any value may be used.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "preferredLanguage",
        "type" : "string",
        "multiValued" : false,
        "description" : "Indicates the User''s preferred written or spoken language.  Generally used for selecting a localized user interface; e.g., ''en_US'' specifies the language English and country US.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "locale",
        "type" : "string",
        "multiValued" : false,
        "description" : "Used to indicate the User''s default location for purposes of localizing items such as currency, date time format, or numerical representations.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "timezone",
        "type" : "string",
        "multiValued" : false,
        "description" : "The User''s time zone in the ''Olson'' time zone database format, e.g., ''America/Los_Angeles''.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "active",
        "type" : "boolean",
        "multiValued" : false,
        "description" : "A Boolean value indicating the User''s administrative status.",
        "required" : false,
        "mutability" : "readWrite",
        "returned" : "default"
      },
      {
        "name" : "emails",
        "type" : "complex",
        "multiValued" : true,
        "description" : "Email addresses for the user.  The value SHOULD be canonicalized by the service provider, e.g., ''bjensen@example.com'' instead of ''bjensen@EXAMPLE.COM''. Canonical type values of ''work'', ''home'', and ''other''.",
        "required" : false,
        "subAttributes" : [
          {
            "name" : "value",
            "type" : "string",
            "multiValued" : false,
            "description" : "Email addresses for the user.  The value SHOULD be canonicalized by the service provider, e.g., ''bjensen@example.com'' instead of ''bjensen@EXAMPLE.COM''. Canonical type values of ''work'', ''home'', and ''other''.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "type",
            "type" : "string",
            "multiValued" : false,
            "description" : "A label indicating the attribute''s function, e.g., ''work'' or ''home''.",
            "required" : false,
            "caseExact" : false,
            "canonicalValues" : [
              "work",
              "home",
              "other"
            ],
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "primary",
            "type" : "boolean",
            "multiValued" : false,
            "description" : "A Boolean value indicating the ''primary'' or preferred attribute value for this attribute, e.g., the preferred mailing address or primary email address.  The primary attribute value ''true'' MUST appear no more than once.",
            "required" : false,
            "mutability" : "readWrite",
            "returned" : "default"
          }
        ],
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "phoneNumbers",
        "type" : "complex",
        "multiValued" : true,
        "description" : "Phone numbers for the User.  The value SHOULD be canonicalized by the service provider according to the format specified in RFC 3966, e.g., ''tel:+1-201-555-0123''. Canonical type values of ''work'', ''home'', ''mobile'', ''fax'', ''pager'', and ''other''.",
        "required" : false,
        "subAttributes" : [
          {
            "name" : "value",
            "type" : "string",
            "multiValued" : false,
            "description" : "Phone number of the User.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "type",
            "type" : "string",
            "multiValued" : false,
            "description" : "A label indicating the attribute''s function, e.g., ''work'', ''home'', ''mobile''.",
            "required" : false,
            "caseExact" : false,
            "canonicalValues" : [
              "work",
              "home",
              "mobile",
              "fax",
              "pager",
              "other"
            ],
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "primary",
            "type" : "boolean",
            "multiValued" : false,
            "description" : "A Boolean value indicating the ''primary'' or preferred attribute value for this attribute, e.g., the preferred phone number or primary phone number.  The primary attribute value ''true'' MUST appear no more than once.",
            "required" : false,
            "mutability" : "readWrite",
            "returned" : "default"
          }
        ],
        "mutability" : "readWrite",
        "returned" : "default"
      },
      {
        "name" : "addresses",
        "type" : "complex",
        "multiValued" : true,
        "description" : "A physical mailing address for this User. Canonical type values of ''work'', ''home'', and ''other''.  This attribute is a complex type with the following sub-attributes.",
        "required" : false,
        "subAttributes" : [
          {
            "name" : "formatted",
            "type" : "string",
            "multiValued" : false,
            "description" : "The full mailing address, formatted for display or use with a mailing label.  This attribute MAY contain newlines.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "streetAddress",
            "type" : "string",
            "multiValued" : false,
            "description" : "The full street address component, which may include house number, street name, P.O. box, and multi-lineextended street address information.  This attribute MAY contain newlines.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "locality",
            "type" : "string",
            "multiValued" : false,
            "description" : "The city or locality component.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "region",
            "type" : "string",
            "multiValued" : false,
            "description" : "The state or region component.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "postalCode",
            "type" : "string",
            "multiValued" : false,
            "description" : "The zip code or postal code component.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "country",
            "type" : "string",
            "multiValued" : false,
            "description" : "The country name component.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "type",
            "type" : "string",
            "multiValued" : false,
            "description" : "A label indicating the attribute''s function, e.g., ''work'' or ''home''.",
            "required" : false,
            "caseExact" : false,
            "canonicalValues" : [
              "work",
              "home",
              "other"
            ],
            "mutability" : "readWrite",
            "returned" : "default",
            "uniqueness" : "none"
          }
        ],
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
      {
        "name" : "groups",
        "type" : "complex",
        "multiValued" : true,
        "description" : "A list of groups to which the user belongs, either through direct membership, through nested groups, or dynamically calculated.",
        "required" : false,
        "subAttributes" : [
          {
            "name" : "value",
            "type" : "string",
            "multiValued" : false,
            "description" : "The identifier of the User''s group.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readOnly",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "$ref",
            "type" : "reference",
            "referenceTypes" : [
              "User",
              "Group"
            ],
            "multiValued" : false,
            "description" : "The URI of the corresponding ''Group'' resource to which the user belongs.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readOnly",
            "returned" : "always",
            "uniqueness" : "none"
          },
          {
            "name" : "displayName",
            "type" : "string",
            "multiValued" : false,
            "description" : "A human-readable name, primarily used for display purposes.  READ-ONLY.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readOnly",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "type",
            "type" : "string",
            "multiValued" : false,
            "description" : "A label indicating the attribute''s function, e.g., ''direct'' or ''indirect''.",
            "required" : false,
            "caseExact" : false,
            "canonicalValues" : [
              "direct",
              "indirect"
            ],
            "mutability" : "readOnly",
            "returned" : "default",
            "uniqueness" : "none"
          }
        ],
        "mutability" : "readOnly",
        "returned" : "default"
      }
    ]
  }';
begin
INSERT INTO CONF_STORE (CONFTYPE,DOCSTORE,CREATED,LASTMODIFIED,ID,DOCNAME,CHILDDOCID,ENDPOINTNAME) VALUES ('SCHEMA',ldoc,SYSTIMESTAMP,SYSTIMESTAMP,f_getguid,'User',(select id from conf_store where docname='Meta'),'Schemas');
 end;
/

DECLARE
  ldoc varchar2(32767):='{
    "documentationUri": "http://example.com/help/scim.html",
    "patch": {
      "supported":false
    },
    "bulk": {
      "supported":false,
      "maxOperations":1000,
      "maxPayloadSize":1048576
    },
    "filter": {
      "supported":true,
      "maxResults": 200
    },
    "changePassword": {
      "supported":false
    },
    "sort": {
      "supported":true
    },
    "etag": {
      "supported":true
    },
    "authenticationSchemes": [
      {
        "name": "OAuth Bearer Token",
        "description":
          "Authentication scheme using the OAuth Bearer Token Standard",
        "specUri": "http://www.rfc-editor.org/info/rfc6750",
        "documentationUri": "http://example.com/help/oauth.html",
        "type": "oauthbearertoken",
        "primary": true
      },
      {
        "name": "HTTP Basic",
        "description":
          "Authentication scheme using the HTTP Basic Standard",
        "specUri": "http://www.rfc-editor.org/info/rfc2617",
        "documentationUri": "http://example.com/help/httpBasic.html",
        "type": "httpbasic"
       }
    ]
  }';
 begin 
INSERT INTO CONF_STORE (CONFTYPE,DOCSTORE,CREATED,LASTMODIFIED,ID,DOCNAME,CHILDDOCID,ENDPOINTNAME) VALUES ('CONFIG',ldoc,SYSTIMESTAMP,SYSTIMESTAMP,f_getguid,'ServiceProviderConfig','','ServiceProviderConfig');
end;
/

DECLARE
  ldoc varchar2(32767):='{
    "attributes" : [
{
        "name" : "id",
        "type" : "string",
        "multiValued" : false,
        "description" : "For internal use. readOnly.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "readOnly",
        "returned" : "always",
        "uniqueness" : "server"
      },    
     {
        "name" : "displayName",
        "type" : "string",
        "multiValued" : false,
        "description" : "A human-readable name for the Group. REQUIRED.",
        "required" : false,
        "caseExact" : false,
        "mutability" : "readWrite",
        "returned" : "default",
        "uniqueness" : "none"
      },
     {
        "name" : "externalId",
        "type" : "string",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "immutable",
        "returned" : "always",
        "uniqueness" : "server"
      },
      {
        "name" : "members",
        "type" : "complex",
        "multiValued" : true,
        "description" : "A list of members of the Group.",
        "required" : false,
        "subAttributes" : [
{
        "name" : "externalId",
        "type" : "string",
        "multiValued" : false,
        "description" : ". REQUIRED.",
        "required" : true,
        "caseExact" : false,
        "mutability" : "immutable",
        "returned" : "always",
        "uniqueness" : "server"
      },
{
            "name" : "displayName",
            "type" : "string",
            "multiValued" : false,
            "description" : "display name of the member.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readOnly",
            "returned" : "default",
            "uniqueness" : "none"
          },
{
            "name" : "$ref",
            "type" : "reference",
            "referenceTypes" : [
              "User",
              "Group"
            ],
            "multiValued" : false,
            "description" : "The URI corresponding to a SCIM resource that is a member of this Group.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "immutable",
            "returned" : "default",
            "uniqueness" : "none"
          },
          {
            "name" : "type",
            "type" : "string",
            "multiValued" : false,
            "description" : "A label indicating the type of resource, e.g., ''User'' or ''Group''.",
            "required" : false,
            "caseExact" : false,
            "canonicalValues" : [
              "User",
              "Group"
            ],
            "mutability" : "immutable",
            "returned" : "default",
            "uniqueness" : "none"
          }
        ],
        "mutability" : "readWrite",
        "returned" : "default"
      }
,
          {
            "name" : "direct",
            "type" : "boolean",
            "multiValued" : false,
            "description" : "A label indicating the attribute''s function, e.g., ''direct'' or ''indirect''.",
            "required" : false,
            "caseExact" : false,
            "mutability" : "readOnly",
            "returned" : "default",
            "uniqueness" : "none"
          }
    ]
  }';
begin
INSERT INTO CONF_STORE (CONFTYPE,DOCSTORE,CREATED,LASTMODIFIED,ID,DOCNAME,CHILDDOCID,ENDPOINTNAME) VALUES ('SCHEMA',ldoc,SYSTIMESTAMP,SYSTIMESTAMP,f_getguid,'Group',(select id from conf_store where docname='Meta'),'Schemas');
end;
/

begin
apex_util.create_user_group(
p_group_name=>'APEXSCIM',
p_group_desc=>'Group Used to Secure SCIM Module'
);
end;
/
