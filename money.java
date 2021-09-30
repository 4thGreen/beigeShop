import java.util.Scanner;

public class ChangeMoney {
	final static int 오만원=50000;
	final static int 만원=10000;
	final static int 천원=1000;
	final static int 오백원=500;
	final static int 백원=100;
	final static int 오십원=50;
	final static int 십원=10;
	final static int 일원=1;
	
	public static void main(String[] args) {
		int res, money;
		Scanner scanner = new Scanner(System.in);
		money = scanner.nextInt();
		
		res = money/오만원;
		money = money%오만원;
		if(res>0) {
			System.out.println("오만원권"+res+"매");
		}
		res = money/만원;
		money = money%만원;
		if(res>0) {
			System.out.println("만원권"+res+"매");
		}

	}

}
