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
aale: WET_LAB = '/public/home/rreggiar/projects/aale.kras/data/other/wet.lab/:/home/${USER}/wetlab'
aale: RESUB_DATA = '/public/groups/kimlab/aale.resub/data/:/home/${USER}/resub_data'
aale:
	@echo 'making rstudio session hosted at 127 0 0 1 5858 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:4848:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${WET_LAB}\
		-v ${RESUB_DATA}\
		rreggiar/tidyr-studio:aale

plasma: DATA = '/public/groups/kimlab/exoRNA-biomarkers-panc/data:/home/${USER}/data'
plasma: NOTEBOOKS = '/public/groups/kimlab/exoRNA-biomarkers-panc/notebooks:/home/${USER}/notebooks'
plasma: FIGURES = '/public/groups/kimlab/exoRNA-biomarkers-panc/figures:/home/${USER}/figures'
plasma: BIN = '/public/groups/kimlab/exoRNA-biomarkers-panc/bin:/home/${USER}/bin'
plasma: R = '/public/groups/kimlab/exoRNA-biomarkers-panc/R:/home/${USER}/R'
plasma: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
plasma: USER_ID = $(shell id -u)
plasma: OUTPUT = '/public/groups/kimlab/exoRNA-biomarkers-panc/output.data:/home/${USER}/output.data'
plasma: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
plasma:
	@echo 'making rstudio session hosted at 127 0 0 1 5858 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:6868:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} -e ROOT=TRUE --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

dave: DATA = '/public/groups/kimlab/amg-treatment-dave/data:/home/${USER}/data'
dave: NOTEBOOKS = '/public/groups/kimlab/amg-treatment-dave/notebooks:/home/${USER}/notebooks'
dave: FIGURES = '/public/groups/kimlab/amg-treatment-dave/figures:/home/${USER}/figures'
dave: BIN = '/public/groups/kimlab/amg-treatment-dave/bin:/home/${USER}/bin'
dave: R = '/public/groups/kimlab/amg-treatment-dave/R:/home/${USER}/R'
dave: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
dave: USER_ID = $(shell id -u)
dave: OUTPUT = '/public/groups/kimlab/amg-treatment-dave/output.data:/home/${USER}/output.data'
dave: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
dave:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:2828:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} -e ROOT=TRUE --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

sttr: DATA = '/public/groups/kimlab/nci_r41/data:/home/${USER}/data'
sttr: NOTEBOOKS = '/public/groups/kimlab/nci_r41/notebooks:/home/${USER}/notebooks'
sttr: FIGURES = '/public/groups/kimlab/nci_r41/figures:/home/${USER}/figures'
sttr: BIN = '/public/groups/kimlab/nci_r41/bin:/home/${USER}/bin'
sttr: R = '/public/groups/kimlab/nci_r41/R:/home/${USER}/R'
sttr: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
sttr: USER_ID = $(shell id -u)
sttr: OUTPUT = '/public/groups/kimlab/nci_r41/output.data:/home/${USER}/output.data'
sttr: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
sttr:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:2828:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} -e ROOT=TRUE --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run
inhib: DATA = '/public/groups/kimlab/exosome-KRAS-inhib/data:/home/${USER}/data'
inhib: NOTEBOOKS = '/public/groups/kimlab/exosome-KRAS-inhib/notebooks:/home/${USER}/notebooks'
inhib: FIGURES = '/public/groups/kimlab/exosome-KRAS-inhib/figures:/home/${USER}/figures'
inhib: BIN = '/public/groups/kimlab/exosome-KRAS-inhib/bin:/home/${USER}/bin'
inhib: R = '/public/groups/kimlab/exosome-KRAS-inhib/R:/home/${USER}/R'
inhib: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
inhib: USER_ID = $(shell id -u)
inhib: OUTPUT = '/public/groups/kimlab/exosome-KRAS-inhib/output.data:/home/${USER}/output.data'
inhib: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
inhib:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:4848:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} -e ROOT=TRUE --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

luad_exotic: DATA = '/public/groups/kimlab/lung-plasma-exoTIC/data:/home/${USER}/data'
luad_exotic: NOTEBOOKS = '/public/groups/kimlab/lung-plasma-exoTIC/notebooks:/home/${USER}/notebooks'
luad_exotic: FIGURES = '/public/groups/kimlab/lung-plasma-exoTIC/figures:/home/${USER}/figures'
luad_exotic: BIN = '/public/groups/kimlab/lung-plasma-exoTIC/bin:/home/${USER}/bin'
luad_exotic: R = '/public/groups/kimlab/lung-plasma-exoTIC/R:/home/${USER}/R'
luad_exotic: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
luad_exotic: USER_ID = $(shell id -u)
luad_exotic: OUTPUT = '/public/groups/kimlab/lung-plasma-exoTIC/output.data:/home/${USER}/output.data'
luad_exotic: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
luad_exotic:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:4848:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

