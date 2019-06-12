package com.jungle.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 鏃ユ湡鐨勫伐鍏风被
 *
 * @author 闄堝織绁?
 */
public class DateUtils {
    /**
     * 鎶婁竴涓瓧绗︿覆杞垚鏃ユ湡
     *
     * @param sdate 鏃ユ湡瀛楃涓诧紝鎸囧畾鏍煎紡涓? 2015-05-05
     * @return 杩斿洖涓?涓猟ate瀵硅薄
     * @throws ParseException 杞崲澶辫触
     */
    public static Date stringToDate(String sdate) throws ParseException {
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
        return ymd.parse(sdate);
    }

    /**
     * 灏嗕竴涓棩鏈熷璞¤浆鎹㈡垚鎸囧畾鏍煎紡鐨勫瓧绗︿覆<br/> 2015-05-05
     *
     * @param date
     * @return
     * @throws ParseException
     */
    public static String dateToString(Date date) throws ParseException {
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
        return ymd.format(date);
    }

    /**
     * 灏嗕竴涓棩鏈熷璞¤浆鎹㈡垚鎸囧畾鏍煎紡鐨勫瓧绗︿覆<br/> 2015-05-05
     *
     * @param date
     * @return
     * @throws ParseException
     */
    public static String dateToString1(Date date) throws ParseException {
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM");
        return ymd.format(date);
    }

    /**
     * 灏嗕竴涓棩鏈熷璞¤浆鎹㈡垚鎸囧畾鏍煎紡鐨勫瓧绗︿覆<br/> 2015-05-05
     *
     * @param date
     * @return
     * @throws ParseException
     */
    public static String dateToString2(Date date) throws ParseException {
        SimpleDateFormat ymd = new SimpleDateFormat("dd");
        return ymd.format(date);
    }

    //鑾峰彇浼犲叆鏃堕棿鐨勬湀鏈?鍚庝竴澶?
    public static String getMontheLastDay(String date) throws ParseException {

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date dt = df.parse(date);
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.MONTH, 1);
        c.set(Calendar.DAY_OF_MONTH, 0);//璁剧疆涓?1鍙?,褰撳墠鏃ユ湡鏃负鏈湀绗竴澶?
        Date rdate = c.getTime();
        return dateToString2(rdate);
    }

    //public static void main(String str[]) throws ParseException
    //{
    //System.out.println(getMontheLastDay("2015-04-15"));
    //System.out.println(dateToString(getSysdateUpLastDate()));
    //}

    //鑾峰彇绯荤粺褰撳墠鏃堕棿鐨勪笂涓?涓湀鍙婃湀鏈渶鍚庝竴澶?
    public static Date getSysdateUpLastDate() {
        Calendar cale = Calendar.getInstance();
        cale.set(Calendar.DAY_OF_MONTH, 0);//璁剧疆涓?1鍙?,褰撳墠鏃ユ湡鏃负鏈湀绗竴澶?
        Date date = cale.getTime();
        return date;
    }

