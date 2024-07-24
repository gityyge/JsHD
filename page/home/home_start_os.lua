---
--- File: home_start_os.lua
--- Describe: 主页 - 程序启动运行 - 远程调用
--- Created by Gityyge.
---

--[[
网页源码-主页11
网页源码-主页
Js模板-主页
本地源码
调试模式
调试模式2
测试页面
备用
--]]

import "android.provider.Settings$Secure"
android_id = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
---------公用数组相关----------------
gysz={0,0}--公用数组
gzjl={}--规则记录
JsADurl={}--调试器url记录
qxgl={}--管理权限
sjgl={}
--gysz[1]==1==打开运行本时会写入1
--gysz[1]==2==打开预加载时会写入2
--gysz[2]==1==当前点击的复制列表事件 1=默认
--gysz[2]==2==当前点击的复制列表事件 2=带标签
--gysz[2]==3==当前点击的复制列表事件 3=FA提供
----------------公用数组相关----------------

----------------自定义功能函数----------------
function 加载对话框(标题,消息,时间,弹出)
          import("android.app.ProgressDialog");
          local pdc = ProgressDialog.show(this, 标题, 消息);
          local id =import "android.os.Build"
          local dd=id.SERIAL
          local set=import "android.provider.Settings"
          local id = set.System.getString(this.getContentResolver(), "android_id")
          local codeid =dd..id
          -- AppStartupAnimation(1500,1000)--退出启动动画
              task(时间,function()
                pdc.dismiss();
                弹出消息(弹出)
              end)
end

function 自定义事件对话框(标题,消息,积极名称,消极名称,中立名称)
   dialog=AlertDialog.Builder(this)
   .setTitle(标题)
   .setMessage(消息)--设置消息
   .setPositiveButton(积极名称,nil)
   .setNegativeButton(消极名称,nil)
   .setNeutralButton(中立名称,nil)
   .show()
end

function 版本功能限制()
  自定义事件对话框("错误","当前版本缺少内设函数无法使用该功能，请到酷安市场下载最新版本","确定","","")
  dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--预加载
    dialog.dismiss();
    import "android.content.Intent"
    import "android.net.Uri"
    url="https://www.coolapk.com/apk/com.Yyge.JsHD"
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
  end
end

版本限制=function(版本)--参数：字符串  返回：false和true
  getvn=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName
  vn_0=tonumber((getvn:gsub("%.","")))
  vn_1=tonumber((版本:gsub("%.","")))
  if(vn_0>=vn_1)then return true else return false end
end
-- webView.onLongClick=function()

-- end--长按监控-----结束




function 判断文件夹(路径)
  import "java.io.*"
  if File(路径).isDirectory()then  --存在文件
  else
  import "java.io.File"--导入File类
  File(路径).mkdir()
  end
end

function 判断文件(路径)
  import "java.io.*"--导入类
  file,err=io.open(路径)
  if err==nil then  --存在文件
    else
  io.open(路径, 'w') --创建文件（index.xml）
  end--创建结束
end

