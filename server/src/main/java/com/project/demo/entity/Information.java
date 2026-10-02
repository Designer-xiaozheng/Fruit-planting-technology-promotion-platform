package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 资讯信息：(Information)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "Information")
public class Information implements Serializable {

    // Information编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "information_id")
    private Integer information_id;

    // 资讯编号
    @Basic
    private String information_number;
    // 资讯标题
    @Basic
    private String information_title;
    // 发布日期
    @Basic
    private Timestamp release_date;
    // 资讯图片
    @Basic
    private String information_pictures;
    // 资讯内容
    @Basic
    private String information_content;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
