/*
 * @Author: cc
 * @Date: 2024-11-04 22:35:40
 * @LastEditors: cc
 * @LastEditTime: 2024-11-04 23:24:52
 * @Description: 类
 */

// 1. 定义类
import 'dart:collection';

class Person {
  String name = '张三';
  int age = 18;

  void say() {
    print('hello');
  }
}

// 2. 构造函数
class Person2 {
  String name;
  int age;
  // 生成构造函数
  Person2(this.name, this.age);
}

// 3.默认构造函数（不声明构造函数时默认无参构造函数）
class Person3 {
  String? name;
  int? age;
}

// 4. 命名构造函数(提供多种方法实例化类，可以用来实现工厂模式)
class Person4 {
  String? name;
  int? age;
  // 命名构造函数
  Person4.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    age = map['age'];
  }
}

//5.工厂构造函数(用于实现复杂的创建逻辑，控制实例的数量和生命周期，适用于单例模式、对象池等。)
class Person5 {
  String? name;
  int? age;
  // 工厂构造函数
  factory Person5.fromMap(Map<String, dynamic> map) {
    return Person5._internal(map['name'], map['age']);
  }
  // 私有构造函数，防外部代码直接创建类的实例
  Person5._internal(this.name, this.age);
}

//5.1 工厂构造函数实现线程安全的单例模式
class Singleton {
  // 私有构造函数
  Singleton._internal();
  // 静态变量，保存单例实例
  static final Singleton _instance = Singleton._internal();
  // 工厂构造函数
  factory Singleton() {
    return _instance;
  }
}

//5.2 工厂构造函数实现对象池模式
class Worker {
  bool inUse = false;

  void doWork() {
    print('Doing some work...');
  }
}

class WorkerPool {
  final int _poolSize;
  final Queue<Worker> _pool = Queue<Worker>();
  static final WorkerPool _instance = WorkerPool._internal();

  // 私有构造函数
  WorkerPool._internal() : _poolSize = 5 {
    for (int i = 0; i < _poolSize; i++) {
      _pool.add(Worker());
    }
  }

  // 工厂构造函数，用于获取单例的 WorkerPool 实例
  factory WorkerPool() {
    return _instance;
  }

  // 从对象池中获取一个可用的 Worker 对象
  Worker acquire() {
    if (_pool.isEmpty) {
      // 如果池中没有可用对象，可以创建新的对象或等待
      // 这里简单地创建一个新的对象
      var worker = Worker();
      worker.inUse = true;
      return worker;
    }
    var worker = _pool.removeFirst();
    worker.inUse = true;
    return worker;
  }

  // 将不再使用的 Worker 对象放回对象池
  void release(Worker worker) {
    if (worker.inUse) {
      worker.inUse = false;
      _pool.add(worker);
    }
  }
}

//6.常量构造函数(创建不可变对象,在编译时确定，适用于常量上下文，提供性能优化)
class Person6 {
  final String name;
  final int age;
  // 常量构造函数
  const Person6(this.name, this.age);
}

// 7.初始化器列表(在构造函数体运行之前初始化实例变量)
class Person7 {
  String name;
  int age;
  // 初始化器列表
  Person7()
      : name = "cc",
        age = 18;
}

//8.类的静态成员变量，普通成员变量,私有成员变量，类的静态方法，普通方法
class Person8 {
  int age;
  static String id = "123";
  String _name = "abc";

  Person8(this.age);

  String _getName() {
    return _name;
  }

  static String? getName() {
    return id;
  }

  void say() {
    print('hello');
  }
}

// 9.类的继承和超参数
class Student extends Person8 {
  String? school;
  // 调用父类的构造函数
  Student(super.age, this.school);
}
