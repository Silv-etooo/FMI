#pragma once
#include "Data.h"
#include "dynamicArray.h"

//todo validity

class Location(){

    Location(){
        
    }


private:
    int x;
    int y;
    int z;
}



class Product{
public:
    Product(){}
    ~Product(){}

    //input from user
    void addProduct();
    //input from file - delimiter;
    void addProduct(const dynamicArray& newLine); //ei tva 6ibano ne6o otne 10 4asa da se otkrie

    void clear();

    //getters
    const char* getName() const{
        return name.getText();
    }
    dynamicArray getDynamicName() const{
        return name;
    }
    Date getExpirationDate() const{
        return expiration_Date;
    }
    int getQuantity() const{
        return quantity;
    }

    //operators
    Product& operator=(const Product& other);
    

private:
    dynamicArray name; // описание на продукта, символен низ с произволна дължина от тип char* или ваш дефиниран клас
    Date expiration_Date; //срок на годност
    Date admission_Date; //дата на постъпване в склада
    dynamicArray name_Producer; //име на производител
    int quantity; // налично количество
    Location location; // местоположение (вкл. секция, рафт, пореден номер)
        /* номерирайте склада си, както прецените, че ще ви е удобно, имайте 
        предвид, че в началото той е празен и различно количество стока е 
        нормално да заема различно по обем място*/
    dynamicArray comment; // коментар (свободен текст)
};

inline ostream& operator<<(ostream& os, const Product& obj)
{
    os << obj.getName() << "; " << obj.getExpirationDate() << "; "<< obj.getQuantity() << ";";
    return os;
}
