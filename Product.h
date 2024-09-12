#ifndef PRODUCT_H_INCLUDED
#define PRODUCT_H_INCLUDED

using namespace std;

class Product
{
    private:
        string Name;
        float price;
        int weight;
    public:
        Product();
        Product(string Name, float price, int weight);
        ~Product();
        Product(const Product &p);
        string getname(); float getprice(); int getweight();
        void setname(string Name); void setprice(int price); void setweight(int weight);
        void print();
        Product& operator=(const Product &product);
        friend bool operator> (const Product &p1, const Product &p2);
        friend bool operator>= (const Product &p1, const Product &p2);
        friend bool operator< (const Product &p1, const Product &p2);
        friend bool operator<= (const Product &p1, const Product &p2);
        friend bool operator == (const Product &p1, const Product &p2);
        friend bool operator != (const Product &p1, const Product &p2);
        friend std::ostream& operator<< (std::ostream &out, const Product &product);
        friend std::istream& operator>> (std::istream &in, Product &product);
};

#endif // PRODUCT_H_INCLUDED
