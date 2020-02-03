# Roman Reggiardo 2/2/2020 Makefile for docker commands on plaza/courtyard:
# please set the correct variables in the head before running and make your
# own branch to work with/fork this repo so as not to mess with my settings

.DEFAULT_GOAL := error

# The DATA and CODE_FIGURES are just my names....you need to keep the
# destination format (everything after the ':' besides the name of the final dir)
# but everything in front of the ':' should match your desired mounts
DATA := '/public/home/rreggiar/kimlab/kras.aale/lung.cancer.plasma.fastq/:/home/${USER}/data'
CODE_FIGURES := '/public/home/rreggiar/projects/aale.kras.manuscript/KRAS-AALE-CODE/exrna.analysis/:/home/${USER}/code.figures'
USER_ID := $(shell id -u)
# $USER variable is handled correctly, sticking with that

rstudio:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:8787:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${CODE_FIGURES}\
		rocker/tidyverse
error:
	@echo 'you are trying to run as ${USER}:${USER_ID}'
	@echo 'if those look correct, plase make sure you know how to use a makefile'
	@echo 'please choose one of the DOCKER commands: rstudio'
	@echo 'note -- you will need to edit this file to achieve desired results'
	@exit 2
