#include <fstream>
#include <string>
#include <sstream>
#include <iostream>

using namespace std;

int main(int argc, char** argv){ 
	ifstream MyFileIn;
	MyFileIn.open(argv[1]);
	stringstream content;
	content << MyFileIn.rdbuf();
	string str_content = content.str();
	MyFileIn.close();
	ofstream MyFileOut;
	MyFileOut.open(argv[1]);
	MyFileOut << str_content;
	MyFileOut.close();
	return 0;
}