FROM jupyter/demo:latest
USER root
RUN apt-get -y update && apt-get install -y swig libzmq3-dev libgmp-dev libglpk-dev glpk-utils pandoc python-dev python-pip libxml2 libxml2-dev zlib1g zlib1g-dev bzip2 libbz2-dev 
RUN locale -a
RUN export LANG=C.UTF-8
RUN pip install pip --upgrade
RUN pip install inspyred -f http://nikosonnensche.in/wheels/index.html --no-index --trusted-host nikosonnensche.in
RUN pip install python-libsbml-experimental -f http://nikosonnensche.in/wheels/index.html --no-index --trusted-host nikosonnensche.in
RUN pip install -e git+https://github.com/aebrahim/IProgress.git#egg=IProgress
RUN pip --version
# RUN pip install cameo
RUN pip install -e git+https://github.com/biosustain/cameo.git@devel#egg=cameo
# RUN git clone https://github.com/biosustain/cameo.git && cd cameo && pip install .  
RUN rm *.ipynb 
RUN rm -rd datasets src featured communities
ADD notebooks/ /home/jovyan/
CMD ipython notebook
