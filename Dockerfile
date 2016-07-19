FROM jupyter/base-notebook:latest
USER jovyan

# for conda create
RUN conda install --yes psutil

WORKDIR /home/jovyan/.conda/
ADD spec-file.txt .
RUN conda create --yes --file spec-file.txt --name geospatial python=3
RUN /bin/bash -c "source activate geospatial"
	
# enable importing iPython/Jupyter notebooks as python modules
# module available via 'from nbextensions import notebook_importing'
WORKDIR /home/jovyan/.ipython/nbextensions/
ADD https://gist.github.com/DCAL12/1a872bd63bedfb7b12612c8a7ec0f52e/raw/228276e3c7c8e151f32e04e85ea8c33057d2d6a5/notebook_importing.py .
ADD __init__.py .

WORKDIR /home/jovyan/work/
