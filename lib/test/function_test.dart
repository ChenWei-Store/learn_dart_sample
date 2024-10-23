/*
 * @Author: cc
 * @Date: 2024-08-02 22:16:15
 * @LastEditors: cc
 * @LastEditTime: 2024-08-03 00:15:59
 * @Description: dart 函数练习题
 */

/// 编写一个函数greet(name)，接受一个字符串参数name，返回一个问候消息，例如"Hello, name!"。
String greet2(String name) {
  String str = "Hello, $name";
  return str;
}

///创建一个函数addNumbers(a, b)，接受两个数字参数，返回它们的和。
int addNumbers(int a, int b) {
  return a + b;
}

///编写一个函数calculateRectangleArea(length, width = 10)，计算矩形面积，其中宽度有一个默认值。
double calculateRectangleArea(double length, [double width = 10]) {
  return length * width;
}

///实现一个函数describePerson(name, [age])，如果提供了年龄，则返回带有年龄描述的消息，否则只返回名字。
String describePerson(String name, [int? age]) {
  if (age != null) {
    return "$name is $age years old.";
  } else {
    return "$name is a mystery person.";
  }
}

///创建一个函数applyOperation(number, operation)，其中operation是一个函数，接收一个数字并返回另一个数字。使用applyOperation来调用不同的数学操作。
double applyOperation(double number, double Function(double num) operation) {
  return operation(number);
}

///编写一个函数filterEvens(numbers)，使用匿名函数过滤出列表中的所有偶数。
List<int> filterEvens(List<int> numbers) {
  return numbers.where((x) => x % 2 == 0).toList();
}

///设计一个函数createMultiplier(multiplier)，它返回一个新的函数，该函数接受一个数字并将其乘以multiplier
Function createMultiplier(int multiplier) {
  return (int num) => num * multiplier;
}

Function makeCounter2() {
  var count = 0;
  return () => print("count: ${count++}");
}

Function makeCounter() {
  var count = 0;
  return () {
    count++;
    return count;
  };
}


void main() {
  print(greet2("Alice"));
  print(addNumbers(3, 5));
  print(calculateRectangleArea(5.0));
  print(describePerson("Bob", 25));
  applyOperation(6.0, (double num) => num * 2);
  var func = makeCounter2();
  func();
  func();
  func();
}
