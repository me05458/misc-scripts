#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//turns chars into ints
int charEater(char c)
{
    int result =  c - '0'; //the numbers are consecutive so subtract 0
    if(result > 9||result<0) //it's a letter/other character
        return -1;
    return result;
}
int main(int argc, char *argv[])
{
    int rad = 0;
    if(argc >=2)
    {
        int counter = 0;
        char c = argv[1][counter];
        //slurp up each character and multiply 10^its possition to make the full number
        while(c != NULL)
        {
            counter++;
            c = argv[1][counter];
        }
        for(int i=counter-1; i>=0; i--)
        {
            int tmp = charEater(argv[1][(counter-1)-i]);
            //int tmp = 1;
            rad+=tmp*(int)pow(10,i);
        }
    }
    else
    {
        rad = 5;
    }
    printf("SPHERE OF RADIUS %d\n----------------------\n",rad);
    int layers = rad*2;
    double x1 = 0;
    int stitches = 0;
    int tmp = 0;
    for(int i = layers/2; i>=0; i--)
    {
        tmp = stitches;
        x1 = sqrt(rad*rad-i*i);
        stitches = 3.14*x1*2;
        printf("stitches per row: %d New Stitches: %d\n",stitches, abs(tmp-stitches));
    }
    return 0;
}
