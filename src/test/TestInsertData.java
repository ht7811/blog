package test;


import util.DataBaseUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;

import bean.Article;
import bean.Comment;
import service.ArticleService;
import service.CommentService;

public class TestInsertData {

    /**
     * 测试：给文章插入数据
     */
    //@Test
    public void insertArticle(){
        String sql = "INSERT INTO t_article(id,header,name,content,author,"
                +"description,is_published,is_delete,create_time,update_time,"
                +"user_id,type_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ";
        String id = UUID.randomUUID().toString();   //主键
        String header = "echarts学习(3)";
        String name = "云服务器上JavaWeb项目运行环境需要安装些什么？";
        String content = "一直在百度上找云服务器环境搭建的资料，一直没有找到合适的，所以就自己把自己这几天踩坑总结出来的安装经验在这里给大家分享。从购买云服务器及域名，到域名解析，javaweb项目demo搭建，到tomcat、jdk、mysql安装，在这里都会说到";
        String author  = "咦，我怎么在这里";
        String description = "一些云服务器环境搭建的问题";
        int isPublished = 1;
        int isDelete = 0;
        String create_time = "2018-05-24 15:23:00";
        String update_time = "2018-05-24 15:23:00";
        String userId = "199200c3-550a-4f9f-80cf-deebe2376528";
        int typeId = 3;
        DataBaseUtils.update(sql,id,header,name,content,author,description,isPublished,isDelete,create_time,update_time,userId,typeId);
        System.out.println("新增成功！");
    }
    
    
    /**
     * 根据id获取这个id的一条数据
     * @throws SQLException
     */
    
    public void getArticle() throws SQLException{
    	String sql = "select * from t_article where id = ?";
    	Article article = DataBaseUtils.queryForBean(sql, Article.class, "4db40793-7bb1-418a-ba0e-2782532a5491");
    	System.out.println(article);
    }
    
    /**
     * 测试：插入分类数据
     */
    //@Test
    public void insertCategory(){
    	DataBaseUtils.update("insert into t_type set type_name = ?", "Vue.js");
    	DataBaseUtils.update("insert into t_type set type_name = ?", "Java");
    	DataBaseUtils.update("insert into t_type set type_name = ?", "other");
    }
    
    /**
     * 测试：通过类别获取文章列表
     */
    // @Test
    public void getCategoryList(){
    	//String sql = "select * from t_category where 1 = 1";
    	//List list = DataBaseUtils.queryForList(sql);
    	
    	ArticleService articleService = new ArticleService();
        List list = articleService.getArticlesByTypeId(2, 0, 3);
    	System.out.println(list);
    }
    
    
    /**
     * 测试：根据文章id查询文章内容等信息
     */
    //@Test
    public void findArticleById(){
    	ArticleService articleService = new ArticleService();
    	Map<String, Object> list = articleService.getContentByArticleId("f9f994b4-45d5-4b24-8d68-b2cb14898505");
    	System.out.println(list);
    }
    
    /**
     * 测试：获取最新更新的10条文章数据
     */
    //@Test
    public void findNewArticle(){
    	ArticleService articleService = new ArticleService();
    	List list = articleService.getNewArticle(10);
    	System.out.println(list);
    }
    
    
    /**
     * 测试：保存评论，console输出查询出来的评论
     */
    //@Test
    public void testSaveComment(){
    	CommentService cs = new CommentService();
    	Comment comment = new Comment();
    	comment.setId(UUID.randomUUID().toString());
    	comment.setContent("赞一个！");
    	comment.setArticleId("f9f994b4-45d5-4b24-8d68-b2cb14898505");
    	comment.setUserId("5346acde-4571-4317-8545-73ab2ed57973");
    	cs.saveComment(comment);
    	System.out.println("保存成功！");
    	System.out.println(DataBaseUtils.queryForList("select a.content, from t_comment a left JOIN t_user b "
    			+ "on a.user_id = b.id a.headerPic = b.headerPic where a.article_id = 'f9f994b4-45d5-4b24-8d68-b2cb14898505'"));
    	
    }
    
    /**
     * 测试：根据文章id查询它的所有评论
     */
    @Test
    public void testFindArticleComment(){
    	CommentService cs = new CommentService();
    	System.out.println(cs.getCommentsByArticleId("f9f994b4-45d5-4b24-8d68-b2cb14898505"));
    }
    
    
    
    
    
    
    
    
    
}
