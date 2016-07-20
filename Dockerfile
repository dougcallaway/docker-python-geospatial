FROM jupyter/base-notebook:latest

RUN conda install --yes --no-pin geopandas 

# enable importing jupyter notebooks as modules
RUN pip install jupynbimp
