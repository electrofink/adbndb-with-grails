package tests;

import java.text.ParseException;

import junit.framework.Assert;

import org.junit.Test;

import util.DateUtil;

public class DateUtilTests {

	@Test
	public void validate() {
		boolean b = DateUtil.checkRegEx("12");
		Assert.assertTrue(b);
		b = DateUtil.checkRegEx("123");
		Assert.assertTrue(b);
		b = DateUtil.checkRegEx("1234-1");
		Assert.assertFalse(b);
		b = DateUtil.checkRegEx("1234-12");
		Assert.assertTrue(b);
		b = DateUtil.checkRegEx("1234-12-1");
		Assert.assertFalse(b);
		b = DateUtil.checkRegEx("1234-12-12");
		Assert.assertTrue(b);
	}

	@Test
	public void getDate() {
		try {
			String date = "1900-45-21";
			java.util.Date d1 = DateUtil.parseToDate(date);
			Assert.assertTrue(d1 == null);
			
			date = "190-12-34";
			java.util.Date d2 = DateUtil.parseToDate(date);
			Assert.assertTrue(d2 == null);
			
			date = "1900-12-13";
			java.util.Date d3 = DateUtil.parseToDate(date);
			System.out.printf("d3 %s -> ", d3);
			System.out.println(DateUtil.getStringFromDate(d3));
			Assert.assertTrue(d3 != null);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
