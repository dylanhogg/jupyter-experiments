# Jupyter Notebook Experiments and Analysis

A Jupyter Notebook set up that supports diffferent local environments, binder and colab. 

## Usage

### Minimal environment suitable for colab

For a minimal environment where required packages are installed by the notebook:  
```
# Reset environment from requirements_minimal.txt
make venv_minimal_reset  

# Run Jupyter Lab from venv_minimal
make jupyter_minimal
```  

### Reusable environment for local development

For a more complete reusable environment used by multiple notebooks and has `./src` in the `PYTHONPATH`:  
```
# Create environment from requirements.txt
make venv  

# Run Jupyter Lab from venv
make jupyter
```  


## Featured Notebooks

Spacy nlp analysis over cloud product data
[cloud_products_analysis/SpacyTest.colab.ipynb](https://github.com/dylanhogg/jupyter-experiments/blob/master/notebooks/cloud_products_analysis/spacy/SpacyTest.colab.ipynb)  
[![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/dylanhogg/jupyter-experiments/blob/master/notebooks/cloud_products_analysis/spacy/SpacyTest.colab.ipynb)  

Blackstone nlp model example
[legal_eagle/blackstone/BlackstoneTest.colab.ipynb](https://github.com/dylanhogg/jupyter-experiments/blob/master/notebooks/legal_eagle/blackstone/BlackstoneTest.colab.ipynb)  
[![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/dylanhogg/jupyter-experiments/blob/master/notebooks/legal_eagle/blackstone/BlackstoneTest.colab.ipynb)  
