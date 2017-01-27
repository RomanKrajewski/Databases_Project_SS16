
/*
 * Views
 */

-- most renting players
CREATE OR REPLACE view customersWithMostRentals as
 select customerid, count(customerid) as numberOfRentals
 from rentalprocesses
 group by customerid
 order by count(customerid) desc
LIMIT (10);

select *
from customersWithMostRentals;

--most rented Games
CREATE OR REPLACE VIEW mostrentedGames AS
  SELECT
    boardgames.name        AS name,
    boardgames.boardgameid as boardgameID,
    count(rentalprocessid) AS timesrented
  FROM
    rentalprocesses, boardgamecopies, boardgames
  WHERE boardgamecopies.boardgamecopyid = rentalprocesses.boardgamecopyid
        AND boardgamecopies.boardgameid = boardgames.boardgameid
  GROUP BY boardgames.boardgameid
   ORDER BY timesrented DESC;

--most rented by unique players
CREATE OR REPLACE VIEW mostRentedByUniquePlayers AS

  SELECT
    boardgames.name            AS name,
    boardgamecopies.boardgameid,
    count(DISTINCT customerid) AS timesRented
  FROM boardgames, rentalprocesses, boardgamecopies
  WHERE boardgamecopies.boardgamecopyid = rentalprocesses.boardgamecopyid
        AND boardgamecopies.boardgameid = boardgames.boardgameid
  GROUP BY boardgamecopies.boardgameid, boardgames.boardgameid
  ORDER BY timesRented DESC;


-- active rentals
CREATE OR REPLACE VIEW activeRentals AS
SELECT *
FROM rentalprocesses
WHERE returneddate IS NULL;


--most profitable game
CREATE OR REPLACE VIEW mostprofitableGames AS
SELECT
  name,
  boardgames.boardgameid,
  sum(moneydonated) AS moneySum
FROM rentalprocesses, boardgamecopies, boardgames
WHERE boardgamecopies.boardgamecopyid = rentalprocesses.boardgamecopyid
  AND  boardgamecopies.boardgameid = boardgames.boardgameid
GROUP BY boardgames.boardgameid
ORDER BY moneySum DESC;

-- available games
Create OR REPLACE VIEW availableGameCopies AS
 SELECT boardgamecopies.boardgamecopyid, boardgamecopies.boardgameid
FROM boardgamecopies
  LEFT OUTER JOIN activerentals ON boardgamecopies.boardgamecopyid = activerentals.boardgamecopyid
WHERE activerentals.boardgamecopyid IS NULL;

-- customers that should receive a warning
CREATE OR REPLACE VIEW warningsNecessary AS
  SELECT
    rentalprocessid,
    boardgamecopyid,
    (current_date - enddate) AS daysOverdue,
    ((current_date - enddate) / 7) - warningsissued AS warningsNecessary,
    customers.name,
    customers.address
  FROM activerentals, customers
  WHERE activerentals.customerid = customers.customerid
  AND current_date > enddate
        AND (current_date - enddate) > warningsissued * 7; -- warnung alle 7 tage


/*
 * Functions
 */

-- available games
CREATE OR REPLACE FUNCTION gamesAvailable(gameId INT)
  RETURNS BIGINT AS
$$
SELECT count(boardgamecopies.boardgamecopyid)
FROM boardgamecopies
  LEFT OUTER JOIN activerentals ON boardgamecopies.boardgamecopyid = activerentals.boardgamecopyid
WHERE activerentals.boardgamecopyid IS NULL
      AND boardgamecopies.boardgameid = gameId;
$$
LANGUAGE SQL;


-- rental procedure
CREATE OR REPLACE FUNCTION rentGame(aCustomerId INT, aGameId INT, aMoneyDonated NUMERIC, aRentedDays INT,
                                    aStartDate  DATE)
  RETURNS BOOL AS
$$
DECLARE
  vGameCopyId INT;
