# APEX-SCIM-v2
APEX SCIM is a SCIM 2.0 compatible server built on Oracle APEX.  It can be used to push identies from your SCIM provisioning client to Oracle based applications or other applications that have an Oracle back end.  

APEX SCIM will save the development time required to create a SCIM interface between cloud IDAAS providers and your application.  The server has been tested against OKTA and an Azure client.  

Currently supported features:
 1. User/Group Resource Types
 2. Sorting
 3. Filtering
 4. ETags
 5. 2 levels of nested attributes.  Attributes below two levels(e.g User -> User Phone) have not been tested.

Not Supported:
 1. Patch 
 2. Bulk Operations
 3. Change Password

Future roadmap Features:
 1. Those listed under Not Supported.
 2. Extensibile Attribut Mapping/Management
 3. Additional resource types

The currently tested platform version(s):
APEX 24.1
Oracle Database 19c

Installation
1. installscim.sql - Installs the database objects and required config.
2. apex_scim_app.sql - Installs the APEX application
3. installscim.sql - Installs the ORDS module.  

Documentation
1. Further documentation can be found in the the APEXSCIMAdminGuide.htm"# APEX-SCIM-v2" 
