FROM arm64v8/python:alpine as builder

RUN apk add --update libxml2-dev libxslt-dev gcc musl-dev g++
RUN pip install --install-option="--prefix=/install" fava

FROM arm64v8/python:alpine

COPY --from=builder /install /usr/local

ENV BEANCOUNT_FILE ""
ENV FAVA_OPTIONS ""
EXPOSE 5050
CMD fava --host 0.0.0.0 $FAVA_OPTIONS $BEANCOUNT_FILE
