#include <iostream>
#include <cstring>
using namespace std;


template <typename T>
class dynamicArray{
public:
    dynamicArray(){
        capacity = 8;
        text = new T[capacity];
        index = 0;
    }
    ~dynamicArray(){
        delete[] text;
    }

    //input from keyboard only for char
    void input();
    
    void pushBack(T ch){
        if(index >= capacity - 1) resize(text, capacity); 
        text[index++] = ch;
    }

    
    void pushBackArray(const T* niz){
        int i = 0;
        while(i <= niz.getIndex()){
            this->pushBack(niz[i]);
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
        text = new T[capacity];
    }

    const T* getText() const { return text; }
    int getCapacity() const { return capacity; }
    int getIndex() const { return index; }

    dynamicArray<T>(const dynamicArray<T>& other){
        
        capacity = other.getCapacity();
        index = other.getIndex();
        text = new T[capacity];
        int i = 0;
        while(i <= other.getIndex()){
            text[i] = (other.getText())[i];
            i++;
        }
    }

    dynamicArray<T>& operator=(const dynamicArray<T>& other){
        if(this != &other){
            delete[] text;

            capacity = other.getCapacity();
            index = other.getIndex();
            text = new T[capacity];
            int i = 0;
            while(i <= other.getIndex()){
                text[i] = (other.getText())[i];
                i++;
            }
        }
        return *this;

    }
    
    bool operator==(const T* array){
        int i = 0;
        while(i <= this.index || i <= array.getindex()){
            if(text[i] != array[i]) return false;
            i++;
        }
        if(i == this.index || i == array.getindex()) return false;
        return true;
    }
    T& operator[](int i){
        return text[i];
    }


private:
    T *text;
    int capacity;
    int index;

    void resize(T* &str, int& size){
        T* oldStr = str;
        str = new T[size*2];

        for (int i = 0; i < size; i++) {
            str[i] = oldStr[i];
        }
        size *= 2;
        delete[] oldStr;
    }
}; 

template <>
void dynamicArray<char>::input(){
    char ch; 
    cin.get(ch);
        
    text[0] = ch;
    while(ch != '\n'){
        index++;
        if(index >= capacity - 1) resize(text, capacity);

        cin.get(ch);

        text[index] = ch;
    }
}

template <typename T>
inline ostream& operator<<(ostream& os, const dynamicArray<T>& obj)
{ 
    return os << obj.getText();   
}


