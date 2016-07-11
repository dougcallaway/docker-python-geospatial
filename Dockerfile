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
RUN mkdir -p /home/jovyan/.ipython/nbextensions \
	&& cd /home/jovyan/.ipython/nbextensions \
	&& wget https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py \
	&& touch __init__.py
	
