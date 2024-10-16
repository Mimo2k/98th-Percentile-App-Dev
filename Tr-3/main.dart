void main() {
  // Hard-coded values for comparison
  int num1 = 15;
  int num2 = 10;

  // Compare if the numbers are equal, greater, or smaller
  if (num1 == num2) {
    print('The numbers are equal.');
  } else if (num1 > num2) {
    print('$num1 is greater than $num2.');
  } else {
    print('$num1 is smaller than $num2.');
  }

  // Check if at least one of the numbers is zero
  if (num1 == 0 || num2 == 0) {
    print('One of the numbers is zero.');
  }

  // Individual check if num1 is even or odd
  if (num1 % 2 == 0) {
    print('$num1 is an even number.');
  } else {
    print('$num1 is an odd number.');
  }

  // Individual check if num2 is even or odd
  if (num2 % 2 == 0) {
    print('$num2 is an even number.');
  } else {
    print('$num2 is an odd number.');
  }

  // Check if both numbers are positive or negative (kept only once)
  if (num1 > 0 && num2 > 0) {
    print('Both numbers are positive.');
  } else if (num1 < 0 && num2 < 0) {
    print('Both numbers are negative.');
  } else {
    print('The numbers have different signs.');
  }

  // Grading System based on num1 and num2
  print('--- Grading System ---');

  if (num1 >= 90 && num2 >= 90) {
    print('Both numbers score Grade A.');
  } else if (num1 >= 75 && num2 >= 75) {
    print('Both numbers score Grade B.');
  } else if (num1 >= 50 && num2 >= 50) {
    print('Both numbers score Grade C.');
  } else {
    print('One or both numbers score below Grade C.');
  }

  // Activity for students:
  // Complete the following logic to handle other grades (e.g., Grade D, E, or F)
  print('--- Student Task ---');
  if (num1 >= 40 && num2 >= 40) {
    print('Both numbers score Grade D.');
  } else if (num1 >= 30 && num2 >= 30) {
    print('Both numbers score Grade E.');
  } else {
    // Encourage students to complete this section for other grade levels
    print('Complete the grading logic for scores below 30.');
  }
}
