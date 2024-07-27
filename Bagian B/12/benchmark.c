#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void displayProgressBar(int completed, int total) {
	int barWidth = 50; // Width of the progress bar
	float progress = (float)completed / total;
	int pos = barWidth * progress;

	printf("\r[");
	for (int i = 0; i < barWidth; ++i) {
		if (i < pos) printf("=");
		else if (i == pos) printf(">");
		else printf(" ");
	}
	printf("] %.2f%%", progress * 100);
	fflush(stdout); // Flush stdout to ensure immediate display
}

double measureExecutionTime(const char *command, int *completedBenchmarks, const int totalBenchmarks) {
	const int NUM_RUNS = 5;
	double totalTime = 0.0;

	struct timespec start, end;

	for (int i = 0; i < NUM_RUNS; i++) {
		char modifiedCommand[256];
		snprintf(modifiedCommand, sizeof(modifiedCommand), "%s > /dev/null", command);

		clock_gettime(CLOCK_MONOTONIC, &start);
		system(modifiedCommand);
		clock_gettime(CLOCK_MONOTONIC, &end);

		totalTime += (end.tv_sec - start.tv_sec);
		totalTime += (end.tv_nsec - start.tv_nsec) / 1000000000.0;

		// Correctly update progress for each run
		*completedBenchmarks += 1;
		displayProgressBar(*completedBenchmarks, totalBenchmarks); // Removed the multiplication by NUM_RUNS
	}

	return totalTime / NUM_RUNS;
}

int main() {
	system("gcc C/C.c -o C/C");
	system("g++ C++/Cc.cc -o C++/Cc");
	// system("clang `gnustep-config --objc-flags` -I/usr/lib/gcc/x86_64-linux-gnu/13/include -lgnustep-base -lobjc ObjC/objc.m -o ObjC/objc");
	system("javac Java/java.java");
	system("rustc Rust/rust.rs -o Rust/rust");
	system("kotlinc Kotlin/kotlin.kt -include-runtime -d Kotlin/kotlin.jar 2>/dev/null");
	system("ghc -o Haskell/haskell Haskell/haskell.hs 2> /dev/null");
	system("fpc -Sd Pascal/pascal.pas > /dev/null 2>&1");

	printf("Benchmarking...\n");

	const int totalBenchmarks = 15 * 5; // Update this count if you add/remove benchmarks
	int completedBenchmarks = 0;

	displayProgressBar(completedBenchmarks, totalBenchmarks);

	double python3Time = measureExecutionTime("python3 Python3/python3.py", &completedBenchmarks, totalBenchmarks);
	double python2Time = measureExecutionTime("python2 Python2/python2.py", &completedBenchmarks, totalBenchmarks);
	double cTime = measureExecutionTime("./C/C", &completedBenchmarks, totalBenchmarks);
	double ccTime = measureExecutionTime("./C++/Cc", &completedBenchmarks, totalBenchmarks);
	double csTime = measureExecutionTime("dotnet run --project Cs", &completedBenchmarks, totalBenchmarks);
	// double objcTime = measureExecutionTime("./ObjC/objc", &completedBenchmarks, totalBenchmarks);
	double javaTime = measureExecutionTime("java -cp Java java", &completedBenchmarks, totalBenchmarks);
	double rustTime = measureExecutionTime("./Rust/rust", &completedBenchmarks, totalBenchmarks);
	double goTime = measureExecutionTime("go run Go/Go.go", &completedBenchmarks, totalBenchmarks);
	double rubyTime = measureExecutionTime("ruby Ruby/ruby.rb", &completedBenchmarks, totalBenchmarks);
	double javascriptTime = measureExecutionTime("node Javascript/javascript.js", &completedBenchmarks, totalBenchmarks);
	double luaTime = measureExecutionTime("lua Lua/lua.lua", &completedBenchmarks, totalBenchmarks);
	double phpTime = measureExecutionTime("php Php/php.php", &completedBenchmarks, totalBenchmarks);
	double kotlinTime = measureExecutionTime("java -jar Kotlin/kotlin.jar", &completedBenchmarks, totalBenchmarks);
	double dartTime = measureExecutionTime("dart Dart/dart.dart ", &completedBenchmarks, totalBenchmarks);
	double haskellTime = measureExecutionTime("./Haskell/haskell ", &completedBenchmarks, totalBenchmarks);
	double pascalTime = measureExecutionTime("./Pascal/pascal ", &completedBenchmarks, totalBenchmarks);

	printf("\nAverage execution time:\n");
	printf("Python3: %f seconds\n", python3Time);
	printf("Python2: %f seconds\n", python2Time);
	printf("C: %f seconds\n", cTime);
	printf("C++: %f seconds\n", ccTime);
	printf("C#: %f seconds\n", csTime);
	// printf("Objective-C: %f seconds\n", objcTime);
	printf("Java: %f seconds\n", javaTime);
	printf("Rust: %f seconds\n", rustTime);
	printf("Go: %f seconds\n", goTime);
	printf("Ruby: %f seconds\n", rubyTime);
	printf("Javascript: %f seconds\n", javascriptTime);
	printf("Lua: %f seconds\n", luaTime);
	printf("PHP: %f seconds\n", phpTime);
	printf("Kotlin: %f seconds\n", kotlinTime);
	printf("Dart: %f seconds\n", dartTime);
	printf("Haskell: %f seconds\n", haskellTime);
	printf("Pascal: %f seconds\n", pascalTime);

	return 0;
}