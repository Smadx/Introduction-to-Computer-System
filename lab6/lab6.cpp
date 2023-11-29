#include <stdio.h>
#include <stdint.h>

#define     MAXLEN      100
#define     LENTH       3

bool A[16];//保存转换为二进制后的A

int mod(int a,int b)
{
    while(a>0)
    {
        a=a-b;
    }
    if(a==0)
        return 0;
    return a+b;//复位
}

int div(int a,int b)
{
    int i=0;
    for(i=0;a>0;i++)
    {
        a=a-b;
    }
    return i-1;//复位
}
void turn(int a)
{
    for(int i=0;a>0;i++)
    {
        A[i]=mod(a,2);//模2运算
        a=div(a,2);
    }
}

void lab1(int a,int b)
{
    printf("A=%d B=%d\n",a,b);
    turn(a);//把a转换为2进制
    int ans=0;
    for(int i=0;i<b;++i)
    {
        if(A[i]==1)
            ans++;
    }
    printf("结果为:%d\n",ans);
}

void lab2(int p,int q,int n)
{
    int ans,F[1024]={0};
    F[0]=1;//初值
    F[1]=1;//初值
    if(n==0||n==1)
        ans=1;
    else
    {
        for(int i=2;i<=n;++i)
        {
            F[i]=mod(F[i-2],p)+mod(F[i-1],q);//递推
        }
        ans=F[n];
    }
    printf("结果为: %d\n",ans);
}

void lab3(int n,char s[])
{
    printf("n=%d s=%s\n",n,s);
    int i=1,len=1,L=1;//len记录当前检测字符串长度，L记录当前最大长度
    char c=s[0];
    while(i<=n)
    {
        if(s[i]==c)//判断是否是重复字符
        {
            len++;
            if(len>L)//若超过当前最大长度，则替代
                L=len;
            i++;
            continue;
        }
        //不是重复字符，重新初始化
        c=s[i];
        len=1;
        i++;
    }
    printf("结果为: %d\n",L);
}

void bub(int score[])
{
    int temp;
    for(int i=0;i<15;i++)//这么多轮
    {
        for(int j=0;j<15-i;j++)//每一轮
        {
            if(score[j]>score[j+1])//把小的放在前面
            {
                temp=score[j];
                score[j]=score[j+1];
                score[j+1]=temp;
            }
        }
    }
}

void lab4(int score[])
{
    int a=0,b=0;
    bub(score);//对成绩排序
    for(int i=0;i<16;i++)//打印排序后的成绩序列
    {
        printf("%d ",score[i]);
    }
    printf("\n");
    for(int i=12;i<16;i++)//计算得A的人数
    {
        if(score[i]>=85)
            a++;
    }
    for(int i=8;i<16;i++)//计算得B的人数
    {
        if((score[i]>=75)&&(score[i]<85))
            b++;
    }
    printf("有%d人得A,有%d人得B\n",a,b);
}

int main()
{
    FILE *fp;
    fp=fopen("test.txt","r");
    if(fp)
        printf("成功打开文件\n");
    int a=0,b=0;//A、B
    printf("-----------------lab1------------------\n");
    for(int i=0;i<LENTH;++i)
    {
        fscanf(fp,"%d %d",&a,&b);//从文件中读取lab1测试样例
        lab1(a,b);
    }
    printf("-----------------lab2------------------\n");
    int p=0,q=0,n=0;//p、q、N
    for(int i=0;i<LENTH;++i)
    {
        fscanf(fp,"%d %d %d",&p,&q,&n);//从文件中读取lab2测试样例
        printf("p=%d q=%d n=%d\n",p,q,n);
        lab2(p,q,n);
    }
    printf("-----------------lab3------------------\n");
    char s[MAXLEN];//待检查字符串
    for(int i=0;i<LENTH;++i)
    {
        fscanf(fp,"%d %s",&n,s);//从文件中读取lab3测试样例
        lab3(n,s);
    }
    printf("-----------------lab4------------------\n");
    int score[16];//成绩序列
    for(int i=0;i<LENTH;++i)
    {
        for(int j=0;j<16;++j)
        {
            fscanf(fp,"%d",&score[j]);//从文件中读取lab4测试样例
        }
        lab4(score);
    }
    fclose(fp);
    return 0;
}
