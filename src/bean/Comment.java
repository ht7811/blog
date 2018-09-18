package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "t_comment")
public class Comment {

	@Column(type = "varchar(100)", field = "id", primaryKey = true, defaultNull = false)
	private String id;

	@Column(type = "VARCHAR(100)", field = "user_id")
	private String userId; // 评论者id
	
	@Column(type = "VARCHAR(60)", field = "headerPic")
	private String headerPic;	// 头像

	@Column(type = "VARCHAR(600)", field = "content")
	private String content; // 评论内容

	@Column(type = "VARCHAR(100)", field = "article_id")
	private String articleId; // 文章id

	@Column(type = "datetime", field = "create_time")
	private String createTime; // 创建时间

	@Column(type = "timestamp", field = "update_time")
	private String updateTime; // 最后更新时间

	@Column(type = "int(1)", field = "is_delete")
	private Integer isDelete; // 删除状态 0未删除 1删除

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getHeaderPic() {
		return headerPic;
	}

	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", userId=" + userId + ",headerPic=" + headerPic + "content=" + content + ", articleId=" + articleId
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", isDelete=" + isDelete + "]";
	}
	
	

}
