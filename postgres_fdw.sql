CREATE EXTENSION postgres_fdw;

CREATE SERVER test_server
	FOREIGN DATA WRAPPER postgres_fdw
	OPTIONS (host 'test_host_address', port '5432', dbname 'test_db');

CREATE USER MAPPING FOR postgres
	SERVER test_server
	OPTION (user 'test_user', password 'Test#pwd');

IMPORT FOREIGN SCHEMA public
FROM SERVER  test_server INTO public;