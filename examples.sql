-- Übersicht
select *
from costumers;

select *
from boardgames;

-- Suchen anhand von Fakten
select *
from customers
where name = 'Raymond Ngyuen';

select *
from boardgames
where name like '%7%';

-- Suchen anhand von keys
select boardgamecopyid, boardgamecopies.boardgameid, name
from boardgamecopies, boardgames
where boardgamecopies.boardgameid = boardgames.boardgameid
  and boardgamecopyid = 6;

select *
from customers
where username = 'jbrooks3';

