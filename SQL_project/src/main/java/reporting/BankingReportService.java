package reporting;

import com.aventstack.extentreports.ExtentTest;
import tables.AccountsTable;
import tables.CustomersTable;
import tables.TransactionsTable;

import java.sql.Connection;
import java.sql.SQLException;

public class BankingReportService {
    private final Connection connection;
    private final ExtentTest test;

    public BankingReportService(Connection connection, ExtentTest test) {
        this.connection = connection;
        this.test = test;
    }

    public void generateReport(int customerId) throws SQLException {
        CustomersTable.getCustomerFirstName(connection, customerId, test);
        CustomersTable.getCustomerLastName(connection, customerId, test);
        CustomersTable.getCustomerPhoneNumber(connection, customerId, test);
        CustomersTable.getCustomerAddress(connection, customerId, test);
        CustomersTable.getCustomerEmailAddress(connection, customerId, test);

        AccountsTable.checkMinimumTwoAccounts(connection, customerId, test);
        AccountsTable.verifyAccountTypes(connection, customerId, test);

        TransactionsTable.getFirstTransactionType(connection, customerId, test);
        TransactionsTable.getTotalBalance(connection, customerId, test);
        TransactionsTable.getCheckingTransactions(connection, customerId, test);
        TransactionsTable.verifyMinimumTransactionsPerAccount(connection, customerId, test);
        TransactionsTable.confirmNoOverdrawnAccounts(connection, customerId, test);
    }
}

