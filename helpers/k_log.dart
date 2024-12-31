import 'dart:developer';

void kLog(value) {
  log('$value');
}

void kError(value) {
  log('\x1B[31m$value');
  log('\x1B[31m---------------------------------------------------------------------------');
}
