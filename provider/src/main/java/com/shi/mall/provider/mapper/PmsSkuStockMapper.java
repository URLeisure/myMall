package com.shi.mall.provider.mapper;

import com.shi.api.model.PmsSkuStock;
import com.shi.api.model.PmsSkuStockExample;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface PmsSkuStockMapper {
    @SelectProvider(type=PmsSkuStockSqlProvider.class, method="countByExample")
    long countByExample(PmsSkuStockExample example);

    @DeleteProvider(type=PmsSkuStockSqlProvider.class, method="deleteByExample")
    int deleteByExample(PmsSkuStockExample example);

    @Delete({
        "delete from pms_sku_stock",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    @Insert({
        "insert into pms_sku_stock (id, product_id, ",
        "sku_code, price, ",
        "stock, low_stock, ",
        "sp1, sp2, sp3, ",
        "pic, sale, promotion_price, ",
        "lock_stock)",
        "values (#{id,jdbcType=BIGINT}, #{productId,jdbcType=BIGINT}, ",
        "#{skuCode,jdbcType=VARCHAR}, #{price,jdbcType=DECIMAL}, ",
        "#{stock,jdbcType=INTEGER}, #{lowStock,jdbcType=INTEGER}, ",
        "#{sp1,jdbcType=VARCHAR}, #{sp2,jdbcType=VARCHAR}, #{sp3,jdbcType=VARCHAR}, ",
        "#{pic,jdbcType=VARCHAR}, #{sale,jdbcType=INTEGER}, #{promotionPrice,jdbcType=DECIMAL}, ",
        "#{lockStock,jdbcType=INTEGER})"
    })
    int insert(PmsSkuStock record);

    @InsertProvider(type=PmsSkuStockSqlProvider.class, method="insertSelective")
    int insertSelective(PmsSkuStock record);

    @SelectProvider(type=PmsSkuStockSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="product_id", property="productId", jdbcType=JdbcType.BIGINT),
        @Result(column="sku_code", property="skuCode", jdbcType=JdbcType.VARCHAR),
        @Result(column="price", property="price", jdbcType=JdbcType.DECIMAL),
        @Result(column="stock", property="stock", jdbcType=JdbcType.INTEGER),
        @Result(column="low_stock", property="lowStock", jdbcType=JdbcType.INTEGER),
        @Result(column="sp1", property="sp1", jdbcType=JdbcType.VARCHAR),
        @Result(column="sp2", property="sp2", jdbcType=JdbcType.VARCHAR),
        @Result(column="sp3", property="sp3", jdbcType=JdbcType.VARCHAR),
        @Result(column="pic", property="pic", jdbcType=JdbcType.VARCHAR),
        @Result(column="sale", property="sale", jdbcType=JdbcType.INTEGER),
        @Result(column="promotion_price", property="promotionPrice", jdbcType=JdbcType.DECIMAL),
        @Result(column="lock_stock", property="lockStock", jdbcType=JdbcType.INTEGER)
    })
    List<PmsSkuStock> selectByExample(PmsSkuStockExample example);

    @Select({
        "select",
        "id, product_id, sku_code, price, stock, low_stock, sp1, sp2, sp3, pic, sale, ",
        "promotion_price, lock_stock",
        "from pms_sku_stock",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="product_id", property="productId", jdbcType=JdbcType.BIGINT),
        @Result(column="sku_code", property="skuCode", jdbcType=JdbcType.VARCHAR),
        @Result(column="price", property="price", jdbcType=JdbcType.DECIMAL),
        @Result(column="stock", property="stock", jdbcType=JdbcType.INTEGER),
        @Result(column="low_stock", property="lowStock", jdbcType=JdbcType.INTEGER),
        @Result(column="sp1", property="sp1", jdbcType=JdbcType.VARCHAR),
        @Result(column="sp2", property="sp2", jdbcType=JdbcType.VARCHAR),
        @Result(column="sp3", property="sp3", jdbcType=JdbcType.VARCHAR),
        @Result(column="pic", property="pic", jdbcType=JdbcType.VARCHAR),
        @Result(column="sale", property="sale", jdbcType=JdbcType.INTEGER),
        @Result(column="promotion_price", property="promotionPrice", jdbcType=JdbcType.DECIMAL),
        @Result(column="lock_stock", property="lockStock", jdbcType=JdbcType.INTEGER)
    })
    PmsSkuStock selectByPrimaryKey(Long id);

    @UpdateProvider(type=PmsSkuStockSqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") PmsSkuStock record, @Param("example") PmsSkuStockExample example);

    @UpdateProvider(type=PmsSkuStockSqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") PmsSkuStock record, @Param("example") PmsSkuStockExample example);

    @UpdateProvider(type=PmsSkuStockSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(PmsSkuStock record);

    @Update({
        "update pms_sku_stock",
        "set product_id = #{productId,jdbcType=BIGINT},",
          "sku_code = #{skuCode,jdbcType=VARCHAR},",
          "price = #{price,jdbcType=DECIMAL},",
          "stock = #{stock,jdbcType=INTEGER},",
          "low_stock = #{lowStock,jdbcType=INTEGER},",
          "sp1 = #{sp1,jdbcType=VARCHAR},",
          "sp2 = #{sp2,jdbcType=VARCHAR},",
          "sp3 = #{sp3,jdbcType=VARCHAR},",
          "pic = #{pic,jdbcType=VARCHAR},",
          "sale = #{sale,jdbcType=INTEGER},",
          "promotion_price = #{promotionPrice,jdbcType=DECIMAL},",
          "lock_stock = #{lockStock,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(PmsSkuStock record);
}
