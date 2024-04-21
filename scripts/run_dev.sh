#!/usr/bin/env bash

tailwindcss -i ./frontend/static/src/main.css -o ./frontend/static/dist/main.css --minify --watch=always &>/dev/null 2>&1 &
flask run &>/dev/null 2>&1 &
