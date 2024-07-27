#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_CORES 8
#define NUM_BENCHMARKS 30
#define NUM_RUNS 5

int globalCompletedRuns = 0;

pthread_mutex_t lock;

typedef struct {
	const char *command;
	double executionTime;
	char language[256];
	int index;
	int totalBenchmarks;
} Benchmark;

void displayProgressBar(int completed, int total) {
	int barWidth = 50;
	float progress = (float)completed / total;
	int pos = barWidth * progress;

	printf("\r[");
	for (int i = 0; i < barWidth; ++i) {
		if (i < pos) printf("=");
		else if (i == pos) printf(">");
		else printf(" ");
	}
	printf("] %.2f%%", progress * 100);
	fflush(stdout);
}

void *runBenchmark(void *arg) {
	Benchmark *benchmark = (Benchmark *)arg;
	double totalTime = 0.0;
	struct timespec start, end;
	int localCompletedRuns = 0;

	for (int i = 0; i < NUM_RUNS; i++) {
		char modifiedCommand[256];
		snprintf(modifiedCommand, sizeof(modifiedCommand), "%s > /dev/null", benchmark->command);

		clock_gettime(CLOCK_MONOTONIC, &start);
		system(modifiedCommand);
		clock_gettime(CLOCK_MONOTONIC, &end);

		totalTime += (end.tv_sec - start.tv_sec);
		totalTime += (end.tv_nsec - start.tv_nsec) / 1000000000.0;

		// Update progress for each run
		pthread_mutex_lock(&lock);
		globalCompletedRuns++;
		displayProgressBar(globalCompletedRuns, NUM_BENCHMARKS * NUM_RUNS);
		pthread_mutex_unlock(&lock);
	}

	benchmark->executionTime = totalTime / NUM_RUNS;
	return NULL;
}

int main() {
	system("gcc C/C.c -o C/C");
	system("g++ C++/Cc.cc -o C++/Cc");
	system("javac Java/java.java");
	system("rustc Rust/rust.rs -o Rust/rust");
	system("kotlinc Kotlin/kotlin.kt -include-runtime -d Kotlin/kotlin.jar 2>/dev/null");
	system("ghc -o Haskell/haskell Haskell/haskell.hs 2> /dev/null");
	system("fpc -Sd Pascal/pascal.pas > /dev/null 2>&1");
	system("gfortran -o Fortran/fortran Fortran/fortran.f90");
	system("dmd D/D.d -ofD/D");
	system("gcc -no-pie -o x86/asm x86/asm.s");
	system("arm-linux-gnueabi-gcc -c arm/arm.s -o arm/arm.o && arm-linux-gnueabi-gcc arm/arm.o -o arm/arm");
	system("mips-linux-gnu-gcc -o mips/mips mips/mips.s");
	system("scalac -d Scala/ Scala/scala.sc");
	system("powerpc-linux-gnu-gcc -o Powerpc/powerpc Powerpc/powerpc.s");
	system("riscv64-linux-gnu-gcc -o Riscv64/riscv64 Riscv64/riscv64.s ");
	system("v -o V/V V/V.v");
	system("ocamlc -o OCaml/ocaml OCaml/ocaml.ml");

	pthread_t threads[NUM_CORES];
	pthread_mutex_init(&lock, NULL);

	Benchmark benchmarks[NUM_BENCHMARKS] = {
		{"python3 Python3/python3.py", 0.0, "Python3"},
		{"python2 Python2/python2.py", 0.0, "Python2"},
		{"./C/C", 0.0, "C"},
		{"./C++/Cc", 0.0, "C++"},
		{"dotnet run --project Cs", 0.0, "C#"},
		{"java -cp Java java", 0.0, "Java"},
		{"./Rust/rust", 0.0, "Rust"},
		{"go run Go/Go.go", 0.0, "Go"},
		{"ruby Ruby/ruby.rb", 0.0, "Ruby"},
		{"node Javascript/javascript.js", 0.0, "Javascript"},
		{"lua Lua/lua.lua", 0.0, "Lua"},
		{"php Php/php.php", 0.0, "PHP"},
		{"java -jar Kotlin/kotlin.jar", 0.0, "Kotlin"},
		{"dart Dart/dart.dart", 0.0, "Dart"},
		{"./Haskell/haskell", 0.0, "Haskell"},
		{"./Pascal/pascal", 0.0, "Pascal"},
		{"./Fortran/fortran", 0.0, "Fortran"},
		{"sage Sagemath/sagemath.py", 0.0, "Sagemath"},
		{"./D/D", 0.0, "D"},
		{"Rscript R/R.r", 0.0, "R"},
		{"./x86/asm", 0.0, "x86_64 Assembly"},
		{"qemu-arm -L /usr/arm-linux-gnueabi/ arm/arm", 0.0, "ARM Assembly"},
		{"qemu-mips -L /usr/mips-linux-gnu/ ./mips/mips", 0.0, "MIPS Assembly"},
		{"qemu-ppc -L /usr/powerpc-linux-gnu ./Powerpc/powerpc", 0.0, "PowerPC Assembly"},
		{"qemu-riscv64 -L /usr/riscv64-linux-gnu Riscv64/riscv64", 0.0, "RISC-V Assembly"},
		{"scala -classpath Scala/ InverseMatrix", 0.0, "Scala"},
		{"swiftc Swift/swift.swift -o Swift/swift && ./Swift/swift", 0.0, "Swift"},
		{"julia Julia/julia.jl", 0.0, "Julia"},
		{"./V/V", 0.0, "V"},
		{"./OCaml/ocaml", 0.0, "OCaml"}
	};
	int completedBenchmarks = 0;

	printf("Benchmarking inverse of 200x200 matrix...\n");

	for (int i = 0; i < NUM_BENCHMARKS; i += NUM_CORES) {
		int count = 0;
		for (int j = 0; j < NUM_CORES && (i + j) < NUM_BENCHMARKS; ++j) {
			benchmarks[i + j].index = i + j;
			benchmarks[i + j].totalBenchmarks = NUM_BENCHMARKS;
			pthread_create(&threads[j], NULL, runBenchmark, (void *)&benchmarks[i + j]);
			count++;
		}

		for (int j = 0; j < count; ++j) {
			pthread_join(threads[j], NULL);
		}
	}

	printf("\nAverage execution time:\n");
	for (int i = 0; i < NUM_BENCHMARKS; ++i) {
		printf("%s: %f seconds\n", benchmarks[i].language, benchmarks[i].executionTime);
	}

	pthread_mutex_destroy(&lock);
	return 0;
}