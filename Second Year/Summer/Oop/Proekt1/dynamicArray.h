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
        //text[1] = '\0';
        index = 0;
    } 

    ~dynamicArray(){
        delete text;
    }

    void inputArray(){
        char ch; 
        cin.get(ch);
        
        text[0] = ch;
        while(ch != '\n'){
            index++;
            if(index > capacity - 1) resize(text, capacity);

            cin.get(ch);

            text[index] = ch;
        }
        text[index] = '\0';


    }
   
    void inputCharacter(char ch){

        if(index > capacity - 1) resize(text, capacity);

        text[index] = ch;
        text[index+1] = '\0';
        index++;
    }

    void inputString(const char* niz){
        int i = 0;
        while(niz[i]){
            this->inputCharacter(niz[i]);
            i++;
        }

    }

    void inputNumber(int num){

        char temp[4] = {'\0', '\0', '\0','\0'};

        int i = 3;

        while(num > 0){
            temp[i] = num % 10 + '0';
            num = num / 10;
            i--;
        }
       
        i = 0;
        while(i < 4 ){
            if(temp[i] != '\0'){
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
        delete text;
        text = new char[capacity];
        text[0] = '\0';
        capacity = 8;
        index = 0;
    }


    const char* getText() const { return text; }
    


    
private:
    char *text;
    int capacity;
    int index;

    void resize(char *&text, int& capacity){
        //1 
        char * newText = new char[capacity*2];
        if(!newText) cout << "error" <<endl;

        //2
        int i = 0;
        while(text[i] != '\0'){
            newText[i] = text[i];
            i++;
        } 
        //3
        capacity *= 2;
        //4
        delete[] text;
        //5
        text = newText;
    }
}; 



inline ostream& operator<<(ostream& os, const dynamicArray& obj)
{
  
    return os << obj.getText();
     
}
