#!/bin/sh
set -ex

docker run --rm -p 5432:10000 kishikawakatsumi/applelocalization-data:latest
