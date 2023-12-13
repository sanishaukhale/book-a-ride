import 'package:twilio_flutter/twilio_flutter.dart';

class Twilio {
  sendSms(String carName) {
    late TwilioFlutter twilioFlutter;
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC74ab51642b9534fa67dc34c3ef20b601',
        authToken: 'd53ded7d5bbe370bff3fc7112556f990',
        twilioNumber: '+19375950946');
    twilioFlutter.sendSMS(
        toNumber: '+919145681593',
        messageBody:
            'Booking Confirmed!\nYou have successfully booked $carName.');
  }
}
