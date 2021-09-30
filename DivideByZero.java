import java.util.Scanner;

public class DivideByZero {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int dividend;
		int divisor;
		
		System.out.println("분자를 입력하시오.");
		dividend = scanner.nextInt();
		System.out.println("분모를 입력하시오.");
		divisor = scanner.nextInt();
		System.out.println(dividend+ "를"+divisor+"로 나누면 몫은"+dividend/divisor+"입니다.");
		
		scanner.close();
	}

}
