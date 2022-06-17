#pragma once
#include "Figures.h"


class Menu{
public:
    Menu();
    void startMenu();


    void open(dynamicArray& parameters);
    void close();
    void save();
    void saveas();
    void help();

    void print(); //Извежда на екрана всички фигури.
    void create(dynamicArray& parameters); //Създава нова фигура.
    void erase(dynamicArray& parameters); //<n> //Изтрива фигура с пореден номер <n>.
    void translate(dynamicArray& parameters); //[<n>] //Транслира фигурата с пореден номер <n> или всички фигури, ако <n> не е указано.
    void within(dynamicArray& parameters); //<option> 

private:
    Figures figures;
    int processInput(dynamicArray& input, dynamicArray& parameters);


};
