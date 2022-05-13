#include "Sklad.h"
//todo when making the same file, delete old file


Sklad::Sklad(){

    num = 0;
    products = new Product[1000];
    readProductFromFile();
}


void Sklad::print(){
    //Извеждане
    for (int i = 0; i < num; i++){
        cout << products[i] << endl;
    }
}

void Sklad::add(){
    //Добавяне на продукt
    //cout << "in add" << endl;
    //input danni - ot usera
    products[num].addProduct();

    //input product into file
    writeProductToFile(products[num]);

    num++;
}

void Sklad::remove(){
    //Изваждане на продукт

} 
void Sklad::inquiry(){
    //Справка за наличност

} 
void Sklad::clearSklad(){
    //Разчистване 
    /*
    Въвежда информация за текущата дата и разчиства склада от всички стоки, на които е изтекъл или предстои скоро да изтече срока на 
    годност, като извежда информация за разчистените стоки в текстов файл с име cleanup-YYYY-MM-DD.txt, където YYYY-MM-DD е 
    въведената дата
    */

    cout << "Input today's date:";
    Date currDate;
    currDate.inputDate();

    //make the name of the file
    //fileExpired = fileExpired + currDate.getYear() + '-' + currDate.getMonth() + '-' + currDate.getDay; // nqma koi da ti predifinira и + и = брат, няма време 5.12 е
    dynamicArray fileExpired;
    const char* niz = "cleanup-";
    fileExpired.inputString(niz);
    fileExpired.inputNumber(currDate.getYear());
    fileExpired.inputCharacter('-');
    fileExpired.inputNumber(currDate.getMonth());
    fileExpired.inputCharacter('-');
    fileExpired.inputNumber(currDate.getDay());
    niz = ".txt";
    fileExpired.inputString(niz);
    cout << fileExpired << endl;

    //file for clearance
    ofstream out(fileExpired.getText(), std::ios::app);
    if (!out) {
        std::cout << "Couldn't open file!" << std::endl;
    }


    //file inventory
    ifstream in("inventory.txt");
    if (!in) {
        cout << "Couldn't open file!" << endl;
    }

    int i = 0;
    int lineNum= 0;
    while (true) {
        
        char temp;
        in.get(temp);
        if( in.eof() ) break;

        dynamicArray newLine;
        if(temp != '\n'){ //ako ima prazen red 
            while( !in.eof() && temp != '\n' ){
                newLine.inputCharacter(temp);
                in.get(temp);
            }
            
            //add into new file
            if(  products[lineNum++].getExpirationDate() < currDate){
                out << newLine << endl;
                //delete from current file
            }


            newLine.clear();
        }
        if( in.eof() ) break;
    }

    in.close();
    out.close();


} 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Sklad::readProductFromFile(){
    //get store data from file

    //open file
    ifstream in("inventory.txt");
    if (!in) {
        cout << "Couldn't open file!" << endl;
    }

    int i =0;
    while (true) {
        
       
        char temp;
        in.get(temp);
        if( in.eof() ) break;

        dynamicArray newLine;
        if(temp != '\n'){ //ako ima prazen red 
            while( !in.eof() && temp != '\n' ){
                newLine.inputCharacter(temp);
                in.get(temp);
            }
            
            products[num++].addProduct(newLine);
            newLine.clear();
       
        }
      

        if( in.eof() ) break;
    }

    in.close();

}


void Sklad::writeProductToFile(const Product & product){


    std::ofstream out("inventory.txt", std::ios::app);
    if (!out) {
        std::cout << "Couldn't open file!" << std::endl;
    }

    out << product << endl;


    out.close();
}