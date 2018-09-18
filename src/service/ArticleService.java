package service;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import util.DataBaseUtils;

public class ArticleService {
	
	/**
	 * 获取最新更新的文章
	 * @param new_number
	 * @return
	 */
	public List<Map<String, Object>> getNewArticle(Integer new_number){
		String sql = "select * from t_article order by update_time desc limit 0,?";
		return DataBaseUtils.queryForList(sql, new_number);
	}
	
	/**
	 * 通过类别获取文章
	 * @param categoryId
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Map<String,Object>> getArticlesByTypeId(Integer typeId, Integer start, Integer end){
		String sql = "select id,header,name,author,description,like,reading from t_article where 1 = 1 and is_delete = 0"
				+ " and is_published = 1 and type_id = ?"
				+ " order by update_time desc limit ?,?";
		return DataBaseUtils.queryForList(sql, typeId, start, end);
	}
	
	/**
	 * 通过文章id获取文章内容
	 * @param id
	 * @return
	 */
	public Map<String, Object> getContentByArticleId(String id){
		String sql = "select * from t_article a inner join t_type b on a.type_id = b.type_id where a.id = ?";
		return DataBaseUtils.queryForList(sql, id).get(0);
	}
	
	
	public Integer countPeople(){
		int number = 0;  
        File file = new File("count.txt");  
    	if(!file.exists())  
        {  
            number++;  
            try{  
                file.createNewFile();  
                FileOutputStream out = new FileOutputStream("count.txt");  
                DataOutputStream dataOut = new DataOutputStream(out);  
                dataOut.writeInt(number);  
                dataOut.close();  
            }catch(IOException ex){}  
        }  
        else   
            try{  
                FileInputStream in = new FileInputStream("count.txt");  
                DataInputStream dataIn = new DataInputStream(in);  
                number = dataIn.readInt();  
                number++;  
                in.close();  
                dataIn.close();  
                FileOutputStream out = new FileOutputStream("count.txt");  
                DataOutputStream dataOut = new DataOutputStream(out);  
                dataOut.writeInt(number);  
                out.close();  
                dataOut.close();  
            }catch(IOException ex){}
		return number;  
	}	
}
