import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_admin/src/components/my_text_field.dart';
import 'package:pizza_admin/src/modules/create_pizza/components/macro.dart';
import 'package:pizza_repository/pizza_repository.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final calorieController = TextEditingController();
  final proteinController = TextEditingController();
  final fatController = TextEditingController();
  final carbController = TextEditingController();
  String? _errorMsg;
  late Pizza pizza;

  @override
  void initState() {
    super.initState();
    pizza = Pizza.empty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a New Pizza',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Ink(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.photo,
                          size: 100,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Add a Picture here...',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 400,
                          child: MyTextField(
                              controller: nameController,
                              hintText: 'Name',
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              // prefixIcon: const Icon(CupertinoIcons.mail_solid),
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              })),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 400,
                          child: MyTextField(
                              controller: descriptionController,
                              hintText: 'Description',
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              // prefixIcon: const Icon(CupertinoIcons.mail_solid),
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              })),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            Expanded(
                                child: MyTextField(
                                    controller: priceController,
                                    hintText: 'Price',
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    // prefixIcon: const Icon(CupertinoIcons.mail_solid),
                                    errorMsg: _errorMsg,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please fill in this field';
                                      }
                                      return null;
                                    })),
                            const SizedBox(width: 10),
                            Expanded(
                                child: MyTextField(
                                    controller: discountController,
                                    hintText: 'Discount',
                                    suffixIcon: const Icon(
                                      CupertinoIcons.percent,
                                      color: Colors.grey,
                                    ),
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    // prefixIcon: const Icon(CupertinoIcons.mail_solid),
                                    errorMsg: _errorMsg,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please fill in this field';
                                      }
                                      return null;
                                    })),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Is Vegetarian: ",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Checkbox(
                            value: pizza.isVeg,
                            onChanged: (value) {
                              setState(() {
                                pizza.isVeg = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Is Spicy: ",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 1;
                                });
                              },
                              child: Ink(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 1 
                                    ? Border.all(
                                      width: 2,
                                    ): null),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 2;
                                });
                              },
                              child: Ink(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 2 
                                    ? Border.all(
                                      width: 2,
                                    ): null),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 3;
                                });
                              },
                              child: Ink(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 3 
                                    ? Border.all(
                                      width: 2,
                                    ): null),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Macros: ",
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            MyMacroWidget(
                              title: "Calories",
                              value: 12,
                              icon: FontAwesomeIcons.fire,
                              controller: calorieController,
                            ),
                            const SizedBox(width: 10),
                            MyMacroWidget(
                              title: "Proteins",
                              value: 12,
                              icon: FontAwesomeIcons.dumbbell,
                              controller: proteinController,
                            ),
                            const SizedBox(width: 10),
                            MyMacroWidget(
                              title: "Fat",
                              value: 12,
                              icon: FontAwesomeIcons.weightScale,
                              controller: fatController,
                            ),
                            const SizedBox(width: 10),
                            MyMacroWidget(
                              title: "Carbs",
                              value: 12,
                              icon: FontAwesomeIcons.breadSlice,
                              controller: carbController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