function 导出数组(模式,数组,路径) --模式1=普通数组 模式2=含有子数组
  dc={""}
  zsz={""}
  if(模式==1)then
      if(#数组==1)then
        dc[1]="{"..tostring(数组[1].."}")
       else
          for i=1, #(数组) do
            if(i==1)then
              dc[1]="{"..tostring(数组[1]..",")
              else
                if(i==#(数组))then
                dc[1]=dc[1]..tostring(数组[i].."}")
                else
                dc[1]=dc[1]..tostring(数组[i]..",")
                end
            end
          end
      end
  end

  if(模式==2)then
      if(#数组==1)then
          if(#数组[1]==1)then
            zsz[1]="{"..tostring(数组[1][1].."}")
           else
            for i=1, #数组[1] do
                if(i==1)then
                  zsz[1]="{"..tostring(数组[1][1]..",")
                  else
                    if(i==#(数组)[1])then
                    zsz[1]=zsz[1]..tostring(数组[1][i].."}")
                    else
                    zsz[1]=zsz[1]..tostring(数组[1][i]..",")
                    end
                end
            end
          end
       else
          for i=1,#(数组) do--3组
            for v=1,#(数组)[i] do--遍历数组
               if(v==1)then
                  if(i==1)then
                    zsz[1]="{"..tostring(数组[1][1]..",")
                  else
                     if(v==#(数组)[i])then
                        zsz[1]=zsz[1]..",{"..tostring(数组[i][1].."}")
                       else
                        zsz[1]=zsz[1]..",{"..tostring(数组[i][1]..",")
                     end
                  end
               else
                   if(v==#(数组)[i])then
                      zsz[1]=zsz[1]..tostring(数组[i][v].."}")
                      else
                      zsz[1]=zsz[1]..tostring(数组[i][v]..",")
                    end
               end
            end
          end
      end
    dc[1]="{"..zsz[1].."}"
  end

 io.open(路径,"w"):write(dc[1]):close()
end--使用方法 导出数组(a) 导出数组(数组,路径)  a为数组

function 保存个性化()
  ls={}
  for i=1,#szsj[1] do
    table.insert(ls,szsj[1][i])--写入数组
  end

    szsj=io.open(gxh):read("*a")
    if(szsj=="")then
    else
    loadstring("szsj="..szsj)()
    end

  for i=1,#ls do
    szsj[1][i]=ls[i]
  end
  if(szsj[2]==nil)then
    table.insert(szsj,{})
    szsj[2][1]="[[".."".."]]"
  else
     if(szsj[2][1]=="")then
      szsj[2][1]="[[".."".."]]"
     else
      szsj[2][1]="[[".."\n"..szsj[2][1].."]]"
     end
  end

  导出数组(2,szsj,gxh)
end

function 自定义设置初始化()

   if(Build.VERSION.SDK+1>=31)then
     xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
     datawjj=Environment.getExternalStorageDirectory().toString().."/JsHD/"--赋值文件夹路径
     gxh=Environment.getExternalStorageDirectory().toString().."/JsHD/gxh.xml"--赋值个性化设置文件
    else
     xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
     datawjj=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName()--赋值文件夹路径
     gxh=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/gxh.xml"--赋值个性化设置文件
   end

   判断文件夹(datawjj)
   判断文件(gxh)
   function funmonitor()
     szsj=io.open(gxh):read("*a")--读取文件设置数据
     if(szsj:find"{")then------------------准备修改
      loadstring("szsj="..szsj)()
      else
      loadstring([[szsj={{1,0,1,1}}]])() --1代表开 0代表关  szsj[1][1]=侧滑设置1  szsj[1][2]==侧滑设置2  szsj[1][3]==快捷按钮子开关  szsj[2][1]==自定义颜色
      导出数组(2,szsj,gxh)
      保存个性化()
      --1==标签预览
      --2==快捷按钮
      --3==快捷键设置
      --4==复制设置
     end
   end
  function myerrorhandler(err) 弹出消息("错误捕获:!168") end
  xpcall(funmonitor,myerrorhandler)--错误捕获
end

function 分享(数据)
  import "android.webkit.MimeTypeMap"
  import "android.net.Uri"
  import "java.io.File"
  intent = Intent()
  intent.setAction(Intent.ACTION_SEND)
  intent.setType("text/plain")
   -- intent.putExtra(Intent.EXTRA_STREAM,"uri")
  -- intent.putExtra(Intent.EXTRA_TITLE, "标题信息");
  --intent.putExtra(Intent.EXTRA_SUBJECT, "主题信息");
   intent.putExtra(Intent.EXTRA_TEXT, 数据);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent, "分享到:"))
end

function 弹窗圆角(控件,背景色,上角度,下角度)
  if not 上角度 then
    上角度=15
  end
  if not 下角度 then
    下角度=上角度
  end
  控件.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(背景色)
  .setCornerRadii({上角度,上角度,上角度,上角度,下角度,下角度,下角度,下角度}))
end

function 设置对话框(view,widt)
  params = view.getWindow().getAttributes();
  params.width = activity.getWidth()*widt;
  --height = activity.getHeight()*0.9;
  view.getWindow().setAttributes(params);
  弹窗圆角(view.getWindow(),0xFFFFFFFF)
end

function dateChange(time,dayChange)
  if string.len(time)==10 and string.match(time,"%d%d%d%d%-%d%d%-%d%d") then
    local year=string.sub(time,0,4);--年份
    local month=string.sub(time,6,7);--月
    local day=string.sub(time,9,10);--日
    local time=os.time({year=year, month=month, day=day})+dayChange*86400 --一天86400秒
    return (os.date('%Y',time).."-"..os.date('%m',time).."-"..os.date('%d',time))
   else
    return "请输入YYYY-MM-DD格式的日期"
  end
end

function 浏览器布局(布局模式,加载文字,网址,长按事件)--模式1为普通模式 模式2为AD调试模式 加载完毕后运行js不一样
 弹出次数={}--用于计算弹出web的次数
 动态数据={}

 layout={
    FrameLayout,
    layout_width="fill",
    layout_height="fill",

    --你的界面布局
      {
        LinearLayout,
        orientation="vertical",
        layout_width="fill";
        layout_height="80%h";
         {
          LuaWebView;
          id="wz";
          layout_width="fill";
          layout_height="80%h";
        };
      };


    --帧动画布局1
    {
      LinearLayout,
      orientation="vertical",
      layout_width="fill",
      layout_height="fill",
      background="#ff1d8ae7";
      id="qdy";
    },

    {
      LinearLayout,
      orientation="vertical",
      layout_width="fill",
      layout_height="fill",
      background="#ff1d8ae7",
      gravity="center",
      id="qdt",
       --旋转开始-----------
        {
          LinearLayout;
          orientation='vertical';--重力属性
          layout_width='fill';--布局宽度
          layout_height='fill';--布局高度
          {
            LinearLayout;
            orientation='vertical';--重力属性
            layout_width='fill';--布局宽度
            layout_height='fill';--布局高度
            gravity='center';--默认居中
            id="进度条布局";
            {
              ProgressBar;--默认圆圈
              id="进度条";
            };
            {
              TextView;--文本控件
              layout_width='fill';--文本宽度
              layout_height='50dp';--文本高度
              id="qdwb";
              gravity='center';--重力属性
              textColor='#ffffff';--文字颜色
              text=加载文字;--显示的文字
              textSize='15sp';--文字大小
            };
          };
        };
       --旋转结束-----------
    },--旋转图标
  }--动画布局

  dialog=LuaDialog(this)
  dialog2=dialog.show()


  dialog2.getWindow().setContentView(loadlayout(layout));
  -- dialog2.setCanceledOnTouchOutside(false)
  -- dialog2.setCancelable(false)

  function CircleButton(view,InsideColor,radiu)
    drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(InsideColor)
    drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
    view.setBackgroundDrawable(drawable)
  end

  --状态栏,导航栏背景
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff1d8ae7);
  activity.getWindow().setNavigationBarColor(Color.parseColor("#ff1d8ae7"));

  function 退出动画()
    task(2000,function()
      揭露动画一 = AnimatorSet()
      揭露动画一 = ViewAnimationUtils.createCircularReveal(qdt,activity.getWidth(),0,Math.hypot(activity.getWidth(),activity.getHeight())/2,0);
      揭露动画一.setDuration(1000)--设置动画时间
      揭露动画一.start()--开始动画
      揭露动画二 = ViewAnimationUtils.createCircularReveal(qdy,0,activity.getHeight(),Math.hypot(activity.getWidth(),activity.getHeight())/2,0);
      揭露动画二.setDuration(1000)--设置动画时间
      揭露动画二.start()--开始动画
    --动画监听
        揭露动画一.addListener(Animator.AnimatorListener{
          onAnimationStart=function(a)
          end,
          onAnimationEnd=function(a)
            qdt.setVisibility(View.GONE)
            qdy.setVisibility(View.GONE)
          end,
          onAnimationCancel=function(a)
          end,
          onAnimationRepeat=function(a)
          end,
        })

    end)
  end--揭露动画--退出动画结束

  --调用渐变函数
  渐变(0xFFFF6845,0xFFFF2317,qdy) --注意，这里是x不是×
  渐变(0xFFFF6845,0xFFFF2317,qdt) --注意，这里是x不是×

  进度条布局.setVisibility(View.VISIBLE)--显示控件
  进度条.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xffffff,PorterDuff.Mode.SRC_ATOP))

  function 设置web标题()
    wz.loadUrl([===[javascript:var elscript = document.createElement("script");elscript.text = ('document.title="加载完成";');elscript.setAttribute("type","text/javascript");document.body.appendChild(elscript);]===])
  end

  if(布局模式==2)then
   if(Build.VERSION.SDK+1>=31)then
     datawjj=Environment.getExternalStorageDirectory().toString().."/JsHD/"--赋值文件夹路径
     settings=Environment.getExternalStorageDirectory().toString().."/JsHD/.settings.ini"--软件设置文件
    else
     datawjj=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName()--赋值文件夹路径
     settings=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/.settings.ini"--软件设置文件
   end

    判断文件夹(datawjj)
    判断文件(settings)

    --设置UA
    if(io.open(settings):read("*a")=="")then
      settings_text=[[false||true||||utf-8||]]
      io.open(settings,"w"):write(settings_text):close()
     else
           if (#切割字符串(io.open(settings):read("*a"),"||")==5)then
            if(切割字符串(io.open(settings):read("*a"),"||")[3]~="")then
              qg_1=切割字符串(io.open(settings):read("*a"),"||")[3]
              qg_2=切割字符串(qg_1,"@|@")[2]
              wzlj.getSettings().setUserAgentString(qg_2);
             --print(qg_2)
            end
           else
            settings_text=[[false||true||||utf-8||]]
            io.open(settings,"w"):write(settings_text):close()
           end
    end
    --设置UA
  end--设置ua

    yzjz=0--验证加载
    wzlj=网址
    wz.loadUrl(wzlj)
    if(JsADurl[1]==nil)then--智能清除
     table.insert(JsADurl,wzlj)--记录url
     else
     table.insert(JsADurl,wzlj)--记录url
     if(JsADurl[#JsADurl]~=JsADurl[#JsADurl-1])then
       for i=1,#gzjl do--重置规则
         gzjl[i]=nil
       end
     end
    end
    wz.getSettings().setJavaScriptEnabled(true)--设置支持JS
    --wz.getSettings().setSupportZoom(false)--支持缩
    tzyz=0
    yzwz={}
    wz.setWebViewClient{
  -- shouldOverrideUrlLoading=function(view,url)--Url即将跳转
  -- end,
  -- onPageStarted=function(view,url,favicon)--网页加载
  -- end,
  onPageFinished=function(view,url)--网页加载完成
    if(布局模式==1)then
        wz.loadUrl([===[javascript:
        var elscript = document.createElement("script");elscript.text = ('
        var qbys = document.querySelector("head").querySelectorAll("*");
        for (var i = 0; i < qbys.length; i++) {
          var sx=qbys[i].getAttribute("name");
          if(sx=="viewport"){qbys[i].setAttribute("content","width=device-width, initial-scale=0.8, user-scalable=0, minimum-scale=0.8, maximum-scale=1.0");}
         };
        document.getElementById("sider-search").setAttribute("style","display:none");
        document.getElementsByClassName("mdui-fab mdui-ripple mdui-fab-fixed")[0].setAttribute("style","display:none");
        document.title="加载完成";
        ');elscript.setAttribute("type","text/javascript");document.body.appendChild(elscript);
        var hm=document.createElement("style");hm.innerHTML="body { -webkit-touch-callout: none;-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}";var s=document.getElementsByTagName("title")[0];s.parentNode.insertBefore(hm,s);
        ]===])
    end

    if(布局模式==2)then
      --弹出消息("这是正确的二次刷新")
     设置web标题()
     wz.loadUrl([===[javascript:javascript:var hm=document.createElement("style");hm.innerHTML="body { -webkit-touch-callout: none;-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}";var s=document.getElementsByTagName("title")[0];s.parentNode.insertBefore(hm,s);]===])
    end

    wz.getSettings().setUseWideViewPort(true);
    wz.onLongClick=function()--浏览器长按
      loadstring(长按事件)()
    end--长按监控-----结束
  end} --模式1为普通模式  模式2为AD调试模式

    if(布局模式==1)then
        function 循环判断加载()
            task(200,function()
              if(yzjz==0)then
                if(wz.getTitle()=="加载完成")then
                  yzjz=1
                 退出动画()
                 else
                  if(yzjz==0)then
                   循环判断加载()
                  end
                end
              end
            end)
        end

        循环判断加载()

        task(15000,function()
          if(yzjz==0)then
            if(wz.getTitle()~="加载完成")then
              dialog2.dismiss()
                task(200,function()
                     对话框()
                    .设置标题("提示")
                    .设置消息("教程加载失败，请您重试！")
                    .设置积极按钮("重试",function()
                        dialog2.dismiss()
                        使用帮助()
                    end)
                    .设置中立按钮("反馈问题",function ()
                      联系QQ(203455278)
                    end)
                    .设置消极按钮("关闭",function()
                    end)
                    .显示()
                end)
            end
          end
        end)
    end--退出动画循环判断

    if(布局模式==2)then
      task(2000,function()
          设置web标题()
          退出动画()
         function 循环判断规则()
            wz.evaluateJavascript([[document.getElementById("pbgz").innerHTML
            ]],function(a) if(a=="null")then
               task(500,function() 循环判断规则()  end)
             else

                if(gzjl[1]~=nil)then
                  for i=1,#gzjl do
                    if(gzjl[i]~=a)then
                      table.insert(gzjl,a)
                    end
                  end
                 else
                      table.insert(gzjl,a)
                end

                  hb=""
                for i=1,#gzjl do
                  if(i==1)then
                    hb=hb..gzjl[i]
                   else
                    hb=hb.."&"..gzjl[i]
                  end
                end

                   dialog2.dismiss()
                   JsAD添加规则("自动",hb)
                --JsAD添加规则("自动",a)
             end
            end)
         end
           循环判断规则()
      end)
    end--模式2 规则判断
end

function 会员对话框(标题,消息,积极名称,消极名称)
  function vip_shopping()
   弹出消息("已复制设备ID")
   复制文本(android_id)
   联系QQ(203455278)
  end
        InputLayout={
          LinearLayout;
          orientation="vertical";
          id="code";
          Focusable=true,
          FocusableInTouchMode=true,
          {
            EditText;
            hint="请填写授权码";
            layout_marginTop="5dp";
            layout_marginLeft="5dp";
            layout_marginRight="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit";
          };
        };

        function 授权码()
          AlertDialog.Builder(this)
          .setTitle("激活授权码")
          .setView(loadlayout(InputLayout))
          .setPositiveButton("激活",{onClick=function(v)
           for i=1,#data_key_1 do if(data_key_1[i]==edit.text)then warrant_key=1 end end
           for i=1,#data_key_6 do if(data_key_6[i]==edit.text)then warrant_key=6 end end
           for i=1,#data_key_12 do if(data_key_12[i]==edit.text)then warrant_key=12 end end
           for i=1,#data_key_15 do if(data_key_15[i]==edit.text)then warrant_key=15 end end
           for i=1,#data_key_999 do if(data_key_999[i]==edit.text)then warrant_key=999 end end
           if(warrant_key==nil)then
            加载对话框("稍等","正在验证中...",500,"您的授权码无效！")
            task(500,function() 授权码() end)
           else
            warrant="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/2.0/scrap_key.lua"
                Http.get(warrant,nil,"utf8",nil,function(code,html,b,c)
                if(html:find(edit.text))then
                  加载对话框("稍等","正在验证中...",500,"您的授权码已使用！")
                  task(500,function() 授权码() end)
                 else
                  if(getData("warrant_key","key_data")==nil)then putData("warrant_key","key_data","") end
                  if(getData("warrant_key","key_data"):find(edit.text))then
                    加载对话框("稍等","正在验证中...",500,"您的授权码已使用！")
                   else
                    if(sjgl[3]~=nil)then
                      if(warrant_key~=999)then putData("warrant_key","key",dateChange(sjgl[3],warrant_key*30))  else putData("warrant_key","key","2099-09-09") end
                     else
                      if(warrant_key~=999)then putData("warrant_key","key",dateChange(sjgl[1],warrant_key*30))  else putData("warrant_key","key","2099-09-09") end
                    end
                    putData("warrant_key","key_data",getData("warrant_key","key_data")..edit.text)
                    --print(getData("warrant_key","key_data"))
                    加载对话框("稍等","正在验证中...",500,"激活成功！")
                    task(500,function ()
                      会员特权(0)
                    end)

                 end
                end
            end)
          end
          end})
          .setNeutralButton("返回",{onClick=function(v) 会员特权(0)  end})--中立
          .setNegativeButton("购买",{onClick=function(v) vip_shopping() 会员特权(0) end})--消极
          .show()
        end

          import "android.graphics.Color"
          Alert=AlertDialog.Builder(this)
          Alert.setTitle(标题)
          Alert.setMessage(消息)
          Alert.setPositiveButton(积极名称,nil)--积极按钮
          Alert.setNegativeButton(消极名称,nil)--消极按钮
          Alert.setNeutralButton("授权码",nil)--修复BUG

          Dialog=Alert.show();--定义显示对话框为Dialog

        function vip_message()
          import "android.text.Html"
          import "android.content.Context"
          message=Dialog.findViewById(android.R.id.message)
          message.setTextColor(0xFF434343)--设置消息颜色
          message.setTextSize(14);
          message.setPadding(message.getPaddingLeft(),0,message.getPaddingRight(),-message.getPaddingRight())--左、上、右、下

          params = Dialog.getWindow().getAttributes();
          params.width = activity.getWidth()*0.9;
          --params.height = activity.getHeight()*0.9;
          Dialog.getWindow().setAttributes(params);

          field=Class.forName("android.app.AlertDialog").getDeclaredField("mAlert")
          field.setAccessible(true)
          field2=field.get(Dialog)
          field3=field2.getClass().getDeclaredField("mTitleView")
          field3.setAccessible(true)
          tv=field3.get(field2)
          import "android.graphics.Color"
          tv.setText(标题)
          --tv.setGravity(Gravity.CENTER)--设置居中
          tv.getPaint().setFakeBoldText(true);--设置粗体

          message=Dialog.findViewById(android.R.id.message)
          message.setTextColor(0xFF434343)--设置消息颜色
          message.setTextSize(14);
          message.setText(Html.fromHtml(消息))
          Dialog.getButton(Dialog.BUTTON_NEUTRAL).setText("授权码")--设置消极按钮颜色
        end

        Dialog.getButton(Dialog.BUTTON_POSITIVE).onClick=function()--积极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
          vip_shopping()
        end

        Dialog.getButton(Dialog.BUTTON_NEGATIVE).onClick=function()--消极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
         Dialog.dismiss();
        end

        Dialog.getButton(Dialog.BUTTON_NEUTRAL).onClick=function()--中立按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
          --普通对话框
          Dialog.dismiss();
          弹出消息("联系作者购买会员")
          联系QQ(203455278)
          --授权码()--修复BUG
          --期待新版本 API授权

        end
        vip_message()
end

function 列表弹窗(标题,列表数组,事件数组)
  DialogExport=AlertDialog.Builder(this)
  DialogExport.setTitle(标题)
  DialogExport.setItems(列表数组,{onClick=function(l,v)
      for i=0, #(列表数组) do
           if(v==i)then
             loadstring(事件数组[v+1])()
           end
      end
  end})
  DialogShow=DialogExport.show()
  弹窗圆角(DialogShow.getWindow(),0xFFFFFFFF)
  设置对话框(DialogShow,0.86)
end

function 单击复制()
  function 复制事件()
   if(Build.VERSION.SDK+1>=31)then
     jsxml=Environment.getExternalStorageDirectory().toString().."/JsHD/js.xml"--js路径
     jsyjz=Environment.getExternalStorageDirectory().toString().."/JsHD/jsyjz.js"--预加载路径
    else
     jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--js路径
     jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"--预加载路径
   end

    yjz=io.open(jsyjz):read("*a")--取读预加载jsyjz.js文件
    jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
    Fa2_Js_1=[=[
      local jsContent=[==[]=]
    Fa2_Js_2=[=[      ]==]
      local function 获取浏览页(n)
        if n then
          return activity.uiManager.getPage(n)
         else
          return activity.uiManager.currentPage
        end
      end
      local function 获取浏览器()
        return 获取浏览页().webView
      end
      local function 加载Js(str,callback)
        获取浏览器().evaluateJavascript(str,callback or nil)
      end
      local function 绑定WebView加载(view)
        (view or 获取浏览器()).evaluateJavascript(jsContent,nil)
      end

      require"import"
      import "net.fusionapp.core.ui.fragment.WebInterface"
      local uimanager=activity.uiManager
      local fragment=uimanager.currentFragment
      fragment.setWebInterface(WebInterface{
        onPageFinished=function(view,url)
          --页面加载结束事件
          --绑定vConsole停用(view)
          绑定WebView加载(view)
        end,
        onPageStarted=function(view,url,favicon)
          --页面开始加载事件
        end,
        onReceivedTitle=function(view,title)
          --获取到网页标题时加载的事件
        end,
        onLoadResource=function(view,url)
          --页面资源加载监听
          --可通过该方法获取网页上的资源
         -- print(url)
        end,
        onUrlLoad=function(view,url)
          --即将开始加载事件，url参数是即将加载的url
          --该函数返回一个布尔值
          --返回true则拦截本次加载
          return false
        end
      })
    ]=]

    if(gysz[1]==1)then
        if(gysz[2]==1)then--默认
         复制文本(jsnr)
        end

        if(gysz[2]==2)then--带标签
         复制文本("<script>\n"..jsnr.."\n</script>")
        end

        if(gysz[2]==3)then--Fa
         复制文本("加载Js([==[\n"..jsnr.."\n]==])")
        end

        if(gysz[2]==4)then--AppLua
          复制文本(Fa2_Js_1.."\n       "..jsnr.."\n"..Fa2_Js_2)
        end
        if(gysz[2]==5)then--AppLua
          qczs=string.gsub(jsnr,"/.%d.:%d.-%d%d","")
          tjjs=[[var elscript = document.createElement("script");elscript.text = ']]..qczs..[[';elscript.setAttribute("type","text/javascript");document.body.appendChild(elscript);]]
         复制文本("控件ID.evaluateJavascript([===["..tjjs.."\n]===],nil)")
        end
        if(gysz[2]==6)then--AppLua
          分享(jsnr)
        end
    end
    if(gysz[1]==2)then
      if(gysz[2]==1)then--默认
       复制文本(yjz)
      end

      if(gysz[2]==2)then--带标签
       复制文本("<script>\n"..yjz.."\n</script>")
      end

      if(gysz[2]==3)then--Fa
       复制文本("加载Js([==[\n"..yjz.."\n]==])")
      end

      if(gysz[2]==4)then--fa2
       复制文本(Fa2_Js_1.."\n       "..yjz.."\n"..Fa2_Js_2)
      end

      if(gysz[2]==5)then--Web
       复制文本("控件ID.evaluateJavascript([===["..yjz.."\n]===],nil)")
      end
      if(gysz[2]==6)then--Web
       分享(yjz)
      end
    end
  end

  mcsj_4={}--快捷复制按钮--名称--列表的名称
  dmsj_4={}--快捷复制按钮--代码--列表点击时运行的代码
  function 写入列表(列表名称,列表代码)
    table.insert(mcsj_4,列表名称)--写入数组
    table.insert(dmsj_4,列表代码)--写入数组
  end
    写入列表("默认复制Js","gysz[2]=1\n复制事件()".."\n"..[[加载对话框("复制中","代码复制中请稍候，..",400,"复制成功！")]])--szsj[4]
    写入列表("快捷分享Js","gysz[2]=6\n复制事件()")--szsj[4]
    写入列表("带<script>标签","gysz[2]=2\n复制事件()".."\n"..[[加载对话框("复制中","代码复制中请稍候，..",400,"复制成功！")]])--szsj[4]
    写入列表("带FA加载Js([[xxx]])","gysz[2]=3\n复制事件()".."\n"..[[加载对话框("复制中","代码复制中请稍候，..",400,"复制成功！")]])--szsj[4]
    写入列表("Fa2调用(uiManager)","gysz[2]=4\n复制事件()".."\n"..[[加载对话框("复制中","代码复制中请稍候，..",400,"复制成功！")]])--szsj[4]
    写入列表("Web控件加载Js(evaluate)","gysz[2]=5\n复制事件()".."\n"..[[加载对话框("复制中","代码复制中请稍候，..",400,"复制成功！")]])--szsj[4]

    列表弹窗("操作",mcsj_4,dmsj_4)
end

function 写入模板库(名称,事件,编辑)
  table.insert(mcsj,名称)
  table.insert(dmsj,事件)--引入js
  table.insert(sfbj,编辑)--引入js
end

function 模板库()--自定义函数开始
  AlertDialog.Builder(this)
  .setTitle("Js模板库\n")
  .setItems(mcsj,{onClick=function(l,v)
    qths11={}--存放名称
    qths12={}--存放代码
    qths13={}--存入是否编辑
    table.insert(qths11,mcsj[v+1])--代码
    table.insert(qths12,dmsj[v+1])--名称
    table.insert(qths13,sfbj[v+1])--是否编辑
      for i=1,#dmsj do
        if(v==i-1)then
          loadstring(dmsj[i])()
        end
      end
  end})
  .show()
end--自定义函数结束


----------------自定义功能函数----------------

自定义设置初始化()

function 我的运行本()
    --点击悬浮按钮
   if(Build.VERSION.SDK+1>=31)then
     jsxml=Environment.getExternalStorageDirectory().toString().."/JsHD/js.xml"--赋值xml路径
     jsyjz=Environment.getExternalStorageDirectory().toString().."/JsHD/jsyjz.js"
    else
     jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"
     jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--赋值xml路径
   end
    yjz=io.open(jsyjz):read("*a")--取读预加载jsyjz.js文件
    jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
    gysz[1]=1--写入当前状态
    弹出消息("长按代码可复制哦~")
    --点击输入框布局
      xfclayout={
      LinearLayout,
      orientation="vertical",
      Focusable=true,
      FocusableInTouchMode=true,
      {
        EditText,
        id="edit2",
        hint="Input here",
        layout_marginTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
        text=jsnr,--文本内容为 jsnr
      },

    }
    --  输入框布局结束
      --开始-02
        AlertDhk=AlertDialog.Builder(this)
        AlertDhk.setTitle("JavaScript运行本")
        AlertDhk.setView(loadlayout(xfclayout))
        AlertDhk.setPositiveButton("运行",{onClick=function()
           弹出消息("已在此网页加载js")
           js=edit2.text
           io.open(jsxml,"w"):write(js):close()
           --赋值输入框内容
           js=edit2.text
           加载Js(js)
        end})
        AlertDhk.setNegativeButton("预加载",{onClick=function()
              加载对话框("导出","正在导出预加载中...",500,"导出成功！")
              task(500,function()
                  对话框()
                  .设置标题("添加成功")
                  .设置消息("预加载代码添加成功，添加/修改预加载内容，请点击侧边栏“我的预加载”进行操作即可")
                  .设置积极按钮("确定",function()
                    显示消息("点击了确定")
                  end)
                  .设置消极按钮("取消")
                  .显示()
              end)--延迟结束

              js=edit2.text
              io.open(jsxml,"w"):write(js):close()

              yjz=io.open(jsyjz):read("*a")--取读预加载jsyjz.js文件
              jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
              xryjz=yjz.."\n\n"..jsnr
              io.open(jsyjz,"w"):write(xryjz):close()--写入预加载文件
              io.open(jsxml,"w"):write(""):close()--清空运行本代码
        end})--预加载
        AlertDhk.setNeutralButton("清空",{onClick=function()
         io.open(jsxml,"w"):write(""):close()
         加载对话框("清空中","运行本清空中....",1000,"清空完成！")
        end})
        Alertlog=AlertDhk.create()
        Alertlog.show()
        edit2.setHint("请编辑js代码")
        edit2.onLongClick=function()
          单击复制()
          Alertlog.dismiss()
        end

    --结束-02
end

function 我的预加载()--我的预加载开始
    gysz[1]=2--写入当前状态
   if(Build.VERSION.SDK+1>=31)then
     jsxml=Environment.getExternalStorageDirectory().toString().."/JsHD/js.xml"--赋值xml路径
     jsyjz=Environment.getExternalStorageDirectory().toString().."/JsHD/jsyjz.js"
    else
     jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"
     jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--赋值xml路径
   end
    yjz=io.open(jsyjz):read("*a")--取读预加载jsyjz.js文件
    jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
    xfclayout={--点击输入框布局
      LinearLayout,
      orientation="vertical",
      Focusable=true,
      FocusableInTouchMode=true,

      {
        EditText,
        id="edit2",
        hint="Input here",
        layout_marginTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
        text=yjz,--文本内容为 jsnr
      },
    }

    function 预加载()--自定义函数 预加载
       弹出消息("长按代码可复制哦~")
        AlertDhk=AlertDialog.Builder(this)
        AlertDhk.setTitle("我的预加载")
        --AlertDhk.setMessage("")
        AlertDhk.setView(loadlayout(xfclayout))
        --AlertDhk.getWindow().setContentView(loadlayout(xfclayou));
        AlertDhk.setPositiveButton("保存",{onClick=function()
          弹出消息("已保存预加载js")
          yjzbj=edit2.text
          io.open(jsyjz,"w"):write(yjzbj):close()
          end})
        AlertDhk.setNegativeButton("清空",{onClick=function()
          io.open(jsyjz,"w"):write(""):close()
          加载对话框("清空预加载","正在清空，请稍候……",500,"清除成功")
            end})--设置否认按钮
        AlertDhk.setNeutralButton("复制选项",{onClick=function()
            单击复制()
            end})
        --实例化对话框
        Alertlog=AlertDhk.create()
        --argbDialog.setCanceledOnTouchOutside(false)
        Alertlog.show()
        --对话框按钮颜色(Alertlog,2,0xFFFF0000)--设置清空颜色
        edit2.setHint("请编辑js代码")

        edit2.onLongClick=function()
          单击复制()
          Alertlog.dismiss()
        end

    end--自定义函数预加载 --结束
    预加载()
end--我的预加载结束

function 本地源码()---本地源码开始---------------------------本地源码开始-------------------------本地源码开始
   if(Build.VERSION.SDK+1>=31)then
      xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.html"
      datalxwy=Environment.getExternalStorageDirectory().toString().."/JsHD/lxwy/"--赋值文件夹路径
      lxwy=Environment.getExternalStorageDirectory().toString().."/JsHD/lxwy/lxwy.html"
      lxwyjs=Environment.getExternalStorageDirectory().toString().."/JsHD/lxwy/lxwy.js"
    else
      xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.html"
      datalxwy=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/lxwy/"--赋值文件夹路径
      lxwy=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/lxwy/lxwy.html"
      lxwyjs=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/lxwy/lxwy.js"
   end

    --判断文件夹是否存在
    import "java.io.*"
    if File(datalxwy).isDirectory()then
     else
       import "java.io.File"--导入File类
       File(datalxwy).mkdir()  --创建文件夹
    end
       --赋值xml路径


    --判断文件是否存在
    import "java.io.*"--导入类
    file,err=io.open(lxwy)
    if err==nil then --存在文件
      else
    io.open(lxwy, 'w')--创建文件（index.xml）
    end--创建结束

    import "java.io.*"--导入类
    file,err=io.open(lxwyjs)
    if err==nil then --存在文件
      else
    io.open(lxwyjs, 'w')--创建文件（index.xml）
    end--创建结束
    --1111111111111111111111111111111111111
    --赋值xml路径


    --判断index.xml文件是否存在
    import "java.io.*"--导入类
    file,err=io.open(xml)
    if err==nil then
      --存在文件
      else
     --创建文件（index.xml）
    io.open(xml, 'w')
    end--创建结束

    --取读index.xml文件内容
    xmlurl=io.open(xml):read("*a")
    --111111111111111111111111111111111111

    jsurl="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/js/%E8%B7%AF%E5%BE%84%E7%BB%9D%E5%AF%B9%E5%8C%96.js"
    Http.get(jsurl,nil,"utf8",nil,function(code,html,b,c)--准备JS开始

      if(webView.url:find"http://") then
        协议="http"
      end

      if(webView.url:find"https://") then
        协议="https"
      end

      if(协议=="http://") then
        zfcz="http://"
        zfcz2='"http:"'
      else
        zfcz="https://"
        zfcz2='"https:"'
      end

    th1 = string.gsub(webView.url,zfcz,"【")
    th2 = string.gsub(th1,"/","】")
    域名=th2:match("【(.-)】")
    域名2='"'..th2:match("【(.-)】")..'"'

    th3 = string.gsub(html,"window.location.protocol",zfcz2)--js内容替换
    th4 = string.gsub(th3,"window.location.host",域名2)--js内容替换
    io.open(lxwyjs,"w"):write(th4):close()--写入js
    end)--准备JS结束

    Http.get(webView.url,nil,"utf8",nil,function(code,html,b,c)
       --赋值xml路径

    xmljs=io.open(lxwyjs):read("*a")--
      sxtjdm1=html:match("(.+)</body>")
      sxtjdm2=sxtjdm1.."</body>"
      sxtjdm3=html:match("</body>(.+)")
      lxjsdm=[[<script type="text/javascript">]]..xmljs.."</script>"
      sxtjdm4=sxtjdm2.."\n"..lxjsdm.."\n"..sxtjdm3
      弹出消息(sxtjdm4)
      复制文本(sxtjdm4)
      --sxtjdm2=lxjsdm3.."<head>".."\n"..lxjsdm.."\n"..sxtjdm1
      --清空运行本代码
    --写入预加载文件
    io.open(lxwy,"w"):write(sxtjdm4):close()
    end)
    进入子页面("本地源码")
    --崔更()
end---本地源码结束----------------------本地源码结束-------------------------------本地源码结束

function 离线调试()---离线模式开始-----------------------离线模式开始----------------------离线模式开始
崔更()
end---离线模式结束-----------------------离线模式结束---------------------------离线模式结束

function 可视化调试()
 进入子页面("调试模式")
end

function 调试模块()
加载对话框("稍等","正在加载模块列表...",500,"已更新至最新模块！")
--JsMod----
  JsMod="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/home_js_mod_os.lua"
    Http.get(JsMod,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      else
       弹出消息("加载失败！请联系作者")
      end --判断网络--结束
    end)
--JsMod----
end
function 使用帮助()---使用帮助开始-----------------------------使用帮助开始--------------------------使用帮助开始
 浏览器布局(1,"正在加载使用帮助...","https://bk.yyge.net/?sort=7",[[复制文本(wz.getUrl()) 弹出消息("已复制文章地址！")]])
end---使用帮助结束----------------------------使用帮助结束----------------------------------使用帮助结束
hyxx_0_0=[[<p><strong><span">设备ID：]]..android_id..[[ <br>到期时间： 已到期 <br>您的会员特权已到期哦~<br>]]
hyxx_0_1=[[</span></strong><br><br>会员专享特权：<br>1.设置点击事件Js&lua<br>2.悬浮调试功能(开发中)<br>3.嗅探网页资源<br>4.可视化爬虫无限制<br>5.会员模型&背景&点击特效<br>6.网页元素强力删除
</p>]]
hyxx_0_2=[[赶快购买会员支持一波作者吧 ヾ(❀╹◡╹)ﾉ~</span></strong>
<br><br>￥0/月(五星好评限1次)<br>￥52.6/年(限时购)<br>￥66.6/年(+3月)<br>￥128.8/永久<br><br>强大会员特权：<br>1.设置点击事件Js&lua<br>2.悬浮调试功能(开发中)<br>3.嗅探网页资源<br>4.可视化爬虫无限制<br>5.会员模型&背景&点击特效<br>6.网页元素强力删除
</p>]]
hyxx_0_3=[[<p><strong><span">您暂时无权使用该高级功能<br>该功能仅限会员用户使用哦~<br>]]
hyxx_0_4=[[赶快购买会员支持一波作者吧 ヾ(❀╹◡╹)ﾉ~</span></strong>]]
function 会员特权(tidings)--tidings=0为默认   tidings=1为高级功能(不会提示您的会员特权已到期)
  if(tidings==1)then hyxx_0_0=hyxx_0_3 end
  if(getData("warrant_key","key")~=nil and getData("warrant_key","key")~="")then
    sjgl[3]=getData("warrant_key","key")
    sjgl[4]=string.gsub(sjgl[3],"-","")
  end
  if(sjgl[3]~=nil)then
    if(tostring(sjgl[2])>tostring(sjgl[4]))then
      hyxx_1=hyxx_0_0..hyxx_0_4..hyxx_0_1
      会员对话框("会员特权",hyxx_1,"续费","取消")
     else
      hyxx_1=string.gsub(hyxx_0_0..hyxx_0_1,"： 已到期 <br>您的会员特权已到期哦~<br>",sjgl[3])
      会员对话框("会员您好",hyxx_1,"续费","取消")
    end
    else
      hyxx_0_0=[[<p><strong><span">设备ID：]]..android_id..[[ <br>您还不是会员用户哦~<br>]]
      hyxx_1=hyxx_0_0..hyxx_0_2
      会员对话框("会员特权",hyxx_1,"开通","取消")
  end
end


--js模板库在下面
--js模板库在下面

--下面是启动初始化事件----------------------下面是启动初始化事件--------------------------下面是启动初始化事件

--这是收藏代码
    import 'android.webkit.WebView'webView.addJavascriptInterface({},'JsInterface')
    function getAllData(name)
      local data={}
      for d in each(this.getApplicationContext().getSharedPreferences(name,0).getAll().entrySet()) do
        data[d.getKey()]=d.getValue()
      end
      return data
    end

    function getData(name,key,MzI1NTI3MzI)
      local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
      return data
    end

    function putData(name,key,value)
      this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
      return true
    end

    function removeData(name,key)
      this.getApplicationContext().getSharedPreferences(name,32552732*0).edit().remove(key).apply()--[[3(2)6?5{2}2[7]32]]
      return true
    end

    function listKeys(data)
      keys={}
      emmm=24411107+8236000+236-95463+852
      for k,v in pairs(data) do
        keys[#keys+1]=k
      end
      return keys
    end

    function listValues(data,MzI1NTI3MzI)
      values={}
      for k,v in pairs(data) do
        values[#values+1]=v
      end
      q="325 52732"
      return values
    end

    function adapterData(data,jdpuk)
      adpd={}
      for d in pairs(data) do
        table.insert(adpd,{
          text={
            Text=tostring(data[d]),
          },
        })
      end
      return adpd
    end

    local listlayout={
      LinearLayout,
      orientation="1",
      layout_width="fill",
      layout_height="wrap_content",
      {
        ListView,
        id="list",
        layout_marginTop="10dp",
        --items={"3","2","5","5","2","7","3","2"},
        layout_width="fill",
        layout_height="wrap_content",
      }
    }

    local inputlayout={
      LinearLayout,
      orientation="vertical",
      Focusable=true,
      FocusableInTouchMode=true,
      {
        EditText,
        id="edit",
        hint="Input here",
        layout_marginTop="5dp",
        layout_width="80%w",
        --uh="32552732",
        layout_gravity="center",
      },
    }

    local input2layout={
      LinearLayout,
      orientation="vertical",
      Focusable=true,
      FocusableInTouchMode=true,
      {
        EditText,
        id="edit1",
        hint="Input here",
        --numa="32552",
        --aaa="bbb"
        layout_marginTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
      },
      {
        EditText,
        id="edit2",
        --ccc="ddd",
        --numb="732",
        --eee="fff",
        hint="Input here",
        layout_margiTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
      },
    }

    function showDataDialog(name,title,jdpuk)

      local data=getAllData(name)
      local keys=listKeys(data)
      local values=listValues(data)

      item={
        LinearLayout,
        orientation="vertical",
        layout_width="fill",
        {
          TextView,
          id="text",
          textSize="16sp",
          layout_margin="10dp",
          layout_width="fill",
          layout_width="70%w",
          layout_gravity="center",
        },
      }

      local adpd=adapterData(values)
      local items=LuaAdapter(this,adpd,item)

      local dlb=对话框()
      dlb.设置标题(title)
      local dl
      if #keys>0 then
        dlb.setView(loadlayout(listlayout))
        list.setDividerHeight(0)
        list.Adapter=items
        list.onItemClick=function(adp,view,position,id)--3255273 2
          webView.loadUrl(keys[id])
           if(Build.VERSION.SDK+1>=31)then
             xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"--赋值xml路径
            else
             xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"--赋值xml路径
           end

           io.open(xml,"w"):write(keys[id]):close()--写入网址


          if dl then
            dl.dismiss()
          end



        end
        list.onItemLongClick=function(adp,view,pos,id)--325 52732
          对话框()
          .设置标题(title)
          .setView(loadlayout(input2layout))
          .设置积极按钮("保存",function()--32552732
            if not(edit1.text=="") and not(edit2.text=="") or 3255==2732 then
              removeData(name,keys[id])
              putData(name,edit2.text,edit1.text)--32552732
              if dl then
                dl.dismiss()
                showDataDialog(name,title)
              end
            else
              弹出消息("请填写所有信息")
            end
          end)
          .设置消极按钮("取消")
          .设置中立按钮("删除",function()
            removeData(name,keys[id])
            items.remove(pos)
            table.remove(keys,id)
            table.remove(values,id)
            if #adpd<=0 then
              if dl then
                dl.dismiss()
                showDataDialog(name,title);
              end
            end
          end)
          .显示()
          edit1.setHint("备注")
          edit2.setHint("信息")
          edit1.setText(values[id])

          return true
        end
      else
        dlb.设置消息("您还没有收藏网页哦~")
      end

      dl=dlb.show()
    end

    function addDataDialog(name,title,value,key)--32552732
      对话框()
      .设置标题(title)
      .setView(loadlayout(input2layout))
      .设置积极按钮("保存",function()
        if not(edit1.text=="") and not(edit2.text=="") or 325==52732 then
          if not getData(name,edit2.text) then
            putData(name,edit2.text,edit1.text)
          else
            弹出消息("该链接已存在")
            addDataDialog(name,title,edit1.text,edit2.text)
          end
        else
          弹出消息("请填写所有信息")
          addDataDialog(name,title,edit1.text,edit2.text)
        end
      end)
      .设置消极按钮("取消")
      .显示()
      edit1.setHint("备注")
      edit2.setHint("信息")
      if(value)then
        edit1.setText(value)
      end
      if(key)then
        edit2.setText(key)
        edit2.setVisibility(View.GONE)
      end
    end
--这是收藏代码
warrant="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/2.0/scrap_key.lua"
  Http.get(warrant,nil,"utf8",nil,function(code,html,b,c)
    if(getData("warrant_key","key_data")~=nil and getData("warrant_key","key_data")~="") then
      if(html:find(string.sub(getData("warrant_key","key_data"),-32,-1)))then
        putData("warrant_key","key","1999-09-09")
        print(getData("warrant_key","key"))
      end
    end
end)

authorization="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/authorization.c"
    Http.get(authorization,nil,"utf8",nil,function(code,html,b,c)
       table.insert(qxgl,html:match("<share>(.-)</share>"))--分享
end)

function xh_time()
  Time="https://quan.suning.com/getSysTime.do"
      Http.get(Time,nil,"utf8",nil,function(code,html,b,c)
        if(code==(-1) or code== 403 )then
          if(code == 403)then
           task(500,function ()
             xh_time()
           end)
          end
           sjgl[2]="2020-12-13"
         else
          当前时间=html:match('":"(.-)","sysTime1')
          当前日期=string.gsub(当前时间,"%s%d%d:%d%d:%d%d","")
          sjgl[1]=当前日期--带"-"
          sjgl[2]=string.gsub(当前日期,"-","")
        end
  end)
end
xh_time()
----------------------------
function VIPpermission(事件,权限消息,模式,事件2)--模式1为文章  模式3为自定义事件
    function VIP_Tips()
      --自定义事件对话框("权限",权限消息,"联系作者","复制ID","取消")
       会员特权(1)
       dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--积极
       复制文本(android_id)
       联系QQ(203455278)
       dialog.dismiss();
      end

      dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--消极
       复制文本(android_id)
       弹出消息("已复制ID")
       dialog.dismiss();
      end

      dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--中立
       dialog.dismiss();
      end
    end
       if(模式~=3)then
          if(qxgl[模式]:find(android_id))then
             loadstring(事件)()
           else
            if(sjgl[3]~=nil)then
              if(tostring(sjgl[2])>tostring(sjgl[4]))then VIP_Tips() else loadstring(事件)() end
             else
              VIP_Tips()
            end
          end
         else

          if(qxgl[2]:find(android_id))then
            loadstring(事件)()
          else
            if(sjgl[3]~=nil)then
              if(tostring(sjgl[2])>tostring(sjgl[4]))then VIP_Tips() else loadstring(事件)() end
             else
              loadstring(事件2)()
            end
          end
       end

end


--这是js模板库代码
if(Build.VERSION.SDK+1>=31)then
  jsxml=Environment.getExternalStorageDirectory().toString().."/JsHD/js.xml"--赋值xml路径
  jsyjz=Environment.getExternalStorageDirectory().toString().."/JsHD/jsyjz.js"--赋值预加载文件
 else
  jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--赋值xml路径
  jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"--赋值预加载文件
end

MessageAlert={}--消息
table.insert(MessageAlert,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/MessageAlert/SweetAlert2%20/sweetalert_jshd.js")

ClickFx={}--点击
table.insert(ClickFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/sketch%20v2/r/sketch%20v2.norm.js")--sketch v2
table.insert(ClickFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/windSimplexNoise/windSimplexNoise.min.js")--windSimplexNoise
table.insert(ClickFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/StarsBloom/StarsBloom.min.js")--StarsBloom
--table.insert(ClickFx,"")
BgFx={}--背景
table.insert(BgFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/BG/particles/particlesy.minn.js")--particlesy
table.insert(BgFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/BG/background-fx/background-fx.js")--background
table.insert(BgFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/BG/protect/protect.min.js")--protect
table.insert(BgFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/BG/PaintStyleBg/PaintStyleBg.min.js")--PaintStyleBg

FallingFx={}
table.insert(FallingFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/FallingFx/yinghua/yinghua.min.js")--yinghua
table.insert(FallingFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/FallingFx/FireflyFx/FireflyFx.js")--yhc

TopPlugins={}
table.insert(TopPlugins,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/Top/back_to_top/back-to-top1.js")


Live2d={}--模型
-- table.insert(Live2d,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/sketch%20v2/r/sketch%20v2.norm.js")--sketch v2
-- table.insert(Live2d,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/windSimplexNoise/windSimplexNoise.min.js")--windSimplexNoise
-- table.insert(Live2d,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/StarsBloom/StarsBloom.min.js")--StarsBloom

tools={}--工具
table.insert(tools,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/%E7%BF%BB%E8%AF%91/%E5%BD%A9%E4%BA%91%E7%BF%BB%E8%AF%91.js")--彩云
table.insert(tools,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/Plugins/APlayer/JsHD-APlayer.js")--音乐播放器
-- table.insert(tools,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/windSimplexNoise/windSimplexNoise.min.js")--windSimplexNoise
-- table.insert(tools,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/ClickFx/StarsBloom/StarsBloom.min.js")--StarsBloom

-- function FxTemplates(type,url,)
--   if(type=="js")then
--     JsTemplates=[[
--       var hm = document.createElement("script");
--       hm.src = "]]..url..[[";
--       var s = document.getElementsByTagName("title")[0];
--       s.parentNode.insertBefore(hm, s);
--     ]]
--   end
-- end

function FxTemplates(type,url,diyjs)--type=文件类型 url=文件地址  diyjs=自定义js
  if(diyjs=="")then
   --默认
    if(type=="js")then
      JsTemplates=[[
        var hm = document.createElement("script");
        hm.src = "]]..url..[[";
        var s = document.getElementsByTagName("title")[0];
        s.parentNode.insertBefore(hm, s);]]
    end

   else
   --自定义Js
    if(type=="js")then
      JsTemplates=[[function loadJs(path,callback){var header=document.getElementsByTagName("head")[0];var script=document.createElement('script');script.setAttribute('src',path);header.appendChild(script);if(!/*@cc_on!@*/false){script.onload=function(){callback();}}else{script.onreadystatechange=function(){if(script.readystate=="loaded" ||script.readState=='complate'){callback();}}}}
        loadJs("]]..url..[[",function(){]]..diyjs..[[});]]
    end
  end
end

qwhd=[[
  var elscript = document.createElement("style");
  elscript.innerHTML=`html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter: grayscale(100%);-moz-filter: grayscale(100%);-ms-filter: grayscale(100%);-o-filter: grayscale(100%);filter: grayscale(100%);filter: gray;}`
  elscript.setAttribute("type","text/css");
  document.head.appendChild(elscript);
]]--全网灰度

qzsf=[[
  cfpd=0
  Array.from(document.head.getElementsByTagName("meta")).map(function(x){
    var sx = x.getAttribute("name");
    if(sx=="viewport"){
      x.setAttribute("content","width=device-width, initial-scale=自定义缩放, user-scalable=0, minimum-scale=自定义缩放, maximum-scale=自定义缩放");
        cfpd=1;
    }
  });

  if (cfpd!=1){
    var hm = document.createElement("meta");
    hm.name = "viewport";
    hm.content = "width=device-width, initial-scale=自定义缩放, user-scalable=0, minimum-scale=自定义缩放, maximum-scale=自定义缩放";
    var s = document.getElementsByTagName("title")[0];
    s.parentNode.insertBefore(hm, s);
  };
]]--强制缩放


crtbjs=[[
  var hm = document.createElement("替换标签");
  hm.替换属性1 = "替换属性内容1";
  hm.替换属性2 = "替换属性内容2";
  hm.替换属性3 = "替换属性内容3";
  var s = document.getElementsByTagName("title")[0];
  s.parentNode.insertBefore(hm, s);
]]--插入头部标签

crwbjs=[[
  var elscript = document.createElement("替换标签");
  elscript.setAttribute("替换属性1","替换属性内容1");
  elscript.setAttribute("替换属性2","替换属性内容2");
  elscript.setAttribute("替换属性3","替换属性内容3");
  document.body.appendChild(elscript);
]]--插入尾部标签


yrjs=[[
  var hm = document.createElement("script");
  hm.src = "yrjs自定义替换";
  var s = document.getElementsByTagName("title")[0];
  s.parentNode.insertBefore(hm, s);
]]--引入外部js

yrcss=[[
  var hm = document.createElement("link");
  hm.rel = "stylesheet";
  hm.src = "yrcss自定义替换";
  var s = document.getElementsByTagName("title")[0];
  s.parentNode.insertBefore(hm, s);
]]--引入外部Css

djtx_1=[==[
  var elscript = document.createElement("canvas");
  elscript.setAttribute("class","fireworks");
  elscript.setAttribute("style","position:fixed;left:0;top:0;z-index:99999999;pointer-events:none;");
  document.body.appendChild(elscript);
  eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('12 j={7H:{}};j.2k="8"==1v 1M.4X?1M.2k:8(e,r,p){13(p.5z||p.5A){5B 2J 5y("5v 5w 5x 5C 5H 5I 5J.")}e!=1V.1I&&e!=1M.1I&&(e[r]=p.1j)};j.4p=8(e){o"2L"!=1v 1r&&1r===e?e:"2L"!=1v 1k&&2z!=1k?1k:e};j.1k=j.4p(1x);j.4s="5G";j.3n=8(){j.3n=8(){};j.1k.1s||(j.1k.1s=j.1s)};j.4r=0;j.1s=8(e){o j.4s+(e||"")+j.4r++};j.2A=8(){j.3n();12 e=j.1k.1s.1O;e||(e=j.1k.1s.1O=j.1k.1s("1O"));"8"!=1v 1V.1I[e]&&j.2k(1V.1I,e,{4e:!0,48:!0,1j:8(){o j.41(1x)}});j.2A=8(){}};j.41=8(e){12 r=0;o j.3X(8(){o r<e.14?{24:!1,1j:e[r++]}:{24:!0}})};j.3X=8(e){j.2A();e={2a:e};e[j.1k.1s.1O]=8(){o 1x};o e};j.3W=j.3W||{};j.4M=8(e,r){j.2A();e 2e 5D&&(e+="");12 p=0,m={2a:8(){13(p<e.14){12 u=p++;o{1j:r(u,e[u]),24:!1}}m.2a=8(){o{24:!0,1j:1i 0}};o m.2a()}};m[1s.1O]=8(){o m};o m};j.4S=8(e,r,p,m){13(r){p=j.1k;e=e.2f(".");1a(m=0;m<e.14-1;m++){12 u=e[m];u 1m p||(p[u]={});p=p[u]}e=e[e.14-1];m=p[e];r=r(m);r!=m&&2z!=r&&j.2k(p,e,{4e:!0,48:!0,1j:r})}};j.4S("1V.1I.3F",8(e){o e?e:8(){o j.4M(1x,8(e){o e})}},"5E-5F","5u");12 j=1x;(8(e,r){"8"===1v 3g&&3g.5j?3g([],r):"3o"===1v 3i&&3i.4L?3i.4L=r():e.1g=r()})(1x,8(){8 e(a){13(!h.27(a)){5k{o 2v.5l(a)}5i(c){}}}8 r(a,c){1a(12 d=a.14,b=2<=3d.14?3d[1]:1i 0,f=[],n=0;n<d;n++){13(n 1m a){12 k=a[n];c.2F(b,k,n,a)&&f.1q(k)}}o f}8 p(a){o a.5f(8(a,d){o a.5g(h.1t(d)?p(d):d)},[])}8 m(a){13(h.1t(a)){o a}h.26(a)&&(a=e(a)||a);o a 2e 5h||a 2e 5m?[].5r.2F(a):[a]}8 u(a,c){o a.5s(8(a){o a===c})}8 C(a){12 c={},d;1a(d 1m a){c[d]=a[d]}o c}8 D(a,c){12 d=C(a),b;1a(b 1m a){d[b]=c.35(b)?c[b]:a[b]}o d}8 z(a,c){12 d=C(a),b;1a(b 1m c){d[b]=h.1Z(a[b])?c[b]:a[b]}o d}8 T(a){a=a.34(/^#?([a-f\\d])([a-f\\d])([a-f\\d])$/i,8(a,c,d,k){o c+c+d+d+k+k});12 c=/^#?([a-f\\d]{2})([a-f\\d]{2})([a-f\\d]{2})$/i.1D(a);a=1J(c[1],16);12 d=1J(c[2],16),c=1J(c[3],16);o"33("+a+","+d+","+c+",1)"}8 U(a){8 c(a,c,b){0>b&&(b+=1);1<b&&--b;o b<1/6?a+6*(c-a)*b:0.5>b?c:b<2/3?a+(c-a)*(2/3-b)*6:a}12 d=/21\\((\\d+),\\s*([\\d.]+)%,\\s*([\\d.]+)%\\)/g.1D(a)||/5t\\((\\d+),\\s*([\\d.]+)%,\\s*([\\d.]+)%,\\s*([\\d.]+)\\)/g.1D(a);a=1J(d[1])/4R;12 b=1J(d[2])/1P,f=1J(d[3])/1P,d=d[4]||1;13(0==b){f=b=a=f}1n{12 n=0.5>f?f*(1+b):f+b-f*b,k=2*f-n,f=c(k,n,a+1/3),b=c(k,n,a);a=c(k,n,a-1/3)}o"33("+2Q*f+","+2Q*b+","+2Q*a+","+d+")"}8 y(a){13(a=/([\\+\\-]?[0-9#\\.]+)(%|2C|5q|5n|5o|1m|5p|65|66|67|64|60|62|63|69|3V|6e|6f)?$/.1D(a)){o a[2]}}8 V(a){13(-1<a.1y("6g")||"4m"===a){o"2C"}13(-1<a.1y("4H")||-1<a.1y("6d")){o"3V"}}8 I(a,c){o h.2i(a)?a(c.1f,c.1R,c.3w):a}8 E(a,c){13(c 1m a.1N){o 6a(a).6b(c.34(/([a-z])([A-Z])/g,"$1-$2").3M())||"0"}}8 J(a,c){13(h.2c(a)&&u(W,c)){o"1w"}13(h.2c(a)&&(a.1u(c)||h.2K(a)&&a[c])){o"3f"}13(h.2c(a)&&"1w"!==c&&E(a,c)){o"3h"}13(2z!=a[c]){o"3o"}}8 X(a,c){12 d=V(c),d=-1<c.1y("2I")?1:0+d;a=a.1N.1w;13(!a){o d}1a(12 b=[],f=[],n=[],k=/(\\w+)\\((.+?)\\)/g;b=k.1D(a);){f.1q(b[1]),n.1q(b[2])}a=r(n,8(a,b){o f[b]===c});o a.14?a[0]:d}8 K(a,c){2B(J(a,c)){1c"1w":o X(a,c);1c"3h":o E(a,c);1c"3f":o a.1u(c)}o a[c]||0}8 L(a,c){12 d=/^(\\*=|\\+=|-=)/.1D(a);13(!d){o a}12 b=y(a)||0;c=2x(c);a=2x(a.34(d[0],""));2B(d[0][0]){1c"+":o c+a+b;1c"-":o c-a+b;1c"*":o c*a+b}}8 F(a,c){o 17.6c(17.2X(c.x-a.x,2)+17.2X(c.y-a.y,2))}8 M(a){a=a.3Q;1a(12 c=0,d,b=0;b<a.3R;b++){12 f=a.3c(b);0<b&&(c+=F(d,f));d=f}o c}8 N(a){13(a.3L){o a.3L()}2B(a.5Z.3M()){1c"5O":o 2*17.1z*a.1u("r");1c"5P":o 2*a.1u("2t")+2*a.1u("2u");1c"5Q":o F({x:a.1u("5N"),y:a.1u("5K")},{x:a.1u("5L"),y:a.1u("5M")});1c"5R":o M(a);1c"5W":12 c=a.3Q;o M(a)+F(c.3c(c.3R-1),c.3c(0))}}8 Y(a,c){8 d(b){b=1i 0===b?0:b;o a.4J.5X(1<=c+b?c+b:0)}12 b=d(),f=d(-1),n=d(1);2B(a.2m){1c"x":o b.x;1c"y":o b.y;1c"5Y":o 2G*17.5V(n.y-f.y,n.x-f.x)/17.1z}}8 O(a,c){12 d=/-?\\d*\\.?\\d+/g,b;b=h.2q(a)?a.31:a;13(h.27(b)){13(h.20(b)){12 f=/20\\((\\d+,\\s*[\\d]+,\\s*[\\d]+)\\)/g.1D(b);b=f?"33("+f[1]+",1)":b}1n{b=h.2O(b)?T(b):h.21(b)?U(b):1i 0}}1n{f=(f=y(b))?b.5S(0,b.14-f.14):b,b=c&&!/\\s/g.29(b)?f+c:f}b+="";o{3m:b,2s:b.3v(d)?b.3v(d).1o(5T):[0],3D:h.26(a)||c?b.2f(d):[]}}8 P(a){a=a?p(h.1t(a)?a.1o(m):m(a)):[];o r(a,8(a,d,b){o b.1y(a)===d})}8 Z(a){12 c=P(a);o c.1o(8(a,b){o{1f:a,1R:b,3w:c.14}})}8 3H(a,c){12 d=C(c);13(h.1t(a)){12 b=a.14;2!==b||h.2y(a[0])?h.2i(c.18)||(d.18=c.18/b):a={1j:a}}o m(a).1o(8(a,b){b=b?0:c.1b;a=h.2y(a)&&!h.2q(a)?a:{1j:a};h.1Z(a.1b)&&(a.1b=b);o a}).1o(8(a){o z(a,d)})}8 3x(a,c){12 d={},b;1a(b 1m a){12 f=I(a[b],c);h.1t(f)&&(f=f.1o(8(a){o I(a,c)}),1===f.14&&(f=f[0]));d[b]=f}d.18=2x(d.18);d.1b=2x(d.1b);o d}8 3B(a){o h.1t(a)?A.2p(1x,a):Q[a]}8 3G(a,c){12 d;o a.2r.1o(8(b){b=3x(b,c);12 f=b.1j,e=K(c.1f,a.2E),k=d?d.1Y.3m:e,k=h.1t(f)?f[0]:k,w=L(h.1t(f)?f[1]:f,k),e=y(w)||y(k)||y(e);b.2W=O(k,e);b.1Y=O(w,e);b.2Y=d?d.2w:a.1p;b.2w=b.2Y+b.1b+b.18;b.1C=3B(b.1C);b.2D=(36-17.2U(17.2T(b.2D,1),5U))/36;b.3E=h.2q(f);b.2M=h.27(b.2W.3m);b.2M&&(b.2b=1);o d=b})}8 3C(a,c){o r(p(a.1o(8(a){o c.1o(8(b){12 c=J(a.1f,b.2E);13(c){12 d=3G(b,a);b={1A:c,2m:b.2E,3e:a,2r:d,18:d[d.14-1].2w,1b:d[0].1b}}1n{b=1i 0}o b})})),8(a){o!h.1Z(a)})}8 R(a,c,d,b){12 f="1b"===a;o c.14?(f?17.2U:17.2T).2p(17,c.1o(8(b){o b[a]})):f?b.1b:d.1p+b.1b+b.18}8 3S(a){12 c=D(3t,a),d=D(S,a),b=Z(a.1B),f=[],e=z(c,d),k;1a(k 1m a){e.35(k)||"1B"===k||f.1q({2E:k,1p:e.1p,2r:3H(a[k],d)})}a=3C(b,f);o z(c,{1E:[],2h:b,2H:a,18:R("18",a,c,d),1b:R("1b",a,c,d)})}8 q(a){8 c(){o 1r.38&&2J 38(8(a){o p=a})}8 d(a){o g.1F?g.18-a:a}8 b(a){1a(12 b=0,c={},d=g.2H,f=d.14;b<f;){12 e=d[b],k=e.3e,h=e.2r,n=h.14-1,l=h[n];n&&(l=r(h,8(b){o a<b.2w})[0]||l);1a(12 h=17.2U(17.2T(a-l.2Y-l.1b,0),l.18)/l.18,w=3z(h)?1:l.1C(h,l.2D),h=l.1Y.3D,p=l.2b,n=[],m=1i 0,m=l.1Y.2s.14,t=0;t<m;t++){12 x=1i 0,x=l.1Y.2s[t],q=l.2W.2s[t],x=l.3E?Y(l.1j,w*x):q+w*(x-q);p&&(l.2M&&2<t||(x=17.2b(x*p)/p));n.1q(x)}13(l=h.14){1a(m=h[0],w=0;w<l;w++){p=h[w+1],t=n[w],3z(t)||(m=p?m+(t+p):m+(t+" "))}}1n{m=n[0]}3p[e.1A](k.1f,e.2m,m,c,k.1R);e.5e=m;b++}13(b=1M.3F(c).14){1a(d=0;d<b;d++){H||(H=E(2v.51,"1w")?"1w":"-57-1w"),g.2h[d].1f.1N[H]=c[d].54(" ")}}g.1G=a;g.3O=a/g.18*1P}8 f(a){13(g[a]){g[a](g)}}8 e(){g.1S&&!0!==g.1S&&g.1S--}8 k(a){12 k=g.18,n=g.1p,w=n+g.1b,r=g.1G,x=g.1F,q=d(a);13(g.1E.14){12 u=g.1E,v=u.14;13(q>=g.1G){1a(12 G=0;G<v;G++){u[G].1W(q)}}1n{1a(;v--;){u[v].1W(q)}}}13(q>=w||!k){g.1L||(g.1L=!0,f("3u")),f("4y")}13(q>n&&q<k){b(q)}1n{13(q<=n&&0!==r&&(b(0),x&&e()),q>=k&&r!==k||!k){b(k),x||e()}}f("1T");a>=k&&(g.1S?(t=h,"3J"===g.1X&&(g.1F=!g.1F)):(g.1Q(),g.1K||(g.1K=!0,f("4G"),"38"1m 1r&&(p(),m=c()))),l=0)}a=1i 0===a?{}:a;12 h,t,l=0,p=2z,m=c(),g=3S(a);g.1U=8(){12 a=g.1X,c=g.4F;g.1G=0;g.3O=0;g.2l=!0;g.1L=!1;g.1K=!1;g.1F="3N"===a;g.1S="3J"===a&&1===c?2:c;b(0);1a(a=g.1E.14;a--;){g.1E[a].1U()}};g.3r=8(a){h=a;t||(t=h);k((l+h-t)*q.3q)};g.1W=8(a){k(d(a))};g.1Q=8(){12 a=v.1y(g);-1<a&&v.4E(a,1);g.2l=!0};g.2o=8(){g.2l&&(g.2l=!1,t=0,l=d(g.1G),v.1q(g),B||3s())};g.3N=8(){g.1F=!g.1F;t=0;l=d(g.1G)};g.4D=8(){g.1Q();g.1U();g.2o()};g.4W=m;g.1U();g.2j&&g.2o();o g}12 3t={1T:1i 0,3u:1i 0,4y:1i 0,4G:1i 0,4F:1,1X:"4Y",2j:!0,1p:0},S={18:36,1b:0,1C:"4V",2D:4u,2b:0},W="4U 59 5b 4H 5c 52 56 2I 58 5d 5a 4T 4Z 4m".2f(" "),H,h={1t:8(a){o 1V.7q(a)},2y:8(a){o-1<1M.1I.7r.2F(a).1y("1M")},2q:8(a){o h.2y(a)&&a.35("31")},2K:8(a){o a 2e 7m},2c:8(a){o a.7n||h.2K(a)},26:8(a){o"7o"===1v a},2i:8(a){o"8"===1v a},1Z:8(a){o"2L"===1v a},2O:8(a){o/(^#[0-4z-F]{6}$)|(^#[0-4z-F]{3}$)/i.29(a)},20:8(a){o/^20/.29(a)},21:8(a){o/^21/.29(a)},27:8(a){o h.2O(a)||h.20(a)||h.21(a)}},A=8(){8 a(a,d,b){o(((1-3*b+3*d)*a+(3*b-6*d))*a+3*d)*a}o 8(c,d,b,f){13(0<=c&&1>=c&&0<=b&&1>=b){12 e=2J 7w(11);13(c!==d||b!==f){1a(12 k=0;11>k;++k){e[k]=a(0.1*k,c,b)}}o 8(k){13(c===d&&b===f){o k}13(0===k){o 0}13(1===k){o 1}1a(12 h=0,l=1;10!==l&&e[l]<=k;++l){h+=0.1}--l;12 l=h+(k-e[l])/(e[l+1]-e[l])*0.1,n=3*(1-3*b+3*c)*l*l+2*(3*b-6*c)*l+3*c;13(0.7y<=n){1a(h=0;4>h;++h){n=3*(1-3*b+3*c)*l*l+2*(3*b-6*c)*l+3*c;13(0===n){7u}12 m=a(l,c,b)-k,l=l-m/n}k=l}1n{13(0===n){k=l}1n{12 l=h,h=h+0.1,g=0;7v{m=l+(h-l)/2,n=a(m,c,b)-k,0<n?h=m:l=m}7b(1e-7<17.7d(n)&&10>++g);k=m}}o a(k,d,f)}}}}(),Q=8(){8 a(a,b){o 0===a||1===a?a:-17.2X(2,10*(a-1))*17.4K(2*(a-1-b/(2*17.1z)*17.79(1))*17.1z/b)}12 c="7a 7e 7i 7j 7k 7f 7g 7h 7N".2f(" "),d={7L:[[0.55,0.7B,0.68,0.53],[0.55,0.7z,0.7M,0.19],[0.7F,0.3y,0.7s,0.22],[0.7D,0.3l,0.7C,0.7P],[0.47,0,0.7J,0.6x],[0.3K,0.3l,0.6y,0.6z],[0.6,0.6u,0.6v,0.6w],[0.6,-0.28,0.6F,0.3P],a],6A:[[0.25,0.46,0.45,0.6k],[0.6l,0.61,0.3U,1],[0.3A,0.6m,0.44,1],[0.23,1,0.32,1],[0.39,0.6i,0.6j,1],[0.19,1,0.22,1],[0.6n,0.6o,0.3A,1],[0.3T,0.6p,0.32,1.6G],8(b,c){o 1-a(1-b,c)}],6X:[[0.6Y,0.3y,0.6Z,0.6U],[0.6V,0.3P,0.3U,1],[0.77,0,0.3T,1],[0.3I,0,0.73,1],[0.74,0.3l,0.55,0.3K],[1,0,0,1],[0.76,0.70,0.15,0.3I],[0.68,-0.55,0.72,1.55],8(b,c){o 0.5>b?a(2*b,c)/2:1-a(-2*b+2,c)/2}]},b={4c:A(0.25,0.25,0.75,0.75)},f={},e;1a(e 1m d){f.1A=e,d[f.1A].2V(8(a){o 8(d,f){b["6K"+a.1A+c[f]]=h.2i(d)?d:A.2p(j,d)}}(f)),f={1A:f.1A}}o b}(),3p={3h:8(a,c,d){o a.1N[c]=d},3f:8(a,c,d){o a.4I(c,d)},3o:8(a,c,d){o a[c]=d},1w:8(a,c,d,b,f){b[f]||(b[f]=[]);b[f].1q(c+"("+d+")")}},v=[],B=0,3s=8(){8 a(){B=6M(c)}8 c(c){12 b=v.14;13(b){1a(12 d=0;d<b;){v[d]&&v[d].3r(c),d++}a()}1n{6H(B),B=0}}o a}();q.6I="2.2.0";q.3q=1;q.6J=v;q.6Q=8(a){a=P(a);1a(12 c=v.14;c--;){1a(12 d=v[c],b=d.2H,f=b.14;f--;){u(a,b[f].3e.1f)&&(b.4E(f,1),b.14||d.1Q())}}};q.6R=K;q.6S=8(a,c){12 d=h.26(a)?e(a)[0]:a,b=c||1P;o 8(a){o{4J:d,2m:a,31:N(d)*(b/1P)}}};q.6N=8(a){12 c=N(a);a.4I("4P-6O",c);o c};q.6P=A;q.6C=Q;q.4f=8(a){12 c=q(a);c.1Q();c.18=0;c.3a=8(d){c.1E.2V(8(a){a.1L=!0;a.1K=!0});m(d).2V(8(b){12 d=z(b,D(S,a||{}));d.1B=d.1B||a.1B;b=c.18;12 e=d.1p;d.2j=!1;d.1X=c.1X;d.1p=h.1Z(e)?b:L(e,b);c.1L=!0;c.1K=!0;c.1W(d.1p);d=q(d);d.1L=!0;d.1K=!0;d.18>b&&(c.18=d.18);c.1E.1q(d)});c.1W(0);c.1U();c.2j&&c.4D();o c};o c};q.1l=8(a,c){o 17.6L(17.1l()*(c-a+1))+a};o q});8 4n(e){2S=(e.4x||e.4C[0].4x)-1h.4A().6T,2N=e.4B||e.4C[0].4B-1h.4A().71}8 4Q(e){12 t=1g.1l(0,4R)*17.1z/2G,a=1g.1l(50,2G),n=[-1,1][1g.1l(0,1)]*a;o{x:e.x+n*17.6W(t),y:e.y+n*17.4K(t)}}8 49(e,t){12 a={};o a.x=e,a.y=t,a.2g=3k[1g.1l(0,3k.14-1)],a.1H=1g.1l(16,32),a.2P=4Q(a),a.2Z=8(){1d.4N(),1d.4O(a.x,a.y,a.1H,0,2*17.1z,!0),1d.6s=a.2g,1d.6r()},a}8 4b(e,t){12 a={};o a.x=e,a.y=t,a.2g="#6q",a.1H=0.1,a.3j=0.5,a.2n=6,a.2Z=8(){1d.4a=a.3j,1d.4N(),1d.4O(a.x,a.y,a.1H,0,2*17.1z,!0),1d.2n=a.2n,1d.6h=a.2g,1d.4P(),1d.4a=1},a}8 37(e){1a(12 t=0;t<e.2h.14;t++){e.2h[t].1f.2Z()}}8 4o(e,t){1a(12 a=4b(e,t),n=[],i=0;i<4g;i++){n.1q(49(e,t))}1g.4f().3a({1B:n,x:8(e){o e.2P.x},y:8(e){o e.2P.y},1H:0.1,18:1g.1l(4d,3Y),1C:"3Z",1T:37}).3a({1B:a,1H:1g.1l(6t,7p),2n:0,3j:{1j:0,1C:"4c",18:1g.1l(6B,6E)},18:1g.1l(4d,3Y),1C:"3Z",1T:37,1p:0})}8 4q(42,1b){12 3b;o 8(){12 43=1x;12 40=3d;6D(3b);3b=7K(8(){42.2p(43,40)},1b)}}12 1h=2v.7Q(".7I");13(1h){12 1d=1h.4t("2d"),4g=30,2S=0,2N=0,4j="7E",3k=["#7G","#7A","#7O","#78"],2R=4q(8(){1h.2t=2*1r.4v,1h.2u=2*1r.4w,1h.1N.2t=1r.4v+"2C",1h.1N.2u=1r.4w+"2C",1h.4t("2d").2I(2,2)},4u),4i=1g({18:1/0,1T:8(){1d.7c(0,0,1h.2t,1h.2u)}});2v.4l(4j,8(e){"4k"!==e.1f.1R&&"7l-4k"!==e.1f.1R&&"A"!==e.1f.4h&&"7t"!==e.1f.4h&&(4i.2o(),4n(e),4o(2S,2N))},!1),2R(),1r.4l("7x",2R,!1)};',62,487,'||||||||function||||||||||||||||return||||||||||||||||||||||||||||||||||||||||var|if|length|||Math|duration||for|delay|case|ctx||target|anime|canvasEl|void|value|global|random|in|else|map|offset|push|window|Symbol|arr|getAttribute|typeof|transform|this|indexOf|PI|type|targets|easing|exec|children|reversed|currentTime|radius|prototype|parseInt|completed|began|Object|style|iterator|100|pause|id|remaining|update|reset|Array|seek|direction|to|und|rgb|hsl|||done||str|col||test|next|round|dom||instanceof|split|color|animatables|fnc|autoplay|defineProperty|paused|property|lineWidth|play|apply|pth|tweens|numbers|width|height|document|end|parseFloat|obj|null|initSymbolIterator|switch|px|elasticity|name|call|180|animations|scale|new|svg|undefined|isColor|pointerY|hex|endPos|255|setCanvasSize|pointerX|max|min|forEach|from|pow|start|draw||totalLength||rgba|replace|hasOwnProperty|1000|renderParticule|Promise||add|timer|getItem|arguments|animatable|attribute|define|css|module|alpha|colors|05|original|initSymbol|object|ha|speed|tick|ia|ga|begin|match|total|ba|03|isNaN|165|ca|ea|strings|isPath|keys|da|aa|86|alternate|95|getTotalLength|toLowerCase|reverse|progress|045|points|numberOfItems|fa|175|355|deg|array|iteratorPrototype|1800|easeOutExpo|args|arrayIterator|fn|context|||||writable|createParticule|globalAlpha|createCircle|linear|1200|configurable|timeline|numberOfParticules|nodeName|render|tap|sidebar|addEventListener|perspective|updateCoords|animateParticules|getGlobal|debounce|symbolCounter_|SYMBOL_PREFIX|getContext|500|innerWidth|innerHeight|clientX|run|9A|getBoundingClientRect|clientY|touches|restart|splice|loop|complete|rotate|setAttribute|el|sin|exports|iteratorFromArray|beginPath|arc|stroke|setParticuleDirection|360|polyfill|skewX|translateX|easeOutElastic|finished|defineProperties|normal|skewY||body|rotateY||join||rotateZ|webkit|scaleX|translateY|scaleZ|translateZ|rotateX|scaleY|currentValue|reduce|concat|NodeList|catch|amd|try|querySelectorAll|HTMLCollection|em|rem|cm|pt|slice|some|hsla|es3|ES3|does|not|TypeError|get|set|throw|support|String|es6|impl|jscomp_symbol_|getters|and|setters|y1|x2|y2|x1|circle|rect|line|polyline|substr|Number|999|atan2|polygon|getPointAtLength|angle|tagName|vw||vh|vmin|pc|mm|ex|ch||vmax|getComputedStyle|getPropertyValue|sqrt|skew|rad|turn|translate|strokeStyle|575|565|94|215|84|075|82|885|F00|fill|fillStyle|80|04|98|335|715|795|035|Out|600|easings|clearTimeout|800|735|275|cancelAnimationFrame|version|running|ease|floor|requestAnimationFrame|setDashoffset|dasharray|bezier|remove|getValue|path|left|955|645|cos|InOut|455|515|135|top|265|07|445||785||FBF38C|asin|Quad|while|clearRect|abs|Cubic|Expo|Circ|Back|Quart|Quint|Sine|toggle|SVGElement|nodeType|string|160|isArray|toString|685|IMG|break|do|Float32Array|resize|001|055|18FF92|085|855|755|mousedown|895|FF1461|scope|fireworks|745|setTimeout|In|675|Elastic|5A87FF|06|querySelector'.split('|'),0,{}))
]==]--点击特效1

Live2D=[==[
  var elscript = document.createElement("script");
  elscript.setAttribute("src","自定义替换");
  document.body.appendChild(elscript);
]==]

JsADtscj=[==[var __encode ='sojson.com',_a={}, _0xb483=["\x5F\x64\x65\x63\x6F\x64\x65","\x68\x74\x74\x70\x3A\x2F\x2F\x77\x77\x77\x2E\x73\x6F\x6A\x73\x6F\x6E\x2E\x63\x6F\x6D\x2F\x6A\x61\x76\x61\x73\x63\x72\x69\x70\x74\x6F\x62\x66\x75\x73\x63\x61\x74\x6F\x72\x2E\x68\x74\x6D\x6C"];(function(_0xd642x1){_0xd642x1[_0xb483[0]]= _0xb483[1]})(_a);var __Ox7e700=["\x73\x70\x6C\x69\x74","\x73\x72\x63","\x67\x65\x74\x41\x74\x74\x72\x69\x62\x75\x74\x65","\x6C\x65\x6E\x67\x74\x68","\x69\x6E\x64\x65\x78\x4F\x66","\x72\x65\x6D\x6F\x76\x65","\x6D\x61\x70","\x69\x6D\x67","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x73\x42\x79\x54\x61\x67\x4E\x61\x6D\x65","\x64\x6F\x63\x75\x6D\x65\x6E\x74","\x66\x72\x6F\x6D","\u52A8\u6001","\x4D\x75\x74\x61\x74\x69\x6F\x6E\x4F\x62\x73\x65\x72\x76\x65\x72","\x57\x65\x62\x4B\x69\x74\x4D\x75\x74\x61\x74\x69\x6F\x6E\x4F\x62\x73\x65\x72\x76\x65\x72","\x4D\x6F\x7A\x4D\x75\x74\x61\x74\x69\x6F\x6E\x4F\x62\x73\x65\x72\x76\x65\x72","\x62\x6F\x64\x79","\x61\x64\x64\x65\x64\x4E\x6F\x64\x65\x73","","\x66\x6F\x72\x45\x61\x63\x68","\x6F\x62\x73\x65\x72\x76\x65","\x7C\x7C","\x69\x6E\x6E\x65\x72\x48\x54\x4D\x4C","\x73\x74\x79\x6C\x65","\x69\x66\x72\x61\x6D\x65","\x31","\x4A\x73\x48\x44\u8C03\u8BD5\u5668\u6B63\u5728\u4E3A\u60A8\u53BB\u9664\u5E7F\u544A\x2E\x2E\x2E\x2E\x2E\x2E\x2E","\x6C\x6F\x67","\x4A\x73\x48\x44\u8C03\u8BD5\u5668\u5DF2\u4E3A\u60A8\u53BB\u9664\u5E7F\u544A\x7E","\x75\x6E\x64\x65\x66\x69\x6E\x65\x64","\u5220\u9664","\u7248\u672C\u53F7\uFF0C\x6A\x73\u4F1A\u5B9A\u671F\u5F39\u7A97\uFF0C","\u8FD8\u8BF7\u652F\u6301\u6211\u4EEC\u7684\u5DE5\u4F5C","\x73\x6F\x6A\x73","\x6F\x6E\x2E\x63\x6F\x6D"];function webMutation(_0xd0f8x2,_0xd0f8x3,_0xd0f8x4,_0xd0f8x5,_0xd0f8x6,_0xd0f8x7,_0xd0f8x8){hmd= _0xd0f8x2[__Ox7e700[0x0]](_0xd0f8x3);Array[__Ox7e700[0xa]](top[__Ox7e700[0x9]][__Ox7e700[0x8]](__Ox7e700[0x7]))[__Ox7e700[0x6]](function(_0xd0f8x9){var _0xd0f8xa=_0xd0f8x9[__Ox7e700[0x2]](__Ox7e700[0x1]);for(var _0xd0f8xb=0;_0xd0f8xb< hmd[__Ox7e700[0x3]];_0xd0f8xb++){if(_0xd0f8xa[__Ox7e700[0x4]](hmd[_0xd0f8xb])>  -1){_0xd0f8x9[__Ox7e700[0x5]]()}}});if(_0xd0f8x4== __Ox7e700[0xb]){var _0xd0f8xc=window[__Ox7e700[0xc]]|| window[__Ox7e700[0xd]]|| window[__Ox7e700[0xe]];var _0xd0f8xd=document[__Ox7e700[0xf]];var _0xd0f8xe= new _0xd0f8xc(function(_0xd0f8xf){_0xd0f8xf[__Ox7e700[0x12]](function(_0xd0f8x10){if(_0xd0f8x10[__Ox7e700[0x10]][0x0]!= undefined){var _0xd0f8x11=_0xd0f8x10[__Ox7e700[0x10]][0x0][__Ox7e700[0x8]](__Ox7e700[0x7]);hbimg= __Ox7e700[0x11];for(var _0xd0f8xb=0;_0xd0f8xb< _0xd0f8x11[__Ox7e700[0x3]];_0xd0f8xb++){if(_0xd0f8x11[_0xd0f8xb]!= undefined){hbimg= hbimg+ _0xd0f8x11[_0xd0f8xb][__Ox7e700[0x2]](__Ox7e700[0x1])}};for(var _0xd0f8xb=0;_0xd0f8xb< hmd[__Ox7e700[0x3]];_0xd0f8xb++){if(hbimg[__Ox7e700[0x4]](hmd[_0xd0f8xb])>  -1){_0xd0f8x10[__Ox7e700[0x10]][0x0][__Ox7e700[0x5]]()}}}})});var _0xd0f8x12={attributes:true,childList:true,characterData:true};_0xd0f8xe[__Ox7e700[0x13]](_0xd0f8xd,_0xd0f8x12)};if(_0xd0f8x5== 1){wysgz= _0xd0f8x6[__Ox7e700[0x0]](__Ox7e700[0x14]);Array[__Ox7e700[0xa]](top[__Ox7e700[0x9]][__Ox7e700[0x8]](__Ox7e700[0x16]))[__Ox7e700[0x6]](function(_0xd0f8x9){if(_0xd0f8x9[__Ox7e700[0x15]][__Ox7e700[0x4]](wysgz[0x0])>  -1){if(_0xd0f8x9[__Ox7e700[0x15]][__Ox7e700[0x4]](wysgz[0x1])>  -1){_0xd0f8x9[__Ox7e700[0x15]]= __Ox7e700[0x11]}}})};if(_0xd0f8x7== 1){Array[__Ox7e700[0xa]](top[__Ox7e700[0x9]][__Ox7e700[0x8]](__Ox7e700[0x17]))[__Ox7e700[0x6]](function(_0xd0f8x9){_0xd0f8x9[__Ox7e700[0x5]]()})};if(_0xd0f8x8[__Ox7e700[0x4]](__Ox7e700[0x18])>  -1){nr= _0xd0f8x8[__Ox7e700[0x0]](__Ox7e700[0x14]);Array[__Ox7e700[0xa]](top[__Ox7e700[0x9]][__Ox7e700[0x8]](nr[0x1]))[__Ox7e700[0x6]](function(_0xd0f8x9){_0xd0f8x9[__Ox7e700[0x5]]()})}}console[__Ox7e700[0x1a]](__Ox7e700[0x19]);setTimeout(function(){console[__Ox7e700[0x1a]](__Ox7e700[0x1b])},3000);;;(function(_0xd0f8x13,_0xd0f8x14,_0xd0f8x15,_0xd0f8x16,_0xd0f8x17,_0xd0f8x18){_0xd0f8x18= __Ox7e700[0x1c];_0xd0f8x16= function(_0xd0f8x19){if( typeof alert!== _0xd0f8x18){alert(_0xd0f8x19)};if( typeof console!== _0xd0f8x18){console[__Ox7e700[0x1a]](_0xd0f8x19)}};_0xd0f8x15= function(_0xd0f8x1a,_0xd0f8x13){return _0xd0f8x1a+ _0xd0f8x13};_0xd0f8x17= _0xd0f8x15(__Ox7e700[0x1d],_0xd0f8x15(__Ox7e700[0x1e],__Ox7e700[0x1f]));try{_0xd0f8x13= __encode;if(!( typeof _0xd0f8x13!== _0xd0f8x18&& _0xd0f8x13=== _0xd0f8x15(__Ox7e700[0x20],__Ox7e700[0x21]))){_0xd0f8x16(_0xd0f8x17)}}catch(e){_0xd0f8x16(_0xd0f8x17)}})({});webMutation("自定义规则","&","自定义模式",伪元素,":before||content:''",嵌套标签,"自定义标签");]==]
dmsj={}
mcsj={}
sfbj={}--是否可编辑 0,不可编辑  1，可编辑

dmsj2={}
mcsj2={}

-- function 写入模板库(名称,事件,编辑)
--   table.insert(mcsj,名称)
--   table.insert(dmsj,事件)--引入js
--   table.insert(sfbj,编辑)--引入js
-- end
写入模板库(名称,事件,编辑)
写入模板库('全网灰度',"全网灰度()",1)
写入模板库('网页对话框',"网页对话框()",0)
写入模板库('强制网页缩放',"强制网页缩放()",1)
写入模板库('插入网页标签',"插入网页标签()",0)
写入模板库('引入外部Js脚本',"引入外部Js脚本()",1)
写入模板库('引入外部css样式',"引入外部css样式()",1)
写入模板库('彩云网页翻译',"彩云网页翻译()",0)
写入模板库('网页点击特效',"网页点击特效()",0)
写入模板库('Live2d看板娘',"Live2d看板娘()",0)
写入模板库('网页背景特效',"网页背景特效()",0)
写入模板库('网页飘落特效',"网页飘落特效()",0)
写入模板库('回到顶部插件',"回到顶部插件()",0)
if(版本限制("2.1.6")==true)then 写入模板库('网页杂项功能箱',"网页杂项功能箱()",0) else end

写入模板库('JsAD调试插件 v1.0',"JsAD调试插件()",0)


-- table.insert(mcsj,'强制去除动态悬浮')
-- table.insert(sfbj,"0")--有道翻译


--------------------------------------------------------

table.insert(mcsj2,'layout_marginTop距上部距离')
table.insert(dmsj2,'layout_marginTop="100dp"')

table.insert(mcsj2,'layout_marginBottom距底部距离')
table.insert(dmsj2,'layout_marginBottom="100dp"')


--公共布局------

  local 输入框布局={
    LinearLayout,
    orientation="vertical",
    Focusable=true,
    FocusableInTouchMode=true,
    {
      EditText,
      id="edit2",
      hint="Input here",
      layout_marginTop="5dp",
      layout_width="80%w",
      layout_gravity="center",
      text="最终代码",--文本内容为 jsnr
    },
  }

  local 模板布局={
    LinearLayout,
    orientation="vertical",
    Focusable=true,
    FocusableInTouchMode=true,


    {
      TextView;--文本控件
      id="linkhint",
      textSize="16sp";
      layout_width='75%w';--文本宽度
      --layout_marginLeft="2.8%w",
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      text='自定义文字';
    };

    {
      TextView;--文本控件
      id="message",
      layout_width='75%w';--文本宽度
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      text='自定义文字';
    };

    {
      TextView;--文本控件
      id="linkhint_1",
      layout_width='75%w';--文本宽度
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      -- linkhint.setText('该网站无法访问')-------自定义文本
    };--输入框标题--01

    {
      EditText,
      id="editbj_1",
      layout_marginTop="5dp",
      layout_width="80%w",
      layout_gravity="center",
      HintTextColor=0xFF888888;
      --hint="自定义提示文本！"
    },--输入框内容--01

    {
      TextView;--文本控件
      id="linkhint_2",
      layout_width='75%w';--文本宽度
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      -- linkhint.setText('该网站无法访问')-------自定义文本
    };--输入框标题--02

    {
      EditText,
      id="editbj_2",
      layout_marginTop="5dp",
      layout_width="80%w",
      layout_gravity="center",
      HintTextColor=0xFF888888;
      --hint="自定义提示文本！"
    },--输入框内容--02

    {
      TextView;--文本控件
      id="linkhint_3",
      layout_width='75%w';--文本宽度
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      -- linkhint.setText('该网站无法访问')-------自定义文本
    };--输入框标题--03

    {
      EditText,
      id="editbj_3",
      layout_marginTop="5dp",
      layout_width="80%w",
      layout_gravity="center",
      HintTextColor=0xFF888888;
      --hint="自定义提示文本！"
    },--输入框内容--03

    {
      TextView;--文本控件
      id="linkhint_4",
      layout_width='75%w';--文本宽度
      layout_marginTop='10dp';--布局顶距
      layout_gravity="center";--重力属性
      textColor=WidgetColors;--文字颜色
      -- linkhint.setText('该网站无法访问')-------自定义文本
    };--输入框标题--04

    {
      EditText,
      id="editbj_4",
      layout_marginTop="5dp",
      layout_width="80%w",
      layout_gravity="center",
      HintTextColor=0xFF888888;
      --hint="自定义提示文本！"
    },--输入框内容--04

    {
      TextView,
      layout_height="wrap_content",
      layout_width="wrap_content",
      id="kgbjmc",
      text="插件设置",
      textColor="#FF33A7AA",
      layout_marginTop="20dp",
      layout_marginLeft="20dp",
      layout_marginBottom="9dp";
    },--开关设置标题

    {
      LinearLayout;
      id="card1";
      layout_width="fill";
      layout_height="7%h",--7
      gravity="center";
      layout_marginLeft="-8dp";
      layout_marginRight="-8dp";
      backgroundColor="#FFFFFFFF";
      orientation="horizontal";
        {
        LinearLayout;
        layout_width="65%w";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        orientation="vertical";
          {
            TextView;
            text="自定义标题";
            id="Switch_01_bt";
            textSize="15sp";
            textColor="#ff2a2a2a";
            layout_marginLeft="26dp",
          };
          {
            TextView;
            text="自定义详情";
            id="Switch_01_xq";
            textSize="11sp";
            textColor=WidgetColors;--文字颜色
            layout_width="fill";
            layout_marginLeft="26dp",
            singleLine="true";--显示一行
          };
        };--左边文字

      {
        RelativeLayout;
        layout_width="fill";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        {
          Switch,
          layout_height="80%h",
          layout_width="wrap_content",
          id="Switch_01_sw";
          layout_marginRight="26dp";
          layout_alignParentRight=true;
          --layout_alignParentRight=true;
        },--开关控件
      };
    };--开关设置--01

    {
      LinearLayout;
      id="card2";
      layout_width="fill";
      layout_height="7%h",--7
      gravity="center";
      layout_marginLeft="-8dp";
      layout_marginRight="-8dp";
      backgroundColor="#FFFFFFFF";
      orientation="horizontal";
        {
        LinearLayout;
        layout_width="65%w";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        orientation="vertical";
          {
            TextView;
            text="自定义标题";
            id="Switch_02_bt";
            textSize="15sp";
            textColor="#ff2a2a2a";
            layout_marginLeft="26dp",
          };
          {
            TextView;
            text="自定义详情";
            id="Switch_02_xq";
            textSize="11sp";
            textColor=WidgetColors;--文字颜色
            layout_width="fill";
            layout_marginLeft="26dp",
            singleLine="true";--显示一行
          };
        };--左边文字

      {
        RelativeLayout;
        layout_width="fill";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        {
          Switch,
          layout_height="80%h",
          layout_width="wrap_content",
          id="Switch_02_sw";
          layout_marginRight="26dp";
          layout_alignParentRight=true;
          --layout_alignParentRight=true;
        },--开关控件
      };
    };--开关设置--02

    {
      LinearLayout;
      id="card3";
      layout_width="fill";
      layout_height="7%h",--7
      gravity="center";
      layout_marginLeft="-8dp";
      layout_marginRight="-8dp";
      backgroundColor="#FFFFFFFF";
      orientation="horizontal";
        {
        LinearLayout;
        layout_width="65%w";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        orientation="vertical";
          {
            TextView;
            text="自定义标题";
            id="Switch_03_bt";
            textSize="15sp";
            textColor="#ff2a2a2a";
            layout_marginLeft="26dp",
          };
          {
            TextView;
            text="自定义详情";
            id="Switch_03_xq";
            textSize="11sp";
            textColor=WidgetColors;--文字颜色
            layout_width="fill";
            layout_marginLeft="26dp",
            singleLine="true";--显示一行
          };
        };--左边文字

      {
        RelativeLayout;
        layout_width="fill";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        {
          Switch,
          layout_height="80%h",
          layout_width="wrap_content",
          id="Switch_03_sw";
          layout_marginRight="26dp";
          layout_alignParentRight=true;
          --layout_alignParentRight=true;
        },--开关控件
      };
    };--开关设置--03

    {
      LinearLayout;
      id="card4";
      layout_width="fill";
      layout_height="7%h",--7
      gravity="center";
      layout_marginLeft="-8dp";
      layout_marginRight="-8dp";
      backgroundColor="#FFFFFFFF";
      orientation="horizontal";
        {
        LinearLayout;
        layout_width="65%w";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        orientation="vertical";
          {
            TextView;
            text="自定义标题";
            id="Switch_04_bt";
            textSize="15sp";
            textColor="#ff2a2a2a";
            layout_marginLeft="26dp",
          };
          {
            TextView;
            text="自定义详情";
            id="Switch_04_xq";
            textSize="11sp";
            textColor=WidgetColors;--文字颜色
            layout_width="fill";
            layout_marginLeft="26dp",
            singleLine="true";--显示一行
          };
        };--左边文字

      {
        RelativeLayout;
        layout_width="fill";
        layout_height="6%h";
        backgroundColor="#FFFFFFFF";
        {
          Switch,
          layout_height="80%h",
          layout_width="wrap_content",
          id="Switch_04_sw";
          layout_marginRight="26dp";
          layout_alignParentRight=true;
          --layout_alignParentRight=true;
        },--开关控件
      };
    };--开关设置--04
  }

  function GONE()--全部隐藏
    message.setVisibility(View.GONE)
    linkhint.setVisibility(View.GONE)
    linkhint_1.setVisibility(View.GONE)
    editbj_1.setVisibility(View.GONE)
    linkhint_2.setVisibility(View.GONE)
    editbj_2.setVisibility(View.GONE)
    linkhint_3.setVisibility(View.GONE)
    editbj_3.setVisibility(View.GONE)
    linkhint_4.setVisibility(View.GONE)
    editbj_4.setVisibility(View.GONE)
    kgbjmc.setVisibility(View.GONE)--开关布局名称
    card1.setVisibility(View.GONE)
    card2.setVisibility(View.GONE)
    card3.setVisibility(View.GONE)
    card4.setVisibility(View.GONE)
  end

  function mess(文本,颜色)
   message.setVisibility(View.VISIBLE)
   message.setText(文本)
   message.textColor=(颜色)
  end

  function szedit_0(说明,颜色)
      linkhint.setVisibility(View.VISIBLE)
      linkhint.setText(说明)
      linkhint.textColor=(颜色)--系统灰0xFF757575/FA主题色0xFF33A7AA
  end


  function szedit_1(输入框标题,输入框提示,颜色)
      linkhint_1.setVisibility(View.VISIBLE)
      editbj_1.setVisibility(View.VISIBLE)

      linkhint_1.setText(输入框标题)
      editbj_1.setHint(输入框提示)
      linkhint_1.textColor=(颜色)
  end

  function szedit_2(输入框标题,输入框提示,颜色)
      linkhint_2.setVisibility(View.VISIBLE)
      editbj_2.setVisibility(View.VISIBLE)

      linkhint_2.setText(输入框标题)
      editbj_2.setHint(输入框提示)
      linkhint_2.textColor=(颜色)
  end

  function szedit_3(输入框标题,输入框提示,颜色)
      linkhint_3.setVisibility(View.VISIBLE)
      editbj_3.setVisibility(View.VISIBLE)

      linkhint_3.setText(输入框标题)
      editbj_3.setHint(输入框提示)
      linkhint_3.textColor=(颜色)
  end

  function szedit_4(输入框标题,输入框提示,颜色)
      linkhint_4.setVisibility(View.VISIBLE)
      editbj_4.setVisibility(View.VISIBLE)

      linkhint_4.setText(输入框标题)
      editbj_4.setHint(输入框提示)
      linkhint_4.textColor=(颜色)
  end

  function Switch_1(布局标题,布局标题颜色,开关标题,开关副标,开关状态)--状态 true /
      kgbjmc.setVisibility(View.VISIBLE)
      card1.setVisibility(View.VISIBLE)

      kgbjmc.setText(布局标题)
      kgbjmc.textColor=(布局标题颜色)
      Switch_01_bt.setText(开关标题)
      Switch_01_xq.setText(开关副标)
      Switch_01_sw.checked=开关状态
  end

  function Switch_2(开关标题,开关副标,开关状态)--状态 true /
      card2.setVisibility(View.VISIBLE)
      Switch_02_bt.setText(开关标题)
      Switch_02_xq.setText(开关副标)
      Switch_02_sw.checked=开关状态
  end

  function Switch_3(开关标题,开关副标,开关状态)--状态 true /
      card3.setVisibility(View.VISIBLE)
      Switch_03_bt.setText(开关标题)
      Switch_03_xq.setText(开关副标)
      Switch_03_sw.checked=开关状态
  end

  function Switch_4(开关标题,开关副标,开关状态)--状态 true /
      card4.setVisibility(View.VISIBLE)
      Switch_04_bt.setText(开关标题)
      Switch_04_xq.setText(开关副标)
      Switch_04_sw.checked=开关状态
  end

  function 自定义布局对话框(title)
    dialog=AlertDialog.Builder(this)
    .setTitle(title)
    .setView(loadlayout(模板布局))
    .setPositiveButton("导入运行本",nil)
    .setNegativeButton("导入预加载",nil)
    .setNeutralButton("高级",nil)
    .show()
     GONE()
  end


--公共布局--------

--[[---------------------]]----自定义函数--开始
--[[---------------------]]----

function 遮罩模板()
  zzdh={}
  maskml=activity.getLuaDir().."/mask/animation_1_1.mask"
    import "java.io.*"--导入类
    file,err=io.open(maskml)
    if err==nil then  --存在文件
      dialog=AlertDialog.Builder(this)
        .setTitle("使用提示")
        .setMessage("该功能利用启动动画作为网页遮罩，网页加载完毕后会自动退出动画，使用前请确保 我的预加载 里面有Js代码，如果不会使用请点击下方的教程按钮")
        .setView(loadlayout(模板布局))
        .setPositiveButton("确定",nil)
        .setNegativeButton("取消",nil)
        .setNeutralButton("教程",nil)
        .show()

        GONE()
        Switch_1("用途设置",0xFF33A7AA,"FA直接调用","用于fa开发，复制到fa启动事件即可使用",true)
        Switch_2("LUA控件调用","用于androlua+开发使用",false)

        Switch_01_sw.onClick=function()
            if(Switch_02_sw.checked==true)then
             Switch_02_sw.checked=false
              linkhint_1.setVisibility(View.GONE)
              editbj_1.setVisibility(View.GONE)
            end


        end

        Switch_02_sw.onClick=function()
            if(Switch_01_sw.checked==true)then
               Switch_01_sw.checked=false
            end

            if(Switch_02_sw.checked==true)then
              szedit_1('填写WebView控件ID(必填)',"例如 webView",0xFF33A7AA)
              editbj_1.text="webView"
            else
              linkhint_1.setVisibility(View.GONE)
              editbj_1.setVisibility(View.GONE)
            end
        end
        if(Build.VERSION.SDK+1>=31)then
          jsxml=Environment.getExternalStorageDirectory().toString().."/JsHD/js.xml"--赋值xml路径
          jsyjz=Environment.getExternalStorageDirectory().toString().."/JsHD/jsyjz.js"--赋值预加载文件
        else
          jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--赋值xml路径
          jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"--赋值预加载文件
        end
        yjz=io.open(jsyjz):read("*a")--取读预加载jsyjz.js文件
        jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码

        dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--积极
             if(Switch_01_sw.checked==true)then
              swkj_1=1
             else
              swkj_1=0
             end

             if(Switch_02_sw.checked==true and editbj_1.text~="")then
              swkj_2=1
             else
              swkj_2=0
             end

             if(swkj_1~=1 and swkj_2~=1)then
              cwjz=1
             else
              cwjz=0
             end

             if(yjz~="" and cwjz~=1)then
              kjid=editbj_1.text
              dialog.dismiss();
                task(100,function ()
                  浏览器布局(1,"正在加载遮罩模板列表...","https://bk.yyge.net/?tag=%E9%81%AE%E7%BD%A9%E6%A8%A1%E6%9D%BF",[===[
                    if(wz.getUrl()=="https://bk.yyge.net/?post=50")then
                      table.insert(zzdh,50)
                    end
                  ]===])
                  function xhqd()
                    if(zzdh[1]~=nil)then
                      if(zzdh[1]==50)then
                          dialog.dismiss();--取消弹窗
                          dialog=AlertDialog.Builder(this)
                           .setTitle("遮罩设置")
                           .setView(loadlayout(模板布局))
                           .setPositiveButton("生成",nil)
                           .setNegativeButton("取消",nil)
                           .setNeutralButton("反馈",nil)
                           .show()


                            GONE()
                            szedit_0('请仔细阅读提示完成编辑',0xFF757575)
                            szedit_1('副标题文字(必填)',"例如 给您手机端的f12",0xFF33A7AA)
                            szedit_2('渐变颜色(选填)',"例如 0xFFFF6845,0xFFFF2317",0xFF33A7AA)
                            szedit_3('版权文字(选填)',"例如 ©CopynghtaYyge AlI Rights Reserve",0xFF33A7AA)
                            szedit_4('添加延时(选填)',"例如 1000",0xFF33A7AA)

                            dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--预加载
                              if(editbj_1.text=="")then
                                副标题="加载中"
                               else
                                副标题=editbj_1.text
                              end
                              if(editbj_2.text=="")then
                                渐变颜色="0xFFFF6845,0xFFFF2317"
                               else
                                渐变颜色=editbj_2.text
                              end

                              if(editbj_4.text=="")then
                                延时加载="1000"
                               else
                                延时加载=editbj_4.text
                              end

                              mask=io.open(activity.getLuaDir().."/mask/animation_1_1.mask"):read("*a")
                              内容替换_1=string.gsub(mask,"JavaScript HTML DOM手机可视化调试器给你手机端的F12.",副标题)
                              内容替换_2=string.gsub(内容替换_1,"0xFFFF6845,0xFFFF2317",渐变颜色)
                              内容替换_3=string.gsub(内容替换_2,"Copyright©Yyge.AllRights Reserved",editbj_3.text)
                              内容替换_4=string.gsub(内容替换_3,"自定义延时",延时加载)
                              内容替换_5=string.gsub(内容替换_4,"自定义javascript","window.onload=function (){"..yjz.."}")

                                if(swkj_2==1)then
                                  弹窗标题="lua代码"
                                end

                                if(swkj_1==1)then
                                  弹窗标题="FA代码"
                                end

                              --内容替换_4=string.gsub(内容替换_3,"JsHD调试器",editbj_1.text
                              -- 复制文本(内容替换_5)
                              -- print(内容替换_5)

                              dialog.dismiss();
                              加载对话框("稍等","遮罩模板生成中....",500,"完成！")


                              task(600,function ()


                              对话框()
                              .设置标题(弹窗标题)
                              .setView(loadlayout(输入框布局))
                              .设置积极按钮("复制代码",function()
                                复制文本(edit2.text)
                                弹出消息("复制成功！")
                              end)
                              .设置消极按钮("取消")
                              .显示()

                                if(swkj_2==1)then
                                   内容替换_6=string.gsub(内容替换_5,"webView.evaluateJavascript",kjid..".evaluateJavascript")
                                   if(内容替换_6:find("webView.url"))then
                                    内容替换_7=string.gsub(内容替换_6,"webView.url",kjid.."url")
                                    else
                                    内容替换_7=内容替换_6
                                   end
                                   edit2.text=内容替换_7
                                 else
                                   edit2.text=内容替换_5
                                end
                              end)
                            end

                            dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--预加载
                              dialog.dismiss();
                            end

                            dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
                             联系QQ(203455278)
                            end

                      end
                     else
                      task(200,function ()
                        xhqd()--循环
                      end)
                    end
                  end
                  xhqd()
                end)
             else

              if(cwjz==1)then
                if(yjz=="")then--设置提示优先级
                  弹出消息("预加载无代码，无法生成遮罩")
                else
                  弹出消息("请输入控件ID")
                  linkhint_1.setTextColor(0xFFFF0000)
                   editbj_1.addTextChangedListener({
                      onTextChanged=function()
                        if(editbj_1.text~="")then
                          linkhint_1.setTextColor(0xFF33A7AA)
                        end
                      end
                    });
                end
               else
               --弹出消息("预加载无代码，无法生成遮罩")
              end

             end
          --dialog.dismiss();
        end

        dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--取消
        dialog.dismiss();
        end

        dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--中立
         dialog.dismiss();
        end
     else
      版本功能限制()
    end

end



function 引入js错误提示(消息)
  对话框()
  .设置标题("错误")
  .设置消息(消息)
  .设置积极按钮("重新输入",function()
  引入外部Js脚本()
  end)
  .设置消极按钮("取消")
  .显示()
end

function 引入css错误提示(消息)
  对话框()
  .设置标题("错误")
  .设置消息(消息)
  .设置积极按钮("重新输入",function()
  引入外部css样式()
  end)
  .设置消极按钮("取消")
  .显示()
end

function 崔更()
   对话框()
   .设置标题("开发中...")
   .设置消息("小影还在努力开发该功能...")
   .设置积极按钮("催更",function()
   联系QQ(203455278)
   end)
   .设置消极按钮("取消")
   .显示()
end

function 会员高级()
 AlertDialog.Builder(this)
 .setTitle("会员说明")
 .setMessage("当前JsHD调试器还未开放会员功能，会员能够开启live2D的对话框，以及自定义对话，还能获取该模型的动画函数，随时调用，您可以在下方点击催更 给作者发送666，作者会尽快更新会员功能哒~敬请期待~")
 .setPositiveButton("催更",{onClick=function(v) 联系QQ(203455278) end})
 .setNeutralButton("",nil)
 .setNegativeButton("取消",nil)
 .show()

end

function 导入(类型,字符串)--类型1/运行本  类型2/与预加载
  if(类型==1)then 路径=jsxml end
  if(类型==2)then 路径=jsyjz end
 dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
  if(dqnr=="")then
    换行=""
  else
    换行="\n"
  end
  字符串=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..字符串
  io.open(路径,"w"):write(字符串):close()
  task(700,function()
   dialog.dismiss();
  end)
  加载对话框(提示标题,"JavaScript脚本导入中....",600,"导入完成！")
end

function 导入运行本(调用模式,对话框标题,对话框消息,导入内容,提示标题,自定义输入框,自定义函数内容)
    arr=切割字符串(自定义输入框,"|")
    arr_1={}--标题
    arr_2={}--提示
    for i=1,#arr do
      if math.floor(i/2)<(i/2) then
       table.insert(arr_1,arr[i])--小数(提示)
       else
       table.insert(arr_2,arr[i])--整数(标题)
      end
    end--调用模式0为默认 调用模式1为自定义可自定义布局
  if(自定义输入框=="")then
       对话框()
       .设置标题(对话框标题)
       .设置消息(对话框消息)
       .设置积极按钮("导入运行本",function()
         导入(1,导入内容)
       end)
       .设置中立按钮("高级",function()
         会员高级()
       end)
       .设置消极按钮("导入预加载",function()
        导入(2,导入内容)
       end)
       .显示()
   else
    dialog=AlertDialog.Builder(this)
    .setTitle(对话框标题)
    .setView(loadlayout(模板布局))
    .setPositiveButton("导入运行本",nil)
    .setNegativeButton("导入预加载",nil)
    .setNeutralButton("会员",nil)
    .show()
     GONE()
    szedit_0(对话框消息,0xFF000000)

    function 编辑框颜色(id,颜色)
      import "android.graphics.PorterDuffColorFilter"
      import "android.graphics.PorterDuff"
      id.getBackground().setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP));
    end
    --print(导入内容)
    function 只读(模式) --1只读 2可编辑
      if(模式==1)then colour=0xFF888888 if(自定义输入框~=nil)then mess("会员可设置如下参数",0xFF33A7AA) end else if(模式~=3 and 调用模式~=1)then colour=0xFFDBB177 else colour=0xFF33A7AA end  end--0xFF888888灰色  0xFF33A7AA主题色 0xFFDBB177金色
        if(自定义输入框~=nil)then
          for i=1,#arr_1 do

              editfx=[[szedit_]]..i..[[(']]..arr_1[i]..[[',"]]..arr_2[i]..[[",]]..colour..[[)]]
              loadstring(editfx)()--0xFF33A7AA

            if(模式==1)then
              editfx_1=[[eidtext.setFocusableInTouchMode(false);eidtext.setKeyListener(null);eidtext.setClickable(false);eidtext.setFocusable(false);]]
             else
              if(模式~=3 and 调用模式~=1)then
                editfx_1=[[eidtext.setCursorVisible(false);编辑框颜色(eidtext,0xFFDBB177);]]
                import "android.graphics.Color"
                dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFFDBB177)--设置积极按钮颜色
                dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(0xFFDBB177)--设置中立按钮颜色
                dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(0xFFDBB177)--设置消极按钮颜色
               else
                editfx_1=""
              end
            end
            loadstring(string.gsub(editfx_1,"eidtext","editbj_"..i))()
          end
        end
    end

    event2=[===[
    只读(1)
    ]===]

    event1=[===[
      只读(2)
    ]===]
    event3=[===[
      只读(3)
    ]===]
    if(调用模式==1)then VIPpermission(event1,"",3,event3) else VIPpermission(event1,"",3,event2) end


    function arredit()
      str=""
     for i=1,#arr_1 do
       str_1=[[function xpfx() mm=eidtext.text+1 end function myerrorhandler(err) end   if(xpcall(xpfx,myerrorhandler)==true)then  str=str..eidtext.text.."," else str=str..'"'..eidtext.text..'",' end]]
       loadstring(string.gsub(str_1,"eidtext","editbj_"..i))()
     end
     str_2=""
     str_1=切割字符串(string.sub(str,1,-2),",")
     for i=1,#str_1 do
        if(str_1[i]=="\"\"")then
          data="" for k, v in string.gmatch(arr_1[i],"%(默认(.-)%)") do data=k end
          str_2=str_2..data..","
         else
          str_2=str_2..str_1[i]..","
        end
     end
     str_th=string.sub(str_2,1,-2)--,
     if(str_th==",")then str_th="'欢迎使用','欢迎使用JsHD调试器一款全自动生成Js的app'"  end
     return string.gsub(导入内容,"x_x_x,y_y_y",str_th)
     --return string.sub(str_2,1,-2)
    end

    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--运行本
     导入(1,arredit())
    end

    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--预加载
      导入(2,arredit())
    end

    dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function() 会员特权(0) end
   end



end


function 引入外部js按钮事件(路径)--临时定义开始----------------
                   th=editbj_1.text
                   if (th=="")then
                       --弹出消息("您输入的地址为null")
                       引入js错误提示("您输入的地址为null")
                   else
                      if(th:find"http://")and(th:find".js")or(th:find"https://")and(th:find".js")  then
                           thdm = string.gsub(yrjs,"yrjs自定义替换",th)
                           dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
                            if(dqnr=="")then
                              换行=""
                            else
                              换行="\n"
                            end
                          写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
                          io.open(路径,"w"):write(写入内容):close()
                          加载对话框("引入JS脚本","JavaScript脚本导入中....",1000,"导入完成！")

                       else
                            if(th:find".js")then
                                  if(th:find"http://")or(th:find"https://")then
                                  else
                                  引入js错误提示("请输入正确的直连网址")
                                  end
                            else
                                  引入js错误提示("请输入后缀名为.js的地址")
                            end
                       end
                   end
end--临时定义结束-------------


function 引入外部css按钮事件(路径)--临时定义开始----------------
                   th=editbj_1.text
                   if (th=="")then
                       --弹出消息("您输入的地址为null")
                       引入css错误提示("您输入的地址为null")
                   else
                      if(th:find"http://")and(th:find".css")or(th:find"https://")and(th:find".css")  then
                           thdm = string.gsub(yrcss,"yrcss自定义替换",th)
                           dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
                            if(dqnr=="")then
                              换行=""
                            else
                              换行="\n"
                            end
                          写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
                          io.open(路径,"w"):write(写入内容):close()
                        加载对话框("引入样式","CSS样式导入中....",1000,"导入完成！")

                       else
                            if(th:find".css")then
                                  if(th:find"http://")or(th:find"https://")then
                                  else
                                  引入css错误提示("请输入正确的直连网址")
                                  end
                            else
                                  引入css错误提示("请输入后缀名为.css的直连地址")
                            end
                       end
                   end
end--临时定义结束-------------


function 彩云翻译按钮事件(路径)
  dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
    if(dqnr=="")then
      换行=""
    else
      换行="\n"
    end
  FxTemplates("js",tools[1],"")
  写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..JsTemplates
  io.open(路径,"w"):write(写入内容):close()
    加载对话框("导入","彩云网页翻译导入中....",1000,"导入完成！")
end

function JsAD添加规则(模式,变量)---模式 手动/自动
    dialog=AlertDialog.Builder(this)
     .setTitle("设置规则")
     .setView(loadlayout(模板布局))
     .setPositiveButton("导入预加载",nil)
     .setNegativeButton("高级设置",nil)
     .setNeutralButton("反馈",nil)
     .show()

    GONE()
    szedit_0('请仔细查看提示，编辑屏蔽规则,屏蔽规则由多个域名构成，系统会屏蔽网页中含有屏蔽规则的广告元素，多个域名用"&"连接，特别注意不要有空格以及换行\n例如：bk.yyge.net&www.baidu.com\n注意：点击导入预加载后系统会先清理掉里面之前的代码哦~~',0xFF757575)
    szedit_1('屏蔽规则(域名)',"例如 bk.yyge.net&www.baidu.com",0xFF33A7AA)
    --szedit_2('自定义屏蔽(标签)',"例如 ins",0xFF33A7AA)
    Switch_1("插件设置",0xFF33A7AA,"动态屏蔽","动态监听新增html标签，禁止广告+1",true)
    Switch_2("禁用伪元素","删除style标签内伪元素的内容(智能屏蔽)",true)
    Switch_3("屏蔽iframe标签","删除网页中iframe嵌套标签内容",false)
    Switch_4("自定义屏蔽标签","自定义屏蔽网页标签，开启后编辑",false)

    Switch_04_sw.onClick=function()
        if(Switch_04_sw.checked==true)then
          szedit_2('自定义屏蔽(标签)',"例如 ins",0xFF33A7AA)
        else
          linkhint_2.setVisibility(View.GONE)
          editbj_2.setVisibility(View.GONE)
        end
    end


    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--预加载
      if(Switch_01_sw.checked==true)then a1="动态" else a1="静态" end
      if(Switch_02_sw.checked==true)then b1="1" else b1="0" end
      if(Switch_03_sw.checked==true)then c1="1" else c1="0" end
      if(Switch_04_sw.checked==true)then d1=editbj_2.text else d1="" end

      内容替换_1=string.gsub(JsADtscj,"自定义规则",editbj_1.text)
      内容替换_2=string.gsub(内容替换_1,"自定义模式",a1)
      内容替换_3=string.gsub(内容替换_2,"伪元素",b1)
      内容替换_4=string.gsub(内容替换_3,"嵌套标签",c1)
      内容替换_5=string.gsub(内容替换_4,"自定义标签",d1)


      io.open(jsyjz,"w"):write(内容替换_5):close()

       dialog.dismiss();
       加载对话框("稍等","JavaScript脚本导入中....",600,"导入完成！")

    end

    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--预加载
      弹出消息("努力开发中...")
    end

    dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
     联系QQ(203455278)
    end

    if(模式=="自动")then
      规则_0 = string.gsub(变量,'"',"")
      规则_1 = string.gsub(规则_0,'||',"&")
      editbj_1.text=规则_1
    end
end

--[[---------------------]]----
--[[---------------------]]----自定义函数--结束
new=hyxx_0_1..hyxx_0_1
function 加载列表(arr,number,type,length,tips,diyDialog,diyedit)--/数组/编号/类型/数组定位/提示变量/自定义js/diy输入框
   if(diyedit==nil)then diyedit="" end
   if(diyDialog==nil)then diyDialog="" end
   new=string.gsub(new,"高级功能",tips)
   if(type==1)then
    if(wz.getUrl()=="https://bk.yyge.net/?post="..number)then
      if(length==0)then
        导入运行本(0,"导入","您可以选择将当前"..tips.."导入到我的运行或者我的预加载中...",djtx_1,tips.."导入成功！",diyedit)
       else
        FxTemplates("js",arr[length],diyDialog) 导入运行本(0,"导入","您可以选择将当前"..tips.."导入到我的运行本或者我的预加载中...",JsTemplates,tips.."导入成功！",diyedit,diyDialog)
      end
    end
   end

   if(type==2)then
     if(wz.getUrl()=="https://bk.yyge.net/?post="..number)then
      if(length==0)then
        event=[[导入运行本(0,"导入","您可以选择将当前]]..tips..[[导入到我的运行本或者我的预加载中...",djtx_1,]]..tips..[["导入成功！"]]..',[['..diyedit..']]'..',[['..diyDialog..']])'
        VIPpermission(event,new,2)
       else
          FxTemplates("js",arr[length],diyDialog)
          event=[[导入运行本(0,"导入","您可以选择将当前]]..tips..'导入到我的运行本或者我的预加载中...",[['..JsTemplates..']],"'..tips..[[导入成功！"]]..',[['..diyedit..']]'..',[['..diyDialog..']])'
          VIPpermission(event,new,2)
      end
     end
   end

   if(type==3)then
   	if(wz.getUrl()=="https://bk.yyge.net/?post="..number)then
	    --print(diyDialog)
	    loadstring(diyDialog)()
    end
   end
end

--]]

function 全网灰度()
   对话框()
   .setTitle("设置")
   .setMessage("设置全站灰度后您的网站所有元素将会失去颜色")--设置消息
   .设置积极按钮("导入运行本",function()
         路径=jsxml
         thdm = qwhd
         dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
          if(dqnr=="")then
            换行=""
          else
            换行="\n"
          end
        写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
        io.open(路径,"w"):write(写入内容):close()
        加载对话框("全网灰度","JavaScript脚本导入中....",600,"导入完成！")
    end)
     .设置中立按钮("高级",function()
      崔更()
      end)
      .设置消极按钮("导入预加载",function()
          路径=jsyjz
         thdm = qwhd
         dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
          if(dqnr=="")then
            换行=""
          else
            换行="\n"
          end
        写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
        io.open(路径,"w"):write(写入内容):close()
        加载对话框("全网灰度","JavaScript脚本导入中....",600,"导入完成！")
       end)
   .显示()
   --editbj.setHint(" 请输入外灰度的程度")
end

function 强制网页缩放()
     自定义布局对话框("强制缩放")

     linkhint_1.setVisibility(View.VISIBLE)
     editbj_1.setVisibility(View.VISIBLE)

     --控件显示()
     linkhint_1.setText("在当前网页强制缩放比例 可填正数 默认为1，\n一般在0~2之间 例如：0.5")
     editbj_1.setHint(" 请输入缩放比例值(0~2之间)")

    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--运行本
        路径=jsxml
         thdm = string.gsub(qzsf,"自定义缩放",editbj_1.text)
         dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
          if(dqnr=="")then
            换行=""
          else
            换行="\n"
          end
        写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
        io.open(路径,"w"):write(写入内容):close()
        dialog.dismiss()
        加载对话框("强制缩放","JavaScript脚本导入中....",600,"导入完成！")
    end

    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--运行本
        路径=jsyjz
         thdm = string.gsub(qzsf,"自定义缩放",editbj_1.text)
         dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
          if(dqnr=="")then
            换行=""
          else
            换行="\n"
          end
        写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..thdm
        io.open(路径,"w"):write(写入内容):close()
        dialog.dismiss()
        加载对话框("强制缩放","JavaScript脚本导入中....",600,"导入完成！")
    end

    dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
     崔更()
     dialog.dismiss()
    end
end

function 插入网页标签()
  crbqmc={}
  crbqdm={}
  function 写入插入标签列表(名称,事件)
   table.insert(crbqmc,名称)
   table.insert(crbqdm,事件)
  end

  function 插入标签事件函数(位置)
    自定义布局对话框("设置")
    szedit_0('请仔细阅读提示，编辑插入标签。属性设置规则 属性名称,属性内容 中间用双等于号隔开\n例如：style==top:50px;',0xFF757575)
    szedit_1('标签名(无需加<>)',"例如 div",0xFF33A7AA)
    szedit_2('设置属性1(属性名称==属性内容)',"例如 style==top:50px;",0xFF33A7AA)
    szedit_3('设置属性2(不设置则不填)',"例如 style==top:50px;",0xFF33A7AA)
    szedit_4('设置属性3(不设置则不填)',"例如 style==top:50px;",0xFF33A7AA)


    function 编辑规则判断(调用类型,脚本)
        a=0
        b=0
        c=0
        d=0
        e=0--判断是否通过 =1时不通过
        if(editbj_1.text=="")then linkhint_1.setTextColor(0xFFFF0000) a=1 end
        if(editbj_2.text=="")then b=1 else if(editbj_2.text:find"==")then sx1_1=editbj_2.text:match("(.+)==") sx1_2=editbj_2.text:match("==(.+)") else linkhint_2.setTextColor(0xFFFF0000) sx1_1="undefined" sx1_2="" e=1 end end
        if(editbj_3.text=="")then c=1 else if(editbj_3.text:find"==")then sx2_1=editbj_3.text:match("(.+)==") sx2_2=editbj_3.text:match("==(.+)") else linkhint_3.setTextColor(0xFFFF0000) sx2_1="undefined" sx2_2="" e=1 end end
        if(editbj_4.text=="")then d=1 else if(editbj_4.text:find"==")then sx3_1=editbj_4.text:match("(.+)==") sx3_2=editbj_4.text:match("==(.+)") else linkhint_4.setTextColor(0xFFFF0000) sx3_1="undefined" sx3_2="" e=1 end end

        if(b+c+d>2)then
          linkhint_2.setTextColor(0xFFFF0000)
          linkhint_3.setTextColor(0xFFFF0000)
          linkhint_4.setTextColor(0xFFFF0000)
        end

        if(b==1)then editbj_2.text="" sx1_1="undefined" sx1_2="" end
        if(c==1)then editbj_3.text="" sx2_1="undefined" sx2_2="" end
        if(d==1)then editbj_4.text="" sx3_1="undefined" sx3_2="" end

        function 默认提示颜色()
          linkhint_1.setTextColor(0xFF33A7AA)
          linkhint_2.setTextColor(0xFF33A7AA)
          linkhint_3.setTextColor(0xFF33A7AA)
          linkhint_4.setTextColor(0xFF33A7AA)
        end


        editbj_1.addTextChangedListener({
          onTextChanged=function()
            if(editbj_1.text=="")then
              linkhint_1.setTextColor(0xFFFF0000)
             else
              linkhint_1.setTextColor(0xFF33A7AA)
            end
          end
        });

        editbj_2.addTextChangedListener({
          onTextChanged=function()
            if(editbj_2.text~="")then
               if(editbj_2.text:find"==")then
                linkhint_2.setTextColor(0xFF33A7AA)
               else
                linkhint_2.setTextColor(0xFFFF0000)
               end
             else
              linkhint_2.setTextColor(0xFF33A7AA)
            end
          end
        });

        editbj_3.addTextChangedListener({
          onTextChanged=function()
            if(editbj_3.text~="")then
               if(editbj_3.text:find"==")then
                linkhint_3.setTextColor(0xFF33A7AA)
               else
                linkhint_3.setTextColor(0xFFFF0000)
               end
             else
              linkhint_3.setTextColor(0xFF33A7AA)
            end
          end
        });

        editbj_4.addTextChangedListener({
          onTextChanged=function()
            if(editbj_4.text~="")then
               if(editbj_4.text:find"==")then
                linkhint_4.setTextColor(0xFF33A7AA)
               else
                linkhint_4.setTextColor(0xFFFF0000)
               end
             else
              linkhint_4.setTextColor(0xFF33A7AA)
            end
          end
        });

        if(脚本=="头部")then
          插入类型=crtbjs
        end
        if(脚本=="尾部")then
          插入类型=crwbjs
        end

        bqm=editbj_1.text
        sxdm1 = string.gsub(插入类型,"替换标签",bqm)
        sxdm2 = string.gsub(sxdm1,"替换属性1",sx1_1)
        sxdm3 = string.gsub(sxdm2,"替换属性内容1",sx1_2)
        sxdm4 = string.gsub(sxdm3,"替换属性2",sx2_1)
        sxdm5 = string.gsub(sxdm4,"替换属性内容2",sx2_2)
        sxdm6 = string.gsub(sxdm5,"替换属性3",sx3_1)
        sxdm7 = string.gsub(sxdm6,"替换属性内容3",sx3_2)

         dqnr=io.open(调用类型):read("*a")--读取当前jsxml(运行本内容)
              if(dqnr=="")then
                换行=""
              else
                换行="\n"
              end
               写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..sxdm7
              if(a==1)then
                 弹出消息("您未配置标签名，请重新填写")
               else
                  if(b+c+d>2)then
                    弹出消息("您未配置标签属性，请重新填写")
                   else
                    if(e==1)then
                      弹出消息("您配置标签属性格式不正确，请重新填写")
                    else
                      io.open(调用类型,"w"):write(写入内容):close()
                      加载对话框("稍等","JavaScript脚本导入中....",600,"导入完成！")
                      dialog.dismiss()
                    end
                  end
              end
    end

    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--运行本
      编辑规则判断(jsxml,位置)
    end

    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--运行本
      编辑规则判断(jsyjz,位置)
    end

    dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
     崔更()
     dialog.dismiss()
    end
  end


    写入插入标签列表("插入标签到头部",[[插入标签事件函数("头部")]])
    写入插入标签列表("插入标签到尾部",[[插入标签事件函数("尾部")]])
    列表弹窗("插入选择",crbqmc,crbqdm)
end

function 引入外部Js脚本()
   对话框()
   .setTitle("引入外部js")
   .setView(loadlayout(模板布局))
   .设置积极按钮("导入运行本",function()
        引入外部js按钮事件(jsxml)
    end)
     .设置中立按钮("高级",function()
      崔更()
      end)
      .设置消极按钮("导入预加载",function()
        引入外部js按钮事件(jsyjz)
       end)
   .显示()

    GONE()--全部控件隐藏
    szedit_1('在网页中引入外部JavaScript的以.js为后缀的脚本文件'," 请输入外部js脚本直链",0xFF757575)
end

function 引入外部css样式()
   对话框()
   .setTitle("引入外部css")
   .setView(loadlayout(模板布局))
   .设置积极按钮("导入运行本",function()
        引入外部css按钮事件(jsxml)
    end)
     .设置中立按钮("高级",function()
      崔更()
      end)
      .设置消极按钮("导入预加载",function()
        引入外部css按钮事件(jsyjz)
       end)
   .显示()

    GONE()--全部控件隐藏
    szedit_1('在网页中引入外部css的以.css为后缀的样式文件'," 请输入外部css样式直链",0xFF757575)
end

function 彩云网页翻译()
   对话框()
   .setTitle("彩云网页翻译")
   .设置消息("注入后在线翻译网页里的英文，在注入页面后会出现一个悬浮球点击后可定义切换翻译模式(中文/双语/英语)")
   .设置积极按钮("导入运行本",function()
       彩云翻译按钮事件(jsxml)
    end)
     .设置中立按钮("高级",function()
      崔更()
      end)
      .设置消极按钮("导入预加载",function()
       彩云翻译按钮事件(jsyjz)
       end)
   .显示()
end

function 网页点击特效()
   对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择该特效，每个特效在文章详情页面可以直接点击测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载点击特效列表...","https://bk.yyge.net/?tag=Js%E7%82%B9%E5%87%BB%E7%89%B9%E6%95%88",[===[
      加载列表(ClickFx,27,1,0,"点击特效",nil)
      加载列表(ClickFx,78,2,1,"点击特效",nil)
      加载列表(ClickFx,103,2,2,"点击特效",nil)
      加载列表(ClickFx,104,2,3,"点击特效",nil)
      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end

function 网页背景特效()
   对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择该特效，每个特效在文章详情页面可以直接点击测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载背景特效列表...","https://bk.yyge.net/?tag=Js%E8%83%8C%E6%99%AF%E7%89%B9%E6%95%88",[===[
      加载列表(BgFx,31,1,1,"背景特效",nil)
      加载列表(BgFx,77,2,2,"背景特效",nil)
      加载列表(BgFx,102,1,3,"背景特效",nil)
      加载列表(BgFx,105,1,4,"背景特效",nil)
      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end

function 网页飘落特效()
    对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择该特效，每个特效在文章详情页面可以直接测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载飘落特效列表...","https://bk.yyge.net/?tag=Js%E9%A3%98%E8%90%BD%E7%89%B9%E6%95%88",[===[
      加载列表(FallingFx,108,1,1,"飘落特效","yinghua(x_x_x,y_y_y)","樱花数量(默认50)|请填写数字|樱花大小(默认1.5)|请填写数字(1~5之间)")
      加载列表(FallingFx,139,2,2,"萤火虫特效","FireflyFx(x_x_x,y_y_y)","萤火虫大小(默认1.75)|请填写数字")
      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end

function 网页对话框()
    对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择该对话框样式，每个对话框在文章详情页面可以直接测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载对话框样式列表...","https://bk.yyge.net/?tag=Js%E6%B6%88%E6%81%AF%E5%AF%B9%E8%AF%9D%E6%A1%86",[===[
      Alert_Name1={}
      Alert_Fun1={}
      Alert_Name2={}
      Alert_Fun2={}
      Alert_Name3={}
      Alert_Fun3={}
      function 写入Alert1(mc,sj)
        table.insert(Alert_Name1,mc)
        table.insert(Alert_Fun1,sj)
      end
      text_fun=[[
      FxTemplates("js",MessageAlert[1],"function SweetAlert2(){swal(x_x_x,y_y_y,'success')};src_path_load(2,SweetAlert2)")
      导入运行本(1,"普通提示","您可以选择将当前对话框导入到我的运行本或者我的预加载中...",JsTemplates,"对话框导入成功！","标题文字(3~8个)|请填写任意字符串|消息内容|请填写任意字符串","")
      ]]

      写入Alert1("普通提示-带标题",text_fun)
      写入Alert1("错误提示-带标题",string.gsub(text_fun,"success","error"):gsub("普通提示","错误提示"))
      写入Alert1("警告提示-带标题",string.gsub(text_fun,"success","warning"):gsub("普通提示","警告提示"))

      if(wz.getUrl()=="https://bk.yyge.net/?post=117")then
        列表弹窗("选择类型",Alert_Name1,Alert_Fun1)
      end

      ]===])
   end)

   .设置消极按钮("取消")
   .显示()
end

function 回到顶部插件()
    对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择该插件，每个插件在文章详情页面可以直接测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载插件列表...","https://bk.yyge.net/?tag=%E8%BF%94%E5%9B%9E%E9%A1%B6%E9%83%A8",[===[
      加载列表(TopPlugins,119,1,1,"Top插件",nil)
      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end

function Live2d看板娘()
   对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择Live2d模型，每个模型在文章详情页面可以直接点击测试预览\n\n请确保您的网页支持注入外部js文件")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载Live2d模型列表...","https://bk.yyge.net/?tag=Live2D%E6%A8%A1%E5%9E%8B",[===[
      if(wz.getUrl()=="https://bk.yyge.net/?post=29")then
        Live2Dmx=string.gsub(Live2D,"自定义替换","https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/L2Dwidget/ycdy/Wanko.min.js")
       导入运行本(0,"确认","是否导入当前Live2d模型",Live2Dmx,"Live2d模型导入成功！")
      end

      if(wz.getUrl()=="https://bk.yyge.net/?post=30")then
        Live2Dmx=string.gsub(Live2D,"自定义替换","https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/L2Dwidget/ycdy/shizuku.min.js")
       导入运行本(0,"确认","是否导入当前Live2d模型",Live2Dmx,"Live2d模型导入成功！")
      end


      if(wz.getUrl()=="https://bk.yyge.net/?post=40")then
       VIPpermission([[Live2Dmx=string.gsub(Live2D,"自定义替换","https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/L2Dwidget/ycdy/Xuexban.min.js") 导入运行本(0,"确认","是否导入当前Live2d模型",Live2Dmx,"Live2d模型导入成功！")]],"您暂时无权使用改模型，该模型为分享特权模型，您需在壹影博客发布一篇文章后才能解锁该模型的使用权限，分享完成后复制ID授权码联系作者给予授权，我们希望能够帮助更多的开发者，所以期待您的精彩分享\n\n壹影博客：https://bk.yyge.net",1)
      end

      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end

function JsAD调试插件()
   对话框()
   .setTitle("JsAD调试插件 v1.0")
   .设置消息("该插件能够调试您的网页广告，点击确定后系统会自动加载您当前预览的网址\n\n提示：请在网页的广告加载完毕之后长按，请确保您的网页能够正确的识别广告\n\nJsAD调试插件也支持直接配置屏蔽规则(点击'规则'进行添加)")
   .设置积极按钮("调试",function()
    浏览器布局(2,"正在加载调试页面...",webView.url,[===[

        对话框()
        .设置标题("提示")
        .设置消息("如果您认为您的网页存在随机域名广告，那么请确保当前网页已经加载出了与上一次不同的广告，如果和上次调试广告相同可以点击刷新")
        .设置积极按钮("识别",function()
          加载对话框("稍等","正在分析网页图片....",600,"分析完成！")
          wz.loadUrl([==[javascript:Array.from(top.document.getElementsByTagName("img")).map(function(x){var tpdz=x.getAttribute("src");document.write('<div style="word-break:break-all;max-height: 100%; box-shadow: 0 8px 33px 0 rgba(30,35,42,0.13);"><img class="xz_0" onclick="fun(this)" style="width:100%;height: auto;max-width: 100%;max-height: 100%;" οnclick="tpdz" src="'+tpdz+'"><br><br>'+tpdz+"<br><br></div>"+"<br><br>")});document.write('<br><br><style>#myBtn {display: none;position: fixed;bottom: 50px;right: 30px;z-index: 99;border: none;outline: none;background-color: #555;color: white;cursor: pointer;padding: 15px;border-radius: 10px;} #myBtn:hover {background-color: #f44336;}</style><button onclick="queren()" id="myBtn" title="确定选择">确定选择</button><script>window.onscroll = function() {scrollFunction()};function scrollFunction() {console.log(121);if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {document.getElementById("myBtn").style.display = "block";} else {document.getElementById("myBtn").style.display = "none";}}<\/script>');document.write('<script> function fun(obj){if (obj.getAttribute("class")=="xz_0") {obj.setAttribute("class","xz_1");obj.parentElement.style.boxShadow="0 8px 33px 0 rgba(244,67,54,1)";}else{obj.setAttribute("class","xz_0");obj.parentElement.style.boxShadow=" 0 8px 33px 0 rgba(30,35,42,0.13)";};if(document.getElementsByClassName("xz_1")[0]!=undefined){document.getElementById("myBtn").style.backgroundColor="#f44336";}else{document.getElementById("myBtn").style.backgroundColor="#555"};}<\/script>');document.write('<div style="word-break:break-all;max-height: 100%;text-align:center;">JsAD调试插件 v1.0 </div><br><div style="word-break:break-all;max-height: 100%;height:200px;border:3px solid #848484;background:#dcdcdc7a;font-size:15px">特别注意：在此边框下若有广告图片请勿点击，该广告为远程js强制插入，无需在点击选择，点击确定后系统会自动为您添加远程广告的规则...</div>');document.write('<script> function queren(){var xz=document.getElementsByClassName("xz_1");var smcookie="";for(var i=0;i<xz.length;i++){var domain=xz[i].getAttribute("src").split("/");if(domain[2]){domain=domain[2]}else{domain=""}if(smcookie==""){smcookie=smcookie+domain}else{smcookie=smcookie+"||"+domain}}var elscript_1=document.createElement("pbgz");elscript_1.innerHTML=(smcookie);elscript_1.setAttribute("id","pbgz");elscript_1.setAttribute("style","display:none");document.body.appendChild(elscript_1)};<\/script>');document.write("<style> body { -webkit-touch-callout: none;-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;</style>");document.write('<script> var MutationObserver=window.MutationObserver||window.WebKitMutationObserver||window.MozMutationObserver;var target=document.body;var observer=new MutationObserver(function(mutations){mutations.forEach(function(mutation){if(mutation.addedNodes[0]!=undefined){if(mutation.addedNodes[0].tagName!="PBGZ"){mutation.addedNodes[0].remove()}}})});var config={attributes:true,childList:true,characterData:true};observer.observe(target,config);<\/script>');]==])
         end)
        .设置消极按钮("刷新",function()
          wz.loadUrl(wzlj)
         end)
        .显示()


       ]===])
    end)
     .设置中立按钮("添加规则",function()
       JsAD添加规则("手动","")
      end)
      .设置消极按钮("取消",function()

       end)
   .显示()
end

function 网页杂项功能箱()
  tools_0=function(arr,length)
    自定义布局对话框("导入设置")
    szedit_0('功能包含三个参数 其中音乐来源可以是QQ、网易、百度、虾米,酷狗等;专辑的ID是在对应平台复制分享专辑的链接,ID就是链接后面的那一串数字,例如网易分享链接：https://music.163.com/song?id=478596258&userid=468670140中,478596258就是歌曲ID',0xFF757575)
    szedit_1('音乐类型(单曲/歌单/艺术家)',"默认 单曲",0xFF33A7AA)
    szedit_2('音乐来源(QQ/网易/酷狗..)',"默认 网易",0xFF33A7AA)
    szedit_3('专辑ID(默认60198)',"默认 60198",0xFF33A7AA)
    --szedit_4('底部高度(默认0)',"默认 100",0xFF33A7AA)
    function fx_a()
      if(editbj_1.text=="" or editbj_1.text=="单曲") then MusicType="song" end
      if(editbj_1.text=="歌单" or editbj_1.text=="playlist")then MusicType="playlist" end
      if(editbj_1.text=="艺术家" or editbj_1.text=="artist")then MusicType="artist" end
      if(editbj_2.text=="" or editbj_2.text=="网易")then server="netease" end
      if(editbj_2.text=="QQ" or editbj_2.text=="qq")then server="tencent" end
      if(editbj_2.text=="酷狗" or editbj_2.text=="kugou")then server="kugou" end
      if(editbj_2.text=="虾米" or editbj_2.text=="xiami")then server="xiami" end
      if(editbj_2.text=="百度" or editbj_2.text=="baidu")then server="baidu" end
      if(editbj_3.text=="")then mcid="60198" else mcid=editbj_3.text end
      --if(editbj_4.text=="")then height="0" else height=editbj_4.text end
      FxTemplates("js",arr[length],[[APlayer("]]..MusicType..'","'..server..[[","]]..mcid..[[","0")]])
    end
    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--运行本
       fx_a()
       快速导入("运行本")
       dialog.dismiss()
    end

    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--运行本
      fx_a()
      快速导入("预加载")
      dialog.dismiss()
    end
    dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
     dialog.dismiss()
    end
  end

   对话框()
   .设置标题("提示")
   .设置消息("进入文章详情页面长按即可选择网页杂项功能，每个功能在文章详情页面可以直接点击测试预览")
   .设置积极按钮("确定",function()
    浏览器布局(1,"正在加载杂项功能列表...","https://bk.yyge.net/?tag=Js%E6%9D%82%E9%A1%B9%E5%8A%9F%E8%83%BD",[===[
      function 快速导入(type)
        if(type=="运行本")then 路径=jsxml else 路径=jsyjz end
         dqnr=io.open(路径):read("*a")--读取当前jsxml(运行本内容)
          if(dqnr=="")then
            换行=""
           else
            换行="\n"
          end
          写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..JsTemplates
          io.open(路径,"w"):write(写入内容):close()
          加载对话框("稍等","JavaScript脚本导入中....",600,"导入完成！")
      end


      加载列表(tools,106,3,2,"杂项功能",[[tools_0(tools,2)]],nil)

      ]===])
   end)
   .设置消极按钮("取消")
   .显示()
end


import "java.util.regex.Matcher"
import "java.util.regex.Pattern"
import "android.text.SpannableString"
import "android.text.Spanned"
import "android.text.style.ForegroundColorSpan"

function 高亮(color,text,keyword)
  local s=SpannableString(text)
  local p=Pattern.compile(keyword)
  local m=p.matcher(s)
  while m.find() do
    start = m["start"]()
    send = m["end"]()
    s.setSpan(ForegroundColorSpan(color), start, send,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
  end
  return s
end

function 多高亮(color,text,keyword)
  local s = SpannableString(text);
  for i = 1,tonumber(#keyword),1 do
    local p = Pattern.compile("\""..string.gsub(keyword[i],"?",".").."\"")
    local m = p.matcher(s)
    while m.find() do
      start = m["start"]()
      send = m["end"]()
      s.setSpan(ForegroundColorSpan(color), start+1, send-1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
    end
  end
  return s
end

DomJs=[[sojson=~[];/*sojson.com*/sojson={___:++sojson,/*sojson.com*/$$$$:(![]+"")[sojson],__$:++sojson,$_$_:(![]+"")[sojson],_$_:++sojson,$_$$:({}+"")[sojson],$$_$:(sojson[sojson]+"")[sojson],_$$:++sojson,$$$_:(!""+"")[sojson],$__:++sojson,$_$:++sojson,$$__:({}+"")[sojson],$$_:++sojson,$$$:++sojson,$___:++sojson,$__$:++sojson};sojson.$_=(sojson.$_=sojson+"")[sojson.$_$]+(sojson._$=sojson.$_[sojson.__$])+(sojson.$$/*sojson.com*/=(sojson.$+"")[sojson.__$])+((!sojson)+"")[sojson._$$]+(sojson.__=sojson.$_[sojson.$$_])+(sojson.$=(!""+"")[sojson.__$])+(sojson._=(!""+"")[sojson._$_])+sojson.$_[sojson.$_$]+sojson.__+sojson._$+sojson.$;/*sojson.com*/sojson.$$=sojson.$+(!""+"")[sojson._$$]+sojson.__+sojson._+sojson.$+sojson.$$/*sojson.com*/;sojson.$=(sojson.___)[sojson.$_][sojson.$_];sojson.$(sojson.$(sojson.$$+"\""+" "+sojson.__+"\\"+sojson.__$+sojson.$$_+sojson._$_+"\\"+sojson.__$+sojson.$$$+sojson.__$+" {\\"+sojson.__$+sojson._$_+sojson.$__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson._$_+sojson.___+sojson.$_$_+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.$$$+sojson._$$+"} "+sojson.$$__+sojson.$_$_+sojson.__+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"("+sojson.$$$_+") {\\"+sojson.__$+sojson._$_+"  "+sojson.$$_$+sojson._$+sojson.$$__+sojson._+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+"."+sojson.$$_$+sojson._$+sojson.$$__+sojson._+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+"\\"+sojson.__$+sojson.___+sojson.$_$+(![]+"")[sojson._$_]+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+".\\"+sojson.__$+sojson.$$_+sojson._$$+sojson.__+"\\"+sojson.__$+sojson.$$$+sojson.__$+(![]+"")[sojson._$_]+sojson.$$$_+".\\"+sojson.__$+sojson.$$_+sojson.$$$+sojson.$$$_+sojson.$_$$+"\\"+sojson.__$+sojson.$_$+sojson._$$+"\\"+sojson.__$+sojson.$_$+sojson.__$+sojson.__+"\\"+sojson.__$+sojson._$_+sojson.$__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson.___+sojson._$$+sojson.$_$_+(![]+"")[sojson._$_]+(![]+"")[sojson._$_]+sojson._$+sojson._+sojson.__+"\\"+sojson.$$$+sojson.$_$+"'\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson._$+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$$_+"'\\"+sojson.$$$+sojson._$$+"\\"+sojson.__$+sojson._$_+"  "+sojson.$$_$+sojson._$+sojson.$$__+sojson._+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+"."+sojson.$$_$+sojson._$+sojson.$$__+sojson._+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+"\\"+sojson.__$+sojson.___+sojson.$_$+(![]+"")[sojson._$_]+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$_$+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+".\\"+sojson.__$+sojson.$$_+sojson._$$+sojson.__+"\\"+sojson.__$+sojson.$$$+sojson.__$+(![]+"")[sojson._$_]+sojson.$$$_+".\\"+sojson.__$+sojson.$$_+sojson.$$$+sojson.$$$_+sojson.$_$$+"\\"+sojson.__$+sojson.$_$+sojson._$$+"\\"+sojson.__$+sojson.$_$+sojson.__$+sojson.__+"\\"+sojson.__$+sojson._$_+sojson.$_$+"\\"+sojson.__$+sojson.$$_+sojson._$$+sojson.$$$_+"\\"+sojson.__$+sojson.$$_+sojson._$_+"\\"+sojson.__$+sojson._$_+sojson._$$+sojson.$$$_+(![]+"")[sojson._$_]+sojson.$$$_+sojson.$$__+sojson.__+"\\"+sojson.$$$+sojson.$_$+"'\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson._$+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$$_+"'\\"+sojson.$$$+sojson._$$+"\\"+sojson.__$+sojson._$_+"  \\"+sojson.__$+sojson._$_+sojson.$__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson._$_+sojson.___+sojson.$_$_+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+" \\"+sojson.$$$+sojson.$_$+" \\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$$_+"\\"+sojson.__$+sojson.$$_+sojson.$$$+" \\"+sojson.__$+sojson.___+sojson.__$+"\\"+sojson.__$+sojson.$$_+sojson._$_+"\\"+sojson.__$+sojson.$$_+sojson._$_+sojson.$_$_+"\\"+sojson.__$+sojson.$$$+sojson.__$+"()\\"+sojson.$$$+sojson._$$+"\\"+sojson.__$+sojson._$_+"  \\"+sojson.__$+sojson.$$_+sojson.$$$+"\\"+sojson.__$+sojson.$_$+sojson.__$+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$_$+sojson._$+"\\"+sojson.__$+sojson.$$_+sojson.$$$+"."+sojson.$_$_+sojson.$$_$+sojson.$$_$+"\\"+sojson.__$+sojson.___+sojson.$_$+"\\"+sojson.__$+sojson.$$_+sojson.$$_+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.__+"\\"+sojson.__$+sojson.__$+sojson.$__+"\\"+sojson.__$+sojson.$_$+sojson.__$+"\\"+sojson.__$+sojson.$$_+sojson._$$+sojson.__+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$$_+"\\"+sojson.__$+sojson.$$_+sojson._$_+"(\\\""+sojson.__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson.$$_+sojson._$$+sojson.__+sojson.$_$_+"\\"+sojson.__$+sojson.$$_+sojson._$_+sojson.__+"\\\", "+sojson.$$$$+sojson._+"\\"+sojson.__$+sojson.$_$+sojson.$$_+sojson.$$__+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.__$+sojson._$+"\\"+sojson.__$+sojson.$_$+sojson.$$_+"("+sojson.$$$_+") {\\"+sojson.__$+sojson._$_+"  \\"+sojson.__$+sojson._$_+sojson.$__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson._$_+sojson.___+sojson.$_$_+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+"."+(![]+"")[sojson._$_]+sojson.$$$_+"\\"+sojson.__$+sojson.$_$+sojson.$$_+"\\"+sojson.__$+sojson.$__+sojson.$$$+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+" \\"+sojson.$$$+sojson.$_$+" "+sojson.___+"\\"+sojson.__$+sojson._$_+"  \\"+sojson.__$+sojson._$_+sojson.$__+sojson._$+sojson._+sojson.$$__+"\\"+sojson.__$+sojson.$_$+sojson.___+"\\"+sojson.__$+sojson._$_+sojson.___+sojson.$_$_+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+".\\"+sojson.__$+sojson.$$_+sojson.___+sojson._+"\\"+sojson.__$+sojson.$$_+sojson._$$+"\\"+sojson.__$+sojson.$_$+sojson.___+"("+sojson.$$$_+".\\"+sojson.__$+sojson.$$_+sojson.___+sojson.$_$_+sojson.__+"\\"+sojson.__$+sojson.$_$+sojson.___+")\\"+sojson.__$+sojson._$_+"  })\\"+sojson.$$$+sojson._$$+"\\"+sojson.__$+sojson._$_+" }"+"\"")())(sojson={___:++sojson,$$$$:(![]+"")[sojson]});]]

LoadTime=0
local loadjs=[====[document.readyState+"=="+window.location.href]====]

function WebViewLoad(view)
  webView.evaluateJavascript(loadjs,function(a)
    task(100,function()
      LoadTime=LoadTime+100
      if(a~='"complete==about:blank"' and a:find"complete==")then
           webView.evaluateJavascript(DomJs,function(a)
         end)
        else
        WebViewLoad(view)
      end
    end)
    end)
end

WebViewLoad(view)

webView.onTouch=function(v,e)
end

webView.onLongClick=function(v,e)
  加载Js(DomJs)
  htr=v.getHitTestResult()
  url=v.hitTestResult.extra
  type_1=htr.getType()
  Parent=""
  JS=[[var message=TouchPath[0][0].outerHTML;message]]

    webView.evaluateJavascript(JS,function(a)
      if(a~="null")then
        b_b=string.gsub(string.sub(a,2,-2),[[\u003C]],"<"):gsub([[\"]],'"'):gsub([[\n]],' '):gsub([[\t]],'')
        DlogEdit=BottomDialog(this)
        DlogEdit.setTitle("审查元素")
        DlogEdit.setMessage(b_b)
        DlogEdit.setPositiveButton("获取父类",nil)
        DlogEditShow=DlogEdit.show()

            data={}--截取的所有数据&数组
            function addkey(x,str,arr)
              for k, v in string.gmatch(str,x) do table.insert(arr,k) end
            end
            addkey("id=\"(.-)\"",b_b,data)
            addkey("class=\"(.-)\"",b_b,data)
            addkey("src=\"(.-)\"",b_b,data)
            addkey("href=\"(.-)\"",b_b,data)
            addkey("title=\"(.-)\"",b_b,data)

           --更改消息颜色
            message=DlogEditShow.findViewById(android.R.id.message)
            message.TextIsSelectable=true--设置文本可复制


        if(#data<=30)then
          message.Text=多高亮(0xFF33A7AA,b_b,data)
         else
           if(#data<=50)then
             data={}
             addkey("id=\"(.-)\"",b_b,data)
             addkey("class=\"(.-)\"",b_b,data)
             message.Text=多高亮(0xFF33A7AA,b_b,data)
            else
             data={}
             addkey("id=\"(.-)\"",b_b,data)
             message.Text=多高亮(0xFF33A7AA,b_b,data)
           end
        end
        Dlomessage=DlogEditShow.findViewById(android.R.id.message)
        Dlomessage.setTextColor(0xFF434343)--设置消息颜色
        Dlomessage.setTextSize(14);
        DlogEditShow.getButton(DlogEditShow.BUTTON_POSITIVE).onClick=function()--获取父类
          Parent=Parent..".parentElement"
          JS=[==[var message=TouchPath[0][0]]==]..Parent..[[.outerHTML;message]]
          webView.evaluateJavascript(JS,function(q)
            if(q=="null")then
              DlogEditShow.dismiss();
            end
            strtext_1=string.gsub(string.sub(q,2,-2),[[\u003C]],"<"):gsub([[\"]],'"'):gsub([[\n]],' '):gsub([[\t]],'')
            Dlomessage.setText(strtext_1)
              data_add_1={}
              addkey("id=\"(.-)\"",strtext_1,data_add_1)
              addkey("class=\"(.-)\"",strtext_1,data_add_1)
              addkey("src=\"(.-)\"",strtext_1,data_add_1)
              addkey("href=\"(.-)\"",strtext_1,data_add_1)
              addkey("title=\"(.-)\"",strtext_1,data_add_1)
                if(#data_add_1<=30)then
                  message.Text=多高亮(0xFF33A7AA,strtext_1,data_add_1)
                 else
                   if(#data_add_1<=50)then
                     data_add_1={}
                     addkey("id=\"(.-)\"",strtext_1,data_add_1)
                     addkey("class=\"(.-)\"",strtext_1,data_add_1)
                     message.Text=多高亮(0xFF33A7AA,strtext_1,data_add_1)
                     else
                     data_add_1={}
                     --addkey("id=\"(.-)\"",strtext_1,data_add_1)
                     addkey("class=\"(.-)\"",strtext_1,data_add_1)
                     message.Text=多高亮(0xFF33A7AA,strtext_1,data_add_1)
                    --  data_add_1={}
                    --  addkey("id=\"(.-)\"",strtext_1,data_add_1)
                    --  message.Text=多高亮(0xFF33A7AA,strtext_1,data_add_1)
                   end
                end

          end)
        end
      end
    end)
end
--上面是启动初始化事件-----------------------上面是启动初始化事件-------------------------上面是启动初始化事件