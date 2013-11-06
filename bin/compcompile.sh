#!/bin/bash

for dir in */
do
  dir=${dir%*/}
  compass compile ${dir}
done
