#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

double measureExecutionTime(const char *command) {
    const int NUM_RUNS = 5;
    double totalTime = 0.0;

    struct timespec start, end;

    for (int i = 0; i < NUM_RUNS; i++) {
        // Append "> /dev/null" to the command to suppress output
        char modifiedCommand[256];
        snprintf(modifiedCommand, sizeof(modifiedCommand), "%s > /dev/null", command);

        clock_gettime(CLOCK_MONOTONIC, &start);
        system(modifiedCommand);
        clock_gettime(CLOCK_MONOTONIC, &end);

        totalTime += (end.tv_sec - start.tv_sec);
        totalTime += (end.tv_nsec - start.tv_nsec) / 1000000000.0;
    }

    return totalTime / NUM_RUNS;
}

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

int main() {
	system("gcc C/C.c -o C/C");
	system("g++ C++/Cc.cc -o C/Cc");
	// system("clang `gnustep-config --objc-flags` -I/usr/lib/gcc/x86_64-linux-gnu/13/include -lgnustep-base -lobjc ObjC/objc.m -o ObjC/objc");
	system("javac Java/java.java");

	printf("Benchmarking...\n");

	const int totalBenchmarks = 6; // Update this count if you add/remove benchmarks
	int completedBenchmarks = 0;

	double python3Time = measureExecutionTime("python3 Python3/python3.py");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	double python2Time = measureExecutionTime("python2 Python2/python2.py");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	double cTime = measureExecutionTime("./C/C");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	double ccTime = measureExecutionTime("./C++/Cc");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	double csTime = measureExecutionTime("dotnet run --project Cs");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	// double objcTime = measureExecutionTime("./ObjC/objc");
	// displayProgressBar(++completedBenchmarks, totalBenchmarks);

	double javaTime = measureExecutionTime("java Java/java.java");
	displayProgressBar(++completedBenchmarks, totalBenchmarks);

	printf("\nAverage execution time:\n");
	printf("Python3: %f seconds\n", python3Time);
	printf("Python2: %f seconds\n", python2Time);
	printf("C: %f seconds\n", cTime);
	printf("C++: %f seconds\n", ccTime);
	printf("C#: %f seconds\n", csTime);
	// printf("Objective-C: %f seconds\n", objcTime);
	printf("Java: %f seconds\n", javaTime);

	return 0;
}