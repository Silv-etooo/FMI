#pragma once
#include "dynamicArray.h"

class Figure{
public:

    Figure(){}
    ~Figure(){}

    virtual void print() = 0;

private:

};

//////////////////////////
struct Point
{
public:
    Point(){
        x = 0;
        y = 0;
    }
    double x;
    double y;
    
};

////////////////////////////////////////
class Line: public Figure{

public:
    Line(){
    }
    Line(dynamicArray& niz, int i){
        //0 0 3000 3000 green
        point1.x = 0;
        while(niz[i] != ' '){
            point1.x = (niz[i] - '0') + point1.x*10;
            i++;
        }
        i++;
        point1.y = 0;
        while(niz[i] != ' '){
            point1.y = (niz[i] - '0') + point1.y*10;
            i++;
        }
        i++;
        point2.x = 0;
        while(niz[i] != ' '){
            point2.x = (niz[i] - '0') + point2.x*10;
            i++;
        }
        i++;
        point2.y = 0;
        while(niz[i] != ' '){
            point2.y = (niz[i] - '0') + point2.y*10;
            i++;
        }
        i++;
        while(niz[i] != '\0'){
            stroke.inputCharacter(niz[i]);
            i++;
        }

    }

    void print() override{
        cout << "Line " << point1.x << " " << point1.y << " " << point2.x << " " << point2.y << " " << stroke << endl;
    }


    
    //=
    //<< cout
    
private:
    Point point1;
    Point point2;
    dynamicArray stroke;
};
/////////////////////////////////////////
class Circle: public Figure{

public:
    Circle(){}
    Circle(dynamicArray& niz, int i){}

    void print();
    //<< cout
    //=

private:
    Point point;
    double r;
    dynamicArray fill;
    dynamicArray stroke;

};
///////////////////////////////////////////
class Rect: public Figure{

public:
    Rect(){}
    Rect(dynamicArray& niz, int i){}

    void print();
    //<< cout
    //=

private:
    Point point;
    double height;
    double width;
    dynamicArray fill;
    dynamicArray stroke;
};

