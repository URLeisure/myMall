package com.shi.mall;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/24 20:16
 **/


public class Main {

    public static int[][] solution(int[][] matrix, int times) {
        // 在这⾥写代码
        int len = matrix.length;
        System.out.println(len);
        int[][] res = new int[len][len];
        while (times-- > 0) {
            for (int i = 0; i < len; i++) {
                for (int j = 0; j < len; j++) {
                    res[i][j] = matrix[j][len - i + 1];
                }
            }
            matrix = res;
        }
        return res;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int n = input.nextInt();
        int[][] a = new int[105][105];
        int[][] b = new int[105][105];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                a[i][j] = input.nextInt();
            }
        }
        Integer integer = Integer.valueOf(1);
        BigDecimal sd = new BigDecimal(1);


    }


}

