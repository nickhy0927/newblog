package com.iss.exception;

/**
 * Created by yuanhuangd on 2017/7/25.
 */
@SuppressWarnings("serial")
public class LockedException extends Exception {

    public LockedException() {
        super();
    }

    public LockedException(String message) {
        super(message);
    }

    public LockedException(String message, Throwable cause) {
        super(message, cause);
    }

    public LockedException(Throwable cause) {
        super(cause);
    }

    protected LockedException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
