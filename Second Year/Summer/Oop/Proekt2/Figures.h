#pragma once
#include <fstream>
#include "Figure.h"

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
    }

    
    void open(dynamicArray& filename);

    void close(){
        //clear();
    }
    void save(){}
    void saveas(){}

    void print(){

        for(int i = 0; i< num; i++){
            //cout << figures[i] << endl;
        }


    }

    void create(dynamicArray& niz){
        addFigure(niz);
    }

    void erase(dynamicArray& niz){
        eraseProcessInput(niz);
    }

    void translate(dynamicArray& niz){
        translateProcessInput(niz);
    }

    void within(dynamicArray& niz){
        withinProcessInput(niz);
    }

    
    //[]
    //cout

private:
    Figure *figures[100];
    int num;
    dynamicArray filename;

    //ako e eden processInput - faida ot menu
    void createProcessInput(dynamicArray& niz){}
    void eraseProcessInput(dynamicArray& niz){}
    void translateProcessInput(dynamicArray& niz){}
    void withinProcessInput(dynamicArray& niz){}

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


    void clear(){}

    
};


/*
open = <filename>

create = <type of figure>, <n parameters>, <color>
            if line, n = 4
            if rectangle, n = 4 
            if circle, n = 3

erase = <index>

translate = <2 parameters>

within = <type of figure>, <n parameters>
            if line, n = 4
            if rectangle, n = 4 
            if circle, n = 3
*/