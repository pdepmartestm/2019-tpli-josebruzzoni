padre(matias,jose).
padre(matias,juan).
padre(matias,lourdes).
padre(julio,silvina).
padre(julio,martin).
padre(martin,santiago).
padre(martin,fermin).
padre(martin,magdalena).
madre(clotilde,martin).
madre(carolina,santiago).
madre(carolina,fermin).
madre(carolina,magdalena).
madre(silvina,jose).
madre(silvina,juan).
madre(silvina,lourdes).
madre(clotilde,silvina).
madre(marta,matias).

progenitor(Prog,Hijo):-
    padre(Prog,Hijo).
progenitor(Prog,Hijo):-
    madre(Prog,Hijo).

abuelo(Abu,Nieto):-
    padre(Abu,Hijo),
    progenitor(Hijo,Nieto).

abuela(Abu,Nieto):-
    madre(Abu,Hijo),
    progenitor(Hijo,Nieto).

hermano(Hermano1,Hermano2):-
    progenitor(Prog,Hermano1),
    progenitor(Prog,Hermano2),
    Hermano1\=Hermano2.

tio(Tio,Sobrino):-
    hermano(Tio,Prog),
    progenitor(Prog,Sobrino).

primo(Primo1,Primo2):-
    tio(Tio,Primo1),
    progenitor(Tio,Primo2).

descendiente(Descendiente,Ancestro):-
    progenitor(Ancestro,Descendiente).
descendiente(Descendiente,Ancestro):-
    progenitor(Ancestro,Otro),
    descendiente(Descendiente,Otro).