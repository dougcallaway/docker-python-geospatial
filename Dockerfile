FROM jupyter/base-notebook:latest

USER root

# Switch back to unprivileged user to avoid accidental container runs as root
USER jovyan

RUN mkdir -p /home/jovyan/.conda/ \
	&& cd /home/jovyan/.conda/ \
	&& wget https://github.com/DCAL12/docker-python-geospatial/blob/master/spec-file.txt \
	&& conda create -y --name geospatial --file /home/jovyan/.conda/spec-file.txt python=3 \
	&& source activate geospatial
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
RUN mkdir -p /home/jovyan/.conda/ 
	&& cd /home/jovyan/.conda/ 
	&& wget https://raw.githubusercontent.com/DCAL12/docker-python-geospatial/master/spec-file.txt 
	&& conda create -y --name geospatial --file /home/jovyan/.conda/spec-file.txt python=3
	&& source activate geospatial
