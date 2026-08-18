@echo off
title Otimizador de Rede - Jogos
color 0A

:: Verificar administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [ERRO] Execute este arquivo como ADMINISTRADOR.
    echo.
    pause
    exit /b
)

echo ==================================================
echo       OTIMIZADOR DE REDE By Marco
echo ==================================================
echo.
echo Este processo pode desconectar sua internet
echo temporariamente.
echo.
pause

echo.
echo [1/12] Limpando cache DNS...
ipconfig /flushdns

echo.
echo [2/12] Renovando configuracao de IP...
ipconfig /release
ipconfig /renew

echo.
echo [3/12] Limpando cache ARP...
arp -d *

echo.
echo [4/12] Resetando Winsock...
netsh winsock reset

echo.
echo [5/12] Resetando TCP/IP...
netsh int ip reset

echo.
echo [6/12] Resetando configuracoes de IPv4...
netsh int ipv4 reset

echo.
echo [7/12] Resetando configuracoes de IPv6...
netsh int ipv6 reset

echo.
echo [8/12] Limpando tabela de roteamento...
route -f

echo.
echo [9/12] Resetando proxy WinHTTP...
netsh winhttp reset proxy

echo.
echo [10/12] Limpando cache NetBIOS...
nbtstat -R
nbtstat -RR

echo.
echo [11/12] Renovando DNS novamente...
ipconfig /flushdns

echo.
echo [12/12] Verificando configuracao de rede...
ipconfig /all

echo.
echo ==================================================
echo              PROCESSO CONCLUIDO
echo ==================================================
echo.
echo IMPORTANTE:
echo Reinicie o computador para aplicar completamente
echo os resets de Winsock e TCP/IP.
echo.
echo Depois de reiniciar, teste seu ping no jogo.
echo.
pause