#include <fstream>
#include <string>
#include <iostream>

using namespace std;

int main(int argc, char** argv){ 
	ofstream MyFileOut;
	string str_content = string(argv[1]);
	string corrected_str;
	if (str_content[0] != '\"' || str_content[0] != '\'')
		corrected_str = "\"" + str_content + "\"";
	else if ((str_content[0] == '\"' && str_content[1] == '\"') ||
			(str_content[0] == '\'' && str_content[1] == '\''))
	{
		for (int i = 1; i < str_content.length() - 1; i++)
		corrected_str += str_content[i];
	}
	else
	{
		corrected_str = str_content;
	}

	for (int i = 0; i < str_content.length(); i++)
	{
		if (corrected_str[i] == '\\')
			corrected_str[i] = '/';
	}
	MyFileOut.open("../source/conf.py", ofstream::app);
	if (MyFileOut.fail())
		cout << "failed open output file";
	cout << "Append " << "sys.path.insert(0," + corrected_str + ")";
	MyFileOut << "\n";
	MyFileOut << "sys.path.insert(0," + corrected_str + ")";
	MyFileOut.close();

	return 0;
}