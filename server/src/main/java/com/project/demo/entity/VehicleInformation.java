package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 车辆信息：(VehicleInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "VehicleInformation")
public class VehicleInformation implements Serializable {

    // VehicleInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vehicle_information_id")
    private Integer vehicle_information_id;

    // 车辆编号
    @Basic
    private String vehicle_number;
    // 车辆名称
    @Basic
    private String vehicle_name;
    // 车辆状态
    @Basic
    private String vehicle_status;
    // 车辆图片
    @Basic
    private String vehicle_image;
    // 车辆描述
    @Basic
    private String vehicle_description;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
