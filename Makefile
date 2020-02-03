.DEFAULT_GOAL := error

rstudio_8787:
	@echo 'making rstudio session hosted at 127 0 0 1 8787 8787'
error:
	@echo 'please choose one of the DOCKER commands: rstudio'
	@exit 2
