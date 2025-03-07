
import database.DatabaseConnection;
import reporting.BankingReportService;
import reporting.ExtentReportGenerator;
import tables.AccountsTable;
import tables.CustomersTable;
import tables.TransactionsTable;
import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

public class BankingApp {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter customer ID: ");
        int customerId = scanner.nextInt();

        ExtentReports report = ExtentReportGenerator.getReportInstance();
        ExtentTest test = report.createTest("Banking Report for Customer ID: " + customerId);

        try (Connection connection = DatabaseConnection.getConnection()) {
            BankingReportService reportService = new BankingReportService(connection, test);

            reportService.generateReport(customerId);

            report.flush();
            System.out.println("\nReport generated successfully. Check the 'reports' folder.");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
