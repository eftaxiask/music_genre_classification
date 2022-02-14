# Music Genre Classification

The problem of audio classification based on its genre is tackled. The main classifier is built by using transfer learning
and image based classification on the mel-scaled spectrograms of the audio. A 75% accuracy was reached and the method has 
plenty of space for further improvement. More details, results and comments can be found in the IPython Notebook, genre_class_hyper_mel.ipynb. 

# Setup 

The project runs using Docker and a local Jupyter notebook server. In order to build the docker container, navigate to 
the root project folder and run: 

```
docker build . -t genre_class
```


In order to run Jupyterlab with GPU support (given that your system is set up for nvidia-docker2) and browse the 
genre_class_hyper_mel.ipynb, run: 

```
docker run --gpus all -p 8888:8888 -p 6006:6006 -v /path/to/music_genre_classification/:/tf -t genre_class 

```

For systems without supported GPU, remove the `--gpus all`. 

#Dataset

For the notebook to run as it is, the GTZAN Dataset needs to be extracted in the root folder following this structure:

```
.genres_original/<various genres>/
```

# Tensorboard

The logs of the hyperparameter optimisation can be viewed by loading Tensorboard. The easiest way for doing so 
is by opening a terminal through JupyterLab or a bash through `docker exec` and run: 

```
%tensorboard --logdir logs/mel/ --host 0.0.0.0
```

