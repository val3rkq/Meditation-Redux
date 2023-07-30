import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/generated/l10n.dart';
import 'package:meditation_fox/redux/home_page_state.dart';
import 'package:redux/redux.dart';

import '../widgets/for_change_time_view/all.dart';

class ChangeTimeView extends StatelessWidget {
  ChangeTimeView({
    super.key,
    required this.updateTime,
    required this.formKey,
  });

  final Store store = GetIt.I<Store<HomePageState>>();
  final Function(BuildContext, Store) updateTime;
  final Key formKey;

  // focus nodes
  final FocusNode minutesFocus = FocusNode();
  final FocusNode hoursFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<HomePageState, HomePageState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: transparent,
                appBar: AppBar(
                  toolbarHeight: 30,
                  leading: const SizedBox(),
                  title: Text(
                    S.of(context).change_time,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: black8,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    // close
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: black8,
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    // check and update time
                    GestureDetector(
                      onTap: () {
                        updateTime(context, store);
                      },
                      child: Icon(
                        Icons.check_rounded,
                        color: black8,
                      ),
                    ),
                  ],
                  backgroundColor: transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      // seconds textfield
                      Expanded(
                        flex: 6,
                        child: MyTextField(
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (int.parse(value) >= 60) {
                              return S.of(context).too_much_seconds;
                            }
                            return null;
                          },
                          controller: state.secondsController,
                          // focus: secondsFocus,
                          changeFocus: () {
                            FocusScope.of(context).requestFocus(minutesFocus);
                          },
                          hintText: S.of(context).seconds,
                        ),
                      ),

                      const Spacer(
                        flex: 1,
                      ),

                      // minutes textfield
                      Expanded(
                        flex: 6,
                        child: MyTextField(
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (int.parse(value) >= 60) {
                              return S.of(context).too_much_minutes;
                            }
                            return null;
                          },
                          focus: minutesFocus,
                          changeFocus: () {
                            FocusScope.of(context).requestFocus(hoursFocus);
                          },
                          controller: state.minutesController,
                          hintText: S.of(context).minutes,
                        ),
                      ),

                      const Spacer(
                        flex: 1,
                      ),
                      // hours textfield
                      Expanded(
                        flex: 6,
                        child: MyTextField(
                          validateFunction: (value) {
                            return null;
                          },
                          focus: hoursFocus,
                          changeFocus: () {},
                          controller: state.hoursController,
                          hintText: S.of(context).hours,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
