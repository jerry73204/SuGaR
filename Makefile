.PHONY: default train

REGULARIZATION = "dn_consistency" # One of "dn_consistency", "density" or "sdf"
DATASET_DIR := ./scene

default:
	@echo 'If you are first comer, please run the setup.'
	@echo '    make setup'
	@echo
	@echo 'To Train a model,'
	@echo '    make train DATASET_DIR=/path/to/your/dataset'


prepare:
	export CUDA_HOME=/usr/local/cuda-11.8 && \
	conda env create --file environment.yml

train:
	python train_full_pipeline.py \
		-s $(DATASET_DIR) \
		-r $(REGULARIZATION) \
		--high_poly True \
		--export_obj True
