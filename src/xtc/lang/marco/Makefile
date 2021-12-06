PACKAGE     = xtc.lang.marco
PACKAGE_LOC = xtc/lang/marco

SOURCE_DIRS = \
  . \
  ./analysis \
  ./analysis/hygiene \
  ./analysis/oracle \
  ./analysis/oracle/cpp \
  ./analysis/oracle/sql \
  ./analysis/oracle/util \
  ./ast \
  ./exception \
  ./modules \
  ./run \
  ./stable \
  ./type

SOURCE := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.java))

RESOURCES = \
  modules/debug.mc \
  modules/MLib.mc \
  modules/places.db

ifdef JAVA_DEV_ROOT
include $(JAVA_DEV_ROOT)/Makerules

RESOURCES_OUTPUT = $(foreach m,$(RESOURCES), $(PACKAGE_DIR)/$(m))

.PHONY: clean_resources

$(PACKAGE_DIR)/modules/% : modules/%
	mkdir -p $(dir $@) && cp $< $@

classes: $(RESOURCES_OUTPUT)

parsers: ast/RatsMarcoParser.java

ast/RatsMarcoParser.java: ast/Marco.rats
	$(RATS) -lgpl -out ast $<

clean: clean_resources

clean_resources:
	$(RM) $(RESOURCES_OUTPUT)

endif
