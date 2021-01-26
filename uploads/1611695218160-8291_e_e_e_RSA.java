
import java.util.*;
import java.math.*;
 
public class RSA
{
	
 public static double Encrypt(int msg,int prime1,int prime2) {
	int n,z,d=0,e,i;
	double c;
	n=prime1*prime2;
	z=(prime1-1)*(prime2-1);
	System.out.println("the value of z = "+z); 
	for(e=2;e<z;e++)
	 {
	 if(gcd(e,z)==1)            // e is for public key exponent
	 { 
	 break;
	 }
	 }
	 System.out.println("the value of e = "+e); 
	 for(i=0;i<=9;i++)
	 {
	 int x=1+(i*z);
	 if(x%e==0)      //d is for private key exponent
	 {
	 d=x/e;
	 break;
	 }
	 }
	 System.out.println("the value of d = "+d); 
	 c=(Math.pow(msg,e))%n;
	 System.out.println("Encrypted message is : -");
	 System.out.println(c);
	 return c;
 }
 
 public static BigInteger Decrypt(double msg,int prime1,int prime2) {
	BigInteger msgback; 
	int n,e,z,i,d=0;
	n=prime1*prime2;
	z=(prime1-1)*(prime2-1);
	for(e=2;e<z;e++)
	 {
	 if(gcd(e,z)==1)            // e is for public key exponent
	 { 
	 break;
	 }
	 }
	 System.out.println("the value of e = "+e); 
	 for(i=0;i<=9;i++)
	 {
	 int x=1+(i*z);
	 if(x%e==0)      //d is for private key exponent
	 {
	 d=x/e;
	 break;
	 }
	 }
	//converting int value of n to BigInteger
	BigInteger N = BigInteger.valueOf(n);
	//converting float value of c to BigInteger
	BigInteger C = BigDecimal.valueOf(msg).toBigInteger();
 	msgback = (C.pow(d)).mod(N);
 	System.out.println("Derypted message is : -");
 	System.out.println(msgback);
 	return msgback;
 }
 
 static int gcd(int e, int z)
 {
 if(e==0)
 return z; 
 else
 return gcd(z%e,e);
 }
}
