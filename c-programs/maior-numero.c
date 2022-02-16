#include<stdio.h>

int main(){
    float numero_1, numero_2;

    scanf("%f", &numero_1);
    scanf("%f", &numero_2);

    if(numero_1 < numero_2){
        printf("%.2f", numero_2);
    }else{
        printf("%.2f", numero_1);
    }
}