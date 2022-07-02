#pragma once
#include "dynamicArray.h"
#include "Point.h"
//то до а ако има .
//to do setPoint na point

class Figure{
public:

    Figure(){}
    virtual ~Figure(){}

    virtual void print() = 0;
    virtual void setPoint(int x, int y) = 0;
    virtual bool withinRectangle(double parameters[]) = 0;
    virtual bool withinCircle(double parameters[]) = 0;

    virtual std::ostream& format(std::ostream& out) const{
        return out;
    }
    friend std::ostream& operator << (std::ostream& out, const Figure& figure);


    //new
    virtual Figure* clone() const = 0;

private:

};


/////////////////////////////////////////////////////////////////////////////////////////////////////////
class Line: public Figure{

public:
    Line(){}
    Line(dynamicArray<char>& niz, int i){
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
            stroke.pushBack(niz[i]);
            i++;
        }

    }


    void print() override{
        cout << "Line " << point1.x << " " << point1.y << " " << point2.x << " " << point2.y << " " << stroke << endl;
    }

    void setPoint(int x, int y) override{
        int diffx = point2.x - point1.x;
        int diffy = point2.y - point1.y;

        point1.x = x; 
        point1.y = y;

        point2.x = x + diffx; 
        point2.y = y + diffy;
    }
    
    bool withinRectangle(double parameter[]) override{
        //4 parameters 
        /*
            up, left ------------------------
            .                               .
            .          line wihin           .
            .                               .
            ------------------------down, right

        */

        int left = parameter[0];
        int up = parameter[1];
        int right = parameter[0] + parameter[2];
        int down = parameter[1] + parameter[3];

        //parameter[0]
        if(point1.x >  left && point2.x >  left){
            //parameter[1]
            if(point1.y > up && point2.y > up ){
                //parameter[2]
                if(point1.x < right && point2.x < right ){
                    //parameter[3]
                    if(point1.y < down && point2.y < down ){
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


        //1
        if((point1.x - cx)*(point1.x - cx) + (point1.y - cy)*(point1.y - cy) > r*r) return false;

        //2
        if((point2.x - cx)*(point2.x - cx) + (point2.y - cy)*(point2.y - cy) > r*r) return false;

        return true;
    }
    
    std::ostream& format(std::ostream& out) const override {
        //<line x1="10" y1="10"  x2="300" y2="300" stroke="green"/>
        out << " <line x1=\"" << point1.x << "\" y1=\"" << point1.y << "\" x2=\"" << point2.x << "\" y2=\"" << point2.y << " stroke=\"" << stroke << "\"/>"<< endl;
        return Figure::format(out);
    }


    //new
    Figure* clone() const { return new Line(*this); }

private:
    Point point1;
    Point point2;
    dynamicArray<char> stroke;
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////
class Circle: public Figure{
    //5 5 100 blue green

public:
    Circle(){}
    Circle(dynamicArray<char>& niz, int i){
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
            fill.pushBack(niz[i]);
            i++;
        }
        //stoke
        i++;
        while(niz[i] != '\0' && niz[i] != ' '){
            stroke.pushBack(niz[i]);
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

    std::ostream& format(std::ostream& out) const override {
        //<circle cx="5" cy="5" r="10" fill="blue" />
        out << " <circle cx=\"" << point.x << "\" cy=\"" << point.y << "\" r=\"" << r << " fill=\"" << fill << " stroke=\"" << stroke << "\"/>"<< endl;
        return Figure::format(out);
    }

    //new
    Figure* clone() const { return new Circle(*this); }

private:
    Point point;
    double r;
    dynamicArray<char> fill;
    dynamicArray<char> stroke;

};

/////////////////////////////////////////////////////////////////////////////////////////////////////////
class Rect: public Figure{
    //rect 5 5 1000.5 10 red green


public:
    Rect() {}
    Rect(dynamicArray<char>& niz, int i){
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
            fill.pushBack(niz[i]);
            i++;
        }
        //stoke
        i++;
        while(niz[i] != '\0'){
            stroke.pushBack(niz[i]);
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

    //<rect x="100" y="60" width="10" height="10" fill="red" />
    std::ostream&  format(std::ostream& out) const override {
        out << " <rect x=\"" << point.x << "\" y=\"" << point.y << "\" width=\"" << width << " height=\"" << height << " fill=\"" << fill << " stroke=\"" << stroke << "\"/>"<< endl;
        return Figure::format(out);
    }

    //new
    Figure* clone() const { return new Rect(*this); }

private:
    Point point;
    double width;
    double height;
    dynamicArray<char> fill;
    dynamicArray<char> stroke;
};



inline std::ostream& operator << (std::ostream& out, const Figure& figure) {
    // Forward the call to a virtual member function
    return figure.format(out);
}