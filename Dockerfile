FROM jupyter/base-notebook:latest

### Spatial Analysis Tools

USER root

RUN apt-get update && apt-get install -y \
	g++ \
	libgeos-dev \
	libgdal-dev	 

# Switch back to jovyan to avoid accidental container runs as root
USER jovyan

RUN conda install \
	geopandas
