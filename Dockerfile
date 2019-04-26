FROM jupyter/base-notebook:7d427e7a4dde

RUN pip install --no-cache-dir notebook==5.*

USER root

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

COPY . ${HOME}/work
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# libraries
RUN pip install pandas
RUN pip install numpy
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install plotnine
RUN pip install plotly
RUN pip install plotly-express
RUN pip install vega==1.3
RUN pip install vega_datasets
RUN pip install altair
RUN pip install bokeh
RUN pip install holoviews

# table of content
RUN conda install -c conda-forge -y jupyter_contrib_nbextensions
RUN jupyter nbextension enable toc2/main
