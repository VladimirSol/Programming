#include <iostream>
#include <locale>
#include <string>
#include "Product.h"

using namespace std;

Product::Product()
{
    Name = "NULL";
    price = 0;
    weight = 0;
}

Product::Product(string Name, float price, int weight)
{
    this->Name = Name;
    this->price = price;
    this->weight = weight;
}

Product::Product(const Product &p)
{
    this->Name = p.Name;
    this->price = p.price;
    this->weight = p.weight;
}

Product::~Product()
{

}

void Product::setname(string Name)
{
    cout << "\nSetName... " << " from " << this->Name << " into " << Name << "\n\n";
    this->Name = Name;
}

void Product::setprice(int price)
{
    cout << "\nSetPrice... " << " from " << this->price << " into " << price << "\n\n";
    this->price = price;
}

void Product::setweight(int weight)
{
    cout << "\nSetPrice... " << " from " << this->weight << " into " << weight << "\n\n";
    this->weight = weight;
}

string Product::getname()
{
    cout << "\n...GetName...\n";
    return Name;
}

float Product::getprice()
{
    cout << "\n...GetPrice...\n";
    return price;
}

int Product::getweight()
{
    cout << "\n...GetWeight...\n";
    return weight;
}

void Product::print()
{
    cout << "Name = " << Name << "\nPrice = " << price << "\nWeight = " << weight << "\n\n";
}

 bool operator> (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 > len2)
        return p1.Name > p2.Name && p1.price > p2.price && p1.weight > p2.weight;
}
bool operator>= (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 >= len2 || p1.Name == p2.Name)
        return p1.Name >= p2.Name && p1.price >= p2.price && p1.weight >= p2.weight;
}
bool operator< (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 < len2)
        return p1.Name < p2.Name && p1.price < p2.price && p1.weight < p2.weight;
}
bool operator<= (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 <= len2 || p1.Name == p2.Name)
        return p1.Name <= p2.Name && p1.price <= p2.price && p1.weight <= p2.weight;
}
bool operator == (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 == len2 && p1.Name == p2.Name)
        return p1.Name == p2.Name && p1.price == p2.price && p1.weight == p2.weight;
}
bool operator != (const Product &p1, const Product &p2)
{
    int len1, len2;
    len1 = p2.Name.length();
    len2 = p1.Name.length();
    if (len1 != len2 && p1.Name != p2.Name)
        return !(p1 == p2);
}

std::ostream& operator<< (std::ostream &out, const Product &product)
{
    out << "Product: " << product.Name << ", " << product.price << ", " << product.weight;
    return out;
}

std::istream& operator>> (std::istream &in, Product &product)
{
    cout << "Name: ";
    in >> product.Name;
    cout << "Price: ";
    in >> product.price;
    cout << "Weight: ";
    in >> product.weight;
    cout << "\n";
    return in;
}

Product& Product::operator= (const Product &product)
{
    if (this == &product)
        return *this;
    Name = product.Name;
    price = product.price;
    weight = product.weight;
    return *this;
}
