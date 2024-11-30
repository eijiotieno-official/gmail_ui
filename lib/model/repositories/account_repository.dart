import 'dart:math';

import '../base/account_model.dart';
import '../base/company_model.dart';
import '../base/user_model.dart';

final Random _random = Random();

class AccountRepository {
  final _users = _UserGenerator.data();

  final _companies = _CompanyGenerator.data();

  List<Account> get fetch => [..._users, ..._companies];
}

class _CompanyGenerator {
  static final List<String> sampleCompanies = [
    'Acme Corp',
    'Global Industries',
    'Tech Solutions LLC',
    'Maverick Enterprises',
    'Redwood Innovations',
    'Skyline Technologies',
    'Fusion Dynamics',
    'Bright Future Ltd.',
    'NextGen Systems',
    'Pioneer Networks',
    'Bluewave Solutions',
    'Vanguard Enterprises',
    'Quantum Innovations',
    'Alpha Tech Solutions',
    'Horizon Digital Media',
    'Greenleaf Group',
    'Riverside Industries',
    'Summit Technologies',
    'Echo Global Services',
    'Bluepeak Enterprises'
  ];

  static final List<String> _provider = [".com", ".io", ".gov"];

  static String _getEmail(String companyName) {
    final provider = _generateRandomProvider();

    final domain =
        _generateRandomDomain(companyName: companyName, provider: provider);

    final email =
        '$companyName@$domain'.replaceAll(" ", ".").toLowerCase().trim();

    return email;
  }

  static String _generateRandomProvider() {
    return _provider[_random.nextInt(_provider.length)];
  }

  static String _generateRandomDomain({
    required String companyName,
    required String provider,
  }) {
    String firstWord = companyName.split(" ")[0].toLowerCase();

    return '$firstWord$provider';
  }

  static List<Company> data() {
    List<Company> results = [];

    for (var companyName in sampleCompanies) {
      final email = _getEmail(companyName);

      results.add(Company(name: companyName, email: email));
    }

    return results;
  }
}

class _UserGenerator {
  static final List<String> sampleNames = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
    'Chris Evans',
    'Emily Davis',
    'Michael Scott',
    'Sarah Connor',
    'David Beckham',
    'Sophia Lee',
    'Oliver King',
    'Emma Watson',
    'Liam Miller',
    'Mia Wilson',
    'Noah Anderson',
    'Ava Martinez',
    'William Taylor',
    'Isabella Thomas',
    'James White',
    'Charlotte Harris'
  ];

  static final List<String> _domains = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com',
    'customdomain.com'
  ];

  static String _generateRandomDomain() {
    return _domains[_random.nextInt(_domains.length)];
  }

  static String _getEmail(String userName) {
    final domain = _generateRandomDomain();
    final email = '$userName@$domain'.replaceAll(" ", "").toLowerCase().trim();
    return email;
  }

  static List<User> data() {
    List<User> results = [];

    for (var userName in sampleNames) {
      final email = _getEmail(userName);

      results.add(User(name: userName, email: email));
    }

    return results;
  }
}
