/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author GIGABYTE
 */
public class FormatUtils {

    public static String formatPRice(double price) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator('.'); // Sử dụng dấu chấm làm dấu phân cách nhóm
        symbols.setDecimalSeparator(','); // Sử dụng dấu phẩy làm dấu thập phân nếu cần

        // Tạo DecimalFormat với các ký hiệu tùy chỉnh
        NumberFormat formatter = new DecimalFormat("#,###", symbols);
        return formatter.format(price);
    }

    public static String formatNumber(String number) {
        NumberFormat formatter = NumberFormat.getInstance(Locale.US);
        formatter.setMaximumFractionDigits(0);
        return formatter.format(number);
    }

    public static double formatDouble(int number) {
        // Tạo một đối tượng NumberFormat với Locale là US để định dạng số
        NumberFormat formatter = NumberFormat.getInstance(Locale.US);

        // Thiết lập số chữ số thập phân tối đa là 0
        formatter.setMaximumFractionDigits(0);

        // Chuyển đổi giá trị int thành double và định dạng lại bằng formatter
        double result = Double.parseDouble(formatter.format(number));

        return result;
    }

    public static String convertDateFormat(Date inputDate) {
        // Define the output date format
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

        // Format the date to the output format
        return outputFormat.format(inputDate);
    }
}
