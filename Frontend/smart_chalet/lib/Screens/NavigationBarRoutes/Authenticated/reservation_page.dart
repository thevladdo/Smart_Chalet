// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../../../Cubit/app_cubits.dart';
import '../../../Widget/icons_buttons.dart';
import 'detail_page.dart';

class ReservationPage extends StatelessWidget {
  String? selectedDate;
  String? dateCount;
  String? range;
  String? rangeCount;

  ReservationPage(
      this.selectedDate, this.dateCount, this.range, this.rangeCount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
            ),
            const Positioned(left: 0, right: 0, child: BackgroundImage()),
            Positioned(
                top: 70, left: 20, child: Row(children: const [TopButton()])),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 30, top: 35, right: 30),
                width: 100.w,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ReadyToBookText(),
                        ]),
                    const SizedBox(height: 5),
                    const SizedBox(height: 5),
                    Positioned(child: DateCalendar()),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 40,
                left: 30,
                right: 30,
                child: Row(children: [
                  GestureDetector(
                    onTap: (() {
                      BlocProvider.of<AppCubits>(context).jumpHome();
                    }),
                    child: SqaureButton(
                        size: 60,
                        color: _mainPageColor,
                        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                        borderColor: _mainPageColor,
                        isIcon: true,
                        icon: Icons.arrow_back_ios_new_rounded),
                  ),
                  const SizedBox(width: 30),
                  ArrowButton(
                    text: 'BOOK NOW',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            content: Container(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              height: range!.isNotEmpty ? 200 : 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  range!.isNotEmpty
                                      ? (ParagraphTitle(TextAlign.center,
                                          text:
                                              'Thank you for your reservation !'))
                                      : (ParagraphTitle(TextAlign.center,
                                          text:
                                              'Please select a valid date range !')),
                                  const SizedBox(height: 10),
                                  range!.isNotEmpty
                                      ? (SubParagraphText(TextAlign.center,
                                          text: 'See you in $range'))
                                      : (SubParagraphText(TextAlign.center,
                                          text: ':(')),
                                ],
                              ),
                            )),
                      );
                      //  BlocProvider.of<AppCubits>(context).jumpHome();
                    },
                  )
                ])),
          ],
        ),
      ),
    );
  }
}

const _mainPageColor = Color.fromARGB(255, 156, 177, 241);

class ReserveText extends StatelessWidget {
  const ReserveText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\n\nBOOK NOW\nYOUR ',
        style: TextStyle(
          fontFamily: 'AvenirBook',
          fontWeight: FontWeight.w700,
          fontSize: 22.sp,
          color: const Color.fromARGB(255, 82, 85, 96),
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'UMBRELLA!',
              style: TextStyle(
                fontSize: 22.sp,
                fontFamily: 'AvenirBlack',
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}

class ReadyToBookText extends StatelessWidget {
  const ReadyToBookText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ready to book ?',
      style: TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w700,
        fontSize: 25,
        letterSpacing: -1,
        color: Color.fromARGB(210, 23, 24, 27),
      ),
    );
  }
}

class DateCalendar extends StatelessWidget {
  String selectedDate;
  String dateCount;
  String range;
  String rangeCount;
  dynamic thiscontext;

  DateCalendar({
    this.selectedDate = '',
    this.dateCount = '',
    this.range = '',
    this.rangeCount = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    thiscontext = context;
    return SfDateRangePicker(
      startRangeSelectionColor: _mainPageColor,
      endRangeSelectionColor: _mainPageColor,
      selectionColor: _mainPageColor,
      todayHighlightColor: _mainPageColor,
      enablePastDates: false,
      rangeSelectionColor: const Color.fromARGB(255, 229, 235, 251),
      view: DateRangePickerView.month,
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3))),
    );
  }

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.

    if (args.value is PickerDateRange) {
      range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      BlocProvider.of<AppCubits>(thiscontext)
          .reservePage(selectedDate, dateCount, range, rangeCount);
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
      BlocProvider.of<AppCubits>(thiscontext)
          .reservePage(selectedDate, dateCount, range, rangeCount);
    } else if (args.value is List<DateTime>) {
      dateCount = args.value.length.toString();
      BlocProvider.of<AppCubits>(thiscontext)
          .reservePage(selectedDate, dateCount, range, rangeCount);
    } else {
      rangeCount = args.value.length.toString();
      BlocProvider.of<AppCubits>(thiscontext)
          .reservePage(selectedDate, dateCount, range, rangeCount);
    }
  }
}
