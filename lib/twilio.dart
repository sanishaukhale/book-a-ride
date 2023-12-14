import 'package:twilio_flutter/twilio_flutter.dart';

class Twilio {
  sendSms(String carName) {
    late TwilioFlutter twilioFlutter;
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC74ab51642b9534fa67dc34c3ef20b601',
        authToken: '718f1ed7e5e23a8fe032929b7179e370',
        twilioNumber: '+19375950946');
    twilioFlutter.sendSMS(
        toNumber: '+919145681593',
        messageBody:
            'Booking Confirmed!\nYou have successfully booked $carName.');
  }
}
