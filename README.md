# Projecte17-2
En este proyecto de GitHub es un fichero de configuración para comprobar conexiones MySQL

## Comenzando 🚀
Para poder hacer uso de este script se requiere de un equipo linux y dar permisos de ejecucuón del mismo

## Pre-requisitos 📋
Se requiere:
* Conocimientos de linux (terminal)
* Tener dispositivo linux

## Instalación 🔧

Hay que clonar el repositorio:

```
git clone https://github.com/Many-ip/Projecte17-2
```
## Funcionalidad 👨🏽‍💻
```
./conndb.sh -u usuario -h host [-p puerto <1025|65535>] [-t]
```
Es obligatorio el uso de los argumentos -u y -h. en caso de poner -p y no dar argumento se quejara que no ha indicado el puerto, pero por defecto entendera que querra hacer una conexion al 3306
