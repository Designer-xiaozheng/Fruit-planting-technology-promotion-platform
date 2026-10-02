package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 人员信息：(PersonnelInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "PersonnelInformation")
public class PersonnelInformation implements Serializable {

    // PersonnelInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "personnel_information_id")
    private Integer personnel_information_id;

    // 人员姓名
    @Basic
    private String personnel_name;
    // 人员性别
    @Basic
    private String gender_of_personnel;
    // 人员工号
    @Basic
    private String personnel_id;
    // 人员职务
    @Basic
    private String personnel_position;
    // 联系电话
    @Basic
    private String contact_number;
    // 人员介绍
    @Basic
    private String personnel_introduction;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
