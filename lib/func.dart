/*
 * @Author: cc
 * @Date: 2024-07-25 22:22:38
 * @LastEditors: cc
 * @LastEditTime: 2024-08-03 00:44:15
 * @Description: dart 函数demo
 */

// 不返回任何值的函数
import 'dart:async';

void greet(String name) {
  print('Hello, $name!');
}

// 返回整数的函数
int add(int x, int y) {
  return x + y;
}

// 函数可选位置参数用[],可指定默认值,必须放在位置参数后
void displayInfo(String name, [int? age]) {
  print('Name: $name, Age: ${age ?? "unknown"}');
}

// 函数命名参数可以指定名称赋值，用{},可以有默认值
// 非命名参数都是位置参数，必须放在命名参数前面
void describePerson(String name, {int? age, int sex = 0}) {
  print('Name: $name, age: ${age ?? 'unknown'} sex：$sex');
}

//可选位置参数和命名参数不能同时存在
// void introduce(String name,  [String? hobby, {int age = 0, int sex = 0}]) {
//   print('Name: $name, age: $age sex：$sex');
// }

/// 下面是高阶函数demo

//在函数参数表中可以直接使用Function声明函数，通过调用他时的实现推断高阶函数返回值和参数
//不推荐
void operator3(int a, int b, Function func) {
  func(a, b);
}

// 有返回值的高阶函数
void operator(int a, int b, int Function(int a, int b) oper) {
  int result = oper(a, b);
  print("result: $result");
}

//无返回值的高阶函数
void operator2(int a, int b, void Function(int a, int b) oper) {
  oper(a, b);
}

// 使用类型别名
typedef PlusNumber = int Function(int a, int b);
void oper3(int a, int b, PlusNumber) {
  var num = PlusNumber(a, b);
  print("num:$num");
}

// 定义高阶函数对应的函数
int addNum(int a, int b) {
  return a + b;
}

//调用高阶函数
void performHighFunc() {
  // 调用定义好的高阶函数
  operator(1, 2, addNum);
  // 使用lambda表达式/匿名函数实现高阶函数
  operator2(1, 2, (a, b) {
    int c = a - b;
    print("c: $c");
  });
  oper3(1, 2, addNum);
}

// 高阶函数，匿名函数，闭包的区别
// 函数参数表中声明函数作为参数则这个参数叫高阶函数
// 调用函数时实现参数表中的高阶函数可以使用匿名函数的方式实现，也可以使用别名或者直接定义函数
// 如果匿名函数中引用了外部变量，则这个匿名函数叫闭包
//只要有方法访问外部变量，则这个方法就是闭包，方法内定义一个变量，在声明一个方法访问外部变量则是闭包
//缺点:
//闭包：性能消耗大，可能内存泄漏
//高阶函数不好调试，可读性差
//匿名函数：可读性差,频繁调用匿名函数，性能消耗大

///定义一个函数operator(), 创建一个值number,再创建一个闭包访问number,调用闭包打印闭包返回的值
void operator4() {
  int number = 10;
  int operator() {
    return number;
  }

  print(operator());
  print(operator());
}

void main() {
  greet('Alice'); // 输出: Hello, Alice!
  int result = add(10, 20);
  print(result); // 输出: 30
  displayInfo('cc', 5);
  displayInfo('ee');
  describePerson(
    'jack',
    age: 5,
    sex: 1,
  );
  performHighFunc();

  List<int> numbers = List.generate(10000, (index) => index);

  // 不好的做法，会导致每个闭包都引用相同的`i`，并且`i`无法被垃圾回收
  int i = 0;
  numbers.forEach((_) {
    Timer.periodic(Duration(seconds: 1), (_) => print(i++));
  });
}
