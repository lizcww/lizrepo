package internet;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.junit.Test;

public class Download {

	@Test
	public void download() throws Exception{
		String urlPath= "http://confluence.assentis.info/download/temp/download603fI081336.zip?contentType=application/zip";
		URL url = new URL(urlPath);
		HttpURLConnection conn =(HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setConnectTimeout(60*1000);
		String username = "li.zhuang";
		String password = "_welcome2013";
		String input = username + ":" + password;
		String encoding = new sun.misc.BASE64Encoder().encode(input.getBytes());
		conn.setRequestProperty("Authorization", "Basic " + encoding);
		
		if(conn.getResponseCode() == 200){
            InputStream inputStream = conn.getInputStream();

            byte[] data = readInstream(inputStream);
            File file = new File("C://tmp//CLASSIC-12917pngs.zip");
            FileOutputStream outputStream = new FileOutputStream(file);
            outputStream.write(data);
            outputStream.close();  
		}
		
	}

	private byte[] readInstream(InputStream inputStream) throws Exception {
		ByteArrayOutputStream byteArrayOutPutStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int length = -1;
		while ((length = inputStream.read(buffer)) != -1) {
			byteArrayOutPutStream.write(buffer, 0, length);
		}
		;
		byteArrayOutPutStream.close();
		inputStream.close();

		return byteArrayOutPutStream.toByteArray();
	}

}
