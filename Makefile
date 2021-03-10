all: mypythonservice mypythonservice.service
.PHONY: all mypythonservice install uninstall
lib_dir=/usr/local/lib/mypythonservice
conf_dir=/usr/local/etc/mypythonservice
service_dir=/etc/systemd/system
venv=$(lib_dir)/venv

install: $(service_dir) mypythonservice.service
	@echo Installing the service files...
	cp mypythonservice.service $(service_dir)
	chown root:root $(service_dir)/mypythonservice.service
	chmod 644 $(service_dir)/mypythonservice.service

	@echo Installing library files...
	mkdir -p $(lib_dir)
	cp mypythonservice.py $(lib_dir)
	chown root:root $(lib_dir)/*
	chmod 644 $(lib_dir)/*

	@echo Installing configuration files...
	mkdir -p $(conf_dir)
	cp mypythonservice.env $(conf_dir)
	chown root:root $(conf_dir)/*
	chmod 644 $(conf_dir)/*

	@echo Creating python virtual environment and isntalling packages...
	python3 -m venv $(venv)
	$(venv)/bin/pip3 install -r requirements.txt

	@echo Installation complete...
	@echo run 'systemctl start mypythonservice' to start service
	@echo run 'systemctl status mypythonservice' to view status

uninstall:
	-systemctl stop mypythonservice
	-systemctl disable mypythonservice
	-rm -r $(lib_dir)
	-rm -r $(conf_dir)
	-rm -r $(service_dir)/mypythonservice.service