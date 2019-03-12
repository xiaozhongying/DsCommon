SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS DS_EP_ENTERPRISE;
DROP TABLE IF EXISTS DS_EP_USER;
DROP TABLE IF EXISTS DS_PERSON_USER;
CREATE TABLE DS_EP_ENTERPRISE
(
   ID                   BIGINT(18) NOT NULL COMMENT 'ID',
   NAME                 VARCHAR(300) COMMENT '企业名称',
   SSXQ                 VARCHAR(30) COMMENT '所属辖区',
   QYBM                 VARCHAR(64) COMMENT '编码',
   STATUS               INT COMMENT '状态(0禁用,1正常运营,待扩展)',
   TYPE                 VARCHAR(300) COMMENT '类型',
   PRIMARY KEY (ID)
) COMMENT '企业';
CREATE TABLE DS_EP_USER
(
   ID                   BIGINT(18) NOT NULL COMMENT '主键',
   QYBM                 VARCHAR(64) COMMENT '企业编码',
   ACCOUNT              VARCHAR(64) COMMENT '账号',
   PASSWORD             VARCHAR(256) COMMENT '密码',
   NAME                 VARCHAR(30) COMMENT '姓名',
   IDCARD               VARCHAR(64) COMMENT '身份证号',
   STATUS               INT COMMENT '状态(1启用,0禁用)',
   USERTYPE             INT COMMENT '用户类型(1企业管理员,0普通用户)',
   EMAIL                VARCHAR(300) COMMENT '电子邮件',
   MOBILE               VARCHAR(30) COMMENT '手机',
   PHONE                VARCHAR(30) COMMENT '电话',
   WORKCARD             VARCHAR(64) COMMENT '工作证号',
   CAKEY                VARCHAR(1024) COMMENT 'CA证书的KEY',
   CREATETIME           VARCHAR(19) COMMENT '创建时间',
   SSDW                 VARCHAR(300) COMMENT '所属单位',
   SSBM                 VARCHAR(300) COMMENT '所属部门',
   FAX                  VARCHAR(30) COMMENT '传真',
   PRIMARY KEY (ID)
) COMMENT '企业用户';
CREATE TABLE DS_PERSON_USER
(
   ID                   BIGINT(18) NOT NULL COMMENT '主键',
   IDCARD               VARCHAR(64) COMMENT '身份证号',
   ACCOUNT              VARCHAR(64) COMMENT '账号',
   PASSWORD             VARCHAR(256) COMMENT '密码',
   NAME                 VARCHAR(30) COMMENT '姓名',
   STATUS               INT COMMENT '状态(1启用,0禁用)',
   EMAIL                VARCHAR(300) COMMENT '电子邮件',
   MOBILE               VARCHAR(30) COMMENT '手机',
   PHONE                VARCHAR(30) COMMENT '电话',
   CAKEY                VARCHAR(1024) COMMENT 'CA证书的KEY',
   CREATETIME           VARCHAR(19) COMMENT '创建时间',
   USERTYPE             VARCHAR(30) COMMENT '用户类型',
   PRIMARY KEY (ID)
) COMMENT '个人用户';




DROP TABLE IF EXISTS DS_XZSP;
CREATE TABLE DS_XZSP
(
   ID                   BIGINT(18) NOT NULL COMMENT '主键',
   SBLSH                VARCHAR(19) COMMENT '申办流水号',
   SPTYPE               INT(11) COMMENT '对象类型0ShenBan，1YuShouLi，2ShouLi，3ShenPi，4BanJie，5TeBieChengXuQiDong，6TeBieChengXuBanJie，7BuJiaoGaoZhi，8BuJiaoShouLi，9LingQuDengJi',
   FSZT                 INT(11) COMMENT '发送状态(0待发,1已发,3信息格式不正确)',
   FSCS                 INT(11) COMMENT '发送次数',
   FSSJ                 VARCHAR(19) COMMENT '发送时间',
   SPOBJECT             VARCHAR(4000) COMMENT '序列化对象',
   MEMO                 VARCHAR(4000) COMMENT '备注',
   PRIMARY KEY (ID)
) COMMENT '电子政务行政审批';





