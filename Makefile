.DEFAULT_GOAL := error

rstudio:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:$(shell id -u)'
	docker run --rm -p 127.0.0.1:8787:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=$(shell id -u)\
		-v /public/home/rreggiar/kimlab/kras.aale/lung.cancer.plasma.fastq/:/home/rreggiar/data\
		-v /public/home/rreggiar/projects/aale.kras.manuscript/KRAS-AALE-CODE/exrna.analysis/:/home/rreggiar/code.figures\
		rocker/tidyverse
error:
	@echo 'please choose one of the DOCKER commands: rstudio'
	@exit 2
