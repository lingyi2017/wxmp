package com.qmx.wxmp.common.utils;

public class DaemonThread extends Thread {
	public DaemonThread() {
		super();
		this.setDaemon(true);
	}
}
