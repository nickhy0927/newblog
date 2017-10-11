package com.iss.emuns;

/**
 * Created by yuanhuangd on 2017/8/9.
 */
public class SysConstant {

	public static class ApprovalStatus {
		public final static int DEFUALT = 0;
		public final static int PASS = 1;
		public final static int REFUSE = 2;

		public static String getName(Integer status) {
			switch (status) {
			case DEFUALT: {
				return "未审核";
			}
			case PASS: {
				return "审核通过";
			}
			case REFUSE: {
				return "审核拒绝";
			}
			default: {
				return "未审核";
			}
			}
		}
	}

	public static class isGroom {
		public final static int DEFUALT = 0;
		public final static int GROOM = 1;

		public static String getName(Integer status) {
			switch (status) {
				case DEFUALT: {
					return "未推荐";
				}
				case GROOM: {
					return "已推荐";
				}
				default: {
					return "未推荐";
				}
			}
		}
	}
}
