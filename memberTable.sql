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
drop table member;
commit;

--어드민
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('어드민', 'admin', '1234', 'tigsnor@naver.com',
'0', '1', '010-1111-2222', '0');

--일반사용자 남 더미 데이터
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('홍길동', 'hong', '1234', 'hong@naver.com',
'0', '1', '01022223333', '1');

--일반사용자 여 더미 데이터
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('심청이', 'sim', '1234', 'sim@naver.com',
'0', '2', '01033334444', '1');

--헬퍼 더미 데이터
insert into member 
(member_name, member_id, member_pass, member_email, member_age, member_sex,
member_phone,member_status, member_bank, member_account, member_vehicle, member_introduce, member_review
,member_missionC, member_point)
values ('헬퍼', 'helper', '1234', 'helper@naver.com', '24', '1',
'01055556666', 2, '국민은행', '12341241242', '0', '열심히하겠습니다.', '4', '10', '2000');

--블랙리스트사용자 더미 데이터
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('블랙', 'black', '1234', 'black@naver.com',
'0', '1', '01066667777', '3');

commit;

select * from member;

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
--qna더미데이터
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, '큐제목1', '큐내용1', '더미아이디', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, '큐제목2', '큐내용2', '더미아이디', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, '큐제목3', '큐내용3', '더미아이디', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, '큐제목4', '큐내용4', '더미아이디', sysdate, 0);

commit;


create table qreview (
    num number primary key,
    content varchar2(200) not null,
    id varchar2(20) not null
);

insert into qreview
(num, content, id)
values (1, '리뷰내용1', '리뷰관리자');

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


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '떡복이이이이이배달해주세요', '떡볶이 배달해주세요~~!!', '출발좌표', '도착좌표', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요', '떡볶이 배달해주세요~~^^', '출발좌표', '도착좌표', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요2', '떡볶이 배달해주세요~~2', '출발좌표', '도착좌표', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요3', '떡볶이 배달해주세요~~3', '출발좌표', '도착좌표', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요4', '떡볶이 배달해주세요~~4', '출발좌표', '도착좌표', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요5', '떡볶이 배달해주세요~~5', '출발좌표', '도착좌표', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요6', '떡볶이 배달해주세요~~6', '출발좌표', '도착좌표', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '배달,장보기', '배달해주세요7', '떡볶이 배달해주세요~~7', '출발좌표', '도착좌표', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_reservation, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'hong', '청소,집안일', '청소요청!', '깨끗하게 청소부탁해요^^', '출발좌표', '도착좌표', '2', '2022-02-20', '4', '10000', '2');



commit;
select * from mission;

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

insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '관리자', '이건 공지사항', '이건공지사항내용이네', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '관리자1', '이건 공지사항1', '이건공지사항내용이네1', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '관리자2', '이건 공지사항2', '이건공지사항내용이네2', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '관리자3', '이건 공지사항3', '이건공지사항내용이네3', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '관리자4', '이건 공지사항4', '이건공지사항내용이네4', sysdate, 0);

commit;
select * from mboard;

----------------------------------------------------------------------------------------------

create table review(
    review_num number primary key not null,
    mission_num number not null,
    review_id varchar2(10) not null,
    review_content varchar2(200) not null,
    review_point number not null,
    review_date date default sysdate not null
);
--리뷰 시퀀스
create sequence review_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--리뷰 더미데이터
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo', '이것은 리뷰입니다','5' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'kosmo2', '이것은 리뷰입니다','2' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,3,'kosmo3', '이것은 리뷰입니다','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo4', '이것은 리뷰입니다','4' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo5', '이것은 리뷰입니다','1' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmoh123', '이것은 리뷰입니다','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,0,'kosmoh123', '엄청 좋아요','5' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmoh123', '보통','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'kosmoh123', '싫어요','2' ,sysdate);

insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'helper', '어허허허','2' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'helper', 'good허333','5' ,sysdate);
commit;

