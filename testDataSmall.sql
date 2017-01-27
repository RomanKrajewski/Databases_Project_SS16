--TESTDATA

--customers
insert into Customers (name, customerid, address, username, passwordhash) values ('Rüger Oswald', default, '88 hggfduzasdfhpvdauhisdfosd', 'xyz', 'offenesPasswort');
select * from customers;
update customers
  set name = 'Rüger Oßwald'
where customerid = 1011;
insert into Customers (name, customerid, address, username, passwordhash) values ('Joe Black', default, '4480 Dwight Street', 'jblack1', '8a559c1ff737b36515ad809f98678793ea411a402347007c9e08641b11149f44');
insert into Customers (name, customerid, address, username, passwordhash) values ('Raymond Nguyen', default, '09 Kropf Point', 'rnguyen2', '34ff40b49eafe703471b41f9ccb6ee76c904c761b76f6a8cb226e9e93af668ce');
insert into Customers (name, customerid, address, username, passwordhash) values ('Jose Brooks', default, '0 Chive Park', 'jbrooks3', '22275d2ca1a1ccefa66974be8a6428192e8ce133e2a03231c6bcefe4c70d490e');
insert into Customers (name, customerid, address, username, passwordhash) values ('Rebecca Garrett', default, '45 Mendota Hill', 'rgarrett4', 'a5f01a8050e9c04efe395eba0d75e7a810b59325092ae744b32c33698713e2c9');
insert into Customers (name, customerid, address, username, passwordhash) values ('Christine Bailey', default, '64 Red Cloud Hill', 'cbailey5', '66d8f19a99e50f1b2d414879273f69b2dfab831a7177d272f19962f6e01258e8');
insert into Customers (name, customerid, address, username, passwordhash) values ('Jane Austin', default, '71310 Packers Avenue', 'jaustin6', 'ed3da495d60dba7edf7e8043bbf415fb5dcd13c0d989e7f09562eb1e26f7e99a');
insert into Customers (name, customerid, address, username, passwordhash) values ('Brian Morgan', default, '6945 Bluejay Street', 'bmorgan7', 'c9546e7cbe20c507d62884010c1a436bf4272e428f83d76dfdc5d59706883740');
insert into Customers (name, customerid, address, username, passwordhash) values ('Jane Mills', default, '43 Quincy Way', 'jmills8', '2cf795d0e9b37cb769ec5236498a5ff4b0705585c66443aa3acc7e21ff1cd9d6');
insert into Customers (name, customerid, address, username, passwordhash) values ('David Griffin', default, '9340 High Crossing Parkway', 'dgriffin9', 'a4aa1c57c5acf015875e0c8aac2dc7ab12e38b2ab1a1ffb0fa1265eae1be3ee1');



--boardgames
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('6 nimmt!', 'KIDS', 5, 51, 8, 9, 'lorem integer tincidunt ante vel ipsum', 'Meedoo', 1960);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('7te See', 'CLASSIC', 2, 8, 5, 20, 'posuere cubilia curae duis faucibus accumsan odio', 'Divape', 1965);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('7 Wonders', 'PARTYGAME', 17, 27, 4, 20, 'in magna bibendum imperdiet nullam orci pede venenatis non sodales', 'Meembee', 1978);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('15-Puzzle', 'OTHER', 1, 67, 7, 23, 'pede ullamcorper augue a suscipit nulla', 'Vidoo', 1922);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('17 und 4', 'CLASSIC', 3, 68, 5, 25, 'habitasse platea dictumst aliquam augue quam', 'Feedfish', 1923);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('18XX', 'CLASSIC', 6, 46, 3, 17, 'nulla suspendisse potenti cras in purus eu magna', 'Mydeo', 1995);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('20 Questions', 'EUROGAME', 5, 85, 1, 3, 'luctus nec molestie sed justo pellentesque viverra pede ac', 'Livetube', 1919);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('20Q', 'CLASSIC', 18, 21, 5, 20, 'ut erat id mauris vulputate elementum', 'Bluezoom', 1904);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('31', 'KIDS', 11, 46, 2, 17, 'in sapien iaculis congue vivamus metus arcu', 'Eabox', 2014);
insert into boardgames (name, genre, minage, maxage, minplayers, maxplayers, shortdescription, publisher, releaseyear) values ('31', 'OTHER', 15, 48, 3, 11, 'ut ultrices vel augue vestibulum ante ipsum', 'Oyope', 1914);


--boardgameCopies
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 10);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 5);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 6);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 8);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 6);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 2);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 8);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 10);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 1);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 7);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 3);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 4);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 7);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 10);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 8);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 7);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 4);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 10);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 4);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 9);
insert into boardgamecopies (boardgamecopyid, boardgameid) values (default, 1);

--billingInformation
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'dsimmons0@hp.com', default, 7);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'mreed1@biglobe.ne.jp', default, 9);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'mmoreno2@scientificamerican.com', default, 9);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'mperry3@phoca.cz', default, 3);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'hdiaz4@nydailynews.com', default, 8);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'ccarpenter5@scribd.com', default, 9);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'gchapman6@tripod.com', default, 2);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'smyers7@jimdo.com', default, 10);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'choward8@guardian.co.uk', default, 7);
insert into billinginformation (type, data, billinginformationid, customerid) values ('PAYPAL', 'smurphy9@abc.net.au', default, 9);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'LV36 QGIK UYSX MD5A CCNZ V', default, 8);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'FR18 0177 5109 61JQ WE11 GR1W B05', default, 1);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'HU82 9877 7899 3973 9180 0551 0096', default, 5);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'FR22 3013 1516 426E 0ODR RRUI P32', default, 3);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'AZ18 IELS D2CQ SCCS WNKQ KNWI Z0LV', default, 8);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'CY32 7001 4146 WEON 9ONL PQH6 ZYER', default, 4);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'ES17 0329 9322 5844 3109 8741', default, 2);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'IL27 5509 8906 3537 7634 324', default, 1);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'AL46 8486 7211 CPKY SQ3Z QNEN Z4DM', default, 10);
insert into billinginformation (type, data, billinginformationid, customerid) values ('IBAN', 'FR63 0263 8825 93WM FZGL HD1I I62', default, 7);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '3545242597497779', default, 10);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '3561959658280187', default, 8);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '6304653485187617', default, 5);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '589366493136151237', default, 6);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '3568960047462810', default, 2);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '30334521959723', default, 3);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '6382684877182473', default, 1);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '3580017802652350', default, 8);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '6380526661201906', default, 7);
insert into billinginformation (type, data, billinginformationid, customerid) values ('CCARD', '6393369783109136', default, 2);


