#include <fstream>
#include <iostream>
using namespace std;
fstream infile;
filename = "tux.rgb";
infile.open(filename, fstream::in|fstream::out|fstream::app);

int a;
infile >> std::hex >> a;
cout << hex << a;