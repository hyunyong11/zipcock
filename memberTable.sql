/****************************
    zipcock 서비스
*****************************/

-- System계정에서 생성
create user zipcock identified by 1234;
grant connect, resource to zipcock;

-- 여기부터 zipcock으로 진행
-- 멤버 테이블 생성
create table member (
    member_name varchar2(50) not null,
    member_id varchar2(20) primary key,
    member_pass varchar2(20) not null,
    member_email varchar2(50) not null,
    member_age varchar2(10) not null,
    member_sex number not null,
    member_phone varchar2(20) not null,
    member_missionN number,
    member_status number default 1 not null,
    member_bank varchar(50),
    member_account varchar(50),
    member_vehicle number,
    member_introduce varchar2(500),
    member_ofile varchar2(200),
    member_sfile varchar2(200),
    member_review number,
    member_missionC number,
    member_point number
);



------------------------------------------------------------------------------------------------------------
create table qboard (
    num number primary key,
    title varchar2(30) not null,
    content varchar2(200) not null,
    id varchar2(20) not null,
    postdate date default sysdate not null,
    visitcount number default 0 not null
);
drop table qboard;
create sequence seq_qboard
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
drop sequence seq_qboard;



create table qreview (
    num number primary key,
    content varchar2(200) not null,
    id varchar2(20) not null
);

commit;
------------------------------------------------------------------------------------------------------------
create table mission (
    mission_num number primary key,
    mission_id varchar2(20) not null,
    mission_category varchar(50) not null,
    mission_name varchar2(50) not null,
    mission_content varchar2(300) not null,
    mission_ofile varchar2(200),
    mission_sfile varchar2(200),
    mission_sex number default 1 not null,
    mission_Hid varchar2(20),
    mission_start varchar2(200),
    mission_waypoint varchar2(200),
    mission_end varchar2(200) not null,
    mission_mission number not null,
    mission_reservation varchar2(50),
    mission_time varchar(20) not null,
    mission_cost number not null,
    mission_status number default 1 not null 
);

drop table mission;

create sequence mission_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
drop sequence mission_seq;



----------------------------------------------------------------------------------------------
create table mboard (
    mboard_num number primary key,
    mboard_id varchar2(20) not null,
    mboard_title varchar2(30) not null,
    mboard_content varchar2(200) not null,
    mboard_date date default sysdate not null,
    mboard_count number default 0 not null
); 

create sequence mboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache; 


----------------------------------------------------------------------------------------------

--리뷰 테이블
create table review(
    review_num number primary key not null,
    mission_num number not null,
    review_id varchar2(10) not null,
    review_content varchar2(200) not null,
    review_point number not null,
    review_date date default sysdate not null,
    review_hid varchar2(10)not null
);
drop table review;
--리뷰 시퀀스
create sequence review_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

drop sequence review_seq;
