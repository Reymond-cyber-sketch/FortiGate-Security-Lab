# FortiGate Security Lab

## Video demostrativo

[Ver video de demostración](PEGA_AQUI_EL_ENLACE_DEL_VIDEO)

## Descripción

Laboratorio de seguridad de red desarrollado en GNS3 utilizando FortiGate, MikroTik RouterOS, Docker, Nginx y MariaDB.

El objetivo del laboratorio es aplicar segmentación de red y políticas de seguridad para controlar la comunicación entre usuarios, un servidor WEB y un servidor de base de datos.

## Topología

La topología está compuesta por:

- 1 FortiGate 7.4.12
- 1 MikroTik RouterOS 7.23.7
- 1 USER-PC
- 1 servidor WEB con Nginx
- 1 servidor DB con MariaDB
- 1 nodo NAT para acceso externo

## Direccionamiento IP

### USERS

Network: 10.24.96.0/25  
Gateway: 10.24.96.1  
VLAN: 10  
DHCP Server: FortiGate  

Durante las pruebas el USER-PC recibió:

10.24.96.12/25

### WEB SERVER

Network: 10.24.96.128/28  
Gateway: 10.24.96.129  
Server: 10.24.96.130  
Service: HTTPS TCP/443  

### DATABASE SERVER

Network: 10.24.96.144/28  
Gateway: 10.24.96.145  
Server: 10.24.96.146  
Service: MariaDB/MySQL TCP/3306  

## Políticas de Firewall

### USERS_TO_WEB_HTTPS

Permite que los usuarios de la VLAN 10 puedan acceder al servidor WEB utilizando HTTPS TCP/443.

### BLOCK_USERS_TO_DB

Bloquea la comunicación directa desde la red de usuarios hacia el servidor de base de datos mediante TCP/3306.

### WEB_TO_DB_MYSQL

Permite que únicamente el servidor WEB pueda comunicarse con el servidor de base de datos utilizando TCP/3306.

## Pruebas realizadas

USER-PC → WEB-SERVER TCP/443: PERMITIDO

USER-PC → DB-SERVER TCP/3306: BLOQUEADO

WEB-SERVER → DB-SERVER TCP/3306: PERMITIDO

WEB-SERVER → DB-SERVER TCP/22: BLOQUEADO

DHCP FortiGate → USER-PC: FUNCIONANDO

HTTPS WEB-SERVER: FUNCIONANDO

MariaDB TCP/3306: FUNCIONANDO

## Seguridad del switch

El switch MikroTik utiliza:

- VLAN Filtering
- RSTP
- VLAN 10 para usuarios
- VLAN 20 para servidores
- Puertos configurados mediante PVID
- Restricción de tráfico etiquetado/no etiquetado en puertos de acceso

## Servidores Docker

### WEB

Servidor Nginx configurado para HTTPS mediante certificado autofirmado.

IP:

10.24.96.130

Puerto:

443/TCP

### DATABASE

Servidor MariaDB.

IP:

10.24.96.146

Puerto:

3306/TCP

Base de datos utilizada:

fortigate_lab

## Limitaciones del laboratorio

La versión Evaluation de FortiGate utilizada durante la práctica presentó limitaciones relacionadas con algunas funciones avanzadas de inspección SSL y certificados.

Por esta razón algunas funciones de inspección profunda no pudieron demostrarse completamente.

Las funciones de segmentación, DHCP, comunicación HTTPS, control de acceso entre USERS, WEB y DATABASE fueron probadas correctamente.

## Estructura del repositorio

configs/
- mikrotik_running-config.rsc
- network-addressing.txt
- fortigate_running-config.conf

scripts/
- web/
- client/
- db/

evidence/
- Capturas de la topología
- Políticas de firewall
- Pruebas de conectividad
- DHCP
- Servidores WEB y DB

## Tecnologías utilizadas

- GNS3
- FortiGate 7.4.12
- MikroTik RouterOS 7.23.7
- Docker
- Nginx
- MariaDB
- Linux
