FROM python:3.10 as build
WORKDIR /pyapp
COPY requirements.txt req.txt

RUN pip install -r req.txt

FROM python:3.10-slim
RUn apt update -y
WORKDIR /pyapp
COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=build /pyapp /pyapp
EXPOSE 8000

CMD ["python3","main.py"]
