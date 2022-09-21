CREATE EDITION V1;
CREATE EDITION V1POINT1;
CREATE EDITION V1POINT2;

CREATE USER quizflyway IDENTIFIED BY mypassword;
GRANT DWROLE TO quizflyway;
GRANT UNLIMITED TABLESPACE TO quizflyway;

alter user quizflyway enable editions;
grant use on edition V1 to quizflyway;
grant use on edition V1POINT1 to quizflyway;
grant use on edition V1POINT2 to quizflyway;