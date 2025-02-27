-- Cleare Database 
DELETE FROM provider;
DELETE FROM server;
DELETE FROM domain;
DELETE FROM server_domain;

-- Define Provider
INSERT INTO provider values(100, "long_name_example.com", "whatever-name");

-- Define Server (IMAP + SMPT)
INSERT INTO server VALUES(101, 10, "example.com", 587, 'smtp', 'STARTTLS', '%MAILADDRESS%', 'plain');    
INSERT INTO server VALUES(102, 10, "example.com", 993, 'imap', 'SSL', '%MAILADDRESS%', 'plain');    

-- Link Domain and Provider
INSERT INTO domain VALUES(110, 'example.com', 100, NULL);

-- Link Server and Domain
INSERT INTO server_domain VALUES(101, 110);
INSERT INTO server_domain VALUES(102, 110);
