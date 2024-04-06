
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'GOOGLE_GEMINI_API', obfuscate: true)
  static final String geminiAPIKey = _Env.geminiAPIKey;
  @EnviedField(varName: 'SUPABASE_KEY', obfuscate: true)
  static final String supabaseKey = _Env.supabaseKey;
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseURL = _Env.supabaseURL;
  @EnviedField(varName: 'MAIL_USERNAME', obfuscate: true)
  static final String mailUsername = _Env.mailUsername;
  @EnviedField(varName: 'MAIL_PASSWORD', obfuscate: true)
  static final String mailPassword = _Env.mailPassword;
}