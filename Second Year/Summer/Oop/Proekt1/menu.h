#pragma once
#include "Sklad.h"


class Menu{
public:
    Menu();

    void startMenu();

    void printMenu();

    void display_inventory(Sklad & sklad);
    void add_product(Sklad & sklad);
    void remove_product(Sklad & sklad);
    void quantity_inquiry(Sklad & sklad);
    void clearance(Sklad & sklad);
};