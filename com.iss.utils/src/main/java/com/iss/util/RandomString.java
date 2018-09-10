package com.iss.util;

import java.util.UUID;

/**
 * Created by yuanhuangd on 2017/7/27.
 */
public class RandomString {

    public static String getUUID () {
        String id = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
        return id;
    }
}
