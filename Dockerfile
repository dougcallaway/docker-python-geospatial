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
