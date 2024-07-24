function 样式长按()

import "android.graphics.drawable.ColorDrawable"
import "android.content.res.ColorStateList"
import "android.view.animation.Animation"
import "android.view.animation.RotateAnimation"
import "android.animation.Animator$AnimatorListener"
import "com.wuyr.rippleanimation.*"

  布局初始化()
  初始化标题()

总高度="170dp"
背景高度="175dp"
滚动高度="100dp"


ganbei={
  LinearLayout,
  orientation="vertical",
  layout_height="50%h";
  layout_width="95%w";
  gravity="center";
  backgroundColor="#FFEEEEEE";
  id="dc",

 


  {
    CardView;
    layout_height=总高度;--高度480dp以下会有滚动效果--总共的高度
    id="card";
    backgroundColor="#FFEEEEEE";

    {
      ScrollView,
      layout_width="fill";
      layout_height="fill";
      layout_marginTop="3dp",
      backgroundColor="#FFEEEEEE";
      VerticalScrollBarEnabled=false;--去除滚动条
      --OverScrollMode=2;--去除滚动圆弧
      
      
      
      {
      LinearLayout;
       orientation="vertical";
      --背景颜色
      --BackgroundColor="#FFFFFFFF";   --白色
       backgroundColor="#FFEEEEEE"; --灰色
       layout_marginTop="0dp",
       layout_width="100%w";
       layout_height="fill";
   
 
        {--上部白色块布局开始

          LinearLayout;
          BackgroundColor="#FFFFFFFF";
          id="tj";
          orientation="vertical";
          layout_width="100%w";
          layout_height=背景高度;--上部白色块布局高度//会员功能需要开启这个高度
          layout_gravity="center";
          layout_marginTop="0dp";


    {
     HorizontalScrollView,--横向滚动
     layout_width='fill';--宽
     layout_height=滑动高度;--高
     HorizontalScrollBarEnabled=false;--隐藏横向滑条
      --VerticalScrollBarEnabled=false;--隐藏滑动条
        {
         LinearLayout;--设置线性布局
         layout_marginTop='8dp';
         orientation="horizontal";


          {
            TextView;
            Gravity='left';
            textColor='#FF000000';
            text="..<.";--标签名
            textSize='18sp';
          layout_marginLeft='18dp';
            layout_marginTop='0dp';
            onClick=function()          
                 加载Js([[
                    var arr = document.getElementsByClassName("eruda-parent");
                    sz=arr.length-1
                    arr[sz].click();
                  ]])
              end
        
          };
        


          {
            TextView;
            Gravity='left';
            textColor='#FF006CFF';
            text=bqm;--标签名
            textSize='20sp';
          layout_marginLeft='1dp';
            layout_marginTop='0dp';
        
          };
        
             {
            TextView;
            Gravity='left';
            --textColor='#FF2E9AFF';
            textColor='#FF000000';
            text=idwb;--id名
            textSize='18sp';
         --layout_marginLeft='48dp';
       --  layout_marginTop='0dp';
          };

           {
            TextView;
            Gravity='left';
            textColor='#FF000000';
            text=classwb;--class名
            textSize='18sp';
         --layout_marginLeft='48dp';
       --  layout_marginTop='0dp';
          };


         {
            TextView;
            Gravity='left';
            textColor='#FF000000';
            text="   ";--标签文本
            textSize='14sp';
            id="bqnr"
             
         --layout_marginLeft='48dp';
       --  layout_marginTop='0dp';
          };


           {
            TextView;
            Gravity='left';
            textColor='#FF000000';
            text="element.style {             ";--标签文本
            textSize='14sp';
            id="bqnr"
         --layout_marginLeft='48dp';
       --  layout_marginTop='0dp';
          };

      };--横向滚动标题&元素
    };


---------------------------------------长按基本功能结束---------------------------------------
        {
            LinearLayout;
            BackgroundColor="#FFFFFFFF";
            layout_height="45dp";
            layout_width="80%w";
            layout_gravity="center";
            id="gn1";
            {
              LinearLayout;
              id="xm2";
              layout_height="fill";
              layout_width="fill";
              orientation="horizontal",--横布局
              style="?android:attr/borderlessButtonStyle";
            

            	    {TextView,
				      layout_height="wrap_content",
				      text="宽度",
				      textColor="#333333";
				      layout_width="wrap_content"
				    },
                    {
                      SeekBar,
				      layout_height="wrap_content",
				      layout_width="wrap_content",
				      id="mainProgressBar1",
				      id="seekbar1",
				      layout_weight="1.0"
				    },

				    {TextView,
				      layout_height="wrap_content",
				      text="0",
				      id="seekText1",
				      textColor="#333333";
				      layout_width="wrap_content"
				    },
            };--更新日志--更新日志--布局开始
        };--更新日志--布局开始

        {
            LinearLayout;
            BackgroundColor="#FFFFFFFF";
            layout_height="45dp";
            layout_width="80%w";
            layout_gravity="center";
            id="gn2";
            {
              LinearLayout;
              id="xm3";
              layout_height="fill";
              layout_width="fill";
              orientation="horizontal",--横布局
              style="?android:attr/borderlessButtonStyle";
            

            	    {TextView,
				      layout_height="wrap_content",
				      text="高度",
				      textColor="#333333";
				      layout_width="wrap_content"
				    },
                    {
                      SeekBar,
				      layout_height="wrap_content",
				      layout_width="wrap_content",
				      id="mainProgressBar1",
				      id="seekbar2",
				      layout_weight="1.0"
				    },

				    {TextView,
				      layout_height="wrap_content",
				      text="0",
				      id="seekText2",
				      textColor="#333333";
				      layout_width="wrap_content"
				    },
            };--更新日志--更新日志--布局开始
        };--更新日志--布局开始


          {
            Button;
            style="?android:attr/borderlessButtonStyle";
            layout_width="100%w";
            layout_height="1px";
            layout_gravity="center";
            BackgroundColor="#FFBEBEBE";
          };

        {
            LinearLayout;
            BackgroundColor="#FFFFFFFF";
            layout_height="45dp";
            layout_width="100%w";
            layout_gravity="center";
            id="gn2";
            {
              LinearLayout;
              id="xm3";
              layout_height="fill";
              layout_width="fill";
             
              --style="?android:attr/borderlessButtonStyle";
            

           {
			LinearLayout;
			BackgroundColor="#FFFFFFFF";
			layout_height="45dp";
			layout_width="100%w";
			layout_gravity="center";
			layout_marginTop="0dp";
			orientation="horizontal",--横布局

			{
				LinearLayout;
				layout_height="fill";
				layout_width="20%w";

				{
					TextView;
					text="上对齐";
					--   layout_marginLeft="20dp";
					textSize="14sp";
					layout_gravity="center";
					textColor="#333333";
					textColor="#FF444444";
					layout_height="fill";
					layout_width="fill";
					style="?android:attr/borderlessButtonStyle";
					id="gg1";
					onClick=function()
				    end
			    };
		    };



			{
				LinearLayout;
				layout_height="fill";
				layout_width="20%w";

				{
					TextView;
					text="左对齐";
					--   layout_marginLeft="20dp";
					textSize="14sp";
					layout_gravity="center";
					textColor="#333333";
					textColor="#FF444444";
					layout_height="fill";
					layout_width="fill";
					style="?android:attr/borderlessButtonStyle";
					id="gg2";
					onClick=function()
				    end
			    };
		    };


			{
				LinearLayout;
				layout_height="fill";
				layout_width="20%w";

				{
					TextView;
					text="居中";
					--   layout_marginLeft="20dp";
					textSize="14sp";
					layout_gravity="center";
					textColor="#333333";
					textColor="#FF444444";
					layout_height="fill";
					layout_width="fill";
					style="?android:attr/borderlessButtonStyle";
					id="gg3";
					onClick=function()
				    end
			    };
		    };


			{
				LinearLayout;
				layout_height="fill";
				layout_width="20%w";

				{
					TextView;
					text="右对齐";
					--   layout_marginLeft="20dp";
					textSize="14sp";
					layout_gravity="center";
					textColor="#333333";
					textColor="#FF444444";
					layout_height="fill";
					layout_width="fill";
					style="?android:attr/borderlessButtonStyle";
					id="gg4";
					onClick=function()
				    end
			    };
		    };

			{
				LinearLayout;
				layout_height="fill";
				layout_width="20%w";

				{
					TextView;
					text="下对齐";
					--   layout_marginLeft="20dp";
					textSize="14sp";
					layout_gravity="center";
					textColor="#333333";
					textColor="#FF444444";
					layout_height="fill";
					layout_width="fill";
					style="?android:attr/borderlessButtonStyle";
					id="gg5";
					onClick=function()
				    end
			    };
		    };

	};      

            };--更新日志--更新日志--布局开始
        };--更新日志--布局开始


 };--上部白色块布局结束

     };
  },
  },
}



