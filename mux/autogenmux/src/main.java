public class main {
    public static void main(String[] args) {
        char c;
        int i = 0;
        for(c = 'a'; c <= 'z'; ++c) {
            System.out.print(c + ", ");
            i++;
        }
        char b = 'a';
        for (i = i; i < 32; i++) {
            System.out.print("a" + b + ", ");
            b++;
        }
        System.out.println();
        char z = 'a';
        for (int j = 0; j < 32; j++) {
            System.out.println("assign " + z + " = " + j + ";");
            z++;
        }
    }
}
