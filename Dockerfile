FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
	g++ \
	libgeos-dev \
	libgdal-dev \
	# optional plotting dependencies
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
