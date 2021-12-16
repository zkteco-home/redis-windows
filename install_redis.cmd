@echo off
cd /d %~dp0
sc create redis binPath= "%CD%\redis-server.exe --service-run redis.conf" DisplayName= "Redis" start= auto depend= TCPIP
sc description redis "Redis Cache Service"
net start redis



