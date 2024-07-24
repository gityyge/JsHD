---
--- File: debug_plugin_os.lua
--- Describe: 可视化调试页 - 附属插件&判断
--- Created by Gityyge.
---

function 插件判断()--普通长按函数开始
    import "android.graphics.drawable.ColorDrawable"
    import "android.content.res.ColorStateList"
    import "android.view.animation.Animation"
    import "android.view.animation.RotateAnimation"
    import "android.animation.Animator$AnimatorListener"

    FallingFx={}
    table.insert(FallingFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/FallingFx/yinghua/yinghua.min.js")--yinghua
    table.insert(FallingFx,"https://yyyp.oss-cn-beijing.aliyuncs.com/CDN/FallingFx/BubbleUp/BubbleUp.js")--BubbleUp

  function InitFunction()
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

    --渐变颜色
    import "android.graphics.drawable.GradientDrawable"
    function 渐变(left_jb,right_jb,id)
      drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
        right_jb,--右色
        left_jb,--左色
      });
      id.setBackgroundDrawable(drawable)
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

        yzjz=0--验证加载
        wzlj=网址
        wz.loadUrl(wzlj)
        wz.getSettings().setJavaScriptEnabled(true)--设置支持JS
        --wz.getSettings().setSupportZoom(false)--支持缩
        tzyz=0
        yzwz={}
        wz.setWebViewClient{
         onPageFinished=function(view,url)--网页加载完成
         if(布局模式==1)then
           wz.evaluateJavascript([===[
            var elscript = document.createElement("script");
            elscript.text = ('var qbys = document.querySelector("head").querySelectorAll("*");for (var i = 0; i < qbys.length; i++) {var sx=qbys[i].getAttribute("name");if(sx=="viewport"){qbys[i].setAttribute("content","width=device-width, initial-scale=0.8, user-scalable=0, minimum-scale=0.8, maximum-scale=1.0");}};document.getElementById("sider-search").setAttribute("style","display:none");document.getElementsByClassName("mdui-fab mdui-ripple mdui-fab-fixed")[0].setAttribute("style","display:none");document.title="加载完成";');
            elscript.setAttribute("type","text/javascript");
            document.body.appendChild(elscript);
            var hm=document.createElement("style");
            hm.innerHTML="body { -webkit-touch-callout: none;-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}";
            var s=document.getElementsByTagName("title")[0];
            s.parentNode.insertBefore(hm,s);
           ]===],nil)
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

    end

    function 催更()
      对话框()
      .设置标题("开发中...")
      .设置消息("该功能可以在同级父类下复制当前元素所有的样式并添加在当前元素旁，小影还在努力开发该功能...")
      .设置积极按钮("催更",function()
       联系QQ(203455278)
      end)
      .设置消极按钮("取消")
      .显示()
    end

    --URL解码器
    function 网址解码器(s)
      s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
      return s
    end
    --URL解码器

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

    --new=hyxx_0_1..hyxx_0_1
    function 导入运行本(调用模式,对话框标题,对话框消息,导入内容,提示标题,自定义输入框,自定义函数内容,number)
      对话框()
       .设置标题(对话框标题)
       .设置消息(对话框消息)
       .设置积极按钮("确定",function()
         --添加动作跟踪("特效20"..bqm3.."标签",自定义函数内容,"","特效20撤销成功！",20)--名称数据,代码数据,撤销数据,撤销提示,动作类别
        if(number==138)then 添加动作跟踪("特效20"..bqm3.."标签",自定义函数内容,"","特效20撤销成功！",20) end
        加载Js(自定义函数内容)
        弹出消息("已跟踪记录！")
         dialog2.dismiss()
       end)
       -- .设置中立按钮("高级",function()
       --   会员高级()
       -- end)
       .设置消极按钮("取消",function()

       end)
       .显示()
    end


    new="";
    function 加载列表(arr,number,type,length,tips,diyDialog,diyedit)--/数组/编号/类型/数组定位/提示变量/自定义js/diy输入框
       if(diyedit==nil)then diyedit="" end
       if(diyDialog==nil)then diyDialog="" end
       new=string.gsub(new,"高级功能",tips)
       if(type==1)then
        if(wz.getUrl()=="https://bk.yyge.net/?post="..number)then
          if(length==0)then
            导入运行本(0,"导入","确定在当前元素上添加"..tips.."?点击确定后系统会记录当前动作...",djtx_1,tips.."已跟踪记录！",diyedit.number)
           else

            if(diyDialog:find"Element_Element") then
              diyjs_str=string.gsub(diyDialog,"Element_Element",sqys)
             else
              diyjs_str=diyDialog
            end

            FxTemplates("js",arr[length],diyjs_str)


            导入运行本(0,"导入","确定在当前元素上添加"..tips.."?点击确定后系统会记录当前动作...",JsTemplates,tips.."已跟踪记录！",diyedit,JsTemplates,number)
          end
        end
       end

       if(type==2)then
         if(wz.getUrl()=="https://bk.yyge.net/?post="..number)then
          if(length==0)then
            event=[[导入运行本(0,"导入","确定在当前元素上添加]]..tips..[[?点击确定后系统会记录当前动作...",djtx_1,]]..tips..[["已跟踪记录！"]]..',[['..diyedit..']]'..',[['..JsTemplates..']],'..number..')'
            VIPpermission(event,new,2)
           else
            if(diyDialog:find"Element_Element") then
              diyjs_str=string.gsub(diyDialog,"Element_Element",sqys)
             else
              diyjs_str=diyDialog
            end
              FxTemplates("js",arr[length],diyjs_str)
              event=[[导入运行本(0,"导入","导入到我的运行本或者我的预加载中]]..tips..'?点击确定后系统会记录当前动作...",[['..JsTemplates..']],"'..tips..[[已跟踪记录！"]]..',[['..diyedit..']]'..',[['..JsTemplates..']],'..number..')'
              VIPpermission(event,new,2,1)
          end
         end
       end
    end


  end

 InitFunction()--初始化函数
 function pdbq_1()
    bt=webView.title
    初始化标题()
    总高度="225dp"--弹出框的高度
    --背景高度="236dp"--滑动块的高度
    滚动高度="215dp"

    ganbei={
      LinearLayout,
      orientation="vertical",
      layout_height="50%h";
      layout_width="95%w";
      gravity="center";
      -- backgroundColor="#FFEEEEEE";
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
              layout_height="fill";--上部白色块布局高度//会员功能需要开启这个高度
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
                      textColor='#FF14EF84';
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
                     --layout_marginTop='0dp';
                    };

                    {
                      TextView;
                      Gravity='left';
                      textColor='#FF000000';
                      text=classwb;--class名
                      textSize='18sp';
                     --layout_marginLeft='48dp';
                     --layout_marginTop='0dp';
                    };

                    {
                      TextView;
                      Gravity='left';
                      textColor='#FF000000';
                      text="   ";--标签文本
                      textSize='14sp';
                      id="bqnr"
                     --layout_marginLeft='48dp';
                     --layout_marginTop='0dp';
                    };

                    {
                      TextView;
                      Gravity='left';
                      textColor='#FF000000';
                      text=bqnr.."";--标签文本
                      textSize='14sp';
                      id="bqnr"
                     --layout_marginLeft='48dp';
                     --layout_marginTop='0dp';
                    };
                  };--横向滚动标题&元素
              };

              {
                LinearLayout,
                orientation="vertical",
                layout_width="fill",
                layout_height="fill",
                id="function_add",
              },

              --反馈提示---------------------------------------------

                        {
                          Button;
                          style="?android:attr/borderlessButtonStyle";
                          layout_width="100%w";
                          layout_height="30px";
                          layout_gravity="center";
                          BackgroundColor="#FFEEEEEE";
                        };

                        {
                          Button;
                          style="?android:attr/borderlessButtonStyle";
                          layout_width="40%w";
                          layout_height="3px";
                          layout_gravity="center";
                          BackgroundColor="#FF444444";
                        };

                        {
                          LinearLayout;
                          id="gj";
                          orientation="horizontal";
                          layout_width="100%w";
                          layout_height="fill";
                          layout_gravity="center";
                          layout_marginTop='20dp';

                          {
                            LinearLayout;
                            orientation='vertical';
                            layout_width='100%w';
                            --id="ll";
                            BackgroundColor="#FFFFFFFF";   --白色
                            --backgroundColor="#FFEEEEEE"; --灰色
                            layout_height='fill';
                            --background='#FF000000';


                            {
                              TextView;
                              layout_marginLeft="0dp";
                               text="JsHD调试器 v"..activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName.."@壹影阁";
                              --id='gy7';
                              BackgroundColor="#FFFFFFFF";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#FF444444";
                              onClick=function()
                              联系QQ(203455278)
                              下滑动画(dc)
                            end
                          };



                          {
                            LinearLayout;
                            BackgroundColor="#FFFFFFFF";
                            layout_height="45dp";
                            layout_width="100%w";
                            layout_gravity="center";
                            layout_marginTop="10dp";
                            {
                              LinearLayout;
                              id="xm12222";
                              layout_height="fill";
                              layout_width="fill";

                              {
                                TextView;
                                text="无法索取当前元素？赶紧反馈啊！";
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
                                  下滑动画(dc)
                                  联系QQ(203455278)
                                end
                              };
                            };
                          };



                        };
                        };

              --反馈提示-----------------------------------------------




              --------------------------------------------------会员功能--------------------------------------------------------

                --[[      {
                            Button;
                            style="?android:attr/borderlessButtonStyle";
                            layout_width="100%w";
                            layout_height="30px";
                            layout_gravity="center";
                            BackgroundColor="#FFEEEEEE";
                          };

                          {
                            Button;
                            style="?android:attr/borderlessButtonStyle";
                            layout_width="40%w";
                            layout_height="3px";
                            layout_gravity="center";
                            BackgroundColor="#FFFFB72E";
                          };

                          {
                            LinearLayout;
                            id="gj";
                            orientation="horizontal";
                            layout_width="100%w";
                            layout_height="fill";
                            layout_gravity="center";
                            layout_marginTop='20dp';

                           {
                              LinearLayout;
                              orientation='vertical';
                              layout_width='100%w';
                              --id="ll";
                              BackgroundColor="#FFFFFFFF";   --白色
                              --backgroundColor="#FFEEEEEE"; --灰色
                              layout_height='fill';
                              --background='#FF000000';

                              {
                                TextView;
                                layout_marginLeft="0dp";
                                text="会员功能";
                                --id='gy7';
                                BackgroundColor="#FFFFFFFF";
                                textSize="14sp";
                                layout_gravity="center";
                                textColor="#FFFFB72E";
                                onClick=function()
                                  加载网页("软件介绍链接")
                                  下滑动画(dc)
                                end
                              };

                                {
                                  LinearLayout;
                                  BackgroundColor="#FFFFFFFF";
                                  layout_height="45dp";
                                  layout_width="100%w";
                                  layout_gravity="center";
                                  layout_marginTop="10dp";
                                  {
                                    LinearLayout;
                                    id="xm12222";
                                    layout_height="fill";
                                    layout_width="fill";

                                    {
                                      TextView;
                                      text="屏蔽元素";
                                     --layout_marginLeft="20dp";
                                      textSize="14sp";
                                      layout_gravity="center";
                                      textColor="#333333";
                                      layout_height="fill";
                                      layout_width="fill";
                                      style="?android:attr/borderlessButtonStyle";
                                      id="gy3787878/8";
                                    };
                                  };--屏蔽元素--屏蔽元素--布局开始--屏蔽元素--布局开始
                                };--屏蔽元素--布局结束


                                {
                                  LinearLayout;
                                  BackgroundColor="#FFFFFFFF";
                                  layout_height="45dp";
                                  layout_width="100%w";
                                  layout_gravity="center";
                                  {
                                    LinearLayout;
                                    id="xm22255";
                                    layout_height="fill";
                                    layout_width="fill";
                                    --style="?android:attr/borderlessButtonStyle";

                                    {
                                      TextView;
                                      --layout_marginLeft="20dp";
                                      text="更新日志";
                                      textSize="14sp";
                                      layout_gravity="center";
                                      textColor="#333333";
                                      layout_width="fill";
                                      style="?android:attr/borderlessButtonStyle";
                                      id="gy457575757878787";

                                      onClick=function()
                                        加载网页("更新日志链接")
                                        下滑动画(dc)
                                      end
                                    };
                                  };--更新日志--更新日志--布局开始--更新日志--布局开始
                                };--更新日志--布局结束

                                {
                                  LinearLayout;
                                  BackgroundColor="#FFFFFFFF";
                                  layout_height="45dp";
                                  layout_width="100%w";
                                  layout_gravity="center";

                                  {
                                    LinearLayout;
                                    id="xm3252525252525";
                                    layout_height="fill";
                                    layout_width="fill";
                                    --style="?android:attr/borderlessButtonStyle";

                                    {
                                      TextView;
                                      --layout_marginLeft="20dp";
                                      text="意见反馈";
                                      textSize="14sp";
                                      layout_gravity="center";
                                      textColor="#333333";
                                      layout_width="fill";
                                      style="?android:attr/borderlessButtonStyle";
                                      id="gy525252525252";
                                      onClick=function()
                                        加载网页("意见反馈链接")
                                        下滑动画(dc)
                                      end
                                    };
                                  };--意见反馈--意见反馈--布局开始--意见反馈--布局开始
                                };--意见反馈--布局结束

                                {
                                  LinearLayout;
                                  BackgroundColor="#FFFFFFFF";
                                  layout_height="45dp";
                                  layout_width="100%w";
                                  layout_gravity="center";

                                  {
                                    LinearLayout;
                                    id="xm425252525";
                                    layout_height="fill";
                                    layout_width="fill";
                                    --style="?android:attr/borderlessButtonStyle";

                                    {
                                      TextView;
                                      --layout_marginLeft="20dp";
                                      text="捐赠支持";
                                      textSize="14sp";
                                      layout_gravity="center";
                                      textColor="#333333";
                                      layout_width="fill";
                                      style="?android:attr/borderlessButtonStyle";
                                      id="gy6758787";
                                      onClick=function()
                                        加载网页('同上')
                                        下滑动画(dc)
                                      end
                                    };
                                  };--捐赠支持--捐赠支持--布局开始--捐赠支持--布局开始
                                };--捐赠支持--布局结束
                           };
                          };
                --]]
              --------------------------------------------------会员功能--------------------------------------------------------
            };--上部白色块布局结束
          };
        },
      },
    }
    --自定义函数（动作跟踪）-*-记录
    --[[function 动作跟踪()--开始
     -- 弹出消息("已记录该动作！")

    addDataDialog("Collection","动作跟踪",dzgzmc,dzgzdm)--]]
    --弹出消息(data)
        --end--结束
    --自定义函数（动作跟踪）-*-记录
    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(ganbei));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);
    --设置弹窗与返回键的响应,true为消失
    dialog1.setCancelable(true)
    --设置点击外部弹窗不消失
    dialog1.setCanceledOnTouchOutside(true)
    --设置弹窗宽度
    p=dialog1.getWindow().getAttributes();
    p.width=(activity.Width);
    dialog1.getWindow().setAttributes(p);


    功能标题={}
    功能类型={}
    function 添加功能(写入标题,写入类型)
      table.insert(功能标题,写入标题)
      table.insert(功能类型,写入类型)--默认
    end
    添加功能("逻辑判断",0)
    添加功能("高亮引导",0)
    添加功能("局部特效",0)
    添加功能("基础爬虫(Bata)",0)
    添加功能("索取调用(lua)",0)

    for k,q in pairs(功能标题) do
      item={
        LinearLayout;
        gravity="center";
        layout_width="fill";
        layout_height="45dp";
        orientation="horizontal";
        id="mItem",
        onClick=function()
            dialog1.dismiss()
            if(功能标题[k]=="索取调用(lua)")then
              loadstring("索取调用()")()
            end

            if(功能标题[k]=="基础爬虫(Bata)")then
              loadstring("基础爬虫()")()
            end
            if(功能标题[k]~="索取调用(lua)" and 功能标题[k]~="基础爬虫(Bata)")then
              loadstring(功能标题[k].."()")()
            end
      end,
        {
          LinearLayout;
          layout_width="fill";
          orientation="vertical";
          {
            TextView;
            layout_width="fill";
            textColor="#333333",
            gravity="center",
            textSize="14sp",
            text=功能标题[k],
          };
        };
      };

      --添加到容器


      function_add.addView(loadlayout(item))
      波纹({mItem},"方",0x21000000)
    end




    --弹窗背景和圆角
    import "android.graphics.drawable.GradientDrawable"
    drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(0x00FFFFFF)
    drawable.setCornerRadii({25,25,25,25,0,0,0,0});
    dc.setBackgroundDrawable(drawable)


    --[[--角度=40
    角度=0
    控件id=card
    --控件颜色=0xFFFF5D5D
    CircleButton(控件id,控件颜色,角度)--]]
    function 上滑动画(id)
      import "android.view.animation.LayoutAnimationController"
      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.TranslateAnimation"
      import "android.view.animation.AnimationSet"
      --定义动画变量,使用AnimationSet类，使该动画可加载多种动画
      animationSet = AnimationSet(true)
      --设置布局动画，布局动画的意思是布局里面的控件执行动画，而非单个控件动画，参数:动画名，延迟
      layoutAnimationController=LayoutAnimationController(animationSet,0.2);
      --设置动画类型，顺序   反序   随机
      layoutAnimationController.setOrder(LayoutAnimationController.ORDER_NORMAL); --   ORDER_     NORMAL     REVERSE     RANDOM
      --id控件加载动画
      id.setLayoutAnimation(layoutAnimationController);

      ganbei_dh2=TranslateAnimation(0,0,activity.height/(5/3),0)

      ganbei_dh2.setDuration(500);

      ganbei_dh2.setStartOffset(0)
      --动画执行次数，-1   Animation.INFINITE  表示不停止
      ganbei_dh2.setRepeatCount(0.5)
      --动画执行完后是否停留在执行完的状态
      -- yuxuan_dh2.setFillAfter(true)
      --添加动画
      animationSet.addAnimation(ganbei_dh2);
    end

    上滑动画(dc)

    function 下滑动画(id)
      ganbei_dh3=TranslateAnimation(0,0,0,activity.height/(5/3))
      ganbei_dh3.setDuration(500);
      ganbei_dh3.setStartOffset(0)
      --动画执行次数，-1   Animation.INFINITE  表示不停止
      ganbei_dh3.setRepeatCount(0.5)
      --动画执行完后是否停留在执行完的状态
      ganbei_dh3.setFillAfter(true)
      id.startAnimation(ganbei_dh3)--设置
      import "android.view.animation.Animation$AnimationListener"
      ganbei_dh3.setAnimationListener(AnimationListener{
        onAnimationEnd=function()
          dialog1.dismiss()
        end,
      })
    end


    --波纹函数
    function 波纹(id,颜色)
      import "android.content.res.ColorStateList"
      local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
      local typedArray =activity.obtainStyledAttributes(attrsArray)
      ripple=typedArray.getResourceId(0,0)
      Pretend=activity.Resources.getDrawable(ripple)
      Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
      id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
    end


    波纹(gg1,0xFF888888)--反馈


    --输入框布局-----开始
    input2layout={
      LinearLayout,
      orientation="vertical",
      Focusable=true,
      FocusableInTouchMode=true,
       {
        TextView;--文本控件
        id="linkhint",
        layout_width='75%w';--文本宽度
        layout_marginTop='10dp';--布局顶距
        layout_gravity="center";--重力属性
        textColor=WidgetColors;--文字颜色
        --singleLine="true"--单行显示
        --xtColor="#ffffffff"
         text='当前标签内的文本内容为：'..bqnr.getText()--;--显示的文字
      };

      {

        EditText,
        id="edit1",
        hint="Input here",
        MaxLines=50,
        --numa="32552",
        --aaa="bbb"
        layout_marginTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
        hint=" 请输入要修改的文本内容"
      },
    }
    --输入框布局-----结束
    --自定义对话框
    --sqys为索取元素

    ---------------------------------------判断标签名定义功能开始---------------------------------------
      -- gn1=逻辑判断--***
      -- gn2=高亮引导--***
      -- gn3=设置阴影--input
      -- gn4=设置背景-input
      -- gn5=输入隐藏--input
      -- gn6=修改图片--img
      -- gn7=元素链接--***
      -- gn8=复制元素--***
      -- gn9=编辑样式--***

      -- gn4.setVisibility(View.GONE)
      -- gn5.setVisibility(View.GONE)
      -- gn6.setVisibility(View.GONE)
      -- gn7.setVisibility(View.GONE)
      -- gn8.setVisibility(View.GONE)
      -- gn9.setVisibility(View.GONE)
    ---------------------------------------判断标签名定义功能开始---------------------------------------



    szbqnr=sqys..'.innerHTML="zdyth自定义替换"'--设置标签内容 .innnerHTML="******"

    qcys=sqys..'.setAttribute("style","display:none")'--设置去除元素
    cxqcys=sqys..'.setAttribute("style","display:block")'--设置撤销去除元素

    ydts_0=[[
     var hm = document.createElement("script");
      hm.src = "https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/Js/intro/intro.js";
      var s = document.getElementsByTagName("title")[0];
      s.parentNode.insertBefore(hm, s);

      var hm = document.createElement("link");
      hm.rel="stylesheet"
      hm.href = "https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/Js/intro/introjs.css";
      var s = document.getElementsByTagName("title")[0];
      s.parentNode.insertBefore(hm, s);
            ]]..sqys..'.setAttribute("data-step","替换数字");'..sqys..'.setAttribute("data-intro","自定义替换");'--引导提示
    ydts_1=sqys..'.setAttribute("data-step","替换数字");'..sqys..'.setAttribute("data-intro","自定义替换");'--引导提示

    zdtx=sqys..'.value="zdtx自定义替换"'--自动填写
    cxzdtx=sqys..'.value=""'--撤销自动填写

    xgts=sqys..'.setAttribute("placeholder","xgts自定义替换")'--修改提示文字
    cxxgts=sqys..'.setAttribute("placeholder","xgts自定义替换")'--修改提示文字

    sryc=sqys..'.setAttribute("type","password")'--输入隐藏
    sryc2=sqys..'.setAttribute("type","")'--输入显示


    xgtp=sqys..'.setAttribute("src","xgtp自定义替换")'--修改图片


    --tzlj=sqys..'.setAttribute("href","tzlj自定义替换")'--设置跳转
    --tzlj=sqys..'.setAttribute("href","tzlj自定义替换")'--设置跳转

    tzlj='var dqbq='..sqys..';if(dqbq.tagName.toLowerCase()=="a"){dqbq.setAttribute("href","tzlj自定义替换")}else{if(dqbq.parentElement.tagName.toLowerCase()=="a"){dqbq.parentElement.setAttribute("href","tzlj自定义替换")}else{if(dqbq.parentElement.parentElement.tagName.toLowerCase()=="a"){dqbq.parentElement.parentElement.setAttribute("href","tzlj自定义替换")}else{};};}'




    fzys='var cln='..sqys..';cln.parentElement.appendChild(cln.cloneNode(true));'--复制元素
    cxfzys=sqys..'.parentElement.lastChild.remove();'--撤销复制元素

    bqm3=bqm.."["..bqm2.."]"


    ------------------------------------------点击事件
      bqnr.onClick=function()--自定义标签内容 事件开始
          下滑动画(dc)
          催更()
      end--自定义标签内容 事件结束
      function 逻辑判断()
          下滑动画(dc)
          催更()
      end
      function 高亮引导()
          下滑动画(dc)
          js={}
          if(#dzlb==0)then
           else
              for i=1,#dzlb do
               if(dzlb[i]==17)then
                table.insert(js,i)
               end
              end
          end

          if(#js==0)then
            dng=1
           else
            dng=js[#js]+1
          end
          function 执行引导()
             对话框()
            .设置标题("引导设置")
            .setView(loadlayout(input2layout))--设置输入框布局
            .设置积极按钮("确定",function()
              th=edit1.text
              if(dng==1)then
                tgszgl = string.gsub(ydts_0,"替换数字",dng)
                ydtsjs = string.gsub(tgszgl,"自定义替换",th)
               else
                tgszgl = string.gsub(ydts_1,"替换数字",dng)
                ydtsjs = string.gsub(tgszgl,"自定义替换",th)
              end
               --[[-----------------------------相关配置
                    nextLabel: "Next &rarr;",
                    prevLabel: "&larr; Back",
                    skipLabel: "Skip",
                    doneLabel: "Done",
                    tooltipPosition: "bottom",
                    tooltipClass: "",
                    highlightClass: "",
                    exitOnEsc: !0,
                    exitOnOverlayClick: !0,
                    showStepNumbers: !0,//红色小指标（小点）=1为不显示
                    keyboardNavigation: !0,
                    showButtons: !0,
                    showBullets: !0,//中间过渡 =1为不显示
                    showProgress: !1,
                    scrollToElement: !0,
                    overlayOpacity: 0.8,
                    positionPrecedence: ["bottom", "top", "right", "left"],
                    disableInteraction: !1
                 ]]-----------------------------相关配置

              task(500,function()--延时开始
                 if(dqzt[#dqzt]==nil)then
                  if(dng~=1)then
                   状态设置1()
                    对话框()
                    .设置标题("提示")
                    .设置消息("已为您开启引导效果预览，预览完毕后需手动开启元素锁定（左上角图标）")
                    .设置积极按钮("确定",function()
                      弹出消息("引导预览成功！")
                    end)
                    .设置消极按钮("取消")
                    .显示()
                   end
                 end
              end)--延时结束
                加载Js(ydtsjs..[[introJs().setOptions({'prevLabel':'&larr; 上一步','nextLabel':'下一步 &rarr;','skipLabel':'跳过','doneLabel':'完成','showStepNumbers':!1,'showBullets':!1}).start();]])
                添加动作跟踪("引导"..bqm3.."标签",ydtsjs,"","引导撤销成功！",17)--名称数据,代码数据,撤销数据,撤销提示,动作类别
                过渡加载框("稍等","添加引导中...",500,"已跟踪记录！")
              --弹出消息("已跟踪记录！")
            end)
            .设置消极按钮("取消")
            .显示()
            linkhint.setText("为该页面设置引导提示".."\n".."当前为第"..''..dng..''.."个引导");
            edit1.setHint(" 请输入提示内容")--定义提示
            end

            if(wyzt[1]==1)then
              对话框()
              .设置标题("提示")
              .设置消息("当前网页有保护机制，使用该功能可能会无效，是否继续添加引导？")
              .设置积极按钮("继续",function()
                执行引导()
              end)
              .设置消极按钮("取消")
              .显示()
            else
              执行引导()
            end
      end
      function 局部特效()
        对话框()
       .设置标题("提示")
       .设置消息("进入文章详情页面长按即可选择该特效，每个特效在文章详情页面可以直接测试预览")
       .设置积极按钮("确定",function()
        浏览器布局(1,"正在加载局部特效列表...","https://bk.yyge.net/?tag=%E5%B1%80%E9%83%A8%E7%89%B9%E6%95%88",[===[
          加载列表(FallingFx,138,2,2,"上升气泡",'var BubbleUp_v=Element_Element;function Element_Up() {if(BubbleUp_v.localName=="img" || BubbleUp_v.localName=="a"){BubbleUp_v=BubbleUp_v.parentElement;Element_Up();}else{BubbleUp_v=BubbleUp_v;};};Element_Up();BubbleUp(BubbleUp_v);BubbleUp_v.style.overflow="hidden";var element_css_key1=document.getElementsByClassName("single-thumbnail")[0];var element_css_key2=document.getElementById("thumbnail_canvas");if(element_css_key1!=undefined){element_css_key1.setAttribute("style","height:0px")};if(window.getComputedStyle(element_css_key2,null).position=="relative"){element_css_key2.setAttribute("style", "position:initial");};',"")
          ]===])--加载列表--/数组/编号/类型/数组定位/提示变量/自定义js/diy输入框
       end)
       .设置消极按钮("取消")
       .显示()
      end

      function 索取调用()
        下滑动画(dc)
        sj=[===[控件ID.setWebViewClient{onPageFinished=function(view,url)--网页加载完成]===].."\n"..[===[控件ID.evaluateJavascript([[提取替换]===].."\n"..[===[]],function(a) print(a) end)]===].."\nend}"
        索取内容([[thsj = string.gsub(sj,"提取替换",sqnr) ]].."\n"..[[复制文本(thsj)]]..[[过渡加载框("稍等","系统正在复制索取内容，请稍等...",500,"复制成功！")]])
      end

      function 基础爬虫()
          print(111111)
        下滑动画(dc)
        if(GrabMod==1)then
          -- print(GrabMod)
          --渐变(0xFF333333,0xFF000000,toolbarParent)
          渐变(0xFFFF2778,0xFFFF352C,toolbarParent)
          --渐变(0xFFFF352C,0xFFFF2778,toolbarParent)
          task(200,function()--延时开始
           dianji()
          end)
          --快捷按钮("关闭")
          mb.setVisibility(View.VISIBLE)--显示控件
          --jiaobiao.setBackgroundColor(0x00000000)
          import "android.graphics.drawable.BitmapDrawable"
          jiaobiao.setBackgroundDrawable(BitmapDrawable(loadbitmap("https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E8%A7%92%E6%A0%87-%E7%A1%AE%E8%AE%A4-4.png")))
          --jiaobiao.setBackgroundDrawable()
          tp_2="https://bk.yyge.net/%E6%88%91%E7%9A%84%E5%9B%BE%E7%89%87/jb_fs_2.jpg"
          lzjb.setImageBitmap(loadbitmap(tp_2))
          lzjb1.setImageBitmap(loadbitmap(tp_2))
          lzjb2.setImageBitmap(loadbitmap(tp_2))
          lzjb3.setImageBitmap(loadbitmap(tp_2))
          lzjb4.setImageBitmap(loadbitmap(tp_2))
          hs.setVisibility(View.GONE)--mb隐藏
          hs1.setVisibility(View.GONE)--mb隐藏
          hs2.setVisibility(View.GONE)--mb隐藏
          hs3.setVisibility(View.GONE)--mb隐藏
          hs4.setVisibility(View.GONE)--mb隐藏
          --修改悬浮球("图标",4)
          table.insert(dqzt,2)--写入悬浮球功能

          import("android.app.ProgressDialog");
          local pd = ProgressDialog.show(this,"稍等","正在智能识别列表元素，请稍等...");
          local id =import "android.os.Build"
          local dd=id.SERIAL
          local set=import "android.provider.Settings"
          local id = set.System.getString(this.getContentResolver(), "android_id")
          local codeid =dd..id

          Js_str_max=[==[
            var list_text = new Array();
            var list_origin = new Array();
            var list_text_2 = new Array();
            var list_origin_2 = new Array();
            var list_body_1=0/*计数父类为body*/;
            var list_body_2=0/*计数执行次数*/;
            function uniq_fx(array){
              var temp = [];
              var temp_2 = [];
              for(var i = 0; i < array.length; i++){
              if(temp.indexOf(array[i]) == -1){temp.push(array[i]);
              }}
              return temp;
            };

            function function_childNodes(x,y,type,limit)/*x=父类;y=原始元素;limit=限制元素*/ {
              if(x!=null){
               if(x!=document.body && x!=limit){
                if(x.children.length==1){
                  parentElement_init=x.parentElement
                  function_childNodes(parentElement_init,y,type,limit)
                 }else{
                  var A = new Array();
                  var B = new Array();
                  var C_Element = new Array();

                  for (var i = 0; i < x.children.length; i++) {
                    var element_attributes=x.children[i]
                    var attributes_name="";//小循环
                    var AttLen = element_attributes.attributes.length
                     var X_Att_len = x.attributes.length
                    if(X_Att_len==0/*当原始元素无属性时*/|| X_Att_len==1){A.push(x.localName+"$"+element_attributes.localName);B.push(x);}else/*原始元素有属性时*/{
                      var attributes_X_name="";//大循环 记录父类的属性

                     for (var m = 0; m < X_Att_len; m++) {
                       var value_x_att=x.attributes[m]
                      if(value_x_att.name!="src" && value_x_att.name!="href" && value_x_att.name!="data-aid" && value_x_att.name!="data-title"){
                        var value_str_re=value_x_att.value.replace(/[0-9]+/g,"")
                        if(value_str_re!=""){var attributes_X_name = (attributes_X_name+x.localName+"$"+value_x_att.value+"#").replace(/[0-9]+/g,"");}
                      };
                     };

                      if(AttLen!=0/*子类的属性不为0*/ || X_Att_len==1){
                        for (var v = 0; v < AttLen;/*必须要有属性*/ v++) {
                          var value_str=element_attributes.attributes[v]
                          if(value_str.name!="src" && value_str.name!="href" && value_str.name!="data-aid" && value_str.name!="data-title"){
                              var value_str_re=value_str.value.replace(/[0-9]+/g,"")
                              if(value_str_re!=""){var attributes_name = (attributes_name+x.localName+"$"+element_attributes.attributes[v].value+"#").replace(/[0-9]+/g,"");}
                          };
                          if(v == AttLen-1){A.push(attributes_name);B.push(x);}
                        };
                       }else/*子类属性为0*/{A.push(attributes_X_name);B.push(x);/**console.log(attributes_X_name)**/};
                    };
                  }

                 //去重
                  function uniq(array){
                    var temp = [];
                    for(var i = 0; i < array.length; i++){
                    if(temp.indexOf(array[i]) == -1){
                    temp.push(array[i]);
                    C_Element.push(B[i]);
                    };}
                    return temp;
                  }

                 if(type==1 && A.length!=uniq(A).length){
                  if(A.length/2<=uniq(A).length){
                    parentElement_init=x.parentElement
                    function_childNodes(parentElement_init,y,type,limit)
                   }else{
                     list_text.push(C_Element[0]);
                     list_body_2++;
                     if(C_Element[0].parentElement==document.body){list_body_1++;}
                     list_origin.push(y)
                  };
                 }else{
                  if(A.length/2<=uniq(A).length){
                    parentElement_init=x.parentElement
                    function_childNodes(parentElement_init,y,type,limit)
                   }else{
                     list_text_2.push(C_Element[0]);
                     list_body_2++;
                     if(C_Element[0].parentElement==document.body){list_body_1++;}
                     list_origin_2.push(y)
                  };
                 };
                };
               };
              };
            }

            Array.from(document.body.getElementsByTagName("*")).map(
            function (x){
            var element_init=x
            var parentElement_init=element_init.parentElement
            function reup(x) {
              if(x.children.length==1){reup(x.parentElement)}else{parentElement_init_1=x}
            }
            reup(parentElement_init)
            function_childNodes(parentElement_init_1,element_init,1,document.body)
            });

            if(list_body_1>list_body_2*0.5){list_text=[document.body];}
            function distinct(list) {
              var list_origin_2 = new Array();
               list_origin_2.push(list_origin[0])
               let result = [list[0]];
               for (let i = 1; i < list.length; i++) {
                 if (!(result.some(val => list[i] === val))) {
                   result.push(list[i]);
                   list_origin_2.push(list_origin[i]);
                 }
               }
               return [result,list_origin_2];
            };
            // 去除父类已经包含的列表
            var list_origin_3 = new Array();/*父类数据*/
            var list_origin_4 = new Array();/*原始元素*/
            for (var i = 0; i < distinct(list_text)[0].length; i++) {list_origin_3.push(distinct(list_text)[0][i]);list_origin_4.push(distinct(list_text)[1][i])}
            for (var i = 0; i < distinct(list_text)[0].length; i++) {
              for (var m = list_origin_3.length; m >=0 ; m--) {
                if(distinct(list_text)[0][i]!=list_origin_3[m]){
                  if(distinct(list_text)[0][i].contains(list_origin_3[m]) == true){
                    list_origin_3.splice(m,1);
                    list_origin_4.splice(m,1);
                  }
                };
              }
            };

            function reText(element) {
              var DocumentImages=document.images
              var DocumentLinks=document.links
              var StrLog="";
              var Data_A = new Array();
              function AllTextDocument(x) {
               var Data_Text= new Array();
                function funabbr(v) {
                  if(v.childElementCount==0 &&
                    v.innerHTML!="" &&
                    v.localName!="script" &&
                    v.localName!="style"){Data_Text.push(v);
                   }else{
                    for (var r = 0; r < v.childNodes.length; r++) {
                      if(v.childNodes[r].nodeType==3 && v.childNodes[r].textContent.replace(/\s/g,"")!="" && v.childNodes[r].parentNode.localName!="script" && v.childNodes[r].parentNode.localName!="style"){Data_Text.push(v.childNodes[r])};
                    }
                  }
                };
                var  x_number=x.getElementsByTagName("*");funabbr(x);for (var i = 0; i < x_number.length; i++) {funabbr(x_number[i]);}
                 return Data_Text;
              };

              for(var q=0;q<DocumentImages.length;q++){
                if(DocumentImages[q]==element){
                  Data_A.push("图片");
                  for (var i = 0; i < DocumentLinks.length; i++) {
                    if(DocumentLinks[i].contains(DocumentImages[q])==true){
                      var DocumentLinks_Text=AllTextDocument(DocumentLinks[i])
                      if(DocumentLinks_Text.length==0){
                      Data_A.push("跳转");
                     }else{Data_A.push("跳转");Data_A.push("文本");}
                    }
                  }
                };
              };

              for(var q=0;q<DocumentLinks.length;q++){
                if(DocumentLinks[q]==element){Data_A.push("跳转");if(DocumentLinks[q].getElementsByTagName("*").length==0 && DocumentLinks[q].innerHTML!=""){Data_A.push("文本");};
                  for (var i = 0; i < DocumentImages.length; i++) {
                    if(DocumentLinks[q].contains(DocumentImages[i])==true){
                      var DocumentLinks_Text=AllTextDocument(DocumentLinks[q])
                      if(DocumentLinks_Text.length==0){Data_A.push("图片");}else{Data_A.push("图片");Data_A.push("文本");}
                    }
                  };
                };
              };

              if(StrLog==""){
                for(var q=0;q<DocumentLinks.length;q++){
                  if(DocumentLinks[q].contains(element)==true){Data_A.push("跳转");}else{
                  if(element.contains(DocumentLinks[q])==true){Data_A.push("跳转");};}
                };

                for(var q=0;q<DocumentImages.length;q++){
                  if(element.contains(DocumentImages[q])==true){Data_A.push("图片");}else{
                  if(DocumentImages[q].contains(element)==true){Data_A.push("图片");};}
                };

                var DocumentLinks_Text=AllTextDocument(document.body)
                for(var q=0;q<DocumentLinks_Text.length;q++){
                  if(element.contains(DocumentLinks_Text[q])==true){Data_A.push("文本");}else{
                  if(DocumentLinks_Text[q].contains(element)==true){Data_A.push("文本");};};
                };
               StrLog=distinct(Data_A)[0]
              };
              StrLog_text=""
              for (var i = 0; i < StrLog.length; i++) {
                if (i==StrLog.length-1) {StrLog_text=StrLog_text+StrLog[i]}else{StrLog_text=StrLog_text+StrLog[i]+","}
              }
              return StrLog_text
            }

            sysz="";var sysz_arr=[];var Data_Data_All = new Array();
            var Data = new Array();

            function AllTextDocument(x) {
              //获取文本元素
             var Data_Text= new Array();
              function funabbr(v) {
                if(v.childElementCount==0/*只有一个子元素*/ &&
                  v.innerHTML!="" &&
                  v.localName!="script" &&
                  v.localName!="style"){if(v.parentNode.localName=="a"){
                  if(v.parentNode.getElementsByTagName("em").length==0 && v.parentNode.getElementsByTagName("font").length<=0){Data_Text.push(v);};
                   }else{
                    if(v.localName=="font"/*元素本身就是font*/){
                      if(v.parentNode.getElementsByTagName("font").length>=1){Data_Text.push(v.parentNode);}else{Data_Text.push(v);}
                    }else{Data_Text.push(v);}
                  };
                 }else{
                  v_number=0/*计数*/
                  b_number=v.childNodes.length/*元素内所有子标签含Text*/
                  for (var i = 0; i < b_number; i++) {
                    if(v.childNodes[i].localName=="font"){v_number++;}
                    if(v.childNodes[i].localName=="em"){v_number++;}
                    if(v.childNodes[i].nodeType==3){if(v.childNodes[i].textContent.replace(/[\r\n\s]+/g,"")!=""){v_number++;}}
                  };

                  // console.log(v)
                  // console.log(b_number*0.5+"==="+v_number)
                  if(b_number*0.5<v_number/*原长度的70%小于筛选长度*/){if(v.innerHTM!="" && v.localName!="script" && v.localName!="style"){Data_Text.push(v);}}else{
                      for (var r = 0; r < v.childNodes.length; r++) {
                        if(v.childNodes[r].nodeType==3 && v.childNodes[r].textContent.replace(/\s/g,"")!="" && v.childNodes[r].parentNode.localName!="script" && v.childNodes[r].parentNode.localName!="style"){
                          if(v.childNodes[r].parentNode.localName=="a"){
                             var y=0;
                             if(v.childNodes[r].parentNode.getElementsByTagName("em").length>0){y=1};
                             if(v.childNodes[r].parentNode.getElementsByTagName("font").length>1){y=1};
                             if(y==0){Data_Text.push(v.childNodes[r])};
                             if(y==1){Data_Text.push(v.childNodes[r].parentNode)};
                           }else{Data_Text.push(v.childNodes[r]);};
                        };
                      }
                  };
                }
              };
              var  x_number=x.getElementsByTagName("*");funabbr(x);for (var i = 0; i < x_number.length; i++) {funabbr(x_number[i]);}
               return Data_Text;
            };

            var DocumentImages=document.images
            var DocumentLinks=document.links
            var Data_ArrContext=[]/*与元素为包含关系的元素1为跳转链接a;2为图片img*/

            if(list_origin_3.length==1 && list_origin_3[0]==undefined){}else{
              for (var i = 0; i < list_origin_3.length; i++) {
                arr_x=[];
                x=list_origin_3[i]
                Array.from(x.children).map(function (m){
                  arr_x_x=[];
                  Array.from(DocumentLinks).map(function (y){if(m.contains(y)==true){arr_x_x.push(y)}});
                  Array.from(DocumentImages).map(function (z){if(m.contains(z)==true){arr_x_x.push(z)}});
                  arr_x.push(arr_x_x)
                })

                Data_ArrContext.push(arr_x)
              }
            }

            GetElName=function (x) {
              if(x.id!=""){idstr="#"+x.id}else{idstr=""};
              if(x.className!=""){classstr="."+x.className}else{classstr=""};
              if(x.localName==undefined && idstr=="#undefined" && classstr==".undefined"){str="text||#text||"}else{str=x.localName+"||"+idstr+"||"+classstr}
              return str;
            }

            id_1=".getElementById(\""
            class_1=".getElementsByClassName(\""
            name_1=".getElementsByTagName(\""
          ]==]
          webView.evaluateJavascript(Js_str_max,function(a)
           task(200,function ()
            pd.dismiss();
            弹出消息("已切换至爬虫模式！")
           end)
          end)
            --样式编辑函数----
              -- WebSpider="https://bk.yyge.net/CDN/WebSpider.lua"
              --   Http.get(WebSpider,nil,"utf8",nil,function(code,html,b,c)
              --     if(判断网络()~=0)then
              --       task(500,function ( ... )
              --        loadstring(html)()
              --       end)
              --     end --判断网络--结束
              --   end)
              JsGrab="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%BC%80%E6%BA%90/JsGrab_oc_2_0.lua"
                Http.get(JsGrab,nil,"utf8",nil,function(code,html,b,c)
                  if(判断网络()~=0)then
                    task(500,function ( ... )
                     loadstring(html)()
                    end)
                  end --判断网络--结束
                end)
            --样式编辑函数----
         else
          版本功能限制("爬虫")
        end
      end
    ------------------------------------------点击事件


    --调用渐变函数
    渐变(0xFF0C998C,0xFF2BEF3A,card)

    --渐变(0xFFFF6845,0xFFFF2317,bq)--判断标签_1开始
 end--判断标签

 bt=webView.title
   if(bt:find"bqm=") then
    pdbq_1()
   else

    事件1=([===[
     初始化标签()
     --过渡加载框("稍候","开启动态编辑中...",800,"开启成功！")

     import("android.app.ProgressDialog");
     pd = ProgressDialog.show(this,"稍候","开启动态编辑中...");
     id =import "android.os.Build"
     dd=id.SERIAL
     set=import "android.provider.Settings"
     id = set.System.getString(this.getContentResolver(), "android_id")
     codeid =dd..id

      function zhgz()--整合跟踪
        if(zxdz[#zxdz]==nil)then
          url=""--验证地址
        else
          url=zxdz[#zxdz]--验证地址
        end

      --print(#mcsj..#dmsj..#cxsj..#cxmc..#zxdz..#dzlb);

         cdsj1={}
         cdsj1[1]=""
         jcsj_1={}--名称
         jcsj_2={}--代码
         jcsj_3={}--撤销
         jcsj_4={}--提示
         jcsj_5={}--验证地址
         jcsj_6={}--类别

         for i=1, #(dmsj) do--遍历代码数组所有内容
            if(dzlb[i]==10) then
              table.insert(jcsj_1,mcsj[i])--名称
              table.insert(jcsj_2,dmsj[i])--代码
              table.insert(jcsj_3,cxsj[i])--撤销
              table.insert(jcsj_4,cxmc[i])--提示
              table.insert(jcsj_5,zxdz[i])--验证地址
              table.insert(jcsj_6,dzlb[i])--跟踪类别
            else
              cdsj1[1]=cdsj1[1]..dmsj[i].."\n"

            end
         end

        if(zxdz[#zxdz]==nil)then
          zhdm=""
        else
          zhdm="//**("..url..")**//".."\n".."if(window.location.href.indexOf(".."'"..url.."'"..")>-1){".."\n"..cdsj1[1].."}"
        end
         清空动作跟踪()

        for i=1, #(jcsj_2) do
          table.insert(mcsj,jcsj_1[i])--提示
          table.insert(dmsj,jcsj_2[i])--提示
          table.insert(cxsj,jcsj_3[i])--提示
          table.insert(cxmc,jcsj_4[i])--提示
          table.insert(zxdz,jcsj_5[i])--验证
          table.insert(dzlb,jcsj_6[i])--类别
        end

        if(zhdm~="")then--无前者验证时的判断
          table.insert(mcsj,url.."脚本整合")--写入数组
          table.insert(dmsj,zhdm)--写入数组
          table.insert(cxsj,"")--写入撤销代码
          table.insert(cxmc,"上一步操作不支持撤销！")--写入撤销代码
          table.insert(zxdz,url)--写入验证
          table.insert(dzlb,10)--写入跟踪类别
        end


        清空数组(jcsj_1)
        清空数组(jcsj_2)
        清空数组(jcsj_3)
        清空数组(jcsj_4)
        清空数组(jcsj_5)
        清空数组(jcsj_6)

      end--整合跟踪

      function jzxh()--加载循环开始
            task(200,function()
              if(webView.title:find"url=")then
                zhgz()--整合跟踪
                task(600,function()
                  pd.dismiss();
                  弹出消息("开启成功！")
                end)

               else
                jzxh()--加载循环
              end
            end)
      end--加载循环结束

      jzxh()
    ]===])
    定义对话框("提示","当前选择的元素与当前网址未匹配，极有可能为动态加载,是否开启动态加载,锁定当前页面元素,如果开启，系统将自动整合您之前的动作，请您谨慎操作。(开启后重新长按元素即可编辑)\n".."当前链接："..webView.url,"开启","取消")
   end

end--普通长按函数结束