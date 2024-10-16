// Tr - 2

void main() {
  print("=== Simple Calculator ===");

  // First set of numbers
  double num1 = 10.0;
  double num2 = 5.0;

  // Perform addition
  double addition = num1 + num2;
  print("The sum of $num1 and $num2 is: $addition");

  // Perform subtraction
  double subtraction = num1 - num2;
  print("The difference between $num1 and $num2 is: $subtraction");

  // Perform multiplication
  double multiplication = num1 * num2;
  print("The product of $num1 and $num2 is: $multiplication");

  // Perform division (checking for division by zero)
  if (num2 != 0) {
    double division = num1 / num2;
    print("The division of $num1 by $num2 is: $division");
  } else {
    print("Division by zero is not allowed.");
  }

  // Another set of numbers (Student Activity)
  print("\n=== Let's try again with new numbers ===");

  // Second set of hardcoded numbers
  double num3 = 20.0;
  double num4 = 4.0;

  // Perform addition
  double newAddition = num3 + num4;
  print("The sum of $num3 and $num4 is: $newAddition");

  // Perform subtraction
  double newSubtraction = num3 - num4;
  print("The difference between $num3 and $num4 is: $newSubtraction");

  // Perform multiplication
  double newMultiplication = num3 * num4;
  print("The product of $num3 and $num4 is: $newMultiplication");

  // Perform division
  if (num4 != 0) {
    double newDivision = num3 / num4;
    print("The division of $num3 by $num4 is: $newDivision");
  } else {
    print("Division by zero is not allowed.");
  }

  //Bonus Challenge:

  // New set of numbers
  double num3 = 8.0;
  double num4 = 3.0;

  // Perform addition (Complete this line)
  double newAddition = num3 + num4; 
  print("The sum of $num3 and $num4 is: $newAddition");

  // Perform multiplication (Complete this line)
  double newMultiplication = num3 * num4; 
  print("The product of $num3 and $num4 is: $newMultiplication");
  

  // Buffer section: Extra practice for students if they finish early
  print("\n=== Bonus: Extra Practice ===");

  // Third set of hardcoded numbers for extra practice
  double num5 = 15.0;
  double num6 = 3.0;

  // Perform addition
  double extraAddition = num5 + num6;
  print("The sum of $num5 and $num6 is: $extraAddition");

  // Perform subtraction
  double extraSubtraction = num5 - num6;
  print("The difference between $num5 and $num6 is: $extraSubtraction");

  // Perform multiplication
  double extraMultiplication = num5 * num6;
  print("The product of $num5 and $num6 is: $extraMultiplication");

  // Perform division
  if (num6 != 0) {
    double extraDivision = num5 / num6;
    print("The division of $num5 by $num6 is: $extraDivision");
  } else {
    print("Division by zero is not allowed.");
  }

  print("\nThank you for using the calculator!");
}
