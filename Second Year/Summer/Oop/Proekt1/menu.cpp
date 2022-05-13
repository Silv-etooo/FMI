#include "menu.h"
//todo const

Menu::Menu(){
    cout << "Liga dnes?" << endl;
    startMenu();
}


void Menu::startMenu(){
        
    Sklad sklad;

    printMenu();
    int choice = 0;
    cin >> choice;
    cin.clear();
    fflush(stdin); 


    
    while(choice != 6){

        switch(choice){

            case 1: display_inventory(sklad);
            break;

            case 2: add_product(sklad);
            break;

            case 3: remove_product(sklad);
            break;

            case 4: quantity_inquiry(sklad);
            break;

            case 5: clearance(sklad);
            break;

            default: 
                cout << "pls don't" << endl;
            break;

        }
            
        cin.clear();
        fflush(stdin); 
        printMenu();
        cin >> choice;

        cin.clear();
        fflush(stdin); 
    }

    cout << endl;
    cout << "EXIT" << endl;
    cout << "Have a nice day :)" << endl;

}


void Menu::printMenu(){
    cout << "Menu's options: " << endl;
    cout << "Press coresponding number " << endl;
    cout << "   1: Display inventory " << endl;
    cout << "   2: Add product " << endl;
    cout << "   3: Remove product " << endl;
    cout << "   4: Quantity inquiry " << endl;
    cout << "   5: Clearance " << endl;
    cout << "   6: EXIT " << endl;
}


void Menu::display_inventory(Sklad & sklad){
    cout << "1. Display inventory " << endl;
    sklad.print(); //Извеждане
    cout << endl;
}

void Menu::add_product(Sklad & sklad){
    cout << "2. Add product " << endl;
    sklad.add();//Добавяне на продукт
    cout << endl;
}

void Menu::remove_product(Sklad & sklad){
    cout << "3. Remove product " << endl;
    sklad.remove();//Изваждане на продукт
    cout << endl;
}

void Menu::quantity_inquiry(Sklad & sklad){
    cout << "4. Quantity inquiry " << endl;
    sklad.inquiry();//Справка за наличност
    cout << endl;
}

void Menu::clearance(Sklad & sklad){
    cout << "5. Clearance " << endl;
    sklad.clearSklad();//Разчистване 
    cout << endl;
}
