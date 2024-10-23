/*
 * @Author: cc
 * @Date: 2024-08-07 22:41:16
 * @LastEditors: cc
 * @LastEditTime: 2024-08-07 22:43:32
 * @Description: 空安全
 */

void nullDemo() {
  String name = 'Alice';  // 非空类型，必须初始化
  String? maybeName;      // 可空类型，可以不初始化或赋值为null

  print(name.length);     // 不需要检查null
  print(maybeName?.length);  // 如果maybeName为null，则输出null
  print(maybeName?.length ?? 0);  // 如果maybeName为null，则输出null
}

void main() {
  nullDemo();
}
