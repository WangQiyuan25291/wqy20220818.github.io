package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;


@Data
@TableName("black_word")
public class BlackWord extends BaseEntity {

    /**
     * 内容
     */
    private String content;
}
