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

hermano(H,I):-
    progenitor(Prog,H),
    progenitor(Prog,I),
    H\=I.

tio(Tio,Sobrino):-
    hermano(Tio,Prog),
    progenitor(Prog,Sobrino).

primo(P,Q):-
    tio(Tio,P),
    progenitor(Tio,Q).