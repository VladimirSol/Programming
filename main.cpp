#include <iostream>
#include <locale>
#include <string>
#include "Product.h"

using namespace std;

int main()
{
    setlocale(LC_ALL, "Rus");
    cout << ".....Class Product.......\n" << endl;
    Product p1;
    cout << "Product p1:" << endl;
    p1.print();
    Product p2("NULL", 100, 200);
    cout << "Product p2:" << endl;
    p2.print();
    Product p3(p2);
    cout << "Product p3 with copy p2:" << endl;
    p3.print();
    p3.setprice(1000);
    cout << "Product p3 with setprice(1000):" << endl;
    p3.print();
    p3.setname("Banan");
    cout << "Product p3 with setname(Banan):" << endl;
    p3.print();
    cout << "Product p3 with operator <<:" << endl;
    cout << p3 << "\n" << endl;
    Product p4;
    cout << "Product p4 with >>:" << endl;
    cin >> p4;
    cout << "Product p4 with operator <<:" << endl;
    cout << p4 << "\n" << endl;
    if (p2 == p1)
        cout << "p3 > p2" << endl;
    if (p3 != p2)
        cout << "p3 != p2" << endl;
    if (p2 < p3)
        cout << "p2 < p3\n" << endl;
    Product p5;
    p5 = p2;
    cout << "Product p5 with operator =:" << endl;
    cout << p5 << "\n" << endl;
    cout << ".....End....." << endl;
    return 0;
}
