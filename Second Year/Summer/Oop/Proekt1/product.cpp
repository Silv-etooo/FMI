#include "product.h"



void Product::clear(){
    name.clear();
    //expiration_Date.clear();
    //quantity = 0;
}



void Product::addProduct(){
        
    //input into class product
    cout << "Add new product: " << endl;;
    //Добавя нов продукт в склада в диалогов режим, като въвежда всички данни за продукта и ги проверява за коректност. 

    //1. name
    cout << "   Add name: ";
    name.inputArray();

    //2. expiration_Date
    cout << "   Add expiration date: ";
    expiration_Date.inputDate();

    //4. quantity
    cout << "   Add quantity: ";
    cin >> quantity;

    


}

void Product::addProduct(const dynamicArray& newLine){
    //trq go narejem
        
    int i = 0;

    //1. name
    while( (newLine.getText())[i] != ';' ){
        name.inputCharacter(newLine.getText()[i]);
        i++;
    }
    
    i++; //za ';'
    i++; //za ' '

    //2. expiration date - moje da otide v date
    
        //day
        int tempDay = 0;
        while( (newLine.getText())[i] != '/' ){
            tempDay = tempDay *10 + ((newLine.getText())[i] - '0');
            i++;
        }
        i++; //za /
        //month
        int tempMonth = 0;
        while( (newLine.getText())[i] != '/' ){
            tempMonth = tempMonth *10 + ((newLine.getText())[i] - '0');
            i++;
        }
        i++; //za /
        //year
        int tempYear = 0;
        while( (newLine.getText())[i] != ';' ){
            tempYear = tempYear *10 + ((newLine.getText())[i] - '0');
            i++;
        }
        expiration_Date.inputDate(tempDay, tempMonth, tempYear);
    
    i++; //za ';'
    i++; //za ' '

    //4. quantity
    while((newLine.getText())[i] != ';' ){
        quantity = quantity * 10 + ((newLine.getText())[i] - '0');
        i++;
    }
       
    
        
        

    //while( (newLine.getText())[i] != '\0' ){ //minava prez niza
}


Product& Product::operator=(const Product& other){
    if(this != &other){
        //1. name
        name = other.getDynamicName();
        //2. expiration data
        expiration_Date = other.getExpirationDate();
        //4. quantity
        quantity = other.getQuantity();
    }
    return *this;
}
