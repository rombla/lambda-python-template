FROM public.ecr.aws/lambda/python:3.8

COPY requirements.txt .

RUN if [[ -s requirements.txt ]] python3 -m pip install -r requirements.txt

COPY app.py .

CMD [ "app.handler" ]