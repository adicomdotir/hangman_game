abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://wxcoljureyggclbqwcex.supabase.co',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4Y29sanVyZXlnZ2NsYnF3Y2V4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIwMDg1ODEsImV4cCI6MjA0NzU4NDU4MX0.0rUQep4voKtIE7Kj0LDUhqL4Ozl1tApHmIGilYZq4Uw',
  );
}
