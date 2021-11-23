<?php

include 'conexion_login.php'; 
$nombre=$_POST['usuario'];
$email=$_POST['correoo'];
$contra=$_POST['contrasenaa'];
$sql = $conectar->query("INSERT into usuario (nombre,correo,contrasena) values ('$nombre','$email','$contra')");

if($sql){
    echo'<script type="text/javascript">
    alert("Se registro con exito");
    window.location.href="login.html";
    </script>';
}else {
    echo'<script type="text/javascript">
    alert("ERROR :(");
    window.location.href="index.html";
    </script>';
}
?>