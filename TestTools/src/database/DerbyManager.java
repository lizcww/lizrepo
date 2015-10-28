package database;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DerbyManager {
	private String driver = "org.apache.derby.jdbc.ClientDriver";
	private String url="jdbc:derby://localhost:1527/derby/repository.db;;create=true";
	private String username = "COCKPITSCHEMA";
	private String password = "COCKPITSCHEMA";
	
	Connection conn=null;
	
	
	/**
	 * Get ccmMessage feedback content from table COCKPITSCHEMA.CCM_OUT_MESSAGES
	 * Content is a zip file with a xml file in it.
	 * @throws Exception
	 */
	public void getBlob() throws Exception{
		Class.forName(driver).newInstance();
		conn=DriverManager.getConnection(url + ";user=" + username + ";password=" + password );
		Statement s=conn.createStatement();
		ResultSet rs=s.executeQuery("select content from COCKPITSCHEMA.CCM_OUT_MESSAGES");
		if(rs.next()){
			InputStream is = rs.getBlob("CONTENT").getBinaryStream();
			FileOutputStream fos = new FileOutputStream("C://tmp//feedback.zip");
			
			byte[] buff = new byte[1024];
			while ((is.read(buff)) != -1) {
				fos.write(buff);
			}
			fos.close();
			is.close();
		}
		
		
		conn.close();
	}
	
}
