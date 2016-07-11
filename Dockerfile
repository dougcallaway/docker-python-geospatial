FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
	g++ \
	libgeos-dev \
	libgdal-dev \
	# optional plotting dependencies
	python-qt4 \
	python-matplotlib

# Switch back to jovyan to avoid accidental container runs as root
USER jovyan

RUN conda install -c conda-forge \
	fiona \
	shapely \
	pyproj \
	geopandas 

# Optional dependencies
RUN conda install \
	# improved spatial indexing
	rtree \
	# geographic plotting
	descartes \
	pysal
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
RUN cd /home/jovyan/.ipython/nbextensions \
	&& wget https://gist.github.com/robclewley/75b7719119892b99d73b/raw/b300a29dacd6ad7ec0e39ca42e3841d33c79c454/notebook_importing.py \
	&& touch __init__.py
	
