FROM python:3.11.0a1-slim

COPY ./app /app
# How you install your python packages may differ
RUN pip install -r /app/requirements.txt

# Ensure the path here is correct
ENV FLASK_APP /app/app.py

#Expose needed ports
EXPOSE 5000

ENTRYPOINT [ "gunicorn --chdir ./app wsgi:app/app" ]
#ENTRYPOINT [ "flask run --host=0.0.0.0 --port=5000" ]