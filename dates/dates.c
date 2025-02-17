//THERE ARE NO DATES BEFORE 0/0/0 I DON'T CARE HOW YOU ARGUE IT THEY ARE NOT REAL
//DATES BETWEEN 0/0/0 AND 0/0/1900 ARE ARGUABLE AND MAY OR MAY NOT EXIST
//DATES AFTER 0/0/1900 PROBABLY EXIST

//known # of days:
//I hate calendars so much why are people like this time is awful and a social construct
//like litterally no one knows how calendars work this is absolute madness why are people like this?
//this are not inclusive of the end date!
//0-100: 36,159
//100-200: 36,525
//200-300:36,525
//300-400: 36,525
//400-500: 36,525
//500-600: 36,525
//600-700: 36,525
//700-800: 36,525
//800-900: 36,525
//900-1000:36,525
//1000-1100 :36,525
//1100-1200 : 36,525
//1200-1300 :36,525
//1300-1400 :36,525
//1400-1500 : 36,525
//1500-1600 : 36,525
//1600-1700 :36,525
//1700-1800 :36,514 //gregorian starts
//1800-1900 :36,524 //dates do not exist before here if anyone tells you they do they are lying.

int isLeapYear(int year) //1 is true, 0 is false
{
    if(year%400 == 0)
    {
        return 1;
    }
    if(year%100 == 0)
    {
        return 0;
    }
    if(year%4 == 0)
    {
        return 1;
    }
    return 0;
}

int getDaysYearless(int d, int m, int y)
{
    //YEARS ARE NOT REAL
    //this is the most accurate function
    int netdays = d;
    int months[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    if(isLeapYear(y))
    {
        months[1] = 29;
    }
    for(int i = 0; i<m; i++)
    {
        netdays += months[i];
    }




    return netdays;
}

int getDaysShort(int d, int m, int y)
{ //why are dates like this????
    //dates before 1900 don't exist anyone whos says otherwise is a liar
    d--;
    int netdays = d;
    int months[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    m--;
    if(isLeapYear(y))
    {
        months[1] = 29;
    }
    for(int i = 0; i<m; i++)
    {
        netdays += months[i];
    }
    for(int i = 1900; i<y;i++)
    {
        if(isLeapYear(i))
        {
            netdays += 366;
        }
        else
        {
            netdays += 365;
        }
    }
    return netdays;
}

int getDays(int d, int m, int y)
{ //why are dates like this????
    //okay fine dates exist before 1900 but they're really weird and more of a social construct than actual time
    //yeah.



    return 1;
}

