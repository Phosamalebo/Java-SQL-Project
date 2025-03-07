package tables;

import com.aventstack.extentreports.ExtentTest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomersTable {

    // 🧾 Get customer's first name
    public static void getCustomerFirstName(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT first_name FROM customers WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String firstName = resultSet.getString("first_name");
                test.pass("First Name: " + firstName);
            } else {
                test.fail("No customer found with the given ID.");
            }
        }
    }

    // 🧾 Get customer's last name
    public static void getCustomerLastName(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT last_name FROM customers WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String lastName = resultSet.getString("last_name");
                test.pass("Last Name: " + lastName);
            } else {
                test.fail("No customer found with the given ID.");
            }
        }
    }

    // 🧾 Get customer's phone number
    public static void getCustomerPhoneNumber(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT phone_number FROM customers WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String phoneNumber = resultSet.getString("phone_number");
                test.pass("Phone Number: " + phoneNumber);
            } else {
                test.fail("No customer found with the given ID.");
            }
        }
    }

    // 🧾 Get customer's address
    public static void getCustomerAddress(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT address FROM customers WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String address = resultSet.getString("address");
                test.pass("Address: " + address);
            } else {
                test.fail("No customer found with the given ID.");
            }
        }
    }

    // 🧾 Get customer's email address
    public static void getCustomerEmailAddress(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT email FROM customers WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String email = resultSet.getString("email");
                test.pass("Email Address: " + email);
            } else {
                test.fail("No customer found with the given ID.");
            }
        }
    }
}
