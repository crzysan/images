-- Creating the EMPLOYEES table with 1000 rows.
CREATE TABLE employees (
   employee_id   NUMERIC      NOT NULL,
   first_name    VARCHAR(255) NOT NULL,
   last_name     VARCHAR(255) NOT NULL,
   date_of_birth DATE                 ,
   phone_number  VARCHAR(255) NOT NULL,
   junk          CHAR(255)            ,
   PRIMARY KEY (employee_id)
);

-- generate more records (Very Big Company)
INSERT INTO employees (employee_id,  first_name, 
                       last_name,    date_of_birth, 
                       phone_number, subsidiary_id, junk)
SELECT gen.n + 1
     , GROUP_CONCAT(CHAR( RAND()*25 + 97) SEPARATOR '')
     , GROUP_CONCAT(CHAR( RAND()*25 + 97) SEPARATOR '')
     , CURDATE() - INTERVAL (RAND(0)*365*10 + 40*365) DAY
     , FLOOR(RAND()*9000 + 1000)
     , FLOOR(RAND()*(gen.n/9000)*29 + 1)
     , 'junk'
  FROM generator_64k gen, generator_16 rand
 WHERE gen.n < 9000
 GROUP BY gen.n;