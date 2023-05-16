import 'dart:convert';

class Bank {
  String? cod;
  String? nam;
  List<Branch>? branches;
   Bank({this.cod, this.nam, this.branches});
   factory Bank.fromJson(Map<String, dynamic> json) {
    var branchJsonList = json['branches'] as List;
    List<Branch> _branches = branchJsonList.map((json) => Branch.fromJson(json)).toList();
     return Bank(
      cod: json['cod'],
      nam: json['nam'],
      branches: _branches,
    );
  }
}
 class Branch {
  String? cod;
  String? nam;
   Branch({required this.cod, required this.nam});
   factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      cod: json['cod'],
      nam: json['nam'],
    );
  }
}