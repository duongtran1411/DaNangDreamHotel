/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
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
}
