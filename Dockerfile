FROM jupyter/base-notebook:latest

USER root

# build dependencies
RUN apt-get update && apt-get install -y \
	g++ \
	libgeos-dev \
	libgdal-dev
	
# Switch back to uprivileged user to avoid accidental container runs as root
USER $NB_USER

# geopandas and dependencies
RUN pip install \
	pandas \
	shapely \
	fiona \
	descartes \
	pyproj \
	geopandas

# optional geopandas dependency
RUN conda install --yes \
	rtree

# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
WORKDIR /home/$NB_USER/
RUN mkdir -p -m 700 .ipython/nbextensions/
COPY https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py .ipython/nbextensions/
COPY __init__.py .ipython/nbextensions/

WORKDIR /home/$NB_USER/work
