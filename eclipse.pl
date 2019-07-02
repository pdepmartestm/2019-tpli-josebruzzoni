
%ciudad(nombre,provincia,horario,longitud,segundosDeDuracion)
ciudad(arrecifes,buenosAires,1744,2.5,40).
ciudad(bellaVista,sanJuan,1741,11.5,147).
ciudad(carmenDeAreco,buenosAires,1744,2.1,90).
ciudad(chacabuco,buenosAires,1743,2.6,127).
ciudad(chepes,laRioja,1742,8.9,123).
ciudad(ezeiza,buenosAires,1744,0.9,61).
ciudad(jachal,sanJuan,1741,11.1,99).
ciudad(pergamino,buenosAires,1744,2.9,56).
ciudad(quines,sanLuis,1742,7.8,133).
ciudad(rodeo,sanJuan,1741,11.5,136).
ciudad(rioCuarto,cordoba,1742,6.3,114).
ciudad(venadoTuerto,santaFe,1743,4.1,131).
ciudad(merlo,sanLuis,1742,7.1,139).

% servicio(ciudad,servicioOfrecido)
servicio(bellaVista,telescopio).
servicio(chepes,telescopio).
servicio(ezeiza,telescopio).
servicio(chacabuco,reposeras).
servicio(arrecifes,reposeras).
servicio(chepes,reposeras).
servicio(venadoTuerto,reposeras).
servicio(quines,observatorioAstronomico).
servicio(quines,lentesDeSol).
servicio(rodeo,lentesDeSol).
servicio(rioCuarto,lentesDeSol).
servicio(merlo,lentesDeSol).

% 1)

lugarPunto1(Lugar):-
    ciudad(Lugar,_,_,Altura,_),
    Altura>10.

lugarPunto1(Lugar):-
    ciudad(Lugar,_,Hora,_,_),
    Hora>1742.

% 2)

lugaresSinServicios(Lugar):-
    ciudad(Lugar,_,_,_,_),
    not(servicio(Lugar,_)).

% 3) 

provinciasConMasDeUnaCiudad(Provincia):-
    ciudad(Ciudad1,Provincia,_,_,_),
    ciudad(Ciudad2,Provincia,_,_,_),
    Ciudad1\=Ciudad2.

provinciasConSoloUnaCiudad(Provincia):-
    ciudad(_,Provincia,_,_,_),
    not(provinciasConMasDeUnaCiudad(Provincia)).
    

% 4)

lugarDondeDuraMas(Lugar):-
    ciudad(Lugar,_,_,_,Duracion),
    forall((ciudad(Otro,_,_,_,OtraDur),Lugar\=Otro),Duracion>OtraDur).
    
% 5)

calcularPromedio(Duraciones,DuracionPromedio):-
    length(Duraciones,Cantidad),
    sumlist(Duraciones,Total),
    DuracionPromedio is Total/Cantidad.

duracionPromedioEnPais(DuracionPromedio):-
    findall(Duracion,ciudad(_,_,_,_,Duracion),Duraciones),
    calcularPromedio(Duraciones,DuracionPromedio).

duracionPromedioEnProv(Provincia,DuracionPromedio):-
    ciudad(_,Provincia,_,_,_),
    findall(Duracion,ciudad(_,Provincia,_,_,Duracion),Duraciones),
    calcularPromedio(Duraciones,DuracionPromedio).

duracionPromedioEnCiudadesConTelescopio(DuracionPromedio):-
    findall(Duracion,(ciudad(Ciudad,_,_,_,Duracion),servicio(Ciudad,telescopio)),Duraciones),
    calcularPromedio(Duraciones,DuracionPromedio).

/* 6) En el caso del punto 2, al tener el predicado de orden superior not, 
debo ligar las variables antes de utilizarlo para que sepa con que universo
esta trabajando prolog, por eso el "ciudad(Lugar,_,_,_,_)". Es totalmente inversible
tiene solo una variable y es inversible.

*/