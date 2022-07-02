#include "Figures.h"
//todo magic characters

void Figures::open(dynamicArray& filename){
    //1. opens and reads from file
    //2. get every line //at the exact moment that i wrote it, i realisied that every command starts with < and ends with /> (and not that every command is on a new line but uhhh. no i am not gonna change it :)) 
    //3. import shape

    this->filename = filename;
    
    //1
    ifstream in(filename.getText());
    if (!in) {
        cout << "Couldn't open file!" << endl;
    }

    //2
    int i = 0;
    dynamicArray newLine;
    bool inside = 0;
    while (true) { 

        if (getNextLine(in, newLine) == 0) break;
        //do stuff 
        //cout << newLine << endl; //raboti
             
        if(newLine == "</svg>"){inside = 0;}   
        if(inside == 1){

            //3. 
            formatNewLineFigure(newLine);
            //cout << newLine<< endl; //raboti
            addFigure(newLine);


        }
        if(newLine == "<svg>"){inside = 1;}
                     
            
    }
    in.close();

        
}

//private
void Figures::formatNewLineFigure(dynamicArray& newLine){
    // formating = приемаме че са подредени и стойностите са в кавички 
                
    dynamicArray formattedLine;

    int i=0;
    while(newLine[i] != '<') {i++;}
    i++; //for <

    while(newLine[i] != ' ') {
        formattedLine.inputCharacter(newLine[i]);
        i++;
    }

    formattedLine.inputCharacter(newLine[i]); //for ' '
    i++;


    //x1="0" y1="0" x2="3000" y2="3000" stroke="green"
    while(newLine[i] != '\0') {

        if(newLine[i] == '"'){
            i++;
            while(newLine[i] != '"'){
                formattedLine.inputCharacter(newLine[i]);
                i++;

            }
            char ch = ' ';
            formattedLine.inputCharacter(ch);
        }
        i++;
    }

    newLine = formattedLine;

}


void Figures::addFigure(dynamicArray& niz){
    //first is fill, then stroke
    //<line >0 0 3000 3000 green
    //<rect >5 5 1000.5 10 red green
    //<circle >5 5 100 blue

    
    dynamicArray type;
    int i = 0;
    while(niz[i] != ' '){
        type.inputCharacter(niz[i]);
        i++;
    }
    i++; //for ' '
    //cout << type << endl;

    if(type == "line"){
        figures[num++] = new Line(niz, i);
       // figures[num++] = Lineclone();
    }
    else if(type == "rect" || type == "rectangle"){
        figures[num++] = new Rect(niz, i);
    }
    else if(type == "circle"){
        figures[num++] = new Circle(niz, i);
    }



}
