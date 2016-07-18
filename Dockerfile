FROM jupyter/base-notebook:latest

USER root

# Switch back to unprivileged user to avoid accidental container runs as root
USER jovyan

# required for creating conda environment
RUN conda install --yes psutil 

ADD spec-file.txt .
RUN conda create --yes --file spec-file.txt --name geospatial python=3 \   
	&& source activate geospatial
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
RUN mkdir -p /home/jovyan/.ipython/nbextensions \
	&& cd /home/jovyan/.ipython/nbextensions \
	&& wget https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py \
	&& touch __init__.py
