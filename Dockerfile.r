FROM rpy2/rpy2:2.9.x

ADD . /gluonts

RUN pip3 install /gluonts[shell]
RUN pip3 install mxnet==1.6.0

RUN R -e 'install.packages(c("forecast", "nnfor"), repos="https://cloud.r-project.org")'

ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"

ENTRYPOINT ["python3", "-m", "gluonts.shell"]