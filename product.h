#ifndef PRODUCT_H_INCLUDED
#define PRODUCT_H_INCLUDED
#include <string>

using namespace std;

class tovar
{
    public:
        string name;
        int price;
        tovar();
        tovar(string name, int price);
        tovar(const tovar &t);
        void print();
        string getname(); int getprice();
        void setname(string name); void setprice(int price);
        const tovar& operator=(const tovar &tovar);
        const friend std::ostream& operator<< (std::ostream &out, const tovar &tovar);
        const friend std::istream& operator>> (std::istream &in, tovar &tovar);
};

class fruct : public tovar
{
    public:
        string country;
        fruct();
        fruct(string name, int price, string country);
        fruct(const tovar &t, const fruct &f);
        void print();
        string getcountry(); void setcountry(string country);
        const fruct& operator=(const fruct &fruct);
        const friend std::ostream& operator<< (std::ostream &out, const fruct &fruct);
        const friend std::istream& operator>> (std::istream &in, fruct &fruct);
};

class milk_production : public fruct
{
    public:
        int fat_content;
        int volume;
        milk_production();
        milk_production(string name, int price, string country, int fat_content, int volume);
        milk_production(const tovar &t, const fruct &f, const milk_production &m);
        void print();
        int getfat_content(); int getvolume();
        void setfat_content(int fat_content); void setvolume(int volume);
        const milk_production& operator=(const milk_production &milk_production);
        const friend std::istream& operator>> (std::istream &in, milk_production &milk_production);
        const friend std::ostream& operator<< (std::ostream &out, const milk_production &milk_production);
};

class bakaleya : public milk_production
{
    public:
        void print();
        const bakaleya& operator=(const bakaleya &bakaleya);
};

#endif // PRODUCT_H_INCLUDED
