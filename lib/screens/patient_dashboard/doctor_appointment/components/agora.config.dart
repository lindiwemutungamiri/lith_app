import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lith_app/screens/patient_dashboard/doctor_appointment/screens/token_maker.dart';

/// Get your own App ID at https://dashboard.agora.io/
String appId = env['69c668730c63437e95c637594e8297b7'].toString();

/// Please refer to https://docs.agora.io/en/Agora%20Platform/token
String token = updatedtoken;

/// Your channel ID
String channelId = channelNameEntered;

/// Your int user ID
const uid = 0;

/// Your string user ID
const stringUid = 'Akshatji';
