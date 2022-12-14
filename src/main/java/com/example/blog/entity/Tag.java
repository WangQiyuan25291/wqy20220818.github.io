package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;



@Data
@TableName("tag")
public class Tag extends BaseEntity {

    /**
     * 标签名称
     */
    private String tagName;


    /**
     * 数量
     */
    @TableField(exist = false)
    private Integer count;

}
