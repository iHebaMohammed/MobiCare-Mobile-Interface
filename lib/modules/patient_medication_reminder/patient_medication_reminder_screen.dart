import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class PatientMedicationReminderScreen extends StatelessWidget {
  const PatientMedicationReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/medication_reminder/medication_reminder.svg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'You can set an alarm for medication appointments',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor1BA.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Add a new medicine',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SvgPicture.asset('assets/icons/medicines_icon.svg'),
                          ),                  ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              medicationReminderContainer(
                  name: 'Amitriptyline',
                  timeInHour: '08',
                  timeInMinute: '30',
                  isTimeAM: false,
                  howTimes: '3 per day'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
