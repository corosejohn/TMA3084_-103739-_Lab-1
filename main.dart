import 'dart:io';

void main() {
  bool keepOrdering = true;

  // While loop for continuous ordering

  while (keepOrdering) {
    print('\n=== Pizza Ordering System ===');
    print('Small  = 5 USD');
    print('Medium = 7 USD');
    print('Large  = 10 USD');
    print('=============================');

    // Pizza size
    stdout.write('Enter pizza size (Small/Medium/Large) or "Exit" to quit: ');
    String? sizeInput = stdin.readLineSync();

    if (sizeInput == null) continue;
    String size = sizeInput.trim();

    if (size.toLowerCase() == 'exit') {
      print('Thank you for visiting! Goodbye.');
      break;
    }

    // Input validation
    if (size.toLowerCase() != 'small' &&
        size.toLowerCase() != 'medium' &&
        size.toLowerCase() != 'large') {
      print('Invalid pizza size entered. Please try again.');
      continue;
    }

    // Quantity
    stdout.write('Enter quantity: ');
    String? quantityInput = stdin.readLineSync();
    int? quantity = int.tryParse(quantityInput ?? '');

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity. Please enter a positive whole number.');
      continue;
    }

    // Calculate total payment
    int pricePerUnit = 0;
    switch (size.toLowerCase()) {
      case 'small':
        pricePerUnit = 5;
        break;
      case 'medium':
        pricePerUnit = 7;
        break;
      case 'large':
        pricePerUnit = 10;
        break;
    }

    int totalPayment = pricePerUnit * quantity;
    print('\n-----------------------------');
    print('Order Details: $quantity x ${size[0].toUpperCase()}${size.substring(1)} Pizza');
    print('Total Payment: \$${totalPayment} USD');
    print('-----------------------------');

    // Ask to continue
    stdout.write('Would you like to place another order? (yes/no): ');
    String? continueInput = stdin.readLineSync();
    if (continueInput == null || continueInput.trim().toLowerCase() != 'yes') {
      keepOrdering = false;
      print('Thank you for your order!');
    }
  }
}