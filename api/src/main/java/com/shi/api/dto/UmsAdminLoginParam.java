package com.shi.api.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 22:32
 **/
@Data
public class UmsAdminLoginParam implements Serializable {
    @ApiModelProperty(value = "用户名",required = true)
    @NotEmpty(message = "用户名不能为空")
    private String username;

    @ApiModelProperty(value = "密码",required = true)
    @NotEmpty(message = "密码不能为空")
    private String password;
}
