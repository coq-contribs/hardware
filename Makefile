#############################################################################
##  v      #                   The Coq Proof Assistant                     ##
## <O___,, #                INRIA - CNRS - LIX - LRI - PPS                 ##
##   \VV/  #                                                               ##
##    //   #  Makefile automagically generated by coq_makefile Vtrunk      ##
#############################################################################

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

#
# This Makefile was generated by the command line :
# coq_makefile -f Make -o Makefile 
#

.DEFAULT_GOAL := all

# 
# This Makefile may take arguments passed as environment variables:
# COQBIN to specify the directory where Coq binaries resides;
# TIMECMD set a command to log .v compilation time;
# TIMED if non empty, use the default time command as TIMECMD;
# ZDEBUG/COQDEBUG to specify debug flags for ocamlc&ocamlopt/coqc;
# DSTROOT to specify a prefix to install path.

# Here is a hack to make $(eval $(shell works:
define donewline


endef
includecmdwithout@ = $(eval $(subst @,$(donewline),$(shell { $(1) | tr -d '\r' | tr '\n' '@'; })))
$(call includecmdwithout@,$(COQBIN)coqtop -config)

TIMED=
TIMECMD=
STDTIME?=/usr/bin/time -f "$* (user: %U mem: %M ko)"
TIMER=$(if $(TIMED), $(STDTIME), $(TIMECMD))

##########################
#                        #
# Libraries definitions. #
#                        #
##########################

OCAMLLIBS?=
COQLIBS?= -R . Hardware
COQDOCLIBS?=-R . Hardware

##########################
#                        #
# Variables definitions. #
#                        #
##########################


OPT?=
COQDEP?="$(COQBIN)coqdep" -c
COQFLAGS?=-q $(OPT) $(COQLIBS) $(OTHERFLAGS) $(COQ_XML)
COQCHKFLAGS?=-silent -o
COQDOCFLAGS?=-interpolate -utf8
COQC?=$(TIMER) "$(COQBIN)coqc"
GALLINA?="$(COQBIN)gallina"
COQDOC?="$(COQBIN)coqdoc"
COQCHK?="$(COQBIN)coqchk"
COQMKTOP?="$(COQBIN)coqmktop"

COQSRCLIBS?=-I "$(COQLIB)kernel" -I "$(COQLIB)lib" \
  -I "$(COQLIB)library" -I "$(COQLIB)parsing" -I "$(COQLIB)pretyping" \
  -I "$(COQLIB)interp" -I "$(COQLIB)printing" -I "$(COQLIB)intf" \
  -I "$(COQLIB)proofs" -I "$(COQLIB)tactics" -I "$(COQLIB)tools" \
  -I "$(COQLIB)toplevel" -I "$(COQLIB)grammar" \
  -I $(COQLIB)/plugins/Derive \
  -I $(COQLIB)/plugins/btauto \
  -I $(COQLIB)/plugins/cc \
  -I $(COQLIB)/plugins/decl_mode \
  -I $(COQLIB)/plugins/extraction \
  -I $(COQLIB)/plugins/firstorder \
  -I $(COQLIB)/plugins/fourier \
  -I $(COQLIB)/plugins/funind \
  -I $(COQLIB)/plugins/micromega \
  -I $(COQLIB)/plugins/nsatz \
  -I $(COQLIB)/plugins/omega \
  -I $(COQLIB)/plugins/quote \
  -I $(COQLIB)/plugins/romega \
  -I $(COQLIB)/plugins/rtauto \
  -I $(COQLIB)/plugins/setoid_ring \
  -I $(COQLIB)/plugins/syntax \
  -I $(COQLIB)/plugins/xml
ZFLAGS=$(OCAMLLIBS) $(COQSRCLIBS) -I $(CAMLP4LIB)

CAMLC?=$(OCAMLC) -c -rectypes
CAMLOPTC?=$(OCAMLOPT) -c -rectypes
CAMLLINK?=$(OCAMLC) -rectypes
CAMLOPTLINK?=$(OCAMLOPT) -rectypes
GRAMMARS?=grammar.cma
ifeq ($(CAMLP4),camlp5)
CAMLP4EXTEND=pa_extend.cmo q_MLast.cmo pa_macro.cmo
else
CAMLP4EXTEND=
endif
PP?=-pp '"$(CAMLP4O)" -I "$(CAMLLIB)" -I . $(COQSRCLIBS) compat5.cmo \
  $(CAMLP4EXTEND) $(GRAMMARS) $(CAMLP4OPTIONS) -impl'

##################
#                #
# Install Paths. #
#                #
##################

ifdef USERINSTALL
XDG_DATA_HOME?="$(HOME)/.local/share"
COQLIBINSTALL=$(XDG_DATA_HOME)/coq
COQDOCINSTALL=$(XDG_DATA_HOME)/doc/coq
else
COQLIBINSTALL="${COQLIB}user-contrib"
COQDOCINSTALL="${DOCDIR}user-contrib"
endif