BEGIN
  IF gamesAvailable(aGameId) <= 0
  THEN
    RETURN FALSE;
  END IF;


  SELECT min(boardgamecopyid)
  INTO vGameCopyId
  FROM availableGameCopies
  WHERE boardgameid = aGameId;


  INSERT INTO rentalprocesses (startdate, enddate, boardgamecopyid, customerId, moneydonated)
  VALUES (aStartDate, aStartDate + aRentedDays, vGameCopyId, aCustomerId, aMoneyDonated);

  RETURN TRUE;
END
$$
LANGUAGE plpgsql;


SELECT rentGame(798, 944, 38.8, 30);


CREATE OR REPLACE FUNCTION rentGame(aCustomerId INT, aGameId INT, aMoneyDonated NUMERIC, aRentedDays INT)
  RETURNS BOOL AS
$$
SELECT rentGame(aCustomerId, aGameId, aMoneyDonated, aRentedDays, current_date);
$$
LANGUAGE SQL;

-- return game
CREATE OR REPLACE FUNCTION returnCopy(aBoardgameCopyId INT, aReturnedDate DATE)
  RETURNS BOOL AS
$$
BEGIN
  IF (SELECT count(boardgamecopyid)
      FROM activerentals
      WHERE boardgamecopyid = aBoardgameCopyId) = 0
  THEN
    RETURN FALSE;
  END IF;

  UPDATE rentalprocesses
  SET returneddate = aReturnedDate
  WHERE boardgamecopyid = aBoardgameCopyId
        AND returneddate IS NULL;

  RETURN TRUE;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION returnCopy(aBoardgameCopyId INT)
  RETURNS BOOL AS
$$
SELECT returncopy(aBoardgameCopyId, current_date);
$$
LANGUAGE SQL;

-- warnings
CREATE OR REPLACE FUNCTION increaseWarnings(aRentalProcessId INT, aWarnings INT)
  RETURNS VOID AS
$$
UPDATE rentalprocesses
SET warningsissued = warningsissued + aWarnings
WHERE rentalprocessid = aRentalProcessId
$$
LANGUAGE SQL;

-- update data example
CREATE OR REPLACE FUNCTION changeCustomerAddress(aCustomerId INT, aNewAddress CHAR(64))
  RETURNS VOID AS
$$
  UPDATE customers
  SET address = aNewAddress
  WHERE customerid = aCustomerId
$$
LANGUAGE SQL;


--get specific players most rented game
CREATE OR REPLACE FUNCTION mostRentedByPlayer(INTEGER)
  RETURNS INTEGER AS
$Q$
SELECT mostrentedgames.boardgameid
FROM
  (SELECT
     boardgames.boardgameid,
     count(rentalprocessid) AS Ausgeliehen
   FROM
     rentalprocesses, boardgamecopies, boardgames
   WHERE boardgamecopies.boardgamecopyid = rentalprocesses.boardgamecopyid
         AND boardgamecopies.boardgameid = boardgames.boardgameid
         AND rentalprocesses.customerid = $1
   GROUP BY boardgames.boardgameid
   ORDER BY Ausgeliehen DESC) AS mostrentedgames;
$Q$
LANGUAGE SQL;



-- get players that rented game a certain number of times

CREATE OR REPLACE FUNCTION customersThatRentedGame(aGameId INT, aMinTimesRented INT)
  RETURNS TABLE(customerId INT, timesRented BIGINT) AS
$$
 SELECT rentalprocesses.customerid  AS customerids,
    count(customerid) AS timesRented
  FROM  boardgames, rentalprocesses, boardgamecopies
  WHERE boardgamecopies.boardgamecopyid = rentalprocesses.boardgamecopyid
        AND boardgamecopies.boardgameid = boardgames.boardgameid
        AND boardgamecopies.boardgameid = aGameId

  GROUP BY boardgamecopies.boardgameid, rentalprocesses.customerid
  HAVING count(customerid) >= aMinTimesRented
;
$$
LANGUAGE SQL;

select customersthatrentedgame(688, 2);


