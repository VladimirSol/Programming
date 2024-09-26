#include <iostream>
#include "product.h"
#include <locale>
#include <string>

using namespace std;

int main()
{
    setlocale(LC_ALL, "Russia");
    cout << "Program begin...\n\n";
    tovar t("Apple", 20);
    fruct f ("Orange", 25, "Russia");
    milk_production m ("Mandarin", 20, "Russia", 0, 20);
    cout << "Tovar:\n";
    t.print();
    cout << "\n";
    cout << "Fruct:\n";
    f.tovar::print();
    f.print();
    cout << "\n";
    cout << "Milk production:\n";
    m.tovar::print();
    m.fruct::print();
    m.print();
    cout << "Class changes\n\n";
    cout << "Name in <fruct> from <Orange> to <Mandarin>\n\n";
    f.tovar::setname("Mandarin");
    cout << "Country in <milk_production> from <Russia> to <Ukraine>\n\n";
    m.fruct::setcountry("Ukraine");
    cout << "Name in <milk_production> from <Mandarin> to <Pear>\n\n";
    m.tovar::setname("Pear");
    cout << "Result:\n\n";
    cout << "Tovar:\n";
    t.print();
    cout << "\n";
    cout << "Fruct:\n";
    f.tovar::print();
    f.print();
    cout << "\n";
    cout << "Milk production:\n";
    m.tovar::print();
    m.fruct::print();
    m.print();
    cout << "\nEnd of program\n";
    return 0;
}
