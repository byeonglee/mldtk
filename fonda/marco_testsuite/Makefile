MARCO = java xtc.lang.marco.Main

CPP_TEST_PROGS = \
  discriminant.mc \
  dynamic_bind.mc \
  expr.mc \
  multi.mc \
  myenum.mc \
  paint.mc

CPP_TEST_HYGINE_PROGS = \
  complain.mc \
  exception_handling.mc \
  hygiene1.mc \
  swap.mc

SQL_TEST_PROGS = \
  SQLElementExist.mc \
  SQLSyntax.mc \
  SQLDynamicHygiene.mc \
  SQLDynamicHygieneFix.mc \
  SQLStaticHygiene.mc \
  SQLStaticHygieneFix.mc

PARSER_TEST_PROGS := $(CPP_TEST_PROGS) $(CPP_TEST_HYGINE_PROGS) $(SQL_TEST_PROGS)

.PHONY: test parser_tests cpp_tests sql_tests

test: parser_tests cpp_tests cpp_hygine_tests sql_tests

parser_tests: $(foreach f, $(PARSER_TEST_PROGS), parser_test_$(basename $f))

parser_test_%: %.mc
	@echo "*** $@: $(MARCO) -di -dt -ds -dhs $<"
	$(MARCO) -di -dt -ds -dhs $<

cpp_tests: $(foreach f, $(CPP_TEST_PROGS), cpp_test_$(basename $f))

cpp_test_%: %.mc
	@echo "*** $@: $(MARCO) -di $<"
	$(MARCO) -di $<

cpp_hygine_tests: $(foreach f, $(CPP_TEST_HYGINE_PROGS), cpp_hygine_test_$(basename $f))

cpp_hygine_test_%: %.mc
	@echo "*** $@: $(MARCO) -di $<"
	if $(MARCO) -di $<;then false;else true;fi

sql_tests: $(foreach f, $(SQL_TEST_PROGS), sql_test_$(basename $f))

sql_test_%: %.mc
	@echo "*** $@: $(MARCO) -di $<"
	$(MARCO) -di $<
