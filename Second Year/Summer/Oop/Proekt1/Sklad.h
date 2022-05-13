#include "product.h"
#include <fstream>

class Sklad{
public:
    Sklad();

    void print(); // Извеждане
    void add(); // Добавяне на продукт
    void remove(); // Изваждане на продукт
    void inquiry(); // Справка за наличност
    void clearSklad(); // Разчистване 
    

private:

    Product* products;
    int num;

    int taken_Locations[9][9][9]; //10 на брой с пореден номер на рафт  //10 на брой с рафта //10 секции
    //за локацията е дали е заето 
    

    //spravka file
    //nali4nost file
    void readProductFromFile();
    void writeProductToFile(const Product & product);
};