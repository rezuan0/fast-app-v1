FROM python:3.10 AS build
WORKDIR /pyapp
COPY requirements.txt req.txt
RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir -r req.txt

FROM python:3.10-slim
RUN apt update -y
WORKDIR /pyapp
COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=build /pyapp /pyapp

EXPOSE 8000

CMD ["python3", "main.py"]
