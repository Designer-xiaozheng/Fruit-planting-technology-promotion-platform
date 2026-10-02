package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 物流信息：(LogisticsInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "LogisticsInformation")
public class LogisticsInformation implements Serializable {

    // LogisticsInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "logistics_information_id")
    private Integer logistics_information_id;

    // 订单编号
    @Basic
    private String order_number;
    // 用户信息
    @Basic
    private Integer user_information;
    // 用户姓名
    @Basic
    private String user_name;
    // 联系电话
    @Basic
    private String contact_number;
    // 寄送物品
    @Basic
    private String sending_items;
    // 物品数量
    @Basic
    private String number_of_items;
    // 收件人
    @Basic
    private String addressee;
    // 收件电话
    @Basic
    private String receiving_phone_number;
    // 收件地址
    @Basic
    private String shipping_address;
    // 车辆名称
    @Basic
    private String vehicle_name;
    // 物流描述
    @Basic
    private String logistics_description;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
