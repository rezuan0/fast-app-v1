FROM python:3.12 AS build
WORKDIR /pyapp
COPY requirements.txt req.txt
RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir -r req.txt

FROM python:3.12-slim
RUN apt update -y
RUN apt install uvicorn
WORKDIR /pyapp
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=build /pyapp /pyapp

EXPOSE 8000

CMD ["python3", "main.py"]
