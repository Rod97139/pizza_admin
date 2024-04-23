import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_admin/src/components/my_text_field.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
            const SizedBox(
              height: 20,
            ),
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
                          controller: nameController,
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
                                controller: nameController,
                                hintText: 'Price',
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
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
                                controller: nameController,
                                hintText: 'Discount',
                                suffixIcon: const Icon(
                                  CupertinoIcons.percent,
                                  color: Colors.grey,
                                  ),
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(width: 10,),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                    ],
                  ),
                  const SizedBox(width: 10,),
                  Row(
                    children: [
                      const Text(
                        "Is Spicy: ",
                      ),
                      const SizedBox(width: 10,),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                              )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: 30,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                              )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: 30,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                              )
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
