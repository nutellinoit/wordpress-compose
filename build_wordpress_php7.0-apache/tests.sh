#!/usr/bin/env bash

set -e

number=$(curl -L http://localhost 2>&1 | grep wp-admin | wc -l)

if [ $number -gt 1 ]; then echo "OK"; else exit 125; fi