#!/bin/bash


cat $1 | grep '#f#' |sed 's/<6> #f#[0-9]*://g' > $1.free
cat $1 | grep '#c#' |sed 's/<6> #c#[0-9]*://g' > $1.cache