//	public static void main(String str[])
//	{
//		System.out.println(compare_dates("2015-12-06","2015-12-03","2015-12-05"));
//	}

    public static int compare_date(String DATE1, String DATE2) {


        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() > dt2.getTime()) {
                System.out.println("dt1 鍦╠t2鍓?");
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                System.out.println("dt1鍦╠t2鍚?");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }

    public static boolean compare_dates(String DATE1, String DATE2, String DATE3) {


        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            Date dt3 = df.parse(DATE3);
            if (dt1.getTime() >= dt2.getTime() && dt1.getTime() <= dt3.getTime()) {
                return true;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return false;
    }

//	 public static int compare_date(String DATE1, String DATE2) {
//	        
//	        
//	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//	        try {
//	            Date dt1 = df.parse(DATE1);
//	            Date dt2 = df.parse(DATE2);
//	            if (dt1.getTime() > dt2.getTime()) {
//	                System.out.println("dt1 鍦╠t2鍓?");
//	                return 1;
//	            } else if (dt1.getTime() < dt2.getTime()) {
//	                System.out.println("dt1鍦╠t2鍚?");
//	                return -1;
//	            } else {
//	                return 0;
//	            }
//	        } catch (Exception exception) {
//	            exception.printStackTrace();
//	        }
//	        return 0;
//	    }

//	public static void main(String str[]) throws ParseException
//	{
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
//		//鑾峰彇鍓嶆湀鐨勭涓?澶?
//        Calendar   cal_1=Calendar.getInstance();//鑾峰彇褰撳墠鏃ユ湡 
//        cal_1.add(Calendar.MONTH, -1);
//        cal_1.set(Calendar.DAY_OF_MONTH,1);//璁剧疆涓?1鍙?,褰撳墠鏃ユ湡鏃负鏈湀绗竴澶? 
//        String firstDay = format.format(cal_1.getTime());
//        System.out.println("-----1------firstDay:"+firstDay);
//        //鑾峰彇鍓嶆湀鐨勬渶鍚庝竴澶?
//        Calendar cale = Calendar.getInstance();   
//        cale.set(Calendar.DAY_OF_MONTH,0);//璁剧疆涓?1鍙?,褰撳墠鏃ユ湡鏃负鏈湀绗竴澶? 
//        String lastDay = format.format(cale.getTime());
//        System.out.println("-----2------lastDay:"+lastDay);
//	}

    /**
     * 瀵逛竴涓棩鏈熻繘琛屽姞鍑忔搷浣滐紝濡傛灉涓烘鏁板垯鏄姞锛屽鏋滀负璐熸暟鍒欐槸鍑?
     *
     * @param date    鏃ユ湡瀵硅薄
     * @param datenum 姣斿璇翠竴涓?1锛屽垯鍔犱竴澶╋紝-1鍒欏噺涓?澶?
     * @return 杩斿洖涓?涓棩鏈熷璞?
     */
    public static Date ctrlDate(Date date, int datenum) {
        Calendar calender = new GregorianCalendar();
        calender.setTime(date);
        calender.add(calender.DATE, datenum);
        return calender.getTime();
    }


    /**
     * 寰楀埌鎸囧畾澶╂暟鐨勬渶鍚庝竴绉掗挓
     *
     * @param date 鎸囧畾鐨勬棩鏈熷璞?
     * @return 杩斿洖鎸囧畾鏃ユ湡鐨勬渶鍚庝竴绉掞細2015-06-30 23:59:59
     * @throws ParseException
     */
    public static String getDayLastTime(Date date) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String str = format.format(date);
        Date d2 = format.parse(str);
        int dayMis = 1000 * 60 * 60 * 24;//涓?澶╃殑姣-1
        //杩斿洖鑷? 1970 骞? 1 鏈? 1 鏃? 00:00:00 GMT 浠ユ潵姝? Date 瀵硅薄琛ㄧず鐨勬绉掓暟銆?
        long curMillisecond = d2.getTime();//褰撳ぉ鐨勬绉?
        long resultMis = curMillisecond + (dayMis - 1); //褰撳ぉ鏈?鍚庝竴绉?
        DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //寰楀埌鎴戦渶瑕佺殑鏃堕棿    褰撳ぉ鏈?鍚庝竴绉?
        Date resultDate = new Date(resultMis);
        String lastTime = format2.format(resultDate);
        System.out.println("褰撳ぉ鐨勬渶鍚庝竴绉?:" + lastTime);
        return lastTime;
    }

    /**
     * 寰楀埌鎸囧畾澶╂暟鐨勬渶鍚庝竴绉掗挓
     *
     * @param date 瀛楃涓茬被鍨嬬殑鏃ユ湡锛屾牸寮忓繀椤讳负:2015-06-30
     * @return 杩斿洖褰撳ぉ鐨勬渶鍚庝竴绉掞紝瀛楃涓?2015-06-30 23:59:59
     * @throws ParseException
     */
    public static String getDayLastTime(String date) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date d = format.parse(date);
        String str = format.format(d);
        Date d2 = format.parse(str);
        int dayMis = 1000 * 60 * 60 * 24;//涓?澶╃殑姣-1
        //杩斿洖鑷? 1970 骞? 1 鏈? 1 鏃? 00:00:00 GMT 浠ユ潵姝? Date 瀵硅薄琛ㄧず鐨勬绉掓暟銆?
        long curMillisecond = d2.getTime();//褰撳ぉ鐨勬绉?
        long resultMis = curMillisecond + (dayMis - 1); //褰撳ぉ鏈?鍚庝竴绉?
        DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //寰楀埌鎴戦渶瑕佺殑鏃堕棿    褰撳ぉ鏈?鍚庝竴绉?
        Date resultDate = new Date(resultMis);
        String lastTime = format2.format(resultDate);
        System.out.println("褰撳ぉ鐨勬渶鍚庝竴绉?:" + lastTime);
        return lastTime;
    }

    /**
     * 浼犱竴涓瓧绗︿覆杩涙潵锛屾牴鎹紶鍏ョ殑褰撳墠鏃堕棿鏍煎紡锛屽笇鏈涜浆鎹㈡垚鐨勬椂闂存牸寮忔潵杩涜鏃堕棿 鐨勮浆鎹?
     *
     * @param date      鏃堕棿瀛楃涓诧紝鍙互鏄换鎰忔牸寮忥紝鍙笉杩囬渶瑕佸湪鍙傛暟涓寚瀹氭牸寮?
     * @param oldFormat 褰撳墠鏃堕棿瀛楃涓叉牸寮忥紝濡倅yyy-MM-dd涔?
     * @param newFormat 闇?瑕佽浆鎹㈡垚鐨勬椂闂存牸寮?
     * @return 杩斿洖鏂扮殑鏃堕棿鏍煎紡锛屽瓧绗︿覆绫诲瀷
     * @throws ParseException
     */
    public static String getNewDateForFormat(String date, String oldFormat, String newFormat) throws ParseException {
        SimpleDateFormat oldF = new SimpleDateFormat(oldFormat);
        SimpleDateFormat newF = new SimpleDateFormat(newFormat);
        Date oldDate = oldF.parse(date);
        return newF.format(oldDate);
    }

    /**
     * 鏍规嵁浼犲叆鐨勬椂闂翠笌鍒嗛挓澶у皬锛岃繘琛屽垎閽熺殑杩愮畻
     *
     * @param date   鏃ユ湡瀵硅薄
     * @param minute 闇?瑕佸姞鍑忕殑鍒嗛挓锛屽鏋滀负姝ｆ暟锛屽垯涓哄鍔狅紝濡傛灉涓鸿礋鏁板垯涓哄噺
     * @return
     */
    public static String ctrlDateMinute(Date date, int minute) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(c.MINUTE, minute);//灞炴?у緢澶氫篃鏈夋湀绛夌瓑锛屽彲浠ユ搷浣滃悇绉嶆椂闂存棩鏈?
        Date temp_date = c.getTime();
        return format.format(temp_date);
    }

}
