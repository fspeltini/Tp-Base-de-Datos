CREATE TABLE carrera(
	id SERIAL PRIMARY KEY, nombre VARCHAR(300)
	);

	
CREATE TABLE usuario(
	id SERIAL PRIMARY KEY, nombre VARCHAR(200), apellido VARCHAR(300),username VARCHAR(300), contrasenia VARCHAR(300),fecha_nacimiento DATE, email VARCHAR(300), id_carrera INT,
	CONSTRAINT id_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id));
		
	
CREATE TABLE grupo(
	id SERIAL PRIMARY KEY, nombre_grupo VARCHAR(100), requiere_invitacion BOOL);
	

	--RELACION entre grupo y usuario
CREATE TABLE grupo_usuario(
	id_grupo INT REFERENCES grupo(id), id_user INT REFERENCES usuario(id),
	PRIMARY KEY (id_grupo, id_user)	);
																	  
	CREATE TABLE publicacion(
	id SERIAL PRIMARY KEY, id_user int REFERENCES  usuario(id), id_grupo int REFERENCES grupo(id), titulo VARCHAR(300), contenido VARCHAR(300), fecha_publicacion TIMESTAMP);
	

--drop table comentario
	
	--RELACION entre publicacion y usuario LIKE
CREATE TABLE like_publicacion(
	id_public INT REFERENCES publicacion(id), id_user INT REFERENCES usuario(id), positivo bool, fecha TIMESTAMP,
	PRIMARY KEY (id_public, id_user) );
	
	--id_carrera

CREATE TABLE comentario(
	id SERIAL PRIMARY KEY , id_public INT REFERENCES publicacion(id), id_user INT, contenido VARCHAR(300), fecha_comentario TIMESTAMP);
	--PRIMARY KEY(id, id_public));

--select * from comentario
	--RELACION entre comentario y usuario LIKE
CREATE TABLE like_comentario(
	id_coment INT REFERENCES comentario(id), id_user INT REFERENCES usuario(id), positivo BOOL, fecha TIMESTAMP,
	PRIMARY KEY(id_coment, id_user));


	
	
CREATE TABLE carrera_usuario(
	id_carrera INT REFERENCES carrera(id), id_usuario INT REFERENCES usuario(id), 
    PRIMARY KEY(id_carrera, id_usuario))
