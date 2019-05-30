package com.jungle.email;

import com.jungle.bean.Reguser;
import com.util.RandomUtil_4;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet implementation class RegisterServlet
 */
@Controller
public class SendController {
    /**
     * 发送邮件
     *
     * @param reguser
     * @param request
     * @return
     */
    @RequestMapping("/sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmail(Reguser reguser, HttpServletRequest request) {

        String toMail = reguser.getEmail(); // 接收验证的邮箱
        System.out.println("发送邮件" + toMail);
//			String userName = "947913857@qq.com";
//			String password = "krbzxizlybqbbcja";

        String userName = "1651443756@qq.com";
        String password = "fcvuonbdpakubabh";

        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";// SSL加密
        Properties props = new Properties();
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.host", "smtp.qq.com");
        props.setProperty("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465"); // google使用465或587端口
        props.put("mail.smtp.auth", "true"); // 表示SMTP发送邮件，必须进行身份验证
        props.put("mail.debug", "true"); // 开启调试模式
        props.put("mail.transport.protocol", "SMTP"); // 发送邮件协议名称
        props.setProperty("mail.smtp.socketFactory.port", "465");

        Authenticator authenticator = new MyAuthenticator(userName, password);

        javax.mail.Session session = javax.mail.Session.getDefaultInstance(props, authenticator);
        session.setDebug(true);
        synchronized (this) {
            HashMap<String, Object> map = new HashMap<>();
            String codeGen = RandomUtil_4.codeGen();
            try {
                request.getSession().setAttribute("codeGen", codeGen);
                Address from = new InternetAddress(userName);
                Address to = new InternetAddress(toMail);
                MimeMessage msg = new MimeMessage(session);
                msg.setFrom(from);
                msg.setSubject("丛林闲居");
                msg.setSentDate(new Date());
                msg.setContent("<p>您《忘记密码》验证码为：<font color='red'>" + codeGen + "</font>，有效时间为30分钟，请妥善保管！</p>",
                        "text/html;charset=utf-8");
                msg.setRecipient(RecipientType.TO, to);
                Transport.send(msg);
                map.put("msg", "<img src='/static/images/gougou.jpg'/>验证码已经发送到你的邮箱，有效时间为30分钟，请注意查收！");
                request.getSession().setAttribute(reguser.getUsername(), codeGen);

                System.out.println(reguser.getUsername() + "-" + request.getSession().getAttribute(reguser.getUsername()));
                return map;
            } catch (MessagingException e) {
                e.printStackTrace();
                map.put("msg", "&emsp;服务器出了小差！请稍后重试！");
                return map;
            }
        }
    }

}
