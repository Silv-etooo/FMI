#pragma once
#include <fstream>
#include "Figure.h"
//todo close: add figures to file
//to do check bounds for tranlate 
//to do negative numbers

/*
Class - Figures
this class acts as a storage place for all figures
*/
class Figures{

public:
    Figures(){
        num = 0;
    }
    ~Figures(){
       clear();
    }

    
    void open(dynamicArray& filename);

    void close(){
        saveas(filename);
        clear();
    }
    void save(){
        saveas(filename);
    }
    void saveas(dynamicArray& filename1){

        ofstream out;
        out.open(filename1.getText(), std::ofstream::out | std::ofstream::trunc);

        dynamicArray startText;
        startText.inputString("<?xml version=\"1.0\" standalone=\"no\"?>\n<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\nhttp://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">\n<svg>");
        out << startText << endl;


        for(int i = 0; i< num; i++){
            out << *figures[i];
        }
        

        dynamicArray endText;
        endText.inputString("</svg>");
        out << endText << endl;


        out.close();
    }

    void print(){

        for(int i = 0; i < num; i++){
            cout << i+1 << ".";
            figures[i]->print();
        }


    }

    void create(dynamicArray& niz){
        //create rectangle -1000 -1000 10 20 yellow
        addFigure(niz);
        
    }

    void erase(dynamicArray& niz){
        int i = 0;
        int n = 0;
        while(niz[i] != '\0'){
            n = (niz[i] - '0') + n*10;
            i++;
        }

        n--;
        for(i = n; i< num; i++ ){
            figures[i] = figures[i+1];
        }
        num--;


    }

    void translate(dynamicArray& niz){
        //Транслира фигурата с пореден номер <n> или всички фигури, ако <n> не е указано.
        //translate 10 100 n

        int x,y,n; 
        translateProcessInput(niz, x, y, n);
        
        if (n == -1){ //n не е указано
            for(int i = 0; i< num; i++){
                figures[i]->setPoint(x, y);
            }
        } 
        else{
            //check bounds
            figures[n]->setPoint(x, y);
        }  
        
    }

    void within(dynamicArray& niz){
        //Figure *withinFigure;
        dynamicArray type;
        double parameters[3];


        withinProcessInput(niz, type, parameters);

        for(int i = 0; i < num; i++){
            if(type == "circle"){
                //cout << parameters[0] << " " <<parameters[1] << " " << parameters[2] << " " << parameters[3] << endl;
                if(figures[i]->withinCircle(parameters)) figures[i]->print();

            }
            else if(type == "rectangle") {
                if(figures[i]->withinRectangle(parameters)) figures[i]->print(); //raboti
            }
           
        }
    }

    
    //[]
    //cout

private:
    Figure *figures[100];
    int num;
    dynamicArray filename;

    //ako e eden processInput - faida ot menu
    void translateProcessInput(dynamicArray& niz, int& x, int& y, int& n ){
        //<translate >10 100 n
        x = 0;
        y = 0;
        n = 0;

        int i = 0;
        while(niz[i] != ' '){
            x = (niz[i] - '0') + x*10;
            i++;
        }
        i++;
        while(niz[i] != ' ' && niz[i] != '\0'){
            y = (niz[i] - '0') + y*10;
            i++;
        }

        if(niz[i] == '\0') n = -1;
        else{
            i++;
            while( niz[i] != '\0'){
                n = (niz[i] - '0') + n*10;
                i++;
            }
        }


    }
    void withinProcessInput(dynamicArray& niz, dynamicArray & type, double parameters[]){
        //within = <type of figure>, <n parameters>
        int i = 0;
        while(niz[i] != ' '){
            type.inputCharacter(niz[i]);
            i++;
        }
        i++; //for ' '

        if(type == "circle") {
            parameters[0] = 0;
            while(niz[i] != ' '){
                parameters[0] = (niz[i] - '0') + parameters[0]*10;
                i++;
            }
            i++;
            parameters[1] = 0;
            while(niz[i] != ' '){
                parameters[1] = (niz[i] - '0') + parameters[1]*10;
                i++;
            }
            i++;
            //radius
            parameters[2] = 0;
            while(niz[i] != ' ' && niz[i] != '\0'){
                parameters[2] = (niz[i] - '0') + parameters[2]*10;
                i++;
            }

        }
        if(type == "rectangle") {
            parameters[0] = 0;
            while(niz[i] != ' '){
                parameters[0] = (niz[i] - '0') + parameters[0]*10;
                i++;
            }
            i++;
            parameters[1] = 0;
            while(niz[i] != ' '){
                parameters[1] = (niz[i] - '0') + parameters[1]*10;
                i++;
            }
            i++;
            parameters[2] = 0;
            while(niz[i] != ' '){
                parameters[2] = (niz[i] - '0') + parameters[2]*10;
                i++;
            }
            i++;
            parameters[3] = 0;
            while(niz[i] != ' ' && niz[i] != '\0'){
                parameters[3] = (niz[i] - '0') +  parameters[3]*10;
                i++;
            }


        }

    }

    bool getNextLine(ifstream& in, dynamicArray& newLine){

        newLine.clear();

        char temp;
        in.get(temp);
        if( in.eof() ) return false;

        while( !in.eof() && temp != '\n' ){
            newLine.inputCharacter(temp);
            in.get(temp);
        }

        return true;       
    }
    void formatNewLineFigure(dynamicArray& newLine);
    void addFigure(dynamicArray& niz);


    void clear(){
        for(int i = 0; i < num; i++){
            delete figures[i];
            figures[i] = nullptr;
        }
    }

    
};


/*
open = <filename>

create = <type of figure>, <n parameters>, <color>
            if line, n = 4
            if rectangle, n = 4 
            if circle, n = 3

erase = <index>

translate = <2 parameters> <index>
within = <type of figure>, <n parameters>
            if line, n = 4
            if rectangle, n = 4 
            if circle, n = 3
*/
