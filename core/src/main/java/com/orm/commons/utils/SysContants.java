package com.orm.commons.utils;

public class SysContants {

	/**
	 * 新闻的发布状态
	 *
	 * @author nick
	 *
	 */
	public static class DeployStatus {

		/**
		 * 已发布
		 */
		public static final boolean DEPLOY = true;

		private static final String DEPLOY_NAME = "已发布";

		/**
		 * 未发布
		 */
		public static final boolean NODEPLOY = false;
		private static final String NODEPLOYNAME = "未发布";

		/**
		 * 获得发布状态的名称
		 *
		 * @param code
		 * @return
		 */
		public static String getName(boolean code) {
			String name = "";
			Integer flag = 0;
			if (code) {
				flag = 1;
			}
			switch (flag) {
			case 1:
				name = DEPLOY_NAME;
				break;
			case 0:
				name = NODEPLOYNAME;
				break;
			}
			return name;
		}
	}

	/**
	 * 是否删除
	 *
	 * @author Curtain
	 *
	 */
	public static class IsDelete {
		private final static Integer _NO = 0;
		private final static Integer _YES = 1;
		public final static String NO = "0";
		public final static String YES = "1";

		public static String getIsDeleteName(String code) {
			String name = "";
			if (_NO == 0) {
				name = "否";
			} else if (_YES == 1) {
				name = "是";
			}
			return name;
		}
	}

	/**
	 * 是否可用状态
	 *
	 * @author nick
	 *
	 */
	public static class IsDisable {

		public static final String DISABLE = "0";
		private static final String DISABLE_NAME = "不可用";
		public static final String NODISABLE = "1";
		private static final String NODISABLE_NAME = "可用";

		public static String getName(String code) {
			String name = "";
			switch (Integer.parseInt(code)) {
			case 1:
				name = NODISABLE_NAME;
				break;

			case 0:
				name = DISABLE_NAME;
				break;
			}
			return name;
		}
	}

	/**
	 * 是否显示
	 *
	 * @author Curtain
	 *
	 */
	public static class IsDisplay {
		private final static Integer _NO = 0;
		private final static Integer _YES = 1;
		public final static String NO = "0";
		public final static String YES = "1";

		public static String getIsDispalyName(String code) {
			int cString = Integer.parseInt(code);
			String name = "";
			if (cString == _YES) {
				name = "显示";
			} else if (cString == _NO) {
				name = "不显示";
			}
			return name;
		}
	}

	/**
	 * 是否置顶
	 *
	 * @author Curtain
	 *
	 */
	public static class IsTop {
		private final static Integer _NO = 0;
		private final static Integer _YES = 1;

		public final static String NO = "0";
		public final static String YES = "1";

		public static String getIsTopName(String code) {
			String name = "";
			if (_NO == 0) {
				name = "否";
			} else if (_YES == 1) {
				name = "是";
			}
			return name;
		}
	}

}
