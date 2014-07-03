#!/bin/bash

cd mediadrop
source mediacore_env/bin/activate
mysqld & 
sleep 4
paster serve --reload /mediadrop/development.ini

