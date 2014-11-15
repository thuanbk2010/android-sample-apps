export GOPATH = $(shell pwd)/go_script/

install: install-scripts clean
	script/copy_ooyala_core_sdk_from_vendor.sh
	script/copy_freewheel_jars_from_vendor.sh
	script/copy_ima_jars_from_vendor.sh
	script/copy_code_into_complete_sample_app.sh

clean-scripts:
	rm -f go_script/bin/*

install-scripts: clean-scripts
	cd go_script/src/mobile.ooyala.com/build/samples/clean_sample_apps/ && go install

clean: install-scripts
	go_script/bin/clean_sample_apps