aale_resub: DATA = '/public/groups/kimlab/aale-KRAS-G12-transformation/data:/home/${USER}/data'
aale_resub: NOTEBOOKS = '/public/groups/kimlab/aale-KRAS-G12-transformation/notebooks:/home/${USER}/notebooks'
aale_resub: FIGURES = '/public/groups/kimlab/aale-KRAS-G12-transformation/figures:/home/${USER}/figures'
aale_resub: BIN = '/public/groups/kimlab/aale-KRAS-G12-transformation/bin:/home/${USER}/bin'
aale_resub: R = '/public/groups/kimlab/aale-KRAS-G12-transformation/R:/home/${USER}/R'
aale_resub: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
aale_resub: USER_ID = $(shell id -u)
aale_resub: OUTPUT = '/public/groups/kimlab/aale-KRAS-G12-transformation/output.data:/home/${USER}/output.data'
aale_resub: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
aale_resub:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:3838:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

pitts_exo: DATA = '/public/groups/kimlab/pittsburgh_pah_exoRNA/data:/home/${USER}/data'
pitts_exo: NOTEBOOKS = '/public/groups/kimlab/pittsburgh_pah_exoRNA/notebooks:/home/${USER}/notebooks'
pitts_exo: FIGURES = '/public/groups/kimlab/pittsburgh_pah_exoRNA/figures:/home/${USER}/figures'
pitts_exo: BIN = '/public/groups/kimlab/pittsburgh_pah_exoRNA/bin:/home/${USER}/bin'
pitts_exo: R = '/public/groups/kimlab/pittsburgh_pah_exoRNA/R:/home/${USER}/R'
pitts_exo: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
pitts_exo: USER_ID = $(shell id -u)
pitts_exo: OUTPUT = '/public/groups/kimlab/pittsburgh_pah_exoRNA/output.data:/home/${USER}/output.data'
pitts_exo: CONFIG = '/public/home/${USER}/.rstudio_docker_config:/home/${USER}/.config/rstudio'
pitts_exo:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:3838:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID} --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		-v ${CONFIG}\
		rreggiar/rstudio_workspace:ready_to_run

aale_resub_scanpy: DATA = '/public/groups/kimlab/aale-KRAS-G12-transformation/data:/home/${USER}/data'
aale_resub_scanpy: NOTEBOOKS = '/public/groups/kimlab/aale-KRAS-G12-transformation/notebooks:/home/${USER}/notebooks'
aale_resub_scanpy: FIGURES = '/public/groups/kimlab/aale-KRAS-G12-transformation/figures:/home/${USER}/figures'
aale_resub_scanpy: BIN = '/public/groups/kimlab/aale-KRAS-G12-transformation/bin:/home/${USER}/bin'

aale_resub_scanpy: DATA = '/public/groups/kimlab/aale-KRAS-G12-transformation/data:/home/${USER}/data'
aale_resub_scanpy: NOTEBOOKS = '/public/groups/kimlab/aale-KRAS-G12-transformation/notebooks:/home/${USER}/notebooks'
aale_resub_scanpy: FIGURES = '/public/groups/kimlab/aale-KRAS-G12-transformation/figures:/home/${USER}/figures'
aale_resub_scanpy: BIN = '/public/groups/kimlab/aale-KRAS-G12-transformation/bin:/home/${USER}/bin'
aale_resub_scanpy: R = '/public/groups/kimlab/aale-KRAS-G12-transformation/R:/home/${USER}/R'
aale_resub_scanpy: REFERENCE = '/public/groups/kimlab/genomes.annotations/gencode.35:/home/$(USER)/reference'
aale_resub_scanpy: USER_ID = $(shell id -u)
aale_resub_scanpy: OUTPUT = '/public/groups/kimlab/aale-KRAS-G12-transformation/output.data:/home/${USER}/output.data'
aale_resub_scanpy:
	@echo 'making rstudio session hosted at 127 0 0 1 2828 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:4848:8888 -u $(shell id -u):$(shell id -g) \
		-e JUPYTER_TOKEN='token' --detach\
		-v ${DATA}\
		-v ${NOTEBOOKS}\
		-v ${FIGURES}\
		-v ${BIN}\
		-v ${R}\
		-v ${REFERENCE}\
		-v ${OUTPUT}\
		imperialgenomicsfacility/scanpy-notebook-image:latest



#exotic: DATA = '/public/groups/kimlab/exoTIC-biomarkers/data:/home/${USER}/data'

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

root: USER_ID = $(shell id -u)
root:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787 for ${USER}:${USER_ID}'
	docker run --rm -p 127.0.0.1:5858:8787 -e DISABLE_AUTH=true\
		-e USER=${USER} -e USERID=${USER_ID}\
		-e ROOT=TRUE -e PASSWORD=2553\
		-v '/public/home/rreggiar/rer_tmp:/home/${USER}/tmp'\
		rocker/tidyverse:latest

error:
	@echo 'you are trying to run as ${USER}:${USER_ID}'
	@echo 'if those look correct, plase make sure you know how to use a makefile'
	@echo 'please choose one of the DOCKER commands: rstudio'
	@echo 'note -- you will need to edit this file to achieve desired results'
	@exit 2
