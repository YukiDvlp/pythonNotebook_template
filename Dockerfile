FROM python:3.11.6

COPY ./requirements.txt /

WORKDIR /projects

RUN apt update
RUN apt install -y locales && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

RUN apt install -y ffmpeg

RUN pip install --upgrade pip \
    && pip install -r /requirements.txt

# CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='password'