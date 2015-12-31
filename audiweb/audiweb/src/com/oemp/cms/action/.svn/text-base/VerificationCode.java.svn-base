package com.oemp.cms.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.frame.action.BaseAction;
//生成验证码
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.VerificationCode")
public class VerificationCode extends BaseAction{
	//给定范围获得随机颜色  
    Color getRandColor(int fc,int bc){  
        Random random = new Random();   
        if(fc>255) fc=255;   
        if(bc>255) bc=255;   
        int r=fc+random.nextInt(bc-fc);   
        int g=fc+random.nextInt(bc-fc);   
        int b=fc+random.nextInt(bc-fc);   
        return new Color(r,g,b);   
        }  
    //获取
    public void getVerifyCode()
    {
    	//设置页面不缓存   
    	ServletActionContext.getResponse().setHeader("Pragma", "No-cache");  
    	ServletActionContext.getResponse().setHeader("Cache-Control", "no-cache");  
    	ServletActionContext.getResponse().setDateHeader("Expires", 0);  

        // 在内存中创建图象   
        int width = 100, height = 30;  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  

        // 获取图形上下文   
        Graphics g = image.getGraphics();  

        //生成随机类   
        Random random = new Random();  

        // 设定背景色   
        g.setColor(getRandColor(240, 250));  
        g.fillRect(0, 0, width, height);  

        //设定字体   
        g.setFont(new Font("Times New Roman", Font.PLAIN, 25));  

        // 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到  
        g.setColor(getRandColor(180, 230));  
        for (int i = 0; i < 10; i++) {  
            int x = random.nextInt(width);  
            int y = random.nextInt(height);  
            int xl = random.nextInt(12);  
            int yl = random.nextInt(12);  
            g.drawLine(x, y, x + xl, y + yl);  
        }  
        //验证码，由2个一位数的加减法构成，例如：3 + 4 = ？  
        int num1 = (int)(Math.random() * 9)+1;  
        int num2 = (int)(Math.random() * 9)+1;  
        int funNo = random.nextInt(3);  //产生[0,2]之间的随机整数  
        String funMethod = "";  
        int result = 999;  
        switch (funNo) {  
            case 0: funMethod = "+"; result = num1 + num2; break;  
            case 1: funMethod = "- "; result = num1 - num2; break;  
            case 2: funMethod = "×"; result = num1 * num2; break;  
        }  
        String calc = num1 + " " + funMethod + " " + num2 + " = ?";  
        g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));  
        g.drawString(calc, 5, 25);  
        // 将认证码存入session 
        ServletActionContext.getRequest().getSession().setAttribute("theCalcResult", String.valueOf(result));
        // 图象生效   
        g.dispose();  
        // 输出图象到页面   
        try {
			ImageIO.write(image, "JPEG", ServletActionContext.getResponse().getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		} 
    }
}
