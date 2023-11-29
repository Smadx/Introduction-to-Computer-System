#include <stdio.h>
bool A[16]={0};

int mod(int a,int b)
{
    while(a>0)
    {
        a=a-b;
    }
    if(a==0)
        return 0;
    if(a<0)
        return a+b;
}

int div(int a,int b)
{
    int i=0;
    for(i=0;a>0;i++)
    {
        a=a-b;
    }
    return i-1;
}
void turn(int a)
{
    for(int i=0;a>0;i++)
    {
        A[i]=mod(a,2);
        a=div(a,2);
    }
}
int main()
{
    int a;
    scanf("%d",&a);
    turn(a);
    for(int j=0;j<16;++j)
    {
        printf("%d",A[j]);
    }
    return 0;
}