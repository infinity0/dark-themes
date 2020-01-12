.SECONDEXPANSION:

SRC_DarkFire := DarkCold
SRC_DarkBlood := DarkMint
DST := DarkFire DarkBlood

.PHONY: all clean

all: $(DST:%=%/.stamp)

clean:
	rm -rf $(DST)

%/.stamp: .git/modules/$$(SRC_$$*)/index %.sh
	rm -rf "$*"
	cp -a "$(SRC_$*)" "$*"
	rm -f "$*"/.git "$*"/README*
	cd "$*" && ../"$*".sh
	touch "$@"
