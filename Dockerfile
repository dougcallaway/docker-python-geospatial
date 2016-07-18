FROM jupyter/base-notebook:latest

USER root

# Switch back to unprivileged user to avoid accidental container runs as root
USER jovyan

RUN conda install -y psutil 
RUN mkdir -p /home/jovyan/.conda/ 
RUN cd /home/jovyan/.conda/ 
RUN wget https://raw.githubusercontent.com/DCAL12/docker-python-geospatial/master/spec-file.txt 
RUN conda create --yes --quiet --file /home/jovyan/.conda/spec-file.txt --name geospatial python=3   
RUN source activate geospatial
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
RUN mkdir -p /home/jovyan/.ipython/nbextensions \
	&& cd /home/jovyan/.ipython/nbextensions \
	&& wget https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py \
	&& touch __init__.py
