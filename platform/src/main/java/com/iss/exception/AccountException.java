package com.iss.exception;

/**
 * Created by yuanhuangd on 2017/7/25.
 */
@SuppressWarnings("serial")
public class AccountException extends Exception {
	
	public AccountException() {
		super();
	}

	public AccountException(String message) {
		super(message);
	}

	public AccountException(String message, Throwable cause) {
		super(message, cause);
	}

	public AccountException(Throwable cause) {
		super(cause);
	}

	protected AccountException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
