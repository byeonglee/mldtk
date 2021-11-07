CREATE database hermes;

CREATE table hermesDir (
uid INT PRIMARY KEY NOT NULL auto_increment,
lastName varchar(40) NOT NULL,
firstName varchar(40) NOT NULL,
middleInit varchar(5) NULL,
location varchar(20) NOT NULL,
email varchar(60) NOT NULL,
picture varchar(100) NOT NULL,
password varchar(32) NOT NULL,
status varchar(50) NULL,
stat_expires DATE NULL,
auth INT DEFAULT 0 NOT NULL ,
contact_0 varchar(70) NULL,
contact_1 varchar(70) NULL,
contact_2 varchar(70) NULL,
contact_3 varchar(70) NULL,
contact_4 varchar(70) NULL,
contact_5 varchar(70) NULL,
contact_6 varchar(70) NULL,
contact_7 varchar(70) NULL,
contact_8 varchar(70) NULL,
contact_9 varchar(70) NULL,
phonePin  int(11)
);

GRANT ALL ON hermes.hermesDir to pervasive_RW IDENTIFIED by 'danish+scum';

GRANT SELECT ON hermes.hermesDir to pervasive_RO IDENTIFIED by 'danish';