begin
 
  OAUTH.create_client(
    p_name            => 'scim_client',
    p_grant_type      => 'client_credentials',
    p_owner           => 'Example Company',
    p_description     => 'A client for API integrations by an Example Company',
    p_support_email   => 'myemail@example.com',
    p_privilege_names => 'customer_api_priv'
  );
 
  OAUTH.grant_client_role(
    p_client_name     => 'scim_client',
    p_role_name       => 'SCIMCLIENT'
  );
 
  commit;
 
end;