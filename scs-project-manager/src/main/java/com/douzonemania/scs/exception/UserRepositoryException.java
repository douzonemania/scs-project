package com.douzonemania.scs.exception;

public class UserRepositoryException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public UserRepositoryException() {
		super("UserRepositoryException Occurs");
	}
	
	public UserRepositoryException(String Message) {
		super(Message);
	}
	
}
