# MikroTik RouterOS 7.23.7
# FortiGate Security Lab
# Switch: SW1
# Matricula: 2024-0963
# Configuracion reconstruida segun lo aplicado en el laboratorio GNS3
# No contiene credenciales por seguridad

/system identity
set name=SW1

/interface bridge
add name=BR-LAB protocol-mode=rstp vlan-filtering=yes

/interface bridge port
add bridge=BR-LAB interface=ether1 pvid=10 frame-types=admit-only-untagged-and-priority-tagged
add bridge=BR-LAB interface=ether2 pvid=10 frame-types=admit-only-untagged-and-priority-tagged
add bridge=BR-LAB interface=ether3 pvid=20 frame-types=admit-only-untagged-and-priority-tagged
add bridge=BR-LAB interface=ether4 pvid=20 frame-types=admit-only-untagged-and-priority-tagged
add bridge=BR-LAB interface=ether5 pvid=20 frame-types=admit-only-untagged-and-priority-tagged
add bridge=BR-LAB interface=ether6 pvid=20 frame-types=admit-only-untagged-and-priority-tagged

/interface bridge vlan
add bridge=BR-LAB vlan-ids=10 untagged=ether1,ether2
add bridge=BR-LAB vlan-ids=20 untagged=ether3,ether4,ether5,ether6

# ---------------------------------------------------------
# DISTRIBUCION DE PUERTOS
# ---------------------------------------------------------
# ether1 = FortiGate port2 - Red USERS
# ether2 = USER-PC
# ether3 = FortiGate port3 - Red SERVERS
# ether4 = WEB-SERVER
# ether5 = DB-SERVER
# ether6 = Cloud / Management

# ---------------------------------------------------------
# VLAN 10 - USERS
# ---------------------------------------------------------
# Red: 10.24.96.0/25
# Gateway: 10.24.96.1
# DHCP Server: FortiGate
# USER-PC de prueba: 10.24.96.12/25

# ---------------------------------------------------------
# VLAN 20 - SERVERS / MANAGEMENT
# ---------------------------------------------------------
# WEB Network: 10.24.96.128/28
# WEB Gateway: 10.24.96.129
# WEB Server: 10.24.96.130
# Servicio WEB: HTTPS TCP/443
#
# DB Network: 10.24.96.144/28
# DB Gateway: 10.24.96.145
# DB Server: 10.24.96.146
# Servicio DB: MariaDB/MySQL TCP/3306

# ---------------------------------------------------------
# PRUEBAS REALIZADAS
# ---------------------------------------------------------
# USER-PC -> WEB-SERVER TCP/443 = PERMITIDO
# USER-PC -> DB-SERVER TCP/3306 = BLOQUEADO
# WEB-SERVER -> DB-SERVER TCP/3306 = PERMITIDO
# WEB-SERVER -> DB-SERVER TCP/22 = BLOQUEADO / TIMEOUT

# ---------------------------------------------------------
# SEGURIDAD DEL SWITCH
# ---------------------------------------------------------
# RSTP habilitado
# VLAN filtering habilitado
# Puertos de acceso configurados mediante PVID
# Solo trafico sin etiquetar/prioridad admitido en puertos de acceso
