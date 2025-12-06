import 'package:t2404_dart_7/t2404_dart_7.dart' as t2404_dart_7;
import 'dart:io';

void main(List<String> arguments) {
  print('Hello world: ${t2404_dart_7.calculate()}!');
  while (true) {
    print(
      "\n================ BỘ ĐỀ LUYỆN TƯ DUY LẬP TRÌNH DART ================",
    );
    print("1. Chuẩn hóa tên người dùng");
    print("2. Kiểm tra mật khẩu mạnh");
    print("3. Kiểm tra Anagram");
    print("4. Tìm số lớn thứ hai");
    print("5. Di chuyển số 0 về cuối mảng");
    print("6. Tìm phần tử còn thiếu");
    print("7. Nhóm sản phẩm theo danh mục");
    print("8. Tìm giao của hai danh sách");
    print("9. Tính số ngày công");
    print("10. Đọc số thành chữ (Tiếng Việt)");
    print("0. Thoát");
    stdout.write("Chọn bài (0-10): ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        normalizeName();
        break;
      case "2":
        validatePassword();
        break;
      case "3":
        checkAnagram();
        break;
      case "4":
        findSecondLargest();
        break;
      case "5":
        moveZerosToEnd();
        break;
      case "6":
        findMissingNumber();
        break;
      case "7":
        groupProductsByCategory();
        break;
      case "8":
        findIntersection();
        break;
      case "9":
        calculateWorkingDays();
        break;
      case "10":
        print("Chức năng đang phát triển...");
        break;
      case "0":
        print("Đã thoát chương trình.");
        return;
      default:
        print("❌ Lựa chọn không hợp lệ!");
    }
  }
}

void normalizeName() {
  stdout.write("Nhập tên: ");
  String input = stdin.readLineSync() ?? "";

  List<String> parts = input.trim().split(RegExp(r"\s+"));
  String result = parts
      .map((e) {
        String lower = e.toLowerCase();
        return lower[0].toUpperCase() + lower.substring(1);
      })
      .join(" ");

  print("👉 Kết quả: $result");
}

void validatePassword() {
  stdout.write("Nhập mật khẩu: ");
  String pass = stdin.readLineSync() ?? "";

  if (pass.length < 8) {
    print("❌ Mật khẩu phải ≥ 8 ký tự");
    return;
  }
  if (!RegExp(r"[A-Z]").hasMatch(pass)) {
    print("❌ Phải chứa ít nhất 1 chữ hoa");
    return;
  }
  if (!RegExp(r"[a-z]").hasMatch(pass)) {
    print("❌ Phải chứa ít nhất 1 chữ thường");
    return;
  }
  if (!RegExp(r"[0-9]").hasMatch(pass)) {
    print("❌ Phải chứa ít nhất 1 số");
    return;
  }
  if (!RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  ).hasMatch(pass)) {
    print("❌ Phải chứa ít nhất 1 ký tự đặc biệt");
    return;
  }

  print("✅ Mật khẩu mạnh!");
}

void checkAnagram() {
  stdout.write("Nhập chuỗi 1: ");
  String s1 = stdin.readLineSync() ?? "";

  stdout.write("Nhập chuỗi 2: ");
  String s2 = stdin.readLineSync() ?? "";

  List<String> a = s1.replaceAll(" ", "").split("")..sort();
  List<String> b = s2.replaceAll(" ", "").split("")..sort();

  bool isAnagram = a.join() == b.join();

  print("👉 Kết quả: $isAnagram");
}

void findSecondLargest() {
  stdout.write("Nhập danh sách số (ví dụ: 10 5 20 20 4 8): ");
  List<int> numbers = (stdin.readLineSync() ?? "")
      .split(" ")
      .map(int.parse)
      .toList();

  int? max1, max2;

  for (int n in numbers) {
    if (max1 == null || n > max1) {
      max2 = max1;
      max1 = n;
    } else if (n < max1 && (max2 == null || n > max2)) {
      max2 = n;
    }
  }

  print("👉 Số lớn thứ hai: $max2");
}

void moveZerosToEnd() {
  stdout.write("Nhập mảng (ví dụ:1 0 3 12): ");
  List<int> list = (stdin.readLineSync() ?? "")
      .split(" ")
      .map(int.parse)
      .toList();

  List<int> nonZero = list.where((e) => e != 0).toList();
  int zeroCount = list.length - nonZero.length;

  List<int> result = [...nonZero, ...List.filled(zeroCount, 0)];

  print("👉 Kết quả: $result");
}

void findMissingNumber() {
  stdout.write("Nhập danh sách (ví dụ: 1 2 4 6 3 7 8): ");
  List<int> list = (stdin.readLineSync() ?? "")
      .split(" ")
      .map(int.parse)
      .toList();

  int n = list.length + 1;
  int sumExpected = n * (n + 1) ~/ 2;
  int sumReal = list.reduce((a, b) => a + b);

  print("👉 Số bị thiếu: ${sumExpected - sumReal}");
}

class Product {
  String name;
  String category;
  Product(this.name, this.category);
}

void groupProductsByCategory() {
  List<Product> products = [
    Product("Laptop", "Electronic"),
    Product("Ao thun", "Fashion"),
    Product("Dien thoai", "Electronic"),
    Product("Giay", "Fashion"),
  ];

  Map<String, List<Product>> grouped = {};

  for (var p in products) {
    grouped.putIfAbsent(p.category, () => []);
    grouped[p.category]!.add(p);
  }

  print("👉 Kết quả:");
  grouped.forEach((key, value) {
    print("$key: ${value.map((e) => e.name).toList()}");
  });
}

void findIntersection() {
  stdout.write("Nhập list1 : ");
  Set<int> set1 = (stdin.readLineSync() ?? "")
      .split(" ")
      .map(int.parse)
      .toSet();

  stdout.write("Nhập list2 : ");
  Set<int> set2 = (stdin.readLineSync() ?? "")
      .split(" ")
      .map(int.parse)
      .toSet();

  Set<int> result = set1.intersection(set2);

  print("👉 Giao: $result");
}

void calculateWorkingDays() {
  stdout.write("Nhập ngày bắt đầu (yyyy-mm-dd): ");
  DateTime start = DateTime.parse(stdin.readLineSync()!);

  stdout.write("Nhập ngày kết thúc (yyyy-mm-dd): ");
  DateTime end = DateTime.parse(stdin.readLineSync()!);

  int count = 0;

  for (
    DateTime d = start;
    d.isBefore(end) || d.isAtSameMomentAs(end);
    d = d.add(Duration(days: 1))
  ) {
    if (d.weekday != DateTime.saturday && d.weekday != DateTime.sunday) count++;
  }

  print("👉 Số ngày công: $count");
}

void normalizeName2() {
  stdout.write("Nhập tên: ");
  String input = stdin.readLineSync() ?? "";

  input = input.trim().toLowerCase();

  List<String> chars = input.split("");

  List<String> result = [];

  for (int i = 0; i < chars.length; i++) {
    if (i == 0 && chars[i] != " ") {
      result.add(chars[i].toUpperCase());
    } else if (chars[i - 1] == " " && chars[i] != " ") {
      result.add(chars[i].toUpperCase());
    } else {
      result.add(chars[i]);
    }
  }

  String name = result.join(" ");

  name = name.replaceAll(RegExp(r"\s+"), " ");

  print("👉 Kết quả: $name");
}

void numberToWords() {
  stdout.write("Nhập số (< 1 tỷ): ");
}
