//ne iska6 da go gleda6
#include <iostream>
#include <cstring>
using namespace std;

class dynamicArray{
public:
    dynamicArray(){
        capacity = 8;
        text = new char[capacity];
        text[0] = '\0';
        index = 0;
    } 

    ~dynamicArray(){
        delete[] text;
    }

    void inputArray(){
        char ch; 
        cin.get(ch);
        
        text[0] = ch;
        while(ch != '\n'){
            index++;
            if(index >= capacity - 1) resize(text, capacity);

            cin.get(ch);

            text[index] = ch;
        }
        text[index] = '\0';

    }
   
    void inputCharacter(char ch){
        if(index >= capacity - 1) resize(text, capacity);

        text[index++] = ch;
        text[index] = '\0';
    }

    void inputString(const char* niz){
        int i = 0;
        while(niz[i]){
            this->inputCharacter(niz[i]);
            i++;
        }

    }

    void inputNumber(int num){

        char temp[4] = {'`', '`', '`','`'};

        int i = 3;

        while(num > 0){
            temp[i] = num % 10 + '0';
            num = num / 10;
            i--;
        }
       
        i = 0;
        while(i < 4 ){
            if(temp[i] != '`'){
                this->inputCharacter(temp[i]);
            }
        i++;
        }

    }


    void print(){
        for(int i = 0; i < index; i++){
            cout << text[i];
        }

    }

    void clear(){
        delete[] text;
        capacity = 8;
        index = 0;
        text = new char[capacity];
        text[0] = '\0';
        
    }


    const char* getText() const { return text; }
    int getCapacity() const { return capacity; }
    int getIndex() const { return index; }



    dynamicArray& operator=(const dynamicArray& other){
        if(this != &other){
            delete[] text;

            capacity = other.getCapacity();
            index = other.getIndex();
            text = new char[capacity];
            int i = 0;
            while((other.getText())[i]){
                text[i] = (other.getText())[i];
                i++;
            }
            text[i] = '\0';
        }
        return *this;
    }
    
private:
    char *text;
    int capacity;
    int index;

    // void resize(char *&text, int& capacity){
    //     //1 
    //     char * newText = new char[capacity*2];
    //     if(!newText) cout << "error" <<endl;

    //     //2
    //     int i = 0;
    //     while(text[i] != '\0'){
    //         newText[i] = text[i];
    //         i++;
    //     } 
    //     //3
    //     capacity *= 2;
    //     //4
    //     delete[] text;
    //     //5
    //     text = newText;
    // }
    void resize(char* &str, int& size) {
        char* oldStr = str;
        str = new char[size*2];

        for (int i = 0; i < size; i++) {
            str[i] = oldStr[i];
        }
        size *= 2;
        delete[] oldStr;
    }
}; 



inline ostream& operator<<(ostream& os, const dynamicArray& obj)
{
  
    return os << obj.getText();
     
}
