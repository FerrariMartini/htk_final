package model.service;

public class ImcCaculation {
    /**
     * metodo publico para fazer o calculo inicial do IMC.
     *
     * @param: peso inicial e altura inicial.
     * @return: deve retornar um valor float que é o IMC e adicionar na variável initIMC;
     */
    public static double evaluateImc(double weight, double height) {
        double imc = weight / (height * height);
        return imc;
    }
}
