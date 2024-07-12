FROM okteto/okteto:stable as okteto-cli

FROM python:3-alpine

COPY --from=okteto-cli /usr/local/bin/okteto /usr/local/bin/okteto

WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY destroy-all.py destroy-all.py

CMD python destroy-all.py

