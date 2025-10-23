USE jspbookdb;

CREATE TABLE IF NOT EXISTS member (
	id VARCHAR(20),
  passwd VARCHAR(20),
  name VARCHAR(30),
  PRIMARY KEY (id)
);

SELECT * FROM member;