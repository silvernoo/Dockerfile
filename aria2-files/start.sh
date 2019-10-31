#!/bin/bash

set -m

darkhttpd /AriaNg --port 6801 &

aria2c --conf-path=/conf/aria2.conf