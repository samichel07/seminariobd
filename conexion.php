<?php
 $servidor="localhost";
 $nombrebd="teatro";
 $usuario="root";
 $pass="";
$conexion = new mysqli($servidor,$usuario,$pass,$nombrebd);
 if ($conexion -> connect_error) {
 	die("no se pudo conectar");
 };
?>