FROM jupyter/base-notebook:latest

USER root

# Switch back to unprivileged user to avoid accidental container runs as root
USER jovyan

RUN mkdir -p /home/jovyan/.conda/ \
	&& cd /home/jovyan/.conda/
	&& wget https://github.com/DCAL12/docker-python-geospatial/blob/master/spec-file.txt \
	&& conda create -y --name geospatial --file /home/jovyan/.conda/spec-file.txt python=3 \
	&& source activate geospatial
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
RUN mkdir -p /home/jovyan/.ipython/nbextensions \
	&& cd /home/jovyan/.ipython/nbextensions \
	&& wget https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py \
	&& touch __init__.py
	
