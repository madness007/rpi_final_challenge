#!/usr/bin/env bash

mkdir -p /backup

now=$(date +%F)
echo $(tar -czvf /backup/${now}_backup.tar.gz /home)
