/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 20520
 |      CHILDREN OF IMMIGRANTS LONGITUDINAL STUDY (CILS), 1991-2006
 |                            (DATASET 0001: )
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. The metadata
 | provided below are not stored in the SAS transport version of this data
 | collection.  Users need to use SAS PROC CIMPORT to import the SAS
 | transport file to a SAS data set on their system. This program can
 | then be used in conjunction with the SAS system data file.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .;
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | NOTE:  Users should modify this file to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*').
 | To make this section active in the program, users should remove the SAS
 | comment indicators from this section.
 |
 |------------------------------------------------------------------------*/

RUN;

* SAS DATA STEP;
DATA;
SET SAS-dataset ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (V8 = 9) THEN V8 = .;
   IF (V10 = 99) THEN V10 = .;
   IF (V14 = 9) THEN V14 = .;
   IF (V16 = 99) THEN V16 = .;
   IF (V34A = 9) THEN V34A = .;
   IF (V35 >= 97 AND V35 <= 99) THEN V35 = .;
   IF (V36 = 99) THEN V36 = .;
   IF (V39A = 9) THEN V39A = .;
   IF (V39B = 999) THEN V39B = .;
   IF (V47 = 99) THEN V47 = .;
   IF (V48 = 999) THEN V48 = .;
   IF (V50 = 99) THEN V50 = .;
   IF (V51 = 9) THEN V51 = .;
   IF (V52 = 9) THEN V52 = .;
   IF (V53 = 9) THEN V53 = .;
   IF (V54 = 9) THEN V54 = .;
   IF (V56 = 99) THEN V56 = .;
   IF (V57 = 9) THEN V57 = .;
   IF (V66 = 99) THEN V66 = .;
   IF (V67 = 9) THEN V67 = .;
   IF (V68 = 99) THEN V68 = .;
   IF (V69 = 99) THEN V69 = .;
   IF (V70 = 9) THEN V70 = .;
   IF (V71 = 99) THEN V71 = .;
   IF (V73 = 9) THEN V73 = .;
   IF (V74A = 9) THEN V74A = .;
   IF (V74B = 9) THEN V74B = .;
   IF (V74C = 9) THEN V74C = .;
   IF (V74D = 9) THEN V74D = .;
   IF (V74E = 9) THEN V74E = .;
   IF (V74F = 9) THEN V74F = .;
   IF (V74G = 9) THEN V74G = .;
   IF (V74H = 9) THEN V74H = .;
   IF (V74I = 9) THEN V74I = .;
   IF (V74J = 9) THEN V74J = .;
   IF (V74K = 9) THEN V74K = .;
   IF (V74L = 9) THEN V74L = .;
   IF (V74M = 9) THEN V74M = .;
   IF (V74N = 9) THEN V74N = .;
   IF (V74O = 9) THEN V74O = .;
   IF (V74P = 9) THEN V74P = .;
   IF (V74Q = 9) THEN V74Q = .;
   IF (V74R = 9) THEN V74R = .;
   IF (V74S = 9) THEN V74S = .;
   IF (V74T = 9) THEN V74T = .;
   IF (V74U = 9) THEN V74U = .;
   IF (V75 = 9) THEN V75 = .;
   IF (V76 = 99) THEN V76 = .;
   IF (V77 = 9) THEN V77 = .;
   IF (V86A = 9) THEN V86A = .;
   IF (V86B = 9) THEN V86B = .;
   IF (V86C = 9) THEN V86C = .;
   IF (V86D = 9) THEN V86D = .;
   IF (V86E = 9) THEN V86E = .;
   IF (V86F = 9) THEN V86F = .;
   IF (V87 = 99) THEN V87 = .;
   IF (V246 = 999) THEN V246 = .;
   IF (V247 = 99.00) THEN V247 = .;
   IF (V248 = 999.00) THEN V248 = .;
   IF (V250 = 99) THEN V250 = .;
   IF (V251 = 9) THEN V251 = .;
   IF (V252 = 9) THEN V252 = .;
   IF (V253 = 9) THEN V253 = .;
   IF (V254 = 9) THEN V254 = .;
   IF (V256 = 99) THEN V256 = .;
   IF (V257 = 9) THEN V257 = .;
   IF (V266 = 9) THEN V266 = .;
   IF (V273 = 9) THEN V273 = .;
   IF (V276 = 99) THEN V276 = .;
   IF (V277 = 9) THEN V277 = .;
   IF (V286A = 9) THEN V286A = .;
   IF (V286B = 9) THEN V286B = .;
   IF (V286C = 9) THEN V286C = .;
   IF (V286D = 9) THEN V286D = .;
   IF (V286E = 9) THEN V286E = .;
   IF (V286F = 9) THEN V286F = .;
   IF (V287 = 99) THEN V287 = .;
   IF (P7 >= 97 AND P7 <= 99) THEN P7 = .;
   IF (P14 = 9) THEN P14 = .;
   IF (P15 = 9) THEN P15 = .;
   IF (P16 = 99) THEN P16 = .;
   IF (P17 = 9) THEN P17 = .;
   IF (P18 = 9) THEN P18 = .;
   IF (P19 = 99) THEN P19 = .;
   IF (P20 = 9) THEN P20 = .;
   IF (P27A = 98) THEN P27A = .;
   IF (P29A = 9) THEN P29A = .;
   IF (P29B = 9) THEN P29B = .;
   IF (P29C = 9) THEN P29C = .;
   IF (P29D = 9) THEN P29D = .;
   IF (P33A = 999) THEN P33A = .;
   IF (P35 = 999) THEN P35 = .;
   IF (P36 = 99) THEN P36 = .;
   IF (P37 = 9) THEN P37 = .;
   IF (P38 = 9) THEN P38 = .;
   IF (P39A = 99) THEN P39A = .;
   IF (P40 = 9) THEN P40 = .;
   IF (P41A = 99) THEN P41A = .;
   IF (P42 = 9) THEN P42 = .;
   IF (P43A = 99) THEN P43A = .;
   IF (P44 = 9) THEN P44 = .;
   IF (P45A = 999) THEN P45A = .;
   IF (P45B = 9) THEN P45B = .;
   IF (P46 = 99) THEN P46 = .;
   IF (P47 = 99) THEN P47 = .;
   IF (P48 = 99) THEN P48 = .;
   IF (P49 = 999) THEN P49 = .;
   IF (P50 = 9) THEN P50 = .;
   IF (P51 = 99) THEN P51 = .;
   IF (P53A = 9) THEN P53A = .;
   IF (P53B = 9) THEN P53B = .;
   IF (P53C = 9) THEN P53C = .;
   IF (P53D = 9) THEN P53D = .;
   IF (P54 = 9) THEN P54 = .;
   IF (P59A = 9) THEN P59A = .;
   IF (P59B = 9) THEN P59B = .;
   IF (P59C = 9) THEN P59C = .;
   IF (P61 = 9) THEN P61 = .;
   IF (P63 = 9) THEN P63 = .;
   IF (P64 = 9) THEN P64 = .;
   IF (P67 = 9) THEN P67 = .;
   IF (P68A = 9) THEN P68A = .;
   IF (P69 = 9) THEN P69 = .;
   IF (P70 = 9) THEN P70 = .;
   IF (P71 = 9) THEN P71 = .;
   IF (P82 = 9) THEN P82 = .;
   IF (P83 = 99) THEN P83 = .;
   IF (P85 = 99) THEN P85 = .;
   IF (P88 = 99) THEN P88 = .;
   IF (P90 = 999) THEN P90 = .;
   IF (P91 = 999) THEN P91 = .;
   IF (P122 = 99) THEN P122 = .;
   IF (P124 = 99) THEN P124 = .;
   IF (P134 = 9) THEN P134 = .;
   IF (V414 = 998 OR V414 = 999) THEN V414 = .;
   IF (V415 = 998 OR V415 = 999) THEN V415 = .;
   IF (V422 = 13) THEN V422 = .;
   IF (V426 = 998 OR V426 = 999) THEN V426 = .;
   IF (V433 >= 96 AND V433 <= 99) THEN V433 = .;
   IF (V437 >= 96 AND V437 <= 99) THEN V437 = .;
*/

RUN ;
