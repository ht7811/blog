package bean;

import annotation.Column;
import annotation.Table;

import java.util.Date;

@Table(tableName = "t_article")
public class Article {

	@Column(field = "id", type = "varchar(100)", primaryKey = true)
	private String id;

	@Column(field = "header", type = "varchar(60)")
	private String header;//标题

	@Column(field = "name", type = "varchar(60)")
	private String name;	//文章名称

	@Column(field = "content", type = "text")
	private String content; //文章内容

	@Column(field = "author", type = "varchar(30)")
	private String author;	//作者

	@Column(field = "description", type = "varchar(100)")
	private String description;	//概要

	@Column(field = "is_published", type = "int(1)")
	private Integer isPublished;	//是否发布  0未发布   1发布

	@Column(field = "is_delete", type = "int(1)")
	private Integer isDelete;	//是否删除      0未删除   1删除

	@Column(field ="create_time", type = "datetime")
	private Date createTime;  //创建时间

	@Column(field = "update_time", type ="timestamp", defaultNull = false)
	private Date updateTime;	//最后更新时间
	
	@Column(field = "like", type = "int(30)")
	private Integer like;	//点赞数
	
	@Column(field = "reading", type = "int(30)")
	private Integer reading;	//阅读量

	@Column(field = "user_id", type = "varchar(100)", defaultNull = false)
	private String userId;		//作者id

	@Column(field = "type_id", type = "int(2)", defaultNull = false)
	private Integer typeId;		//分类id

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIsPublished() {
		return isPublished;
	}

	public void setIsPublished(Integer isPublished) {
		this.isPublished = isPublished;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getLike() {
		return like;
	}

	public void setLike(Integer like) {
		this.like = like;
	}

	public Integer getReading() {
		return reading;
	}

	public void setReading(Integer reading) {
		this.reading = reading;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", header=" + header + ", name=" + name + ", content=" + content + ", author="
				+ author + ", description=" + description + ", isPublished=" + isPublished + ", isDelete=" + isDelete
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", like=" + like + ", reading="
				+ reading + ", userId=" + userId + ", typeId=" + typeId + "]";
	}
	
}
