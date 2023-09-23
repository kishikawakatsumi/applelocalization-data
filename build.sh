#!/bin/sh
set -ex

docker build --platform linux/x86_64 --rm -t kishikawakatsumi/applelocalization-data:latest .
