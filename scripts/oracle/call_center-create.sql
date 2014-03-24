INSERT INTO version (table_name, table_version) values ('cc_flows','1');
CREATE TABLE cc_flows (
    id NUMBER(10),
    flowid VARCHAR2(64) PRIMARY KEY,
    priority NUMBER(10) DEFAULT 256 NOT NULL,
    skill VARCHAR2(64),
    prependcid VARCHAR2(32),
    message_welcome VARCHAR2(128) DEFAULT NULL,
    message_queue VARCHAR2(128)
);

CREATE OR REPLACE TRIGGER cc_flows_tr
before insert on cc_flows FOR EACH ROW
BEGIN
  auto_id(:NEW.id);
END cc_flows_tr;
/
BEGIN map2users('cc_flows'); END;
/
INSERT INTO version (table_name, table_version) values ('cc_agents','1');
CREATE TABLE cc_agents (
    id NUMBER(10),
    agentid VARCHAR2(128) PRIMARY KEY,
    location VARCHAR2(128),
    logstate NUMBER(10) DEFAULT 0 NOT NULL,
    skills VARCHAR2(512)
);

CREATE OR REPLACE TRIGGER cc_agents_tr
before insert on cc_agents FOR EACH ROW
BEGIN
  auto_id(:NEW.id);
END cc_agents_tr;
/
BEGIN map2users('cc_agents'); END;
/
INSERT INTO version (table_name, table_version) values ('cc_cdrs','1');
CREATE TABLE cc_cdrs (
    id NUMBER(10) PRIMARY KEY,
    caller VARCHAR2(64),
    received_timestamp DATE,
    wait_time NUMBER(10) DEFAULT 0 NOT NULL,
    pickup_time NUMBER(10) DEFAULT 0 NOT NULL,
    talk_time NUMBER(10) DEFAULT 0 NOT NULL,
    flow_id VARCHAR2(128),
    agent_id VARCHAR2(128) DEFAULT NULL,
    call_type NUMBER(10) DEFAULT -1 NOT NULL,
    call_type NUMBER(10) DEFAULT 0 NOT NULL,
    call_type NUMBER(10) DEFAULT 0 NOT NULL,
    cid NUMBER(10) DEFAULT 0
);

CREATE OR REPLACE TRIGGER cc_cdrs_tr
before insert on cc_cdrs FOR EACH ROW
BEGIN
  auto_id(:NEW.id);
END cc_cdrs_tr;
/
BEGIN map2users('cc_cdrs'); END;
/