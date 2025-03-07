package tables;

import com.aventstack.extentreports.ExtentTest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountsTable {
    public static void checkMinimumTwoAccounts(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT COUNT(account_number) AS account_count FROM accounts WHERE customer_id = ? GROUP BY customer_id HAVING COUNT(account_number) >= 2";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                test.pass("Customer has at least 2 accounts.");
            } else {
                test.fail("Customer has fewer than 2 accounts.");
            }
        }
    }

    public static void verifyAccountTypes(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT account_type, COUNT(account_type) FROM accounts WHERE customer_id = ? GROUP BY account_type";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                test.info("Account Type: " + resultSet.getString("account_type") +
                        " | Count: " + resultSet.getInt("COUNT(account_type)"));
            }
        }
    }
}
