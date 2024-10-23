/*
 * @Author: cc
 * @Date: 2024-08-11 21:05:49
 * @LastEditors: cc
 * @LastEditTime: 2024-08-11 22:00:49
 * @Description: 异步demo
 */
import 'dart:convert';
import 'dart:async';

Future<Map<String, dynamic>> fetchUserInfo() async {
  await Future.delayed(Duration(seconds: 1));
  return {'name': 'John Doe', 'email': 'john.doe@example.com'};
}

Future<List<dynamic>> fetchOrders() async {
  await Future.delayed(Duration(seconds: 1));
  return [
    {'id': 1, 'status': 'shipped'},
    {'id': 2, 'status': 'pending'},
    {'id': 3, 'status': 'canceled'}
  ];
}

void main() async {
  final List<Future> futures = [fetchUserInfo(), fetchOrders()];

  Future.wait(futures).then((List<dynamic> results) async {
    Map<String, dynamic> userInfo = results[0];
    List<dynamic> orders = results[1];

    Map<String, dynamic> mergedResults = {...userInfo, 'orders': orders};

    print(jsonEncode(mergedResults));
  }).catchError((error) {
    print('An error occurred: $error');
  });
}
