import 'package:dropdown/bank_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class BankDropdown extends StatefulWidget {
  const BankDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BankDropdownState createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  String jsonDataString = '''{ 
    
      "bnks": [
        {
          "cod": "02",
          "nam": "Barclays Bank",
          "branches": [
            {"cod": "2101", "nam": "Barclays Headoffice Harare"},
            {"cod": "2112", "nam": "Barclays First Street"},
            {"cod": "2121", "nam": "Barclays Robert Mugabe"},
            {"cod": "2128", "nam": "Barclays Birmingham"},
            {"cod": "2132", "nam": "Barclays Nelson Mandela"},
            {"cod": "2133", "nam": "Barclays Kurima"},
            {"cod": "2143", "nam": "Barclays Highlands"},
            {"cod": "2144", "nam": "Barclays Pearl House"},
            {"cod": "2147", "nam": "Barclays Borrowdale"}
          ]
        },
        {
          "cod": "03",
          "nam": "Stanbic Bank",
          "branches": [
            {"cod": "3101", "nam": "Stanbic Nelson Mandela"},
            {"cod": "3102", "nam": "Stanbic Parklane"},
            {"cod": "3103", "nam": "Stanbic Belgravia"},
            {"cod": "3108", "nam": "Stanbic Msasa"},
            {"cod": "3109", "nam": "Stanbic Central West"},
            {"cod": "3110", "nam": "Stanbic Westgate"},
            {"cod": "3115", "nam": "Stanbic Samora Machel"},
            {"cod": "3118", "nam": "Stanbic Highfield"},
            {"cod": "3120", "nam": "Stanbic Southerton"},
            {"cod": "3125", "nam": "Stanbic Minerva"},
            {"cod": "3128", "nam": "Stanbic Merchant Banking"},
            {"cod": "3302", "nam": "Stanbic Bulawayo"},
            {"cod": "3303", "nam": "Stanbic Belmont"},
            {"cod": "3503", "nam": "Stanbic Gweru"},
            {"cod": "3504", "nam": "Stanbic Mutare"},
            {"cod": "3514", "nam": "Stanbic Kwekwe"},
            {"cod": "3515", "nam": "Stanbic Chitungwiza"}
          ]
        },
        {
          "cod": "04",
          "nam": "Zimbank",
          "branches": [
            {"cod": "4112", "nam": "Zimbank First Street"},
            {"cod": "4113", "nam": "Zimbank Avondale"},
            {"cod": "4116", "nam": "Zimbank Highlands"},
            {"cod": "4118", "nam": "Zimbank Chisipite"},
            {"cod": "4120", "nam": "Zimbank Graniteside"},
            {"cod": "4125", "nam": "Zimbank Union Avenue"},
            {"cod": "4127", "nam": "Zimbank Angwa City"},
            {"cod": "4129", "nam": "Zimbank Borrowdale"},
            {"cod": "4130", "nam": "Zimbank Angwa Street"},
            {"cod": "4134", "nam": "Zimbank Msasa"},
            {"cod": "4135", "nam": "Zimbank West Gate"},
            {"cod": "4139", "nam": "Zimbank Birmingham"},
            {"cod": "4140", "nam": "Zimbank Samora Machel"},
            {"cod": "4143", "nam": "Zimbank Airport"},
            {"cod": "4144", "nam": "Zimbank Rotten Row"},
            {"cod": "4146", "nam": "Zimbank Harare Foreign"},
            {"cod": "4151", "nam": "Zimbank West End"},
            {"cod": "4157", "nam": "Zimbank Douglas Road"},
            {"cod": "4180", "nam": "Zimbank Central Admin"},
            {"cod": "4184", "nam": "Zimbank Blocked Funds"},
            {"cod": "4302", "nam": "Zimbank Fife Street Byo"},
            {"cod": "4303", "nam": "Zimbank Central Bulawayo"},
            {"cod": "4304", "nam": "Zimbank Belmont"},
            {"cod": "4307", "nam": "Zimbank Jason Moyo"},
            {"cod": "4377", "nam": "Zimbank Int- Bulawayo"},
            {"cod": "4511", "nam": "Zimbank Plumtree"},
            {"cod": "4515", "nam": "Zimbank Victoria Falls"},
            {"cod": "4527", "nam": "Zimbank Juliasdale"},
            {"cod": "4528", "nam": "Zimbank Marondera"},
            {"cod": "4532", "nam": "Zimbank Mutare"},
            {"cod": "4537", "nam": "Zimbank Gweru"},
            {"cod": "4552", "nam": "Zimbank Chitungwiza"},
            {"cod": "4555", "nam": "Zimbank Beitbridge"},
            {"cod": "4556", "nam": "Zimbank Kwekwe"},
            {"cod": "4558", "nam": "Zimbank Kadoma"},
            {"cod": "4560", "nam": "Zimbank Sanyati"},
            {"cod": "4561", "nam": "Zimbank Gutu"},
            {"cod": "4563", "nam": "Zimbank Murombedzi"},
            {"cod": "4564", "nam": "Zimbank Masvingo"},
            {"cod": "4565", "nam": "Zimbank Chinhoyi"},
            {"cod": "4566", "nam": "Zimbank Mt. Darwin"},
            {"cod": "4588", "nam": "Zimbank Kadoma"}
          ]
        },
        {
          "cod": "40",
          "nam": "Interfin Merchant Bank of Zimbabwe",
          "branches": [
            {"cod": "40100", "nam": "Interfin Merchant Bank"}
          ]
        },
        {
          "cod": "31",
          "nam": "Nedbank",
          "branches": [
            {"cod": "1100", "nam": "Nedbank"}
          ]
        },
        {
          "cod": "67",
          "nam": "Renaissance Bank",
          "branches": [
            {"cod": "7100", "nam": "Renaissance Bank"}
          ]
        }
      ]

  }''';

  List<Bank> banks = [];

  List<Branch> branches = [];
  Bank? selectedBank;
  Branch? selectedBranch;

  List<Bank> parseBanks(String response) {
    final parsed = jsonDecode(response)['bnks'];
    return (parsed as List).map((json) => Bank.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    banks = parseBanks(jsonDataString);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<Bank>(
          hint: const Text("Select a Bank"),
          value: selectedBank,
          items: banks.map((Bank bank) {
            return DropdownMenuItem<Bank>(
              value: bank,
              child: Text(bank.nam!),
            );
          }).toList(),
          onChanged: (Bank? value) {
            setState(() {
              selectedBank = value!;
              branches = selectedBank?.branches ?? [];
              selectedBranch = null;
            });
          },
        ),
        const SizedBox(height: 10),
        DropdownButton<Branch>(
          hint: const Text("Select a Branch"),
          value: selectedBranch,
          items: branches.map((Branch branch) {
            return DropdownMenuItem<Branch>(
              value: branch,
              child: Text(branch.nam!),
            );
          }).toList(),
          onChanged: (Branch? value) {
            setState(() {
              selectedBranch = value!;
            });
          },
        ),
      ],
    );
  }
}
