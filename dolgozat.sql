-- 1) 
create view eladott_ingatlanok(azonosito, kerulet, eladasi_ar, meret, tipus, eladas_datuma) AS
select pazon as "Azonosito",
        kerulet as " Ingatlan kerülete",
        minar as "Eladási ár",
        nm as "méret",
        tipus as "tipus",
        eladdatum as "eladási dátum"
from ingatlan
order by minar asc;

-- 2) 
create view eladasravaro_ingatlanok(azonosito, ugynok, elado, kerulet, eladasi_ar, meret, tipus) AS
select ingatlan.pazon as "partner azonosito", 
		ugynok.unev as "Ügynök neve",
        partner.pnev as "Partner neve",
        ingatlan.kerulet as "Kerület",
        ingatlan.minar as "Ár",
        ingatlan.nm as "Méret",
        ingatlan.tipus as "Típusa"
from ingatlan natural join ugynok natural join partner
where eladdatum is null;


-- 3) 
create view legdragabb_ingatlan(elado, telefonszam) AS
select pnev as "Partner neve", telszam as "Telefonszáma"
from partner natural join ingatlan
group by pnev,telszam
order by MAX(minar) desc
limit 1;

-- 4)
Select avg(minar)
From ingatlan
Where avg(minar) > minar AND eladdatum != null;

-- 5) 
insert into ugynok (uazon, unev) values ("U05" , "Alexandra") ;

-- 6) 
select tipus, unev
from ingatlan natural join ugynok
where tipus ="panel lakás"
group by tipus, unev
order by MIN(nm) asc
limit 1;

-- 7) 
select * , osszeg
from ingatlan inner join jutalek;


-- 8) 
select tipus 
From ingatlan
Where típus ="panel lakás"
Order by minar DESC ;

-- 9) 
select unev, osszeg
from eladott_ingatlaonok, ugynok, ingatlan
where ugynok.uazon = ingatlan.uazon
    and ingatlan.iazon = jutalek.iazon;
    
-- 10) 
Select *, pnev
from ingatlan natural left join partner;

-- 11) 
Select unev, osszeg
From ugynok, jutalek
where ugynok. uazon = ingatlan.uazon AND
	ingatlan.iazon = jutalek.iazon;

-- 12) 
Select pnev, telszam
From partner
Where unev ="Hókuszpók" AND eladdatum= is null AND
	partenr. pazon = ingatlan.pazon AND
    ingatlan.uazon = ugynok.uazon   AND
    ugynok.unev;


-- 13) 
Select * ,unev
from ingatlan natural left join ugynok;