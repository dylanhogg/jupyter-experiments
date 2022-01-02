## Create main venv for jupyter
venv:
	if [[ ! -e venv/bin/activate ]]; then python3 -m venv venv ; source venv/bin/activate ; pip install --upgrade pip ; pip install -r requirements.txt; fi
	source venv/bin/activate; jupyter labextension install jupyterlab-plotly
	source venv/bin/activate; pip freeze > requirements_freeze.txt

## Run jupyter in main venv
jupyter:
	source venv/bin/activate; PYTHONPATH='./src' jupyter lab

## Create qgrid enabled venv for jupyter
venv_qgrid:
	if [[ ! -e venv_qgrid/bin/activate ]]; then python3 -m venv venv_qgrid ; source venv_qgrid/bin/activate ; pip install --upgrade pip ; pip install -r requirements.txt; fi
	source venv_qgrid/bin/activate; pip install qgrid
	source venv_qgrid/bin/activate; jupyter nbextension enable --py --sys-prefix qgrid
	source venv_qgrid/bin/activate; jupyter nbextension enable --py --sys-prefix widgetsnbextension
	source venv_qgrid/bin/activate; jupyter labextension install @jupyter-widgets/jupyterlab-manager
	source venv_qgrid/bin/activate; jupyter labextension install qgrid2
	source venv_qgrid/bin/activate; jupyter labextension install jupyterlab-plotly
	source venv_qgrid/bin/activate; pip freeze > requirements_qgrid_freeze.txt

## Run jupyter in qgrid venv
jupyter_qgrid:
	source venv_qgrid/bin/activate; jupyter lab

## Create blackstone venv for jupyter
venv_blackstone:
	if [[ ! -e venv_blackstone/bin/activate ]]; then python3 -m venv venv_blackstone ; source venv_blackstone/bin/activate ; pip install --upgrade pip ; pip install -r requirements_blackstone.txt; fi
	source venv_blackstone/bin/activate; pip install https://blackstone-model.s3-eu-west-1.amazonaws.com/en_blackstone_proto-0.0.1.tar.gz
	source venv_blackstone/bin/activate; python -m spacy download en_core_web_md
	source venv_blackstone/bin/activate; pip freeze > requirements_blackstone_freeze.txt

## Run jupyter in main venv
jupyter_blackstone:
	source venv_blackstone/bin/activate; PYTHONPATH='./src' jupyter lab

## Create minimal venv for jupyter
venv_minimal_reset:
	rm -rf venv_minimal
	python3 -m venv venv_minimal ; source venv_minimal/bin/activate ; pip install --upgrade pip ; pip install -r requirements_minimal.txt
	source venv_minimal/bin/activate; pip freeze > requirements_minimal_freeze.txt

## Run minimal in minimal venv, no PYTHONPATH to src
jupyter_minimal:
	source venv_minimal/bin/activate; jupyter lab

## Self Documenting Commands
.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: help
help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
