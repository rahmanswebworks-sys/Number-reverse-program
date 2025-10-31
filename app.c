#include <stdio.h>

//A program to reverse a given number

int reveseNumber(int num);

int main(void){
    int n, result;

    printf("Enter a number to reverse : ");
    scanf("%d", &n);

    if(n > -10 && n < 10) printf("Noting to reverse %d is a single digit number\n", n);
    else {
        result = reveseNumber(n);
        printf("Reversed number : %d\n", result);
        if(result == n) printf("%d is a palindrome\n", n);
    }
    
    return 0;
}

int reverseNumber(int num){
    int reversed = 0;

    while(num != 0){
        int digit = num % 10;
        reversed = reversed * 10 + digit;
        num /= 10;
    }

    return reversed;
}