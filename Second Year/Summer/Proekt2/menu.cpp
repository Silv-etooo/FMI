#include "menu.h"
//todo const
//magic numbers

Menu::Menu(){
    cout << "opaa kak e nastroenieto" << endl;
    startMenu();
}


void Menu::startMenu(){
        
    /*
    get input
    split input = firstword + rest of input
        int command = turn to int (firstword)
        dynamicArray paramenters = rest of input
    switch (command){}
    */

    int command = 0;
    dynamicArray<char> input, parameters;
    input.input();
    command = processInput(input, parameters);

    
    while(command != 11){

        switch(command){

            case 1: open(parameters); //само 1 път брат ц
            break; 

            case 2: close();
            break;

            case 3: save();
            break;

            case 4: saveas(parameters);
            break;
            
            case 5: help();
            break;
            
            case 6: print();
            break;

            case 7: create(parameters);
            break;

            case 8: erase(parameters);
            break;

            case 9: translate(parameters);
            break;

            case 10: within(parameters);
            break;

            default: 
                cout << "just no" << endl;
            break;

        }
        input.clear();
        input.input();
        command = processInput(input, parameters);
            
    
    }

    cout << endl;
    cout << "Exit" << endl;
    cout << "Have a nice day :)" << endl;

}


void Menu::open(dynamicArray<char>& parameters){
    figures.open(parameters); 
    cout << endl;
}

void Menu::close(){
    figures.close(); 
    cout << endl;
}

void Menu::save(){
    figures.save(); 
    cout << endl;
}

void Menu::saveas(dynamicArray<char>& parameters){
    figures.saveas( parameters); 
    cout << endl;
}
           
void Menu::help(){
    cout << "open       - open <filename.svg>" << endl;
    cout << "close " << endl;
    cout << "save " << endl;
    cout << "saveas     - saveas <filename.svg>" << endl;
    cout << "help       - this" << endl;
    cout << "print" << endl;
    cout << "create     - create <type of figure> <parameters>" << endl;
    cout << "erase      - erase <index>  " << endl;
    cout << "translate  - translate <coordinates>" << endl;
    cout << "within     - within <type of figure> <parameters>" << endl;
    cout << "exit " << endl;
}

void Menu::print(){
    figures.print(); 
    cout << endl;
}

void Menu::create(dynamicArray<char>& parameters){
    figures.create(parameters);
    cout << endl;
}

void Menu::erase(dynamicArray<char>& parameters){
    figures.erase(parameters);
    cout << endl;
}

void Menu::translate(dynamicArray<char>& parameters){
    figures.translate(parameters);
    cout << endl;
}

void Menu::within(dynamicArray<char>& parameters){
    figures.within(parameters);
    cout << endl;
}


//private
int Menu::processInput(dynamicArray<char>& input, dynamicArray<char>& parameters){
    //int command = turn to int (first word ot inputstring)
    //dynamicArray paramenters = sledpurva duma (inputString)


    dynamicArray<char> firstWord;
    int i = 0;
    while(input[i] != ' ' && i <= input.getIndex()){
        firstWord.pushBack(input[i]);
        i++;
    }

   
    if(firstWord == "close") return 2;
    if(firstWord == "save") return 3;
    
    if(firstWord == "help") return 5;
    if(firstWord == "print") return 6;

    
    parameters.clear();
    i++; //za space-a
    while(i <= input.getIndex()){
        parameters.pushBack(input[i]);
        i++;
    }
    parameters[i] == '\0';

    if(firstWord == "open") return 1;
    if(firstWord == "saveas") return 4;
    if(firstWord == "create") return 7;
    if(firstWord == "erase") return 8;
    if(firstWord == "translate") return 9;
    if(firstWord == "within") return 10;
    if(firstWord == "exit") return 11;

    return 12;

}