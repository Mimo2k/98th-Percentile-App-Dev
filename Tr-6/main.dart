void main() {
  // 1. Basic: Creating a list of integers
  List<int> numbers = [10, 20, 30, 40, 50];
  print('Original List: $numbers');

  // 2. Basic: Adding an element to the list
  numbers.add(60);
  print('After adding 60: $numbers');

  // 3. Basic: Removing an element from the list
  numbers.remove(20);
  print('After removing 20: $numbers');

  // 4. Basic: Updating an element in the list
  numbers[2] = 100;  // Update the value at index 2
  print('After updating index 2 to 100: $numbers');

  // 5. Intermediate: Linear search in the list
  int searchValue = 100;
  int foundIndex = linearSearch(numbers, searchValue);
  if (foundIndex != -1) {
    print('Value $searchValue found at index $foundIndex');
  } else {
    print('Value $searchValue not found in the list');
  }

  // 6. Sum of all elements in the list
  int totalSum = sumList(numbers);
  print('Sum of all elements: $totalSum');

  // 7. Finding the maximum value in the list
  int maxValue = findMax(numbers);
  print('Maximum value in the list: $maxValue');

  // 8. Student Activity: Calculating the average of list elements
  double average = totalSum / numbers.length;
  print('Average of the elements: $average');
}

// Function for linear search
int linearSearch(List<int> list, int value) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == value) {
      return i;  // Return index if value is found
    }
  }
  return -1;  // Return -1 if value is not found
}

// Function to sum all elements in the list
int sumList(List<int> list) {
  int sum = 0;
  for (int number in list) {
    sum += number;
  }
  return sum;
}

// Function to find the maximum value in the list
int findMax(List<int> list) {
  int max = list[0];  // Assume the first element is the maximum
  for (int number in list) {
    if (number > max) {
      max = number;
    }
  }
  return max;
}
