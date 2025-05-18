.DELETE_ON_ERROR:

# 
# export BOARD_VENDOR="arduino"
# export BOARD_CORE="avr"
# export BOARD_NAME="uno"
#
# export SCRIPT="Blink"
# make
#
# export BOARD_PORT="dev/ttyACM0"
# make install
#

.PHONY: binary clean install

compile = arduino-cli compile --verbose --export-binaries

upload = arduino-cli upload --verbose 

build_dir = ${SCRIPT}/build/${BOARD_VENDOR}.${BOARD_CORE}.${BOARD_NAME}

fqbn = ${BOARD_VENDOR}:${BOARD_CORE}:${BOARD_NAME}

binary: $(build_dir)/${SCRIPT}.ino.elf

clean:
	rm -Rf ${SCRIPT}/build

install: $(build_dir)/${BOARD_PORT}/upload.log

boards.json:
	arduino-cli board list --json | tee $@

$(build_dir):
	mkdir -p $@

$(build_dir)/${SCRIPT}.ino.elf: ${SCRIPT}/${SCRIPT}.ino | $(build_dir)
	$(compile) --fqbn $(fqbn) ${SCRIPT} | tee $(build_dir)/${SCRIPT}.ino.log

$(build_dir)/${BOARD_PORT}:
	mkdir -p $@

$(build_dir)/${BOARD_PORT}/upload.log: $(build_dir)/${SCRIPT}.ino.elf | $(build_dir)/${BOARD_PORT}
	$(upload) \
		--port /${BOARD_PORT} \
		--fqbn $(fqbn) ${SCRIPT} \
		--build-path $(build_dir) \
		| tee $@
