import 'package:flutter/cupertino.dart';
import 'package:my_wallet/model/transaction.dart';

class UserData extends ChangeNotifier{
  late String userName;
  late String userWallet;
  late String userExpenses;
  late String userSaving;
  late List<Transaction> userTransactions;
  UserData();
  void updateData(String name, String wallet, String expenses, String savings,
      List<Transaction> transactions) {
    userName = name;
    userWallet = wallet;
    userExpenses = expenses;
    userSaving = savings;
    userTransactions = transactions;
  }
  void addTransaction(Transaction someTransaction){
    userTransactions.add(someTransaction);
    notifyListeners();
  }
}
