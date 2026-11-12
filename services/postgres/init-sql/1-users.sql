-- Connect to the default 'postgres' database or any other existing database

-- Check if the 'ignition' schema does not exist, and if not, create it
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_namespace WHERE nspname = 'ignition') THEN
        CREATE SCHEMA ignition;
    END IF;
END$$;

-- Check if the 'Ignition' role does not exist, and if not, create it and set permissions
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'ignition') THEN
        CREATE ROLE Ignition WITH LOGIN PASSWORD 'P@ssword1!';
        -- No need to grant privileges on the database since it's the default one
        ALTER ROLE Ignition SET search_path TO ignition;
		GRANT ALL ON SCHEMA ignition TO Ignition;
    END IF;
END$$;

-- Check if the 'liquibase' schema does not exist, and if not, create it
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_namespace WHERE nspname = 'liquibase') THEN
        CREATE SCHEMA liquibase;
    END IF;
END$$;

-- Check if the 'liquibase' role does not exist, and if not, create it and set permissions
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'liquibase') THEN
        CREATE ROLE liquibase WITH LOGIN PASSWORD 'P@ssword1!';
        -- No need to grant privileges on the database since it's the default one
        ALTER ROLE liquibase SET search_path TO liquibase;
		GRANT ALL ON SCHEMA liquibase TO liquibase;
		GRANT ALL ON SCHEMA ignition TO liquibase;
    END IF;
END$$;
