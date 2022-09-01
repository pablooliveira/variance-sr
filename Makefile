all: variance_ref variance_ieee variance_sr

variance_sr: variance_sr.o main_sr.o
	verificarlo -D REAL=float $^ -o $@

variance_sr.o: variance.c
	verificarlo -D REAL=float -c $< -o $@

main_sr.o: main.c
	clang-7 -D REAL=float -c $< -o $@

variance_ieee: variance_ieee.o main_ieee.o
	clang-7 -D REAL=float $^ -o $@

variance_ieee.o: variance.c
	clang-7 -D REAL=float -c $< -o $@

main_ieee.o: main.c
	clang-7 -D REAL=float -c $< -o $@

variance_ref: variance_ref.o main_ref.o
	clang-7 -D REAL=double $^ -o $@

variance_ref.o: variance.c
	clang-7 -D REAL=double -c $< -o $@

main_ref.o: main.c
	clang-7 -D REAL=double -c $< -o $@
