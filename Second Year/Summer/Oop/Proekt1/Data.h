#pragma once
#include <iostream>
using namespace std;


class Date{
public:
    Date(){
        day = 0;
        month = 0;
        year = 0;
    }
    //vuvejdane
    void inputDate(){
        int tempday;
        int tempmonth;
        int tempyear;
        cout << endl; 
        cout << "       day: ";
        cin >> tempday;
        this->day = tempday;
        cout << "       month: ";
        cin >> tempmonth;
        this->month = tempmonth;
        cout << "       year: ";
        cin >> tempyear;
        this->year = tempyear;
    }
    void inputDate(int day, int month, int year){
        this->day = day;
        this->month = month;
        this->year = year;
    }
    //sravnenie
    bool operator<=(const Date& other)const{
        if(year > other.year) return false;
        if(year < other.year) return true;

        if(month > other.month) return false;
        if(month < other.month) return true;

        if(day <= other.day) return true;

        return false;
    }
    //bool operator>(const Date& other)const;
    Date& operator=(const Date& other){
        if(this != &other){
            day = other.getDay();
            month = other.getMonth();
            year = other.getYear();
        }
        return *this;
    }


    void clear(){
        day = 0;
        month = 0;
        year = 0;
    }

    int getDay() const{return day;}
    int getMonth() const{return month;}
    int getYear() const{return year;}

private:
    int day;
    int month;
    int year;
};

inline ostream& operator<<(ostream& os, const Date& obj)
{
    os << obj.getDay() << "/" << obj.getMonth() << "/" << obj.getYear();
    return os;
}
