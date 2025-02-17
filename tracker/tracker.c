// C Program to Read a File Using fscanf()
#include <stdio.h>
#include <time.h>
#include "dates.h"

int addThing(char thing, int d, int m, int y) //return - 0 cool, 1- bad
{
    FILE *ptr = fopen("data", "a");
    if (ptr == NULL) {
        printf("ERROR: something went wrong while opening file (ERROR CODE 1)\n");
        return 1;
    }
    fprintf(ptr, "%d %d %d %c\n",d,m,y,thing);
    fclose(ptr);
    return 0;
}

int reset()
{
    FILE *ptr = fopen("data", "w");
    if (ptr == NULL) {
        printf("ERROR: something went wrong while opening file (ERROR CODE 1)\n");
        return 1;
    }
    fprintf(ptr, "");
    fclose(ptr);
    return 0;
}

int readFile()
{
    FILE *ptr = fopen("data", "r");
    if (ptr == NULL) {
        printf("ERROR: something went wrong while opening file (ERROR CODE 1)\n");
        return 1;
    }

    char occurence;
    int day;
    int month;
    int year;
    while (fscanf(ptr, "%d %d %d %c", &day,&month, &year, &occurence) > 0) {
        printf("%02d/%02d/%02d - %c\n",day,month,year,occurence);
    }
    fclose(ptr);
    return 0;
}

int fileAnalysis(char look) //return -1 == problems, all else is days
{
    time_t T = time(NULL);
    struct tm tm = *localtime(&T);
    FILE *ptr = fopen("data", "r");
    if (ptr == NULL) {
        printf("ERROR: something went wrong while opening file (ERROR CODE 1)\n");
        return -1;
    }
    int lines = 0;
    for (char c = getc(ptr); c != EOF; c = getc(ptr))
    {
        if (c == '\n')
            lines++;
    }
    fclose(ptr);
    ptr = fopen("data","r");
    if (ptr == NULL) {
        printf("ERROR: something went wrong while opening file (ERROR CODE 1)\n");
        return -1;
    }
    int days[lines];
    int months[lines];
    int years[lines];
    char occurences[lines];
    int tmp = 0;
    int day, month, year;
    char occurence;
    while (fscanf(ptr, "%d %d %d %c", &day,&month, &year, &occurence) > 0)
    {
        days[tmp] =day;
        months[tmp] = month;
        years[tmp] = year;
        occurences[tmp] = occurence;
        tmp++;
    }
    // for(int i = 0; i<lines; i++)
    // {
    //    printf("%02d/%02d/%02d - %c\n",days[i],months[i],years[i],occurences[i]);
    // }
    occurence = occurences[0];
    tmp = lines-1;
    do
    {
        if(tmp <0)
        {
            printf("Not a valid occurence\n");
            return -1;
        }
        occurence = occurences[tmp];
        tmp--;
    } while(occurence != look);
    tmp++;
    day = days[tmp];
    month = months[tmp];
    year = years[tmp];
    int netdays = getDaysShort(tm.tm_mday, tm.tm_mon + 1, tm.tm_year + 1900) - getDaysShort(day, month, year);
    printf("Days since occurence: %d\n",netdays);
    fclose(ptr);
    return day;
}

int main(int argc, char *argv[]) {
    time_t T = time(NULL);
    struct tm tm = *localtime(&T);


    //printf("System Date is: %02d/%02d/%04d\n", tm.tm_mday, tm.tm_mon + 1, tm.tm_year + 1900);
    //printf("System Time is: %02d:%02d:%02d\n", tm.tm_hour, tm.tm_min, tm.tm_sec);
    if(argc ==1)
    {
        printf("please specify an action\n");
        return 0;
    }
    if(argv[1][0] == '-')
    {
        argv[1][0] = argv[1][1];
    }
    if(argc >= 2 &&(argv[1][1] == '-'))
    {
        printf("-a <value> adds a value\n-r clears data\n-o outputs data\nany other value will report days since occurence of that value.\n");
        return 0;
    }
    if(argc >=2)
    {
        if(argv[1][0] == 'a')
        {
            if(argc == 2)
            {
                printf("Please specify what you want to add\n");
                return 0;
            }
            int tmp = addThing(argv[2][0],tm.tm_mday,tm.tm_mon +1, tm.tm_year +1900);
            return tmp;
        }
        if(argv[1][0] == 'r')
        {
            int tmp = reset();
            return tmp;
        }
        if(argv[1][0] == 'o')
        {
            int tmp = readFile();
            return tmp;
        }
        if(argv[1][0] == 'f')
        {
            if(argc == 2)
            {
                printf("Please specify what you want to find\n");
                return 0;
            }
            int tmp = fileAnalysis(argv[2][0]);
            return tmp;
        }
        else
        {
            int tmp = fileAnalysis(argv[1][0]);
            return tmp;
        }
    }

   /* printf("There are %d args\n",argc);
    for (int i = 0; i < argc; i++) {
        printf("step %d | %c\n", i,argv[i][0]);
    }*/

    return 0;
}
