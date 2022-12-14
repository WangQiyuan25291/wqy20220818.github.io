package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import com.example.blog.util.RelativeDateFormat;
import lombok.Data;



@Data
@TableName("post_like_ref")
public class PostLikeRef extends BaseEntity {

    /**
     * 点赞人ID
     */
    private Long userId;

    /**
     * 文章ID
     */
    private Long postId;

    @TableField(exist = false)
    private Post post;

    @TableField(exist = false)
    private User user;


    /**
     * 创建时间
     */
    @TableField(exist = false)
    private String createTimeStr;

    public String getCreateTimeStr() {
        return RelativeDateFormat.format(getCreateTime());
    }
}
