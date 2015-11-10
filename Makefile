
# Target construction
goles: nnsteps.o les.o
	f77 -o goles nnsteps.o les.o
nnsteps.o: nnsteps.f
	f77 -c nnsteps.f
les.o: les.f
	f77 -c les.f

clean: 	
	echo "cleaning up"
	rm les.o
	rm nnsteps.o
	rm goles
	echo "done cleaning up"
