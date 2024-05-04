--
-- Base de datos: `farmqor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juega`
--

DROP DATABASE IF EXISTS farmqor;

CREATE DATABASE farmqor;

use farmqor;

CREATE TABLE juega (
  ID_usuario int(11) NOT NULL,
  No_Partida int(11) NOT NULL);

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE usuario (
  ID_usuario   INT NOT NULL AUTO_INCREMENT,
  Nombre varchar(50) NOT NULL,
  Teléfono varchar(11) NOT NULL,
  Contraseña varchar(255) NOT NULL,
  Tipo_Usuario varchar(30) NOT NULL,
  PRIMARY KEY (ID_usuario));

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `videojuego`
--
CREATE TABLE videojuego (
  No_Partida int(11) NOT NULL AUTO_INCREMENT,
  Final varchar(10) NOT NULL,
  PRIMARY KEY (No_Partida));

-- Añadiendo la llave foránea para ID_usuario en la tabla juega
ALTER TABLE juega
  ADD CONSTRAINT fk_juega_usuario
  FOREIGN KEY (ID_usuario) REFERENCES usuario (ID_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Añadiendo la llave foránea para No_Partida en la tabla juega
ALTER TABLE juega
  ADD CONSTRAINT fk_juega_videojuego
  FOREIGN KEY (No_Partida) REFERENCES videojuego (No_Partida)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE videojuego 
ADD COLUMN Final INT(10) NOT NULL, 
CHANGE No_Partida No_Partida INT(11) NOT NULL AUTO_INCREMENT;
