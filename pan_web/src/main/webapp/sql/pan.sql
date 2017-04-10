use pan;

-- 学院账号
create table colcount(
	id VARCHAR(32) PRIMARY KEY,
	col_id VARCHAR(32) not NULL,
	username varchar(20) not NULL,
	password varchar(20) not null,
	fol_id text not null
);

-- 文件对象
create table file (
	id VARCHAR(32) PRIMARY KEY,
	type varchar(5),  -- 图片，文档，视频，种子，音乐，其他，"文件夹"
	folurl text not null
);

-- 学院对象
create table college (
	id varchar(32) PRIMARY KEY,
	col_name VARCHAR(20) NOT NULL
);

-- 网盘大小
create table panlevel(
	id varchar(32) PRIMARY key,
	LEVEL VARCHAR(10) not null,
	size VARCHAR(20) not null  -- 字符串形式存储，单位为M
);

-- 学院老师对象
create table teacount(
	id VARCHAR(32) PRIMARY KEY,
	username VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
	realname VARCHAR(20) NOT NULL,
	col_id VARCHAR(32) NOT NULL,
	phone varchar(15),
	mail VARCHAR(32),
	fol_id VARCHAR(32) NOT NULL,
	pan_id VARCHAR(32)
);



