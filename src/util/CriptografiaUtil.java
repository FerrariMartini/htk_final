package util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.concurrent.ExecutionException;

public class CriptografiaUtil {
    public static String criptografar(String pwd) throws Exception{
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pwd.getBytes("ISO-8859-1"));

        BigInteger hash = new BigInteger(1, md.digest());

        return hash.toString(16);
    }
}
