#include <iostream>
#include "product.h"

tovar::tovar()
{
    name = "Null";
    price = 0;

}

tovar::tovar(string name, int price)
{
    this->name = name;
    this->price = price;
}

tovar::tovar(const tovar &t)
{
    this->name = t.name;
    this->price = t.price;
}


milk_production::milk_production() : fruct()
{
    fat_content = 0;
    volume = 0;
}

fruct::fruct() : tovar()
{
    country = "Null";
}

fruct::fruct(string name, int price, string country) : tovar(name, price)
{
    this->country = country;
}

fruct::fruct(const tovar &t, const fruct &f) : tovar (t)
{
    this->name = f.name;
    this->price = f.price;
}

milk_production::milk_production(string name, int price, string country, int fat_content, int volume) : fruct (name, price, country)
{
    this->fat_content = fat_content;
    this->volume = volume;
}
milk_production::milk_production(const tovar &t, const fruct &f, const milk_production &m) : fruct (f)
{
    this->fat_content = m.fat_content;
    this->volume = m.volume;
}

 void tovar::print()
{
    cout << "Name: " << name << "\nPrice: " << this->price << endl;
}

void fruct::print()
{
    cout << "Country: " << country << endl;
}

void milk_production::print()
{
    cout << "Fat_content: " << fat_content << "\nVolume: " << volume << endl;
}

void bakaleya::print()
{
    cout << "This is bakaleya" << endl;
}

string tovar::getname()
{
    return name;
}

int tovar::getprice()
{
    return price;
}

string fruct::getcountry()
{
    return country;
}

int milk_production::getfat_content()
{
    return fat_content;
}

int milk_production::getvolume()
{
    return volume;
}

void tovar::setname(string name)
{
    this->name = name;
}

void tovar::setprice(int price)
{
    this->price = price;
}

void fruct::setcountry(string country)
{
    this->country = country;
}

void milk_production::setfat_content(int fat_content)
{
    this->fat_content = fat_content;
}

void milk_production::setvolume(int volume)
{
    this->volume = volume;
}

const tovar& tovar::operator=(const tovar &tovar)
{
    if (this == &tovar)
        return *this;
    name = tovar.name;
    price = tovar.price;
    return *this;
}

const fruct& fruct::operator=(const fruct &fruct)
{
    if (this == &fruct)
        return *this;
    country = fruct.country;
    return *this;
}

const milk_production& milk_production::operator=(const milk_production &milk_production)
{
    if (this == &milk_production)
        return *this;
    fat_content = milk_production.fat_content;
    volume = milk_production.volume;
    return *this;
}

const bakaleya& bakaleya::operator=(const bakaleya &bakaleya)
{
    if (this == &bakaleya)
        return *this;
    return *this;
}

const std::ostream& operator<< (std::ostream &out, const tovar &tovar)
{
    out << "Name: " << tovar.name << ", " << tovar.price;
    return out;
}

const std::istream& operator>> (std::istream &in, tovar &tovar)
{
    cout << "Name: ";
    in >> tovar.name;
    cout << "Price: ";
    in >> tovar.price;
    return in;
}

const std::ostream& operator<< (std::ostream &out, const fruct &fruct)
{
    out << "Country: " << fruct.country;
    return out;
}

const std::istream& operator>> (std::istream &in, fruct &fruct)
{
    cout << "Country: ";
    in >> fruct.country;
    return in;
}

const std::ostream& operator<< (std::ostream &out, const milk_production &milk_production)
{
    out << "Fat_content: " << milk_production.fat_content << ", " << "\nVolume:" << milk_production.volume;
    return out;
}

const std::istream& operator>> (std::istream &in, milk_production &milk_production)
{
    cout << "Fat content: ";
    in >> milk_production.fat_content;
    cout << "Volume: ";
    in >> milk_production.volume;
    return in;
}
