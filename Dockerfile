FROM jupyter/base-notebook:7d427e7a4dde

USER root

RUN sudo apt-get update -y
RUN sudo apt-get install git -y

USER jovyan

RUN pip install --upgrade pip
RUN conda update -n base -y conda

RUN conda install -c conda-forge -y rise
RUN conda install -c conda-forge -y jupyter_contrib_nbextensions

RUN pip install pandas
RUN pip install numpy
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install plotnine
RUN pip install plotly==3.7.0
RUN pip install plotly-express
RUN pip install vega==1.3
RUN pip install vega_datasets
RUN pip install altair
RUN pip install bokeh
RUN pip install holoviews
RUN pip install ipywidgets
RUN pip install qgrid
RUN pip install dash
RUN pip install dash-daq
RUN git clone https://github.com/PAIR-code/facets
RUN pip install --upgrade google-api-python-client
RUN conda install -y protobuf
RUN pip install wordcloud
RUN pip install scattertext
RUN pip install spacy && python -m spacy download en
RUN pip install jieba spacy empath astropy gensim umap-learn
RUN pip install missingno
RUN pip install quilt
RUN quilt install ResidentMario/missingno_data

CMD jupyter nbextension enable toc2/main
CMD jupyter nbextension enable --py --sys-prefix widgetsnbextension
