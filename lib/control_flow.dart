/*
 * @Author: cc
 * @Date: 2024-08-06 21:03:16
 * @LastEditors: cc
 * @LastEditTime: 2024-08-06 21:25:35
 * @Description: 控制流
 * 
 */

void ifelsedemo() {
  print("ifelsedemo");
  var a = 10;
  var b = 20;
  if (a > b) {
    print("a>b");
  } else {
    print("a<=b");
  }
}

void ifelseifdemo() {
  print("ifelseifdemo");
  var a = 10;
  var b = 20;
  if (a > b) {
    print("a>b");
  } else if (a < b) {
    print("a<b");
  } else {
    print("a=b");
  }
}

void whiledemo() {
  print("whiledemo");
  var a = 10;
  while (a > 0) {
    print(a);
    a--;
  }
}

void dowhiledemo() {
  print("dowhiledemo");
  var a = 10;
  do {
    print(a);
    a--;
  } while (a > 0);
}

void fordemo() {
  print("fordemo");
  for (var i = 0; i < 10; i++) {
    print(i);
  }
}

void forin() {
  print("forin");
  var list = [1, 2, 3, 4, 5];
  for (var i in list) {
    print(i);
  }
}

void forinmap() {
  print("forinmap");
  var map = {"a": 1, "b": 2, "c": 3};
  for (var i in map.entries) {
    print(i.key);
    print(i.value);
  }
}

void breakdemo() {
  print("breakdemo");
  for (var i = 0; i < 10; i++) {
    if (i == 5) {
      break;
    }
    print(i);
  }
}

void continueDemo() {
  print("continueDemo");
  for (var i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }
}

void switchdemo() {
  print("switchdemo");
  var a = 10;
  switch (a) {
    case 1:
      print("a=1");
      break;
    case 2:
      print("a=2");
      break;
    case 3:
      print("a=3");
      break;
    // default:
    //   print("a=其他");
    //   break;
  }
}

void breakNewerDemo() {
  print("breakNewerDemo");
  outerLoop:
  for (int i = 0; i < 10; i++) {
    // innerLoop:
    for (int j = 0; j < 10; j++) {
      if (i == 5 && j == 5) {
        break outerLoop; // 跳出外层循环
      }
      print("i: $i, j: $j");
    }
  }
}

void main() {
  ifelsedemo();
  ifelseifdemo();
  whiledemo();
  dowhiledemo();
  fordemo();
  forin();
  forinmap();
  switchdemo();
  breakdemo();
  breakNewerDemo();
  continueDemo();
  int age = 18;
  String audit = age >= 18 ? "成年" : "未成年";
  print(audit);
}
