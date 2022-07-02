#pragma once
#include <iostream>
#include <cstring>
#include "Point.h"
#include "Figure.h"
using namespace std;


class Rect: public Figure{
    //rect 5 5 1000.5 10 red green

public:
    Rect() {}
    Rect(dynamicArray& niz, int i){
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
        height = 0;
        while(niz[i] != ' '){
            height = (niz[i] - '0') + height*10;
            i++;
        }
        i++;
        width = 0;
        while(niz[i] != ' '){
            width = (niz[i] - '0') +  width*10;
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
        while(niz[i] != '\0'){
            stroke.inputCharacter(niz[i]);
            i++;
        }
    }

    
    void print() override{
        cout << "Rectangle " << point.x << " " << point.y << " " << height << " " << width << " " << fill << " " << stroke << endl;
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
            .                   .
            .                               .
            ------------------------down, right

            this->rectangle
            point.x, point.y-----------------
            .                               .
            .                               .
            .                               .
            ---------------point.x + width, point.y + height

        */

        int left = parameter[0];
        int up = parameter[1];
        int right = parameter[0] + parameter[2];
        int down = parameter[1] + parameter[3];

        //parameter[0]
        if(point.x > left && point.x + width >  left){
            //parameter[1]
            if(point.y > up && point.y + height > up ){
                //parameter[2]
                if(point.x < right && point.x + width < right ){
                    //parameter[3]
                    if(point.y < down && point.y + height < down ){
                        return true;
                    }
                }
            }   
        }


        return false;
    }
    
    bool withinCircle(double parameter[]) override{
        /*
        this->rectangle
        point.x, point.y-----------------
        .                               .
        .                               .
        .                               .
        ---------------point.x + width, point.y + height
        */
        
        //3 parameter
        double cx = parameter[0];
        double cy = parameter[1];
        double r = parameter[2];


        double x = point.x;
        double y = point.y;
        double x2 = point.x + width;
        double y2 = point.y + height;

        //up (x), left (y)
        if((x - cx)*(x - cx) + (y - cy)*(y - cy) > r*r) return false;
        //up (x), right (y+height)
        if((x - cx)*(x - cx) + (y2 - cy)*(y2 - cy) > r*r) return false;
        //up (x + width), left (y)
        if((x2 - cx)*(x2 - cx) + (y - cy)*(y - cy) > r*r) return false;
        //up (x + width), (y+height)
        if((x2 - cx)*(x2 - cx) + (y2 - cy)*(y2 - cy) > r*r) return false;

        return true;
    }

private:
    Point point;
    double width;
    double height;
    dynamicArray fill;
    dynamicArray stroke;
};

inline ostream& operator<<(ostream& os, const Line& obj)
{
  
   // return os << Line.getText();
     return os;
}