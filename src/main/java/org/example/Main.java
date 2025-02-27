package org.example;

public class Main {
    public static void main(String[] args) {
        Calculator calculator = new Calculator();
        int a = 5;
        int b = 2;

        System.out.println("Addition: " + calculator.add(a, b));
        System.out.println("Subtraction: " + calculator.subtract(a, b));
        System.out.println("Multiplication: " + calculator.multiply(a, b));
        System.out.println("Division: " + calculator.divide(a, b));
    }
}
