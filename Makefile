# Roman Reggiardo 2/2/2020 Makefile for docker commands on plaza/courtyard
# please set the correct variables in the head before running and make you're
# own branch to work with/fork this repo so as not to mess with my settings
#
.DEFAULT_GOAL := error

DATA := '/public/home/rreggiar/kimlab/kras.aale/lung.cancer.plasma.fastq/:/home/rreggiar/data'
CODE_FIGURES := '/public/home/rreggiar/projects/aale.kras.manuscript/KRAS-AALE-CODE/exrna.analysis/:/home/rreggiar/code.figures'
USER_ID := $(shell id -u)
# $USER variable is handled correctly, sticking with that

rstudio:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:${USER_I}'
	docker run --rm -p 127.0.0.1:8787:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${CODE_FIGURES}\
		rocker/tidyverse
error:
	@echo 'please choose one of the DOCKER commands: rstudio'
	@exit 2
