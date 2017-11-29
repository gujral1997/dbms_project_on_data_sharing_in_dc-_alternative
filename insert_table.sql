--Inserting into HUB--

INSERT INTO HUB
VALUES('allavtoto.ru','allavtoto','russian hub','russia','1.2PiB',10000,3);
INSERT INTO HUB
VALUES('allavtoto2.ru','allavtoto','russian hub','russia','1.2PiB',10000,3);
INSERT INTO HUB
VALUES('werocks.in','werocks','indian hub','india','1.2PiB',10000,3);
INSERT INTO HUB
VALUES('werocks.com','werocks','american hub','america','122.2TiB',50000,5);
INSERT INTO HUB
VALUES('helloworld.in','hello','indian hub','india','1.2PiB',10000,1);
INSERT INTO HUB
VALUES('dchub.co.uk','werocks','uk hub','uk','4.2PiB',10000,2);


--Inserting into HUB_LIST--
INSERT INTO HUB_LIST
VALUES('werocks.in','http://dchublist.com/hublist.xml.bz2');
INSERT INTO HUB_LIST
VALUES('helloworld.in','http://hublista.com/hublist.xml.bz2');
INSERT INTO HUB_LIST
VALUES('werocks.com','http://dchublist.com/hublist.xml.bz2');
INSERT INTO HUB_LIST
VALUES('werocks.in','http://hublista.com/hublist.xml.bz2');
INSERT INTO HUB_LIST
VALUES('allavtoto.ru','http://dchublist.com/hublist.xml.bz2');

--Inserting into Users--
INSERT INTO USERS
VALUES('1','codelover1','computer_geek','192.168.1.1','CONNECTED');
INSERT INTO USERS
VALUES('2','codelover1','loves coding','192.168.1.1','DISCONNECTED');
INSERT INTO USERS
VALUES('3','codelover2','loves dc++','192.168.1.2','DISCONNECTED');
INSERT INTO USERS
VALUES('4','codelover3','indian','192.168.1.3','CONNECTED');
INSERT INTO USERS
VALUES('5','codelover4','chinese','192.168.1.4','DISCONNECTED');
INSERT INTO USERS
VALUES('6','codelover5','american','192.168.1.5','CONNECTED');
---Inserting into connection--
INSERT INTO CONNECTION
VALUES('allavtoto.ru','1');
INSERT INTO CONNECTION
VALUES('werocks.in','2');
INSERT INTO CONNECTION
VALUES('werocks.com','3');
INSERT INTO CONNECTION
VALUES('werocks.com','4');
INSERT INTO CONNECTION
VALUES('helloworld.in','5');
--inserting into DATA---
INSERT INTO DATA
VALUES('D1','12-JAN-2016','MY DATA','song1','mp3','10MiB');
INSERT INTO DATA
VALUES('D2','13-JAN-2016','os','windows7','iso','3.8GiB');
INSERT INTO DATA
VALUES('D3','14-JAN-2016','movie','video1','3gp','560MiB');
INSERT INTO DATA
VALUES('D4','15-JAN-2016','MY DATA','song1','mp3','10MiB');
INSERT INTO DATA
VALUES('D5','16-JAN-2016','MY DATA','song2','mp3','5MiB');
--inserting into HASHING---
INSERT INTO HASHING
VALUES('D1','1');
INSERT INTO HASHING
VALUES('D2','1');
INSERT INTO HASHING
VALUES('D1','2');
INSERT INTO HASHING
VALUES('D1','3');
INSERT INTO HASHING
VALUES('D1','4');
--INSERTING INTO UPLOADS--
INSERT INTO UPLOADS
VALUES('D1','4','10s','2MiB/s','NO');
INSERT INTO UPLOADS
VALUES('D1','3','10m2s','1.1MiB/s','YES');
INSERT INTO UPLOADS
VALUES('D1','2','1m1s','230KiB/s','YES');
INSERT INTO UPLOADS
VALUES('D2','1','1m23s','232KiB/s','YES');
INSERT INTO UPLOADS
VALUES('D1','1','1hr2m3s','10KiB/s','NO');
--INSERTING INTO DOWNLOADS--
INSERT INTO DOWNLOADS
VALUES('D1','4','10s','2MiB/s','NO');
INSERT INTO DOWNLOADS
VALUES('D1','3','10m2s','1.1MiB/s','YES');
INSERT INTO DOWNLOADS
VALUES('D1','2','1m1s','230KiB/s','YES');
INSERT INTO DOWNLOADS
VALUES('D2','1','1m23s','232KiB/s','YES');
INSERT INTO DOWNLOADS
VALUES('D1','1','1hr2m3s','10KiB/s','NO');
