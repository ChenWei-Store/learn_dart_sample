/*
 * @Author: cc
 * @Date: 2024-08-07 23:08:28
 * @LastEditors: cc
 * @LastEditTime: 2024-08-07 23:33:03
 * @Description: dart核心库
 */

import 'package:intl/intl.dart';

/// num类型可以作为整数或浮点数使用
/// 以num声明的变量可以先赋值为整数，在赋值浮点数
/// num声明的集合，可以同时有整数和浮点数
void numTest() {
  // num
  num a = 10;
  num b = 20.5;
  print(a + b);
  print(a.runtimeType);
  print(b.runtimeType);
  a = 30.6;
  print(a);

  // num集合
  List<num> list = [1, 2, 3, 4.5, 5.6];
  print(list);
}

/// StringBuffer
/// StringBuffer是可变的，可以多次修改
/// StringBuffer可以用于拼接字符串
/// 非线程安全
void appendString() {
  StringBuffer sb = StringBuffer();
  sb.write('hello');
  sb.write('world');
  print(sb.toString());
}

void dateDemo() {
  // DateTime
  DateTime now = DateTime.now();
  print(now);
  print(now.year);
  print(now.month);
  print(now.day);
  print(now.hour);
  print(now.minute);
  print(now.second);
  print(now.millisecond);
  var specificDate = DateTime(2023, 12, 31, 23, 59, 59); // 2023年12月31日23点59分59秒
  print(specificDate);
  // 解析日期时间字符串（需要自己实现解析）
  var dateString = '2023-12-31T23:59:59Z';
  var parsedDate = DateTime.parse(dateString); // 解析为UTC时间
  print(parsedDate);
  // 获取日期时间的各个部分
  int year = now.year;
  int month = now.month;
  int day = now.day;
  int hour = now.hour;
  int minute = now.minute;
  int second = now.second;

// 设置日期时间的各个部分
  var newDate = DateTime(now.year, now.month, now.day + 1);

// 比较日期时间
  bool isBefore = now.isBefore(specificDate);
  bool isAfter = now.isAfter(specificDate);
}

/// 日期格式转换
void formatDateDemo() {
  // DateFormat
  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  var formattedDate = formatter.format(DateTime.now());
  print(formattedDate);
}

void main() {
  numTest();
  appendString();
  dateDemo();
}
