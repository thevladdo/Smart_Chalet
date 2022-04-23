import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Widget/title_row.dart';
import '../../../Widget/images.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationState();
}

class _ReservationState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 150,
                  ),
                  const Positioned(
                    top: -80,
                    child: HomeWave(),
                  ),
                  const Positioned(
                    right: 30,
                    bottom: 40,
                    child: SittingHuman(),
                  )
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 650,
                  ),
                  Positioned(
                    top: 200,
                    width: 100.w,
                    child: const GradientFooter(),
                  ),
                  const Positioned(
                    top: 280,
                    child: HomePlants(),
                  ),
                  const Positioned(bottom: 580, left: 30, child: ReserveText()),
                  const Positioned(
                      top: 220,
                      left: 90,
                      child: Text('Select your number \n of umbrellas:')),
                  const Positioned(
                    top: 210,
                    left: 250,
                    child: ListUmbrellas(),
                  ),
                  const Positioned(
                      top: 110, left: 50, right: 100, child: DataPicker()),
                  const Positioned(
                      bottom: 200, left: 150, child: ConfirmBottom())
                ],
              ),
            ],
          ),
        ));
  }
}

///Text Reserve
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

///DataPicker
class DataPicker extends StatefulWidget {
  const DataPicker({Key? key}) : super(key: key);

  @override
  _DataPickerState createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String? _valueSaved;
    return Container(
      child: DateTimePicker(
        type: DateTimePickerType.date,
        dateMask: 'dd-MM-yyyy',
        initialValue: selectedDate.toString(),
        firstDate: selectedDate.subtract(const Duration(days: 0)),
        lastDate: DateTime(2100),
        icon: const Icon(Icons.event),
        dateLabelText: 'Date',
        // onChanged: (val) => print(val),
        // onSaved: (val) => setState(() => _valueSaved = val ?? ''),
      ),
    );
  }
}

///Number of Umbrellas
class ListUmbrellas extends StatefulWidget {
  const ListUmbrellas({Key? key}) : super(key: key);

  @override
  _ListUmbrellasState createState() => _ListUmbrellasState();
}

class _ListUmbrellasState extends State<ListUmbrellas> {
  String dropdownvalue = '1';
  late String value = '';

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: DropdownButton(
            value: dropdownvalue,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.blue,
            ),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            }));
  }
}

///Confirm Bottom
class ConfirmBottom extends StatelessWidget {
  const ConfirmBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 214, 225, 255),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 170, 174, 196),
                  offset: Offset.zero,
                  blurRadius: 20)
            ],
            border: Border.all(color: const Color.fromARGB(255, 214, 225, 255)),
            borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 214, 225, 255))),
          onPressed: () {
            //TODO
          },
          child: RichText(
            text: const TextSpan(
              text: 'Confirm',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color.fromARGB(255, 82, 85, 96),
                  letterSpacing: -1,
                  shadows: <Shadow>[
                    Shadow(
                        color: Color.fromARGB(255, 186, 193, 218),
                        offset: Offset.zero,
                        blurRadius: 20)
                  ]),
            ),
          ),
        ));
  }
}
