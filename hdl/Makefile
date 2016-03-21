# IceStick iCE40-HX1K-TQ144
PNR_FLAGS=-d 1k -P tq144
PNR_PCF=HX1KTQ144.pcf

PNR_CC=arachne-pnr
SYN_CC=yosys


default: clean prep nesoi.bin

clean:
	rm -rf target

prep:
	mkdir -p target

nesoi.bin: nesoi.v tmds.v
	${SYN_CC} -q -p "synth_ice40 -blif target/nesoi.blif" $?
	${PNR_CC} ${PNR_FLAGS} -p "${PNR_PCF}" target/nesoi.blif -o target/nesoi.asc
	icepack target/nesoi.asc target/nesoi.bin