dialog= AlertDialog.Builder(this)
dialog1=dialog.show()
dialog1.getWindow().setContentView(loadlayout(ganbei));
dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
dialogWindow = dialog1.getWindow();
dialogWindow.setGravity(Gravity.BOTTOM);
--设置弹窗与返回键的响应,true为消失
dialog1.setCancelable(true)
--设置点击外部弹窗不消失
dialog1.setCanceledOnTouchOutside(true)--设置点击外部弹窗不消失false
--设置弹窗宽度
p=dialog1.getWindow().getAttributes();
p.width=(activity.Width);
dialog1.getWindow().setAttributes(p);

--弹窗背景和圆角
import "android.graphics.drawable.GradientDrawable"
drawable = GradientDrawable()
drawable.setShape(GradientDrawable.RECTANGLE)
drawable.setColor(0x00FFFFFF)
drawable.setCornerRadii({25,25,25,25,0,0,0,0});
dc.setBackgroundDrawable(drawable)

上滑动画(dc)

--波纹函数
import "android.content.res.ColorStateList"
function 波纹(id,lx,color)
  xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="圆" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="方" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
    end
  end,function(e)end)
end

--波纹用法

波纹({gg1},"方",0x21000000)
波纹({gg2},"方",0x21000000)
波纹({gg3},"方",0x21000000)
波纹({gg4},"方",0x21000000)
波纹({gg5},"方",0x21000000)
渐变(0xFF5827E2,0xFF006CFF,card)

