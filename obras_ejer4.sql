/*
TipoObra(idTipo, descripcionTipo)
Obra(nroObra, idTipo(fk), fechaCrea, nombreO, calle, nro, codigoPostal(fk)
Artista(idArtista, DNI, pasaporte, nombre, apellido, telefono, fnac, codigoPostalVive(fk)
Artista_Obra(nroObra(fk), idArtista(fk), fechaI, fechaF, descripcion)
Localidad(codigoPostal, nombreL, descripcion, #habitantes)

4. Reportar DNI, pasaporte, nombre, apellido, fnac, telefono, localidad de artistas
que solo intervinieron obras con fecha de creación inferior a 1890

*/
SELECT a.DNI, a.pasaporte, a.nombre, a.apellido, a.fnac, a.telefono, l.nombreL
FROM Artista a INNER JOIN Localidad l ON (a.codigoPostalVive = l.codigoPostal)
               INNER JOIN Artista_Obra aO ON (a.idArtista = aO.idArtista)
               INNER JOIN Obra o ON (aO.nroObra = o.nroObra)
WHERE o.fechaCrea < '1890-01-01'
EXCEPT
SELECT a.DNI, a.pasaporte, a.nombre, a.apellido, a.fnac, a.telefono, l.nombreL
FROM Artista a INNER JOIN Localidad l ON (a.codigoPostalVive = l.codigoPostal)
               INNER JOIN Artista_Obra aO ON (a.idArtista = aO.idArtista)
               INNER JOIN Obra o ON (aO.nroObra = o.nroObra)
WHERE o.fechaCrea > '1890-01-01';
