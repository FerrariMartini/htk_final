package testes;

import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;

import java.text.NumberFormat;
import java.util.Locale;

public class testes {

    public static void main(String[] args) {


        try {

            Locale lcBRL = new Locale("pt", "BR");
            Locale lcUS = new Locale("en", "US");

            NumberFormat fBRL = NumberFormat.getInstance(lcBRL);
            NumberFormat fUS = NumberFormat.getInstance(lcUS);

            //recebendo a string do frontend
            String brl2 = "2.322,10";

            // converte uma string no formato brasileiro para um number no formato US
            Number brl3 = fBRL.parse(brl2);

            // converte em Double o Number
            Double brl4 = (Double) brl3;

            System.out.println("BRL3" + " " + brl3);
            System.out.println("BRL3" + " " +  brl3);

            if(brl3 instanceof Double){
                System.out.println("é um double");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


//            brl2 = brl2.replace(",", ";");
//            brl2 = brl2.replace(".", "");
//            brl2 = brl2.replace(";", ".");


//            System.out.println(brl2);