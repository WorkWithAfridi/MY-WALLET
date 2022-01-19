import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wallet/model/transaction.dart';
import 'package:my_wallet/model/userData.dart';
import 'package:my_wallet/provider/appData.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  static const routeName = '/addTransaction';
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  bool isIncome = true;
  late UserData userData;
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  void getData(BuildContext context) {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    userData = Provider.of<UserData>(context, listen: false);
  }

  @override
  void initState() {
    getData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 6,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     FontAwesomeIcons.bars,
        //     color: appData.customWhite,
        //     size: 20,
        //   ),
        // ),
        title: Text(
          'Add Transaction',
          style: normalTextStyle.copyWith(
            fontSize: 30,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       FontAwesomeIcons.userAlt,
        //       color: appData.customWhite,
        //       size: 20,
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '*Select a transaction type:',
                  style: normalTextStyle.copyWith(fontSize: 25, height: .8),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isIncome = true;
                          });
                        },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          // color: Colors.pink,
                          alignment: Alignment.center,
                          child: Text(
                            'Income',
                            style: headerTextStyleWhite.copyWith(
                                color: isIncome
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                                fontSize: 45,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: double.infinity,
                        width: 1,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isIncome = false;
                          });
                        },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: Text(
                            'Expense',
                            style: headerTextStyleWhite.copyWith(
                                color: isIncome
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                                fontSize: 45,
                                height: 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Text(
              //     'Amount:',
              //     style: normalTextStyle.copyWith(fontSize: 25, height: .8),
              //   ),
              // ),
              // const SizedBox(height: 3),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: amountController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    labelStyle:
                        normalTextStyle.copyWith(fontSize: 35, height: .2),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter amount here...",
                    hintStyle:
                        normalTextStyle.copyWith(fontSize: 25, height: .2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: titleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text('Title'),
                    labelStyle:
                        normalTextStyle.copyWith(fontSize: 35, height: .2),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter title here...",
                    hintStyle:
                        normalTextStyle.copyWith(fontSize: 25, height: .2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: summaryController,
                  maxLines: 5,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(.1),
                    filled: true,
                    label: Text('Summary (Optional)'),
                    labelStyle:
                        normalTextStyle.copyWith(fontSize: 35, height: .2),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter summary here, if any...",
                    hintStyle:
                        normalTextStyle.copyWith(fontSize: 25, height: .2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    userData.addTransaction(Transaction.name(
                        isIncome,
                        amountController.text,
                        titleController.text,
                        summaryController.text));
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
