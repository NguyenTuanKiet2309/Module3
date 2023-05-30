package com.example.ss10_calculator.model;

public class Calculator {

    public static double calculator(double num1, double num2, String operator) {
        switch (operator) {
            case "+":
                return num1 + num2;
            case "-":
                return num1 - num2;
            case "*":
                return num1 * num2;
            case "/":
                if (num2 != 0) {
                    return num1 / num2;
                } else {
                    throw new RuntimeException("Không chia được cho 0");
                }
            default:
                throw new RuntimeException("NHập không hợp lệ");
        }
    }
}
