# Roman Reggiardo 2/2/2020 Makefile for docker commands on plaza/courtyard:
# please set the correct variables in the head before running and make your
# own branch to work with/fork this repo so as not to mess with my settings

.DEFAULT_GOAL := error

# The DATA and CODE_FIGURES are just my names....you need to keep the
# destination format (everything after the ':' besides the name of the final dir)
# but everything in front of the ':' should match your desired mounts

aale: DATA = '/public/home/rreggiar/kimlab/aale.kras/data:/home/${USER}/data'
aale: NOTEBOOKS = '/public/home/rreggiar/projects/aale.kras/notebooks/:/home/${USER}/notebooks'
aale: FIGURES = '/public/home/rreggiar/projects/aale.kras/figures/:/home/${USER}/figures'
aale: USER_ID = $(shell id -u) # $USER variable is handled correctly, sticking with that
aale: WET_LAB = '/public/home/rreggiar/projects/aale.kras/data/other/wet.lab/'
aale:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:8787:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${WET_LAB}\
		rreggiar/tidyr-studio:aale

plasma: DATA = '/public/groups/kimlab/exoRNA-biomarkers-panc/data:/home/${USER}/data'
plasma: NOTEBOOKS = '/public/groups/kimlab/exoRNA-biomarkers-panc/notebooks:/home/${USER}/notebooks'
plasma: FIGURES = '/public/groups/kimlab/exoRNA-biomarkers-panc/figures:/home/${USER}/figures'
plasma: SCRIPTS = '/public/groups/kimlab/exoRNA-biomarkers-panc/scripts:/home/${USER}/scripts'
plasma: USER_ID = $(shell id -u)
plasma: OUTPUT = '/public/groups/kimlab/exoRNA-biomarkers-panc/output.data:/home/${USER}/output.data'
plasma:
	@echo 'making rstudio session hosted at 127 0 0 1 5858 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:5858:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${SCRIPTS}\
		-v ${OUTPUT}\
		rreggiar/tidyr-studio:plasma

exotic: DATA = '/public/groups/kimlab/exoTIC-biomarkers/data:/home/${USER}/data'
exotic: NOTEBOOKS = '/public/groups/kimlab/exoTIC-biomarkers/notebooks:/home/${USER}/notebooks'
exotic: FIGURES = '/public/groups/kimlab/exoTIC-biomarkers/figures:/home/${USER}/figures'
exotic: SCRIPTS = '/public/groups/kimlab/exoTIC-biomarkers/scripts:/home/${USER}/scripts'

exotic: USER_ID = $(shell id -u)
exotic:
	@echo 'making rstudio session hosted at 127 0 0 1 4848 8383 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:4848:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${SCRIPTS}\
		rreggiar/tidyr-studio:exotic

rstudio:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:8787:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		rreggiar/tidyr-studio
error:
	@echo 'you are trying to run as ${USER}:${USER_ID}'
	@echo 'if those look correct, plase make sure you know how to use a makefile'
	@echo 'please choose one of the DOCKER commands: rstudio'
	@echo 'note -- you will need to edit this file to achieve desired results'
	@exit 2
