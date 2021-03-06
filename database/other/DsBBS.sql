SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS DS_BBS_FORUM;
DROP TABLE IF EXISTS DS_BBS_PAGE;
DROP TABLE IF EXISTS DS_BBS_SITE;
CREATE TABLE DS_BBS_SITE
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   OWN                  VARCHAR(300) COMMENT '拥有者',
   NAME                 VARCHAR(300) COMMENT '名称',
   FOLDER               VARCHAR(300) COMMENT '目录名称',
   URL                  VARCHAR(300) COMMENT '链接',
   IMG                  VARCHAR(300) COMMENT '图片',
   VIEWSITE             VARCHAR(300) COMMENT '网站模板',
   PRIMARY KEY (ID)
) COMMENT '论坛站点';
CREATE TABLE DS_BBS_FORUM
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   PID                  BIGINT COMMENT '父ID',
   SITEID               BIGINT COMMENT '站点ID',
   NAME                 VARCHAR(300) COMMENT '名称',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   STATUS               INT(1) COMMENT '状态(1启用,0禁用)',
   SEQ                  VARCHAR(300) COMMENT '排序',
   VIEWSITE             VARCHAR(300) COMMENT '模板',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_BBS_FORUM FOREIGN KEY (PID)
      REFERENCES DS_BBS_FORUM (ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_DS_BBS_FORUM_SITE FOREIGN KEY (SITEID)
      REFERENCES DS_BBS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '版块';
CREATE TABLE DS_BBS_PAGE
(
   ID                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
   SITEID               BIGINT COMMENT '站点ID',
   FORUMID              BIGINT COMMENT '版块ID',
   USERID               VARCHAR(300) COMMENT '发表人ID',
   TITLE                VARCHAR(300) COMMENT '标题',
   URL                  VARCHAR(300) COMMENT '链接',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   ISESSENCE            INT COMMENT '精华(0否,1是)',
   ISTOP                INT COMMENT '置顶(0否,1是)',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   RELEASEUSER          VARCHAR(30) COMMENT '发表人',
   RELEASETIME          VARCHAR(19) COMMENT '发表时间',
   OVERTIME             VARCHAR(19) COMMENT '结贴时间',
   LASTUSER             VARCHAR(300) COMMENT '最后回复人',
   LASTTIME             VARCHAR(300) COMMENT '最后回复时间',
   NUMPV                INT COMMENT '点击量',
   NUMHT                INT COMMENT '回贴数',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_BBS_PAGE_SITE FOREIGN KEY (SITEID)
      REFERENCES DS_BBS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '主题';