DROP TABLE IF EXISTS GX_USER;
CREATE TABLE GX_USER (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  ALIAS varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标识编码(企业编码、身份证...)',
  NAME varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  PASSWORD varchar(256) DEFAULT NULL COMMENT '密码',
  TYPE varchar(1) DEFAULT NULL COMMENT '类型(0个人,1旅行社,2饭店,3景区...)',
  STATE int(1) DEFAULT NULL COMMENT '状态(0未知,1正常,2已注销...)',
  MEMO varchar(3000) DEFAULT NULL COMMENT '预留字段',
  VJSON varchar(3000) DEFAULT NULL COMMENT '其他数据',
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='企业类型';

DROP TABLE IF EXISTS SSPT_JYFW;
CREATE TABLE SSPT_JYFW (
  ID bigint(18) NOT NULL,
  JYFW varchar(30) DEFAULT NULL,
  JYFWMSG varchar(90) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS SSPT_PWXK;
CREATE TABLE SSPT_PWXK (
  ID bigint(20) NOT NULL,
  QYBM varchar(18) DEFAULT NULL,
  ZCH varchar(64) DEFAULT NULL COMMENT '注册号',
  MC varchar(300) DEFAULT NULL COMMENT '商事主体名称',
  EWMC varchar(90) DEFAULT NULL COMMENT '英文名称',
  JYFW varchar(300) DEFAULT NULL COMMENT '经营范围',
  JYFWMSG varchar(900) DEFAULT NULL COMMENT '经营范围信息',
  STATE int(1) DEFAULT NULL COMMENT '状态(0未处理,1已分发,2已批复,3已许可)',
  REGETTIME varchar(19) DEFAULT NULL COMMENT '接收时间',
  ITEMTIME varchar(60) DEFAULT NULL COMMENT '推送时间',
  RESENDCODE varchar(64) DEFAULT NULL COMMENT '分发部门编码',
  RESENDTIME varchar(19) DEFAULT NULL COMMENT '分发时间',
  XKZMC varchar(60) DEFAULT NULL COMMENT '许可证名称',
  XKZH varchar(64) DEFAULT NULL COMMENT '许可证号',
  XKJG varchar(60) DEFAULT NULL COMMENT '许可机关',
  XKNR varchar(300) DEFAULT NULL COMMENT '许可内容',
  XKXXBM varchar(300) DEFAULT NULL COMMENT '许可信息编码',
  XKKSRQ varchar(19) DEFAULT NULL COMMENT '许可起始期限',
  XKJSRQ varchar(19) DEFAULT NULL COMMENT '许可结束期限',
  PWH varchar(90) DEFAULT NULL COMMENT '批文号',
  CZR varchar(90) DEFAULT NULL COMMENT '出资人',
  FRDB varchar(60) DEFAULT NULL COMMENT '法定代表人',
  JYCS varchar(300) DEFAULT NULL COMMENT '经营场所',
  HZSJ varchar(19) DEFAULT NULL COMMENT '核准时间',
  LRLX varchar(30) DEFAULT NULL COMMENT '录入类型',
  LSXXXKZ varchar(3000) DEFAULT NULL COMMENT '历史信息许可证',
  LSXXPW varchar(3000) DEFAULT NULL COMMENT '历史信息批文',
  SSPTTSQK varchar(3000) DEFAULT NULL COMMENT '商事平台推送情况',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商事平台_批文许可';

DROP TABLE IF EXISTS SSPT_SSZT;
CREATE TABLE SSPT_SSZT (
  ID bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  ZCH varchar(64) DEFAULT NULL COMMENT '注册号',
  MC varchar(300) DEFAULT NULL COMMENT '商事主体名称',
  ITEMID varchar(64) DEFAULT NULL COMMENT '推送ID',
  ITEMTIME varchar(30) DEFAULT NULL COMMENT '推送时间',
  NUMBERTYPE varchar(32) DEFAULT NULL,
  BMBM varchar(64) DEFAULT NULL COMMENT '部门编码',
  BMMC varchar(60) DEFAULT NULL COMMENT '部门名称',
  JYFW varchar(300) DEFAULT NULL COMMENT '经营范围码',
  JYFWMSG varchar(900) DEFAULT NULL COMMENT '经营范围内容',
  ADDRESS varchar(300) DEFAULT NULL COMMENT '经营地址',
  STATE int(1) DEFAULT NULL COMMENT '状态(0待获取,1已获取,2已接收,3已退回)',
  REGETTIME varchar(60) DEFAULT NULL COMMENT '接收时间',
  REBACKTIME varchar(19) DEFAULT NULL COMMENT '退回时间',
  REBACKMSG varchar(900) DEFAULT NULL COMMENT '退回原因',
  SIGNDATA varchar(256) DEFAULT NULL COMMENT '签名值字段',
  SIGNCERT varchar(256) DEFAULT NULL COMMENT '证书序列号字段',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS SSYY;
CREATE TABLE SSYY (
  ID bigint(20) NOT NULL DEFAULT '0',
  TNAME varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '大类',
  NAME varchar(300) DEFAULT NULL COMMENT '小类',
  MSG longtext,
  C1 varchar(300) DEFAULT NULL COMMENT '热量(千卡)',
  C2 varchar(300) DEFAULT NULL COMMENT '硫胺素(毫克)',
  C3 varchar(300) DEFAULT NULL COMMENT '钙(毫克)',
  C4 varchar(300) DEFAULT NULL COMMENT '蛋白质(克)',
  C5 varchar(300) DEFAULT NULL COMMENT '核黄素(毫克)',
  C6 varchar(300) DEFAULT NULL COMMENT '镁(毫克)',
  C7 varchar(300) DEFAULT NULL COMMENT '脂肪(克)',
  C8 varchar(300) DEFAULT NULL COMMENT '烟酸(毫克)',
  C9 varchar(300) DEFAULT NULL COMMENT '铁(毫克)',
  C10 varchar(300) DEFAULT NULL COMMENT '碳水化合物(克)',
  C11 varchar(300) DEFAULT NULL COMMENT '维生素C(毫克)',
  C12 varchar(300) DEFAULT NULL COMMENT '锰(毫克)',
  C13 varchar(300) DEFAULT NULL COMMENT '膳食纤维(克)',
  C14 varchar(300) DEFAULT NULL COMMENT '维生素E(毫克)',
  C15 varchar(300) DEFAULT NULL COMMENT '锌(毫克)',
  C16 varchar(300) DEFAULT NULL COMMENT '维生素A(微克)',
  C17 varchar(300) DEFAULT NULL COMMENT '胆固醇(毫克)',
  C18 varchar(300) DEFAULT NULL COMMENT '铜(毫克)',
  C19 varchar(300) DEFAULT NULL COMMENT '胡罗卜素(微克)',
  C20 varchar(300) DEFAULT NULL COMMENT '钾(毫克)',
  C21 varchar(300) DEFAULT NULL COMMENT '磷(毫克)',
  C22 varchar(300) DEFAULT NULL COMMENT '视黄醇当量(微克)',
  C23 varchar(300) DEFAULT NULL COMMENT '钠(毫克)',
  C24 varchar(300) DEFAULT NULL COMMENT '硒(微克)',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='膳食营养';

DROP TABLE IF EXISTS ZW_GKYJX;
CREATE TABLE ZW_GKYJX (
  ID bigint(20) NOT NULL,
  QUERYID varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '查询码',
  NAME varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  UNITNAME varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位',
  CARDNO varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号码',
  VTELEPHONE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  VEMAIL varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  VADDRESS varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  TITLE varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  MSG varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  STATUS int(2) DEFAULT NULL COMMENT '状态',
  CREATETIME varchar(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请时间',
  REPLYTIME varchar(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理时间',
  REPLYRESULT varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理结果',
  REPLYUSER varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理人',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='信息公开意见箱';

DROP TABLE IF EXISTS ZW_JZXX;
CREATE TABLE ZW_JZXX (
  ID bigint(20) DEFAULT NULL,
  NAME varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  CARDTYPE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '证件类型',
  CARDNO varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '证件号码',
  PHONE varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  EMAIL varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮件',
  TITLE varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信件主题',
  MSG varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信件内容',
  STATUS int(10) DEFAULT NULL COMMENT '状态(0待受理,8已办结)',
  CREATETIME varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  REPLYTIME varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回复时间',
  REPLYRESULT varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回复意见',
  REPLYUSER varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '回复人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='局长信箱';

DROP TABLE IF EXISTS ZW_YSQGK;
CREATE TABLE ZW_YSQGK (
  ID bigint(20) NOT NULL,
  QUERYID varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '查询码',
  NAME varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名/法人代表',
  UNITNAME varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  DWJGDM varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位机构代码',
  DWYYZZ varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位营业执照注册号',
  CARDTYPE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '证件类型',
  CARDNO varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '证件号码',
  VNAME varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人/联系人电话',
  VPOST varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  VTELEPHONE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  VFAX varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '传真',
  VEMAIL varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  VADDRESS varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  CONTENTNAME varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '所需政府信息文件名称',
  CONTENTNO varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '所需政府信息文号',
  CONTENT varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '所需政府信息描述',
  PURPOSE varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '所需政府信息用途',
  PURPOSEFILE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '证明材料',
  USERFREE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否申请减免费用',
  USERFREEFILE varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请材料',
  INFOGET varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '提供政府信息的指定方式',
  INFOTO varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '获取政府信息的方式',
  OTHER varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '若本机关无法按照指定方式提供所需信息，也可接受其他方式',
  MEMO varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  TYPE int(2) DEFAULT NULL COMMENT '类型(1公民,2机构,3企业法人,4社团组织,5其他)',
  STATUS int(2) DEFAULT NULL COMMENT '状态(0待受理,-1已作废,1待处理,8已办结)',
  CREATETIME varchar(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请时间',
  ACCEPTTIME varchar(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '受理时间',
  ACCEPTRESULT varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '受理结果',
  ACCEPTUSER varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '受理人',
  REPLYTIME varchar(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理时间',
  REPLYRESULT varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理结果',
  REPLYUSER varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理人',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='依申请公开';