######################
#                    #
# Files dispatching. #
#                    #
######################

VFILES:=Factorization/Comparator/Comp_Prog.v\
  Factorization/Comparator/Comp_Verif.v\
  Factorization/Comparator/Comp_Synth.v\
  Factorization/Comparator/Comp_Simpl.v\
  Factorization/Comparator/extract.v\
  Factorization/Comparator/Comparator_Relation.v\
  Factorization/Linear_Structures.v\
  Factorization/Factorization.v\
  Factorization/Factorization_Verif.v\
  Factorization/Factorization_Synth.v\
  Factorization/Lib_Numerals/Lists_of_Numerals.v\
  Factorization/Lib_Numerals/Numerals.v\
  Factorization/Lib_Numerals/Compare_Nat.v\
  Factorization/Lib_Numerals/Compare_Num.v\
  Factorization/Factorization_Prog.v\
  Libraries/Lib_Arithmetic/Lib_Minus.v\
  Libraries/Lib_Arithmetic/Lib_Dec.v\
  Libraries/Lib_Arithmetic/Lib_Mult.v\
  Libraries/Lib_Arithmetic/Lib_Exp.v\
  Libraries/Lib_Arithmetic/Lib_Eq_Le_Lt.v\
  Libraries/Lib_Arithmetic/Lib_Fact.v\
  Libraries/Lib_Arithmetic/Lib_Arith.v\
  Libraries/Lib_Arithmetic/Lib_Square.v\
  Libraries/Lib_Arithmetic/Lib_Plus.v\
  Libraries/Lib_Arithmetic/Lib_Pred.v\
  Libraries/Lib_Arithmetic/Lib_Div_Even_Odd.v\
  Libraries/Lib_Lists/Lists_of_lists.v\
  Libraries/Lib_Lists/Dependent_lists.v\
  Libraries/Lib_Set_Products.v\
  Libraries/Lib_Prop.v\
  Libraries/Lib_Boolean/Lib_Zerob.v\
  Libraries/Lib_Boolean/Lib_Bool.v

-include $(addsuffix .d,$(VFILES))
.SECONDARY: $(addsuffix .d,$(VFILES))

VO=vo
VOFILES:=$(VFILES:.v=.$(VO))
GLOBFILES:=$(VFILES:.v=.glob)
GFILES:=$(VFILES:.v=.g)
HTMLFILES:=$(VFILES:.v=.html)
GHTMLFILES:=$(VFILES:.v=.g.html)
ifeq '$(HASNATDYNLINK)' 'true'
HASNATDYNLINK_OR_EMPTY := yes
else
HASNATDYNLINK_OR_EMPTY :=
endif

#######################################
#                                     #
# Definition of the toplevel targets. #
#                                     #
#######################################

all: $(VOFILES) $(CMOFILES) $(if $(HASNATDYNLINK_OR_EMPTY),$(CMXSFILES)) test\
  Factorization/Comparator/comp.cmi\
  Factorization/Comparator/comp\
  Factorization/Comparator/comp.ml

