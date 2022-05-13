#include "Sklad.h"


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
    /*
        ако нов продукт е с различен срок на годност от вече 
    съществуващ едноименен продукт, той да бъде поставен на 
    различно място
        ако имате достатъчно място, еднакви продукти с един и същи 
    срок на годност да бъдат поставени на съседни места в склада 
    */



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
    /*
    Извежда справка за всички промени в наличността в период, въведен 
    от потребителя, включително зареждания и извеждания на стоки.
    */

   //realno 6e ima nqkakuv fail i 6e go pro4etem ot x data do y data



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
    int lineNum = 0;
    while (true) {

        char temp;
        in.get(temp);
        if( in.eof() ) break;

        dynamicArray newLine;
        if(temp != '\n'){ //ako ima prazen red 
            while( !in.eof() && temp != '\n' ){ //extract one line
                newLine.inputCharacter(temp);
                in.get(temp);
            }
            

            //expirie date < current date
            if(  products[lineNum].getExpirationDate() <= currDate){
                //add into expired file file
                out << newLine << endl;
                //delete from current file
                //moje da iztriq celiq fail. i posle write product to file 

                //delete that product from products
                removeProduct(lineNum);
               
            }
            lineNum++;
            newLine.clear();
        }

        

        if( in.eof() ) break;
    }
    in.close();
    out.close();

    

    // abe da kajem
    ofstream ofs;
    ofs.open("inventory.txt", std::ofstream::out | std::ofstream::trunc);
    for(int i = 0; i< num; i++){
        writeProductToFile(products[i]);
    }
    ofs.close();


} 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Sklad::readProductFromFile(){
    //get store data from file

    //open file
    ifstream in("inventory.txt");
    if (!in) {
        cout << "Couldn't open file!" << endl;
    }

    int i = 0;
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

void Sklad::removeProduct(int index){

    //delete the product at products[index]
    products[index] = products[num-1]; 
    //products[num-1].clear();
    num--;

}
