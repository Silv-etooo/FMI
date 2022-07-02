#pragma once
#include <iostream>
#include <cstring>
#include "Point.h"
#include "Figure.h"
using namespace std;



class Circle: public Figure{
    //5 5 100 blue green

public:
    Circle(){}
    Circle(dynamicArray& niz, int i){
        point.x = 0;
        while(niz[i] != ' '){
            point.x = (niz[i] - '0') + point.x*10;
            i++;
        }
        i++;
        point.y = 0;
        while(niz[i] != ' '){
            point.y = (niz[i] - '0') + point.y*10;
            i++;
        }
        i++;
        //radius
        r = 0;
        while(niz[i] != ' '){
            r = (niz[i] - '0') + r*10;
            i++;
        }
        i++;
        //fill
        while(niz[i] != ' '){
            fill.inputCharacter(niz[i]);
            i++;
        }
        //stoke
        i++;
        while(niz[i] != '\0' && niz[i] != ' '){
            stroke.inputCharacter(niz[i]);
            i++;
        }


    }

    void print() override{
        cout << "Circle " << point.x << " " << point.y << " " << r << " " << fill << " " << stroke << endl;
    }

    void setPoint(int x, int y) override{    
        point.x = x;
        point.y = y;
    }
    
    bool withinRectangle(double parameter[]) override{
        //4 parameters 
        /*
        within
        up, left ------------------------
        .                               .
        .                               .
        .                               .
        ------------------------down, right


        circle
        x1y1 ---------------------
        .                         .
        .                         .
        .                         .
        ------------------------x2y2
        */

        int left = parameter[0];
        int up = parameter[1];
        int right = parameter[0] + parameter[2];
        int down = parameter[1] + parameter[3];


        int x1 = point.x - r;
        int y1 = point.y - r;
        int x2 = point.x + r;
        int y2 = point.y + r;


        //parameter[0]
        if(x1 > left && x2 > left){
            //parameter[1]
            if(y1 > up && y2 > up ){
                //parameter[2]
                if(x1 < right && x2 < right ){
                    //parameter[3]
                    if(y1 < down && y2 < down ){
                        return true;
                    }
                }
            }   
        }


        return false;
    }
    
    bool withinCircle(double parameter[]) override{
        //3 parameter
        double cx = parameter[0];
        double cy = parameter[1];
        double r = parameter[2];

        if( (point.x - cx)*(point.x - cx) + (point.y - cy)*(point.y - cy) + this->r > r*r) return false;

        return true;
    }

private:
    Point point;
    double r;
    dynamicArray fill;
    dynamicArray stroke;

};

inline ostream& operator<<(ostream& os, const Line& obj)
{
  
   // return os << Line.getText();
     return os;
}