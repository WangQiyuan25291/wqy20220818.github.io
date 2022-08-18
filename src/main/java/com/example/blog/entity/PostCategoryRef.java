package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;



@Data
@TableName("post_category_ref")
public class PostCategoryRef  extends BaseEntity {

    private static final long serialVersionUID = 1989776329130364722L;
    /**
     * 文章Id
     */
    private Long postId;

    /**
     * 分类Id
     */
    private Long cateId;

    public PostCategoryRef(Long postId, Long cateId) {
        this.postId = postId;
        this.cateId = cateId;
    }

    public PostCategoryRef() {
    }
}