长宽代码={}
单位={"%","px"}
当前单位={"%"}
table.insert(长宽代码,sqys..[[.style.width="自定义替换%"]])--写入数组
table.insert(长宽代码,sqys..[[.style.height="自定义替换%"]])--写入数组

function 设置滑条(控件ID,滑条颜色,文本ID,数组定位,判断数)
	import "android.graphics.PorterDuffColorFilter"
	import "android.graphics.PorterDuff"
	控件ID.ProgressDrawable.setColorFilter(PorterDuffColorFilter(滑条颜色,PorterDuff.Mode.SRC_ATOP))--修改SeekBar滑条颜色
	控件ID.Thumb.setColorFilter(PorterDuffColorFilter(滑条颜色,PorterDuff.Mode.SRC_ATOP))--修改SeekBar滑块颜色
	控件ID.setMax(100);--设置为seekbar音量的最大阶数
	控件ID.setProgress(50);--设置seekbar为当前音量进度 
	控件ID.setOnSeekBarChangeListener{--绑定监听
	  onProgressChanged=function(a,i)
	   文本ID.Text=""..i.."%"
	   代码=长宽代码[数组定位]
     执行=string.gsub(代码,"自定义替换",i)--加载js
     加载Js(执行)
         task(100,function()
            table.insert(bqpd,sqys)--写入标签内容
            function 判断()
              if(#bqpd==1)then--标签判断
                a=0
               else
                if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
                 a=1
                 else
                 a=0
                end
              end

              if(jsq[#jsq]==判断数)then
                b=0
              else
                if(jsq[#jsq]==-(判断数))then
                  b=0
                 else
                  b=1
                end
              end
            end
            判断()
            if(a+b>0)then
               清空数组(jsq)
               table.insert(jcq,gjms1[#gjms1])--写入寄存器
               table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
               table.insert(jcbqtb,gjms3[#gjms3])--写入悬浮按钮1标签名
               清空数组(gjms1)
               清空数组(gjms2)
            end
            table.insert(jsq,判断数)--写入统计次数1
            table.insert(gjms1,执行)--写入悬浮按钮1代码
            table.insert(gjms2,bqm3)--写入悬浮按钮1标签名

            if(数组定位==1)then
             table.insert(gjms3,sqys..'.style["width"] = null;')--写入撤销数据
            end

            if(数组定位==2)then
             table.insert(gjms3,sqys..'.style["height"] = null;')--写入撤销数据
            end

          end)



	  end}
end


设置滑条(seekbar1,0xFF174AFF,seekText1,1,3)
设置滑条(seekbar2,0xFF174AFF,seekText2,2,4)



修改长宽1=[[
 task(100,function()
    table.insert(bqpd,sqys)--写入标签内容
    function 判断()
      if(#bqpd==1)then--标签判断
        a=0
       else
        if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
         a=1
         else
         a=0
        end
      end

      if(jsq[#jsq]==3)then
        b=0
      else
        if(jsq[#jsq]==-3)then
          b=0
         else
          b=1
        end
      end
    end
    判断()
    if(a+b>0)then
       清空数组(jsq)
       table.insert(jcq,gjms1[#gjms1])--写入寄存器
       table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
       清空数组(gjms1)
       清空数组(gjms2)
    end
    table.insert(jsq,3)--写入统计次数1
    table.insert(gjms1,执行)--写入悬浮按钮1代码
    table.insert(gjms2,bqm3)--写入悬浮按钮1标签名

  end)
]]

 修改长宽2=[[
 task(100,function()
    table.insert(bqpd,sqys)--写入标签内容
    function 判断()
      if(#bqpd==1)then--标签判断
        a=0
       else
        if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
         a=1
         else
         a=0
        end
      end

      if(jsq[#jsq]==3)then
        b=0
      else
        if(jsq[#jsq]==-3)then
          b=0
         else
          b=1
        end
      end
    end
    判断()
    if(a+b>0)then
       清空数组(jsq)
       table.insert(jcq,gjms1[#gjms1])--写入寄存器
       table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
       清空数组(gjms1)
       清空数组(gjms2)
    end
    table.insert(jsq,3)--写入统计次数1
    table.insert(gjms1,执行)--写入悬浮按钮1代码
    table.insert(gjms2,bqm3)--写入悬浮按钮1标签名
  end)
]]




 gg1.onClick=function()--上对齐
    table.insert(bqpd,sqys)
          function 判断()
            if(#bqpd==1)then
              a=0
             else
              if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
               a=1
               else
               a=0
              end
            end

            if(jsq[#jsq]==5)then
              b=0
             else
              if(jsq[#jsq]==-5)then
                b=0
               else
                b=1
              end
            end
          end
          判断()
          if(a+b>0)then
             清空数组(jsq)
             table.insert(jcq,gjms1[#gjms1])--写入寄存器
             table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
             table.insert(jcbqtb,gjms3[#gjms3])--写入寄存标签
             清空数组(gjms1)
             清空数组(gjms2)
             清空数组(gjms3)
          end
          table.insert(jsq,5)
          ybdm=sqys..'.style.vertical-align="top";'--右对齐
          弹出消息("上对齐成功！")
          table.insert(gjms1,ybdm)--写入悬浮按钮1代码
          table.insert(gjms2,bqm3)--写入悬浮按钮1代码
          table.insert(gjms3,sqys..'.style["vertical-align"] = null;')--撤销数据
          加载Js(ybdm)
 end

 gg2.onClick=function()--左对齐
   table.insert(bqpd,sqys)
      function 判断()
        if(#bqpd==1)then
          a=0
         else
          if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
           a=1
           else
           a=0
          end
        end

        if(jsq[#jsq]==5)then
          b=0
         else
          if(jsq[#jsq]==-5)then
            b=0
           else
            b=1
          end
        end
      end
      判断()
      if(a+b>0)then
         清空数组(jsq)
         table.insert(jcq,gjms1[#gjms1])--写入寄存器
         table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
         table.insert(jcbqtb,gjms3[#gjms3])--写入寄存标签
         清空数组(gjms1)
         清空数组(gjms2)
         清空数组(gjms3)
      end
      table.insert(jsq,5)
      ybdm=sqys..'.setAttribute("align","left");'--左对齐
      弹出消息("左对齐成功！")
      table.insert(gjms1,ybdm)--写入悬浮按钮1代码
      table.insert(gjms2,bqm3)--写入悬浮按钮1代码
      table.insert(gjms3,sqys..'.setAttribute("align","");')--撤销数据
      加载Js(ybdm)

 end

 gg3.onClick=function()--居中
   table.insert(bqpd,sqys)
      function 判断()
        if(#bqpd==1)then
          a=0
         else
          if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
           a=1
           else
           a=0
          end
        end

        if(jsq[#jsq]==5)then
          b=0
        else
          if(jsq[#jsq]==-5)then
            b=0
           else
            b=1
          end
        end
      end
      判断()
      if(a+b>0)then
         清空数组(jsq)
         table.insert(jcq,gjms1[#gjms1])--写入寄存器
         table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
         table.insert(jcbqtb,gjms3[#gjms3])--写入寄存标签
         清空数组(gjms1)
         清空数组(gjms2)
         清空数组(gjms3)
      end
      table.insert(jsq,5)
      ybdm=sqys..'.setAttribute("align","center");'--修改图片
      弹出消息("居中成功！")
      table.insert(gjms1,ybdm)--写入悬浮按钮1代码
      table.insert(gjms2,bqm3)--写入悬浮按钮1代码
      table.insert(gjms3,sqys..'.setAttribute("align","");')--撤销数据
      加载Js(ybdm)
 end

 gg4.onClick=function()--右对齐
   table.insert(bqpd,sqys)
        function 判断()
          if(#bqpd==1)then
            a=0
           else
            if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
             a=1
             else
             a=0
            end
          end

          if(jsq[#jsq]==5)then
            b=0
          else
            if(jsq[#jsq]==-5)then
              b=0
             else
              b=1
            end
          end
        end
        判断()
        if(a+b>0)then
           清空数组(jsq)
           table.insert(jcq,gjms1[#gjms1])--写入寄存器
           table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
           table.insert(jcbqtb,gjms3[#gjms3])--写入寄存标签
           清空数组(gjms1)
           清空数组(gjms2)
           清空数组(gjms3)
        end
        table.insert(jsq,5)
        ybdm=sqys..'.setAttribute("align","right")'--右对齐
        弹出消息("右对齐成功！")
        table.insert(gjms1,ybdm)--写入悬浮按钮1代码
        table.insert(gjms2,bqm3)--写入悬浮按钮1代码
        table.insert(gjms3,sqys..'.setAttribute("align","");')--撤销数据
        加载Js(ybdm)
 end

 gg5.onClick=function()--下对齐
    table.insert(bqpd,sqys)
          function 判断()
            if(#bqpd==1)then
              a=0
             else
              if(bqpd[#bqpd]~=bqpd[#bqpd-1])then
               a=1
               else
               a=0
              end
            end

            if(jsq[#jsq]==5)then
              b=0
            else
              if(jsq[#jsq]==-5)then
                b=0
               else
                b=1
              end
            end
          end
          判断()
          if(a+b>0)then
             清空数组(jsq)
             table.insert(jcq,gjms1[#gjms1])--写入寄存器
             table.insert(jcbq,gjms2[#gjms2])--写入悬浮按钮1标签名
             table.insert(jcbqtb,gjms3[#gjms3])--写入寄存标签
             清空数组(gjms1)
             清空数组(gjms2)
             清空数组(gjms3)
          end
          table.insert(jsq,5)
          ybdm=sqys..'.style.vertical-align="bottom";'--右对齐
          弹出消息("下对齐成功！")
          table.insert(gjms1,ybdm)--写入悬浮按钮1代码
          table.insert(gjms2,bqm3)--写入悬浮按钮1代码
          table.insert(gjms3,sqys..'.style["vertical-align"] = null;')--撤销数据
          加载Js(ybdm)
 end--样式长按结束

end--样式长按()函数结束