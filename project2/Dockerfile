FROM python:3.9-slim 
WORKDIR /app
COPY project2/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY project2/ .
EXPOSE 8080
CMD ["python" , "app.py" ]
