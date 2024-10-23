/*
 * @Author: cc
 * @Date: 2024-08-06 21:55:41
 * @LastEditors: cc
 * @LastEditTime: 2024-08-06 23:50:28
 * @Description: 错误处理demo
 */

double divide(int a, int b) {
  if (b == 0) {
    throw Exception('Cannot divide by zero');
  }
  return a / b;
}

void catchDemo() {
  try {
    double result = divide(10, 0); // 这里会抛出异常
    print('Result: $result');
  } on Exception catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('This will run no matter what.');
  }
}

void rethrowDemo() {
  try {
    // Some code that may throw an exception
    throw MyException('Something went wrong');
  } catch (e) {
    print('Caught an exception: $e');
    rethrow; // 重新抛出异常
  }
}

void main() {
  catchDemo();
  rethrowDemo();
}

class MyException implements Exception {
  String message;
  MyException(this.message);
  @override
  String toString() => message;
}
