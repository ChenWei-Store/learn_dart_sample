/*
 * @Author: cc
 * @Date: 2024-07-24 23:26:16
 * @LastEditors: cc
 * @LastEditTime: 2024-10-23 22:11:16
 * @Description: 请填写简介
 */
import 'package:learn_dart_sample/first_sample.dart';
import 'package:test/test.dart';

void main() {
  calculate();
  test('calculate', () {
    expect(calculate(), 42);
  });
}
