void main() {
  // 1. Basic: Print Numbers from 1 to 10 (For Loop)
  print('Numbers from 1 to 10:');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // 2. Basic: Print Numbers from 1 to 10 (While Loop)
  print('Numbers from 1 to 10 using a while loop:');
  int i = 1;
  while (i <= 10) {
    print(i);
    i++;
  }

  // 3. Intermediate: Print Even Numbers from 1 to 20 (For Loop)
  print('Even numbers from 1 to 20:');
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }

  // 4. Intermediate: Print Odd Numbers from 1 to 15 (While Loop)
  print('Odd numbers from 1 to 15:');
  int j = 1;
  while (j <= 15) {
    if (j % 2 != 0) {
      print(j);
    }
    j++;
  }

  // 5. Advanced: Sum of Numbers from 1 to 10
  print('Sum of numbers from 1 to 10:');
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print('The sum is: $sum');

  // 6. Advanced: Product of Numbers from 1 to 10 (Student Task)
  print('Product of numbers from 1 to 10:');
  int product = 1;
  for (int i = 1; i <= 10; i++) {
    product *= i;
  }
  print('The product is: $product');

  // 7. Advanced: Print Squares of Numbers from 1 to 5
  print('Squares of numbers from 1 to 5:');
  for (int i = 1; i <= 5; i++) {
    print('Square of $i: ${i * i}');
  }

  // 8. Advanced: Reverse Printing of Numbers from 10 to 1
  print('Numbers from 10 to 1 (Reverse):');
  for (int i = 10; i >= 1; i--) {
    print(i);
  }
}
