CWD := $(shell pwd)

.PHONY: build setup clean clone

RM   := yes | rm -r
ECHO := echo
GIT  := git 

MAKE := make

MAKEOPTS :=

CHAINLOADSCRIPT  := chain.ipxe
IPXE_REPO        := https://github.com/ipxe/ipxe.git
IPXE_REPODIR     := ipxe
IPXE_LOCALCONFIG := ipxe/src/config/local
EFI_TARGET       := bin-x86_64-efi/ipxe.efi

MYCONFIG :=
MYCONFIG += general.h
MYCONFIG += console.h


clone:
	$(GIT) clone $(IPXE_REPO)

$(IPXE_LOCALCONFIG)/%.h: 
	cp $(@F) $@

clean: 
	$(RM) $(CWD)/ipxe

setup: $(foreach CONFIGFILE,$(MYCONFIG),$(IPXE_LOCALCONFIG)/$(CONFIGFILE))

$(IPXE_REPODIR)/src/$(CHAINLOADSCRIPT): $(CHAINLOADSCRIPT)
	cp $< $@

$(IPXE_REPODIR)/$(EFI_DEST_LOCATION): clone
	$(MAKE) -C $(IPXE_REPODIR)/src $(EFI_TARGET) $(MAKEOPTS)
	cp $(IPXE_REPODIR)/src/$(EFI_TARGET) ./

build: $(IPXE_REPODIR)/$(EFI_DEST_LOCATION)

build-chain: clone $(IPXE_REPODIR)/src/$(CHAINLOADSCRIPT)
	$(MAKE) -C $(IPXE_REPODIR)/src $(EFI_TARGET) $(MAKEOPTS) EMBED=chain.ipxe
	cp $(IPXE_REPODIR)/src/$(EFI_TARGET) ./

