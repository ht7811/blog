package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.mysql.jdbc.UpdatableResultSet;

import bean.Comment;
import bean.User;
import util.DataBaseUtils;
import util.TableUtils;

public class TestMain {

	public static void main(String[] args) throws SQLException{
		String sql = TableUtils.getCreateTableSQL(Comment.class);
		System.out.println(sql);
		
		DataBaseUtils.config("jdbc.properties");
		Connection conn = DataBaseUtils.getConnection();
		System.out.println(conn);
		
		String id = UUID.randomUUID() + "";
		String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		DataBaseUtils.update("INSERT INTO t_user(id,username,password,sex,create_time,is_delete,address,telephone) "
		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", id,"咦，我怎么在这里",123456,0,createTime,0,"保密","保密");
		
		List list = DataBaseUtils.queryForList("select * from t_user");
		System.out.println(list);
		
		Map map = DataBaseUtils.queryForMap("select * from t_user where username = ?","咦，我怎么在这里");
		System.out.println(map);
		
		
		User user = DataBaseUtils.queryForBean("select * from t_user  limit 1", User.class);
		System.out.println(user);
		
		
		
		
		
		
		
	}
	
}
