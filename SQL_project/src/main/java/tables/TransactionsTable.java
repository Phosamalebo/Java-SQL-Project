package tables;

import com.aventstack.extentreports.ExtentTest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransactionsTable {
    public static void getFirstTransactionType(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT account_number, MIN(transaction_type) AS first_transaction FROM transactions WHERE account_number IN (SELECT account_number FROM accounts WHERE customer_id = ?) GROUP BY account_number";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                test.pass("Account: " + resultSet.getInt("account_number") + " | First Transaction: " + resultSet.getString("first_transaction"));
            }
        }
    }

    // 🔹 Get total balance for a customer
    public static void getTotalBalance(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT SUM(balance) AS total_balance FROM accounts WHERE customer_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                double totalBalance = resultSet.getDouble("total_balance");
                test.pass("Total balance for customer " + customerId + ": $" + totalBalance);
            } else {
                test.fail("No balance found for customer ID: " + customerId);
            }
        }
    }

    // 🔹 Get all transactions for checking accounts
    public static void getCheckingTransactions(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT t.account_number, t.transaction_date, t.amount, t.transaction_type " +
                "FROM transactions t " +
                "JOIN accounts a ON t.account_number = a.account_number " +
                "WHERE a.customer_id = ? AND a.account_type = 'CHECKING' " +
                "ORDER BY t.transaction_date";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()) {
                test.warning("No transactions found for checking accounts of customer ID: " + customerId);
                return;
            }

            while (resultSet.next()) {
                test.info("Account: " + resultSet.getInt("account_number") +
                        " | Date: " + resultSet.getDate("transaction_date") +
                        " | Amount: $" + resultSet.getDouble("amount") +
                        " | Type: " + resultSet.getString("transaction_type"));
            }
            test.pass("Fetched checking account transactions successfully.");
        }
    }

    // 🔹 Verify minimum transactions per account (at least 3 transactions)
    public static void verifyMinimumTransactionsPerAccount(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT account_number, COUNT(transaction_id) AS transaction_count " +
                "FROM transactions WHERE account_number IN " +
                "(SELECT account_number FROM accounts WHERE customer_id = ?) " +
                "GROUP BY account_number HAVING COUNT(transaction_id) >= 3";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()) {
                test.fail("Customer " + customerId + " has accounts with fewer than 3 transactions.");
                return;
            }

            while (resultSet.next()) {
                test.pass("Account: " + resultSet.getInt("account_number") +
                        " | Transactions: " + resultSet.getInt("transaction_count") +
                        " (Meets minimum required transactions)");
            }
        }
    }

    // 🔹 Confirm no overdrawn accounts
    public static void confirmNoOverdrawnAccounts(Connection connection, int customerId, ExtentTest test) throws SQLException {
        String query = "SELECT t.account_number, " +
                "SUM(CASE WHEN t.transaction_type = 'WITHDRAWAL' THEN t.amount ELSE 0 END) AS total_withdrawals, " +
                "SUM(CASE WHEN t.transaction_type = 'DEPOSIT' THEN t.amount ELSE 0 END) AS total_deposits " +
                "FROM transactions t " +
                "JOIN accounts a ON t.account_number = a.account_number " +
                "WHERE a.customer_id = ? " +
                "GROUP BY t.account_number " +
                "HAVING total_withdrawals > total_deposits";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()) {
                test.pass("No overdrawn accounts for customer ID: " + customerId);
                return;
            }

            while (resultSet.next()) {
                test.fail("Overdrawn Account: " + resultSet.getInt("account_number") +
                        " | Withdrawals: $" + resultSet.getDouble("total_withdrawals") +
                        " | Deposits: $" + resultSet.getDouble("total_deposits"));
            }
        }
    }
}
