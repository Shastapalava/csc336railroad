/* load data local CCNY /space/public/database/stockmarket_benchmark/Data/stockmarket_benchmark*/
use stockmarket;
load data local infile '/space/public/database/stockmarket_benchmark/Data/COUNTRY.csv' into table COUNTRY fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/CAPITALIZATION.csv' into table CAPITALIZATION fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/EXCHANGE.csv' into table EXCHANGE fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/CURRENCY.csv' into table CURRENCY fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/INSTR_TYPE.csv' into table  INSTR_TYPE fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/MAJOR_IDST_CLS.csv' into table  MAJOR_IDST_CLS fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;

load data local infile '/space/public/database/stockmarket_benchmark/Data/GEO_GROUP.csv' into table GEO_GROUP fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/INSTR_EXCHANGE.csv' into table  INSTR_EXCHANGE fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/INSTRUMENT.csv' into table INSTRUMENT fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/DIVIDEND_EVENT.csv' into table DIVIDEND_EVENT fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;  
load data local infile '/space/public/database/stockmarket_benchmark/Data/SCND_IDST_CLS.csv' into table  SCND_IDST_CLS fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/MARKET_INDEX.csv' into table  MARKET_INDEX fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/SPLIT_EVENT.csv' into table  SPLIT_EVENT fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;  
load data local infile '/space/public/database/stockmarket_benchmark/Data/INDEX_CMPSTN.csv' into table INDEX_CMPSTN fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/DIVIDEND_EVENT.csv' into table DIVIDEND_EVENT fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/STOCK_HISTORY.csv' into table  STOCK_HISTORY fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/STOCK_TRADE.csv' into table  STOCK_TRADE  fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;
load data local infile '/space/public/database/stockmarket_benchmark/Data/STOCK_QUOTE.csv' into table STOCK_QUOTE fields terminated by ',' optionally enclosed by '"' lines terminated by '\r\n' ;   


try
alias mariadb55local='mysql --port 3307 --socket=/opt/mariadb-data/mariadb.sock -u peter -p'42lambie' -h'localhost''