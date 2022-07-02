#pragma once
#include "Figures.h"


class Menu{
public:
    Menu();
    void startMenu();


    void open(dynamicArray<char>& parameters);
    void close();
    void save();
    void saveas(dynamicArray<char>& parameters);
    void help();

    void print(); //Извежда на екрана всички фигури.
    void create(dynamicArray<char>& parameters); //Създава нова фигура.
    void erase(dynamicArray<char>& parameters); //<n> //Изтрива фигура с пореден номер <n>.
    void translate(dynamicArray<char>& parameters); //[<n>] //Транслира фигурата с пореден номер <n> или всички фигури, ако <n> не е указано.
    void within(dynamicArray<char>& parameters); //<option> 

private:
    Figures figures;
    int processInput(dynamicArray<char>& input, dynamicArray<char>& parameters);


};
