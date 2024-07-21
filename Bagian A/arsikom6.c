#include <stdio.h>

int a(int arr[], int size){
	if(size <= 0){
		return -1;
	}
	return arr[size-1] + a(arr, size - 1);
}

int bmax(int arr[], int size){
	if(size <= 0){
		return -1;
	}
	if(size == 1){
		return arr[0];
	}
	else{
		int max = bmax(arr + 1, size - 1);
		return (arr[0] > max) ? arr[0] : max;
	}
}

int bmin(int arr[], int size){
	if(size <= 0){
		return -1;
	}
	if(size == 1){
		return arr[0];
	}
	else{
		int max = bmin(arr + 1, size - 1);
		return (arr[0] < max) ? arr[0] : max;
	}
}

int main(){
	int arr[] = {1, -20, 3, 4, 5};
	int size = sizeof(arr) / sizeof(arr[0]);

	printf("%d\n", b2(arr, size));
}