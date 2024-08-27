FROM python:3.10

RUN apt-get update

RUN mkdir /app
WORKDIR /app
COPY . /app

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=true
ENV FLASK_ENV=development

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD sh -c "flask db init && flask db migrate && flask db upgrade && python -m flask run --host=0.0.0.0"