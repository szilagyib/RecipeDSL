Receptleíró nyelv
================

MDSD féléves feladat.

<ins>Készítette:</ins> Szilágyi Borbála, Péter Bertalan Zoltán

### Leírás

Modellezési nyelv receptek magas szintű leírására. Segítségével
gyorsabban, egyszerűbben, intuitív módon írhatók le receptek (ld lejjebb
a _szöveges szintaxis_, illetve _grafikus szintaxis_ részeknél), mint
ha a klasszikus módon egy komplett összefüggő szöveget kellene megfogalmazni.
A recept leíró nyelv segítségével könnyedén megfogalmazhatjuk és
megörökíthatjük ötleteinket, azokat megoszthatjuk másokkal.

A modellezett receptek validálhatók, belőlük a recept klasszikus
szöveges formája automatikusan előállítható. Validálás során kiderülnek az
esetleges modellezési hibák (pl. egy adott hozzávaló nincs felhasználva, hibás
az eszközök illetve hozzávalók viszonya stb). A valid modellekből generálható
a jól megszokott recept formátum későbbi felhasználásra.


### Metamodell

Néhány elképzelt modellelem:
* **hozzávaló**
  * mint a _répa_, _liszt_, _kelkáposzta_…
  * ezekhez tartoznak **mennyiségek**, ezek mértékegységei
* **eszköz** → több kategória is elképzelhető, például
  * konténer jellegű eszköz (_fazék_, _bögre_, _hűtő_)
  * transzformátor jellegű eszköz (_turmixgép_, _daráló_)
  * egyéb
* **cselekvés**
  * például _összekeverés_, _kinyújtás_…
* **viszony**
  * pl. konténerek és hozzávalók között (_répa_ _fazék_ba helyezendő)
  * cselekvések, folyamatok között, pl. időkényszer (_10 perc múlva_)

### Választott technológiák

A következő technológiákat tervezzük alkalmazni:
* szöveges szintaxis
* grafikus szintaxis
* kódgenerálás
* validálás

A lentebbi példák csak _illusztrációk_ a nyelv megvalósításával
kapcsolatban, a konkrét szintaxis a végleges modellben eltérő lehet.

#### Szöveges szintaxis

Egyéni nyelven leírhatóak a receptek. Egy koncepció:

```
put   Répa .5 kg, Víz 1 l -> Fazék
wait  30 min
stir  %Fazék [continuously 10-15 min]
put   Só _to_taste, Bors _to_taste -> Fazék
wait  until 'puha'
done
```


#### Grafikus szintaxis

A fenti szöveges szintaxis egy lehetséges grafikus reprezentációja
(illusztráció):

```
                               +------------------+
                               |                  |
                               v     +--------+   |
  +------+             +-------------| Só     |   |
  | Répa |----------+  |             +--------+   |
  +------+          v  v             [to taste]   |
  [.5 kg ]      (       ) ⧖ 30 min                |⧖ until puha
                ( Fazék )--------->| STIR |-------+----------->{ DONE }
                (       )          [30 min]       |
  +------+      (       )                         |
  | Víz  |          ^  ^                          |
  +------+----------+  |             +--------+   |
  [ 1 l  ]             +-------------| Bors   |   |
                               ^     +--------+   |
                               |     [to taste]   |
                               +------------------+

```

A példához hasonlóan a grafikus szintaxis folyamatábra jellgű
megvalósítását tervezzük.

#### Kódgenerálás

A példa receptből az alábbi „kód” (recept szöveg) generálható:

```
Tegyünk .5 kg répát és 1 l vizet a fazékba.
Várjunk 30 percet.
Kevergessük a fazék tartalmát folyamatosan 10-15 percen keresztül.
Tegyünk sót ízlés szerint és borsot ízlés szerint a fazékba.
Várjunk, amíg nem puha.
Készen vagyunk.

```

Attól, hogy ez egy sóval és borrsal fűszerezett főtt répa receptje,
tekintsünk el… ☺

Továbbfejlesztési lehetőség: a recept szövege és a hozzávalók alapján
viszonylag triviális módon előállítható akár egy HTML-formátumú
receptoldal is, pl:

```
<!-- [...] preambulum -->
<h2>Hozzávalók</h2>
<ul>
    <li>.5 kg répa
    <li>1 l víz
    <li>ízlés szerint só
    <li>ízlés szerint bors
</ul>

<h2>Elkészítés</h2>
<ol>
    <li>Tegyünk .5 kg répát és 1 l vizet a fazékba.
    <li>Várjunk 30 percet.
    <li>Kevergessük a fazék tartalmát folyamatosan 10-15 percen
        keresztül.
    <li>Tegyünk sót ízlés szerint és borsot ízlés szerint a fazékba.
    <li>Várjunk, amíg nem puha.
    <li>Készen vagyunk.
</ol>
```


#### Validálás

Értelemszerűen nem minden viszony, cselekvés megengedett minden
helyzetben. Például vegyük az alábbi grafikus szintaxissal megadott
modellrészletet:

```

    (       )      +------+
    ( Fazék )----->| Répa |
    (       )      +------+
                   [.5 kg ]
```

Ez nem értelmezhető, ugyanis a fazék nem kerülhet hozzáadáshoz a
répához. Hasonlóan egy „magányos” répa hozzávaló a modellben
értelmetlen, valamihez értelemszerűen mindennek tartoznia kell. A répa
mennyiségét általában nem literben mérjük. Ezek mind validálható
tulajdonságok.
