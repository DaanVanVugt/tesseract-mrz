#!/usr/bin/env bash
mkdir -p testdata
cd testdata
URL=https://github.com
REPO=konstantint/PassportEye
wget -q $URL/$REPO/tree/master/passporteye/mrz/testdata -O- |\
	grep -o '[^"]*[.]\(gif\|jpg\|png\)' |\
	grep $REPO |\
	sed 's/blob/raw/g' | sed "s|^|$URL|g" |\
	wget -nc -nv -i -
