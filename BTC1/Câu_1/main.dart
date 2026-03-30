import 'dart:io';

void main() {
  String mssv = "123456";

  print("Nhap mot so:");
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print("So $number la so chan");
  } else {
    print("So $number la so le");
  }

  print("MSSV: $mssv");
}