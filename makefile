all : task1 task2 task3

task1: main1_1.o hello_Ariel.o
	gcc -o task1 main1_1.o hello_Ariel.o
		
task2: main1_2.o libhello_Ariel.so
	gcc -o task2 main1_2.o ./libhello_Ariel.so

task3: main1_3.o libhello_Ariel.so
	gcc -o -rdynamic -o task3 main1_3.c -ldl

libhello_Ariel.so: hello_Ariel.h hello_Ariel.o
	gcc -shared -o libhello_Ariel.so hello_Ariel.o

main1_1.o: main1_1.c
	gcc -c main1_1.c

main1_2.o: main1_2.c
	gcc -c main1_2.c
	
main1_3.o: main1_3.c
	gcc -c main1_3.c

hello_Ariel.o: hello_Ariel.c hello_Ariel.h
	gcc -c hello_Ariel.c

clean: 
	rm -f *.o task1 task2 task3 *.so *.gch	


