
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1,"bruce",24,"shanghai",200);

create TABLE content(
  id INT(11) not null AUTO_INCREMENT ,
  title varchar(100) not null,
  source_content TEXT not null,
  html_content TEXT not null,
  updatetime DATETIME not null,
  addtime DATETIME not null,
  PRIMARY KEY (id),
  INDEX addtime (addtime)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `contenttime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(6) NOT NULL,
  `month` tinyint(4) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

