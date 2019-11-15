package testes;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class testes {

    public static void main(String[] args) {

         SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");

        try {

            String data = "12-09-1983";

            Date hoje = sfd.parse(data);

            System.out.println(hoje);







            String id = "22566738807";

            Long id2 = Long.parseLong(id);

            System.out.println(id2);


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
            System.out.println("BRL3" + " " + brl3);

            if (brl3 instanceof Double) {
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