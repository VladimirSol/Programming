#include <iostream>
#include <string>
#include "Spisok.h"

using namespace std;

int main()
{
    List L;
    const int n = 10;
    int a[n] = {0,1,2,3,4,5,6,7,8,9};
    for(int i = 0; i < n; i++)
    if(i % 2 == 0)
        L.InsertFirst(a[i]);
    else
        L.InsertLast(a[i]);
    cout << "List L:\n";
    L.print();
   cout << endl;
    L.insertAtPos();
    cout << "List L:\n";
    L.print();
    L.PrintPosition(2);
    L.PrintPosition(8);
    return 0;
}
