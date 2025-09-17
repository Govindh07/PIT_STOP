// class Student
// {
//   String name;
//   int age;
//
//   Student(this.name, this.age);
//
//   void display()
//   {
//     print("Name: $name, Age: $age");
//   }
// }
//
// void main()
// {
//   Student s1 = Student("Ravi", 20);
//   s1.display();
// }


class Employee {
  String name;
  int age;

  Employee(this.name , this.age);

  void display() {
    print("Name: $name,"
        "Age: $age");
  }
}


void main() {
  Employee e1 = Employee("Govindh", 22);
  e1.display();
}