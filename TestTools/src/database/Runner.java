package database;

public class Runner {
	public static void main(String[] args) throws Exception{
		DerbyManager dm = new DerbyManager();
		dm.getBlob();
	}
}
