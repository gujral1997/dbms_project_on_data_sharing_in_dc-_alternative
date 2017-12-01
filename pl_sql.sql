 ---CURSOR THAT UPLOADS ALL THE ENTRIES INSIDE CRC_CHECKED OF TABLE UPLAODS TO "YES"
 DECLARE
    total_rows number(3);
 BEGIN
    UPDATE UPLOADS
    SET CRC_CHECKED = 'YES';
    IF sql%notfound THEN
       dbms_output.put_line('No DATA selected');
    ELSIF sql%found THEN
       total_rows := sql%rowcount;
       dbms_output.put_line( total_rows || ' DATA selected ');
    END IF;
 END;
--CURSOR USED TO RETRIEVE THE DETAILED INFORMATION OF THE USERS WHO ARE CONNECTED TO ATLEAST ONE HUB
DECLARE
   u_list hub_list.LIST_URL%type;
   u_url hub.URL_ADDRESS%type;
   u_name hub.NAME%type;
   u_country hub.COUNTRY%type;
   u_user_id users.USER_ID%type;
   u_user_name users.USER_NAME%type;
   u_description users.DESCRIPTION%type;
   u_ip users.IP%type;
   u_connection_status users.CONNECTION_STATUS%type;
   CURSOR userdata is
   SELECT HB.LIST_URL,H.URL_ADDRESS,H.NAME,H.COUNTRY,U.USER_ID,U.USER_NAME,U.DESCRIPTION,U.IP,U.CONNECTION_STATUS
   FROM HUB_LIST HB,HUB H,CONNECTION C,USERS U
   WHERE HB.URL_ADDRESS=H.URL_ADDRESS
   AND  HB.URL_ADDRESS=C.URL_ADDRESS
   AND  C.USER_ID=U.USER_ID;
BEGIN
   OPEN userdata;
   LOOP
   FETCH userdata into  u_list,u_url,u_name,u_country,u_user_id,u_user_name,u_description,u_ip,u_connection_status;
      EXIT WHEN userdata%notfound;
      dbms_output.put_line(u_user_id||' | '||u_user_name||' | '||u_description||' | '||u_ip||' | '||u_connection_status||' | '||u_list||' | '||u_url||' | '||u_name||' | '||u_country);
   END LOOP;
   CLOSE userdata;
END;

---CURSOR THAT COUNTS THE NUMBER OF USERS REGISTERED AT DC++
DECLARE
  cur sys_refcursor;
  cur_rec USERS%rowtype;
BEGIN
  OPEN cur FOR
  SELECT * FROM USERS;
  dbms_output.put_line(cur%rowcount);
  LOOP
    FETCH cur INTO cur_rec;
    EXIT WHEN cur%notfound;
  END LOOP;
  dbms_output.put_line('Total no of users registered at dc++: ' || cur%rowcount);
END;
---PROCEDURE FOR INSERTING DATA IN DATA TABLE
CREATE OR REPLACE PROCEDURE insertDATA(
	   u_dataid IN DATA.DATA_ID%TYPE,
	   u_datemodified IN DATA.DATE_MODIFIED%TYPE,
	   u_description IN DATA.DESCRIPTION%TYPE,
	   u_filename IN DATA.FILE_NAME%TYPE,
     u_type IN DATA.TYPE%TYPE,
    u_filesize IN DATA.FILE_SIZE%TYPE)
IS
BEGIN

  INSERT INTO DATA ("DATA_ID","DATE_MODIFIED","DESCRIPTION","FILE_NAME","TYPE","FILE_SIZE")
  VALUES (u_dataid,u_datemodified,u_description,u_filename,u_type,u_filesize);

  COMMIT;

END;
---
BEGIN
   insertDATA('D13','14-JAN-2016','movie','video1','3gp','560MiB');
END;
/*---Doubt---
CREATE OR REPLACE PROCEDURE insertDATA(
	   u_dataid IN DATA.DATA_ID%TYPE,
	   u_datemodified IN DATA.DATE_MODIFIED%TYPE,
	   u_description IN DATA.DESCRIPTION%TYPE,
	   u_filename IN DATA.FILE_NAME%TYPE,
     u_type IN DATA.TYPE%TYPE,
    u_filesize IN DATA.FILE_SIZE%TYPE)
IS
BEGIN
  u_dataid:=&u_dataid;
  u_datemodified:=&u_datemodified;
  u_description:=&u_description;
  u_filename:=&u_filename;
  u_type:=&u_type;
  u_filesize:=&u_filesize;
   insertDATA(u_dataid,u_datemodified,u_description,u_filename,u_type,u_filename);
END;
BEGIN

  INSERT INTO DATA ("DATA_ID","DATE_MODIFIED","DESCRIPTION","FILE_NAME","TYPE","FILE_SIZE")
  VALUES (u_dataid,u_datemodified,u_description,u_filename,u_type,u_filesize);

  COMMIT;

END;*/
---TRIGGER THAT TELLS THE UPDATE DONE IN MAX USER CAPACITY IN HUB TABLE
CREATE OR REPLACE TRIGGER display_MAX_USERS_changes
BEFORE DELETE OR INSERT OR UPDATE ON HUB
FOR EACH ROW
WHEN (NEW.MAX_USERS > 1000)
DECLARE
   MAX_USERS_diff number;
BEGIN
   MAX_USERS_diff := :NEW.MAX_USERS  - :OLD.MAX_USERS;
   dbms_output.put_line('Old MAX_USERS: ' || :OLD.MAX_USERS);
   dbms_output.put_line('New MAX_USERS: ' || :NEW.MAX_USERS);
   dbms_output.put_line('MAX_USERS difference: ' || MAX_USERS_diff);
END;
---
set serveroutput on;
INSERT INTO HUB
VALUES('dcashfub.co.uk','werocks','uk hub','uk','4.2PiB',10000,2);
---TRIGGER THAT NOTIFIES THAT NEW USER HAS REGISTERED TO DC++
CREATE OR REPLACE TRIGGER INSERT_TRIGGER
AFTER INSERT ON USERS
BEGIN
DBMS_OUTPUT.PUT_LINE('NEW USER ENTERED');
END;
---
INSERT INTO USERS
VALUES('U1','codelover5','american','192.168.1.5','CONNECTED');
---TRIGGER THAT DOESNT ALLOW UPLOAD BETWEEN 11 PM AND 6 AM
CREATE OR REPLACE TRIGGER RESTRICT_UPLAODS
BEFORE INSERT ON UPLOADS
BEGIN
IF(TO_CHAR(SYSDATE,'HH24:MI')NOT BETWEEN '23:00' AND '6:00') THEN
RAISE_APPLICATION_ERROR(-2010,'UPLAOD NOT ALLOWED');
END IF;
END;
---
INSERT INTO UPLOADS
VALUES('D2','4','10s','2MiB/s','NO');
--EXCEPTION thrown when MAX_USERS=1 DONT EXSISTS
DECLARE
   name HUB.NAME%type;
   address HUB.URL_ADDRESS%type;
BEGIN
   SELECT  name, address INTO  name,address
   FROM HUB
   WHERE MAX_USERS = 1;
   DBMS_OUTPUT.PUT_LINE ('Name: '||  name);
   DBMS_OUTPUT.PUT_LINE ('Address: ' || address);

EXCEPTION
   WHEN no_data_found THEN
      dbms_output.put_line('No such HUB!');
   WHEN others THEN
      dbms_output.put_line('Error!');
END;
