 ---
 DECLARE
    total_rows number(3);
 BEGIN
    UPDATE UPLOADS
    SET CRC_CHECKED = 'YES';
    IF sql%notfound THEN
       dbms_output.put_line('no DATA selected');
    ELSIF sql%found THEN
       total_rows := sql%rowcount;
       dbms_output.put_line( total_rows || ' DATA selected ');
    END IF;
 END;
---
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

---
DECLARE
  cur sys_refcursor;
  cur_rec sp%rowtype;
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
---
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
---






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
DECLARE
u_dataid DATA.DATA_ID%TYPE,
u_datemodified DATA.DATE_MODIFIED%TYPE,
u_description DATA.DESCRIPTION%TYPE,
u_filename DATA.FILE_NAME%TYPE,
u_type DATA.TYPE%TYPE,
u_filesize DATA.FILE_SIZE%TYPE
BEGIN
  u_dataid:=&u_dataid;
  u_datemodified:=&u_datemodified;
  u_description:=&u_description;
  u_filename:=&u_filename;
  u_type:=&u_type;
  u_filesize:=&u_filesize;
  INSERT INTO DATA ("DATA_ID","DATE_MODIFIED","DESCRIPTION","FILE_NAME","TYPE","FILE_SIZE")
  VALUES (u_dataid,u_datemodified,u_description,u_filename,u_type,u_filesize);

  COMMIT;

END;
---
BEGIN
   insertDATA('D12','14-JAN-2016','movie','video1','3gp','560MiB');
END;
