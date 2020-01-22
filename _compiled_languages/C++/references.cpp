#include <iostream>
using namespace std;

class Person {
public:
    string lastName;
    Person(string lastName) {
        this->lastName = lastName;
    }
    void setLastName(string lastName);
};

void Person::setLastName(string lastName){
    this->lastName = lastName;
}

int main() {
  int i = 17;
  int& r = i;
  cout << "result: " << i << endl;

  Person brian("Spinos");
  Person& brianRef = brian;
  brian.setLastName("Smith");
  cout << "Person last name: " << brianRef.lastName << endl;
}
