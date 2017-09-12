package utility;

public class StrUtil {

	public static int[] breakStr(String s,int n){
		int arr[]=new int[n];
		int j=0;
		for(int i=0;i<s.length();i++)
		{
			if(s.charAt(i)=='&'){
				arr[j]=Integer.parseInt(s.substring(0,i));
				s=s.substring(i+1);
				i=0;
				j++;
			}
		}
		arr[j]=Integer.parseInt(s);
		return arr;
	}
}
