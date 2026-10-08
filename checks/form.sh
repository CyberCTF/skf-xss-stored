#!/bin/sh
# Page 1 has the edit form that stores its content.
set -e
H=http://web:5000
curl -fsS "$H/home/1" | grep -q 'action="/update"'
