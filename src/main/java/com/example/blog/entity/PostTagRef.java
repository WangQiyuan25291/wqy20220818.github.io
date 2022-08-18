package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;



@Data
@TableName("post_tag_ref")
public class PostTagRef  extends BaseEntity {

    private static final long serialVersionUID = 1989776329130364722L;
    /**
     * 文章Id
     */
    private Long postId;

    /**
     * 标签Id
     */
    private Long tagId;

    public PostTagRef(Long postId, Long tagId) {
        this.postId = postId;
        this.tagId = tagId;
    }

    public PostTagRef() {
    }
}