mlihtml: $(MLIFILES:.mli=.cmi)
	 mkdir $@ || rm -rf $@/*
	$(OCAMLDOC) -html -rectypes -d $@ -m A $(ZDEBUG) $(ZFLAGS) $(^:.cmi=.mli)

all-mli.tex: $(MLIFILES:.mli=.cmi)
	$(OCAMLDOC) -latex -rectypes -o $@ -m A $(ZDEBUG) $(ZFLAGS) $(^:.cmi=.mli)

quick:
	$(MAKE) -f $(firstword $(MAKEFILE_LIST)) all VO=vi
checkproofs:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -schedule-vi-checking $(J) $(VOFILES:%.vo=%.vi)
gallina: $(GFILES)

html: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html $(COQDOCLIBS) -d html $(VFILES)

gallinahtml: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html -g $(COQDOCLIBS) -d html $(VFILES)

all.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

validate: $(VOFILES)
	$(COQCHK) $(COQCHKFLAGS) $(COQLIBS) $(notdir $(^:.vo=))

beautify: $(VFILES:=.beautified)
	for file in $^; do mv $${file%.beautified} $${file%beautified}old && mv $${file} $${file%.beautified}; done
	@echo 'Do not do "make clean" until you are sure that everything went well!'
	@echo 'If there were a problem, execute "for file in $$(find . -name \*.v.old -print); do mv $${file} $${file%.old}; done" in your shell/'

.PHONY: all opt byte archclean clean install uninstall_me.sh uninstall userinstall depend html validate

###################
#                 #
# Custom targets. #
#                 #
###################

test: Factorization/Comparator/comp
	@echo '******* test: comparing two numbers *******'
	./Factorization/Comparator/comp 12365876 646848674
	@echo '************** End of test ****************'

Factorization/Comparator/comp.cmi: Factorization/Comparator/comp.mli
	$(CAMLBIN)ocamlc Factorization/Comparator/comp.mli

Factorization/Comparator/comp: Factorization/Comparator/comp.ml Factorization/Comparator/comp.cmi
	$(CAMLBIN)ocamlopt -I Factorization/Comparator -o Factorization/Comparator/comp Factorization/Comparator/comp.ml Factorization/Comparator/comp.mli Factorization/Comparator/main.ml

Factorization/Comparator/comp.ml: Factorization/Comparator/Comp_Synth.vo
	$(COQBIN)coqtop $(COQFLAGS) -silent -batch -load-vernac-source Factorization/Comparator/extract.v

####################
#                  #
# Special targets. #
#                  #
####################

byte:
	$(MAKE) all "OPT:=-byte"

opt:
	$(MAKE) all "OPT:=-opt"

userinstall:
	+$(MAKE) USERINSTALL=true install

install:
	cd "." && for i in $(VOFILES) $(CMOFILES) $(CMIFILES) $(CMAFILES); do \
	 install -d "`dirname "$(DSTROOT)"$(COQLIBINSTALL)/Hardware/$$i`"; \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/Hardware/$$i; \
	done

install-doc:
	install -d "$(DSTROOT)"$(COQDOCINSTALL)/Hardware/html
	for i in html/*; do \
	 install -m 0644 $$i "$(DSTROOT)"$(COQDOCINSTALL)/Hardware/$$i;\
	done

uninstall_me.sh:
	echo '#!/bin/sh' > $@ 
	printf 'cd "$${DSTROOT}"$(COQLIBINSTALL)/Hardware && rm -f $(VOFILES) $(CMOFILES) $(CMIFILES) $(CMAFILES) && find . -type d -and -empty -delete\ncd "$${DSTROOT}"$(COQLIBINSTALL) && find "Hardware" -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL)/Hardware \\\n' >> "$@"
	printf '&& rm -f $(shell find "html" -maxdepth 1 -and -type f -print)\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL) && find Hardware/html -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	chmod +x $@

uninstall: uninstall_me.sh
	sh $<

clean:
	rm -f $(ALLCMOFILES) $(CMIFILES) $(CMAFILES)
	rm -f $(ALLCMOFILES:.cmo=.cmx) $(CMXAFILES) $(CMXSFILES) $(ALLCMOFILES:.cmo=.o) $(CMXAFILES:.cmxa=.a)
	rm -f $(addsuffix .d,$(MLFILES) $(MLIFILES) $(ML4FILES) $(MLLIBFILES) $(MLPACKFILES))
	rm -f $(VOFILES) $(VOFILES:.vo=.vi) $(GFILES) $(VFILES:.v=.v.d) $(VFILES:=.beautified) $(VFILES:=.old)
	rm -f all.ps all-gal.ps all.pdf all-gal.pdf all.glob $(VFILES:.v=.glob) $(VFILES:.v=.tex) $(VFILES:.v=.g.tex) all-mli.tex
	- rm -rf html mlihtml uninstall_me.sh
	- rm -rf test
	- rm -rf Factorization/Comparator/comp.cmi
	- rm -rf Factorization/Comparator/comp
	- rm -rf Factorization/Comparator/comp.ml

archclean:
	rm -f *.cmx *.o

printenv:
	@"$(COQBIN)coqtop" -config
	@echo 'CAMLC =	$(CAMLC)'
	@echo 'CAMLOPTC =	$(CAMLOPTC)'
	@echo 'PP =	$(PP)'
	@echo 'COQFLAGS =	$(COQFLAGS)'
	@echo 'COQLIBINSTALL =	$(COQLIBINSTALL)'
	@echo 'COQDOCINSTALL =	$(COQDOCINSTALL)'

Makefile: Make
	mv -f $@ $@.bak
	"$(COQBIN)coq_makefile" -f $< -o $@


###################
#                 #
# Implicit rules. #
#                 #
###################

%.cmi: %.mli
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $<

%.mli.d: %.mli
	$(OCAMLDEP) -slash $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

%.cmo: %.ml
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $<

%.cmx: %.ml
	$(CAMLOPTC) $(ZDEBUG) $(ZFLAGS) $<

%.ml.d: %.ml
	$(OCAMLDEP) -slash $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

%.cmxs: %.cmxa
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -linkall -shared -o $@ $<

%.cmxs: %.cmx
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -shared -o $@ $<

%.vo %.glob: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

%.vi: %.v
	$(COQC) -quick $(COQDEBUG) $(COQFLAGS) $*

%.g: %.v
	$(GALLINA) $<

%.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex $< -o $@

%.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS) -html $< -o $@

%.g.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex -g $< -o $@

%.g.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS)  -html -g $< -o $@

%.v.d: %.v
	$(COQDEP) $(COQLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

%.v.beautified:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -beautify $*

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

