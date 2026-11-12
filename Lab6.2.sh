#!/bin/bash

verifica_host() {
local host="$1"
local ip="$2"
local dns="$3"

local ip_nou=$(dig +short "@$dns" "$host" | tail -n1)
if [ "$ip" = "$ip_nou" ]; then
	echo "[SUCCES]"
	return 0
else
        echo "[EROARE]"
        return 1
fi



}
