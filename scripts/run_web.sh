#!/bin/sh
python manage.py makemigrations
python manage.py makemigrations frontend
python manage.py migrate
python manage.py init_static_obj

gunicorn calcus.wsgi:application --bind 0.0.0.0:8000 --access-logfile=- --error-logfile=-
