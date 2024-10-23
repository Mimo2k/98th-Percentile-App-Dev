void main() {
  // Block 1: Basic function with no parameters and no return value
  printWelcomeMessage();

  // Block 2: Function with parameters and no return value
  int num1 = 5;
  int num2 = 10;
  addNumbers(num1, num2);

  // Block 3: Function with parameters and a return value
  int product = multiplyNumbers(num1, num2);
  print('The product of $num1 and $num2 is: $product\n');

  // Block 4: Celsius to Fahrenheit conversion
  double celsius = 25.0;
  double fahrenheit = convertCelsiusToFahrenheit(celsius);
  print('$celsius°C is equal to $fahrenheit°F');

  // Block 5: Fahrenheit to Celsius conversion (Student Activity)
  double fahrenheitInput = 77.0;
  double celsiusResult = convertFahrenheitToCelsius(fahrenheitInput);
  print('$fahrenheitInput°F is equal to $celsiusResult°C');

  // Block 6: Loop example (Factorial Calculation)
  int number = 5;
  int factorialResult = calculateFactorial(number);
  print('The factorial of $number is: $factorialResult');
}

// Block 1: Basic function with no parameters and no return value
void printWelcomeMessage() {
  print('Welcome to the Dart Functions Demo!\n');
}

// Block 2: Function with parameters and no return value
void addNumbers(int a, int b) {
  int sum = a + b;
  print('The sum of $a and $b is: $sum\n');
}

// Block 3: Function with parameters and a return value
int multiplyNumbers(int a, int b) {
  return a * b;
}

// Block 4: Celsius to Fahrenheit conversion
double convertCelsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

// Block 5: Fahrenheit to Celsius conversion (Student Activity)
double convertFahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

// Block 6: Loop example (Factorial Calculation)
int calculateFactorial(int n) {
  int factorial = 1;
  for (int i = 1; i <= n; i++) {
    factorial *= i;
  }
  return factorial;
}
