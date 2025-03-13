create table test(
    userid varchar2(30) primary key,
    userpw varchar2(30) not null
);
insert into test values('user01','pass01');
insert into test values('user02','pass02');
insert into test values('user03','pass03');
commit;

create table member(
    id varchar2(20) primary key,
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    gender char(1),
    birthday char(6),
    email varchar2(30),
    zipcode char(5),
    address varchar2(100),
    detailAddress varchar2(50),
    hobby char(5),
    job varchar2(30)
);
commit;

create table votelist(
num number primary key,
question varchar2(200) not null,
sdate date,
edate date,
wdate date,
type number default 1 not null,
active number default 1
);

COMMENT ON COLUMN votelist.num IS '설문 번호';
COMMENT ON COLUMN votelist.question IS '설문 내용';
COMMENT ON COLUMN votelist.sdate IS '투표 시작 날짜';
COMMENT ON COLUMN votelist.edate IS '투표 종료 날짜';
COMMENT ON COLUMN votelist.wdate IS '설문 작성 날짜';
COMMENT ON COLUMN votelist.type IS '중복투표 허용 여부';
COMMENT ON COLUMN votelist.active IS '설문 활성화 여부';

CREATE TABLE voteitem (
    listnum NUMBER,
    itemnum NUMBER,
    item VARCHAR2(50),
    count NUMBER DEFAULT 0,
    CONSTRAINT voteitem_pk PRIMARY KEY (listnum, itemnum)
);

CREATE SEQUENCE SEQ_VOTE nocache;


