---
--- File: debug_main_tools_os.lua
--- Describe: 可视化调试页 - 常用工具面板
--- Created by Gityyge.
---

function 普通长按()--普通长按函数开始
 function pdbq_1()
    import "android.graphics.drawable.ColorDrawable"
    import "android.content.res.ColorStateList"
    import "android.view.animation.Animation"
    import "android.view.animation.RotateAnimation"
    import "android.animation.Animator$AnimatorListener"

    bt=webView.title
    初始化标题()
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
        layout_height="380dp";--高度480dp以下会有滚动效果--总共的高度
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
              layout_height='550dp';--上部白色块布局高度//会员功能需要开启这个高度
              layout_gravity="center";
              layout_marginTop="0dp";


              {
               HorizontalScrollView,--横向滚动
               layout_width='fill';--宽
               layout_height='40dp';--高
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
                      textColor='#FFFF2317';
                      id="scys";
                      text=bqm;--标签名
                      textSize='20sp';
                      layout_marginLeft='1dp';
                      layout_marginTop='0dp';
                    };

                    {
                      TextView;
                      Gravity='left';
                      textColor='#FF000000';
                      id="idmid";
                      text=idwb;--id名
                      textSize='18sp';
                    };

                    {
                      TextView;
                      Gravity='left';
                      textColor='#FF000000';
                      id="classmclass";
                      text=classwb;--class名
                      textSize='18sp';
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


              ---------------------------------------长按基本功能结束---------------------------------------
                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          layout_marginTop="0dp";
                          id="gn1";
                          {
                            LinearLayout;
                            id="xm1";
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
                              id="gy1";
                            };
                          };--屏蔽元素--屏蔽元素--布局开始
                        };--屏蔽元素
                          --[[ {
                                  Button;
                                  style="?android:attr/borderlessButtonStyle";
                                  layout_width="100%w";
                                  layout_height="1px";
                                  layout_gravity="center";
                                  BackgroundColor="#FFBEBEBE";
                               };--]]

                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn2";
                          {
                            LinearLayout;
                            id="xm2";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="模拟点击";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy2";
                            };
                          };--更新日志--更新日志--布局开始
                        };--模拟点击
                           --[[ {
                                  Button;
                                  style="?android:attr/borderlessButtonStyle";
                                  layout_width="100%w";
                                  layout_height="1px";
                                  layout_gravity="center";
                                  BackgroundColor="#FFBEBEBE";
                                };--]]
                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          -- BackgroundColor="#FFCCCCCC";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn3";

                          {
                            LinearLayout;
                            id="xm3";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="自动填写";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy3";
                            };
                          };--意见反馈--意见反馈--布局开始
                        };--自动填写

                          --[[  {
                                  Button;
                                  style="?android:attr/borderlessButtonStyle";
                                  layout_width="100%w";
                                  layout_height="1px";
                                  layout_gravity="center";
                                  BackgroundColor="#FFBEBEBE";
                                };--]]
                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn4";

                          {
                            LinearLayout;
                            id="xm4";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="输入提示";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy4";

                            };
                          };--捐赠支持--捐赠支持--布局开始
                        };--输入提示

                          --[[  {
                                  Button;
                                  style="?android:attr/borderlessButtonStyle";
                                  layout_width="100%w";
                                  layout_height="1px";
                                  layout_gravity="center";
                                  BackgroundColor="#FFBEBEBE";
                                };--]]
                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn5";

                          {
                            LinearLayout;
                            id="xm5";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="输入隐藏";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy5";

                            };
                          };--捐赠支持--捐赠支持--布局开始
                        };--输入隐藏

                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn6";

                          {
                            LinearLayout;
                            id="xm6";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="修改图片";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy6";

                            };
                          };--修改图片--布局开始
                        };--修改图片

                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn7";

                          {
                            LinearLayout;
                            id="xm7";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="跳转链接";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy7";

                            };
                          };--元素链接--布局开始
                        };--跳转链接

                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn8";

                          {
                            LinearLayout;
                            id="xm8";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              --layout_marginLeft="20dp";
                              text="复制元素";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy8";

                            };
                          };--修改图片--布局开始
                        };--复制元素

                        {
                          LinearLayout;
                          BackgroundColor="#FFFFFFFF";
                          layout_height="45dp";
                          layout_width="100%w";
                          layout_gravity="center";
                          id="gn9";

                          {
                            LinearLayout;
                            id="xm9";
                            layout_height="fill";
                            layout_width="fill";
                            --style="?android:attr/borderlessButtonStyle";

                            {
                              TextView;
                              text="*点击事件";
                              textSize="14sp";
                              layout_gravity="center";
                              textColor="#333333";
                              layout_width="fill";
                              style="?android:attr/borderlessButtonStyle";
                              id="gy9";

                            };
                          };--修改图片--布局开始
                        };--点击事件

                        -- {
                        --   LinearLayout;
                        --   BackgroundColor="#FFFFFFFF";
                        --   layout_height="45dp";
                        --   layout_width="100%w";
                        --   layout_gravity="center";
                        --   id="gn9";

                        --   {
                        --     LinearLayout;
                        --     id="xm9";
                        --     layout_height="fill";
                        --     layout_width="fill";
                        --     --style="?android:attr/borderlessButtonStyle";

                        --     {
                        --       TextView;
                        --       --layout_marginLeft="20dp";
                        --       text="编辑样式";
                        --       textSize="14sp";
                        --       layout_gravity="center";
                        --       textColor="#333333";
                        --       layout_width="fill";
                        --       style="?android:attr/borderlessButtonStyle";
                        --       id="gy9";

                        --     };
                        --   };--修改图片--布局开始
                        -- };--编辑样式

              ---------------------------------------长按基本功能结束---------------------------------------


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
                              text="JsHD调试器 1.0@".."壹影阁";
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

                      -- {
                      --       Button;
                      --       style="?android:attr/borderlessButtonStyle";
                      --       layout_width="100%w";
                      --       layout_height="30px";
                      --       layout_gravity="center";
                      --       BackgroundColor="#FFEEEEEE";
                      --     };

                      --     {
                      --       Button;
                      --       style="?android:attr/borderlessButtonStyle";
                      --       layout_width="40%w";
                      --       layout_height="6px";
                      --       layout_gravity="center";
                      --       BackgroundColor="#FFFFB72E";
                      --     };

                      --     {
                      --       LinearLayout;
                      --       id="gj";
                      --       orientation="horizontal";
                      --       layout_width="100%w";
                      --       layout_height="fill";
                      --       layout_gravity="center";
                      --       layout_marginTop='20dp';

                      --      {
                      --         LinearLayout;
                      --         orientation='vertical';
                      --         layout_width='100%w';
                      --         --id="ll";
                      --         BackgroundColor="#FFFFFFFF";   --白色
                      --         layout_height='fill';


                      --         {
                      --           TextView;
                      --           layout_marginLeft="0dp";
                      --           text="会员功能";
                      --           --id='gy7';
                      --           BackgroundColor="#FFFFFFFF";
                      --           textSize="14sp";
                      --           layout_gravity="center";
                      --           --textColor="#FFFFB72E";
                      --           textColor="#FFFFB72E";


                      --           onClick=function()
                      --             加载网页("软件介绍链接")
                      --             下滑动画(dc)
                      --           end
                      --         };

                      --           {
                      --             LinearLayout;
                      --             BackgroundColor="#FFFFFFFF";
                      --             id="hy1_1";
                      --             layout_height="45dp";
                      --             layout_width="100%w";
                      --             layout_gravity="center";
                      --             layout_marginTop="10dp";
                      --             {
                      --               LinearLayout;
                      --               layout_height="fill";
                      --               layout_width="fill";

                      --               {
                      --                 TextView;
                      --                 text="屏蔽元素";
                      --                --layout_marginLeft="20dp";
                      --                 textSize="14sp";
                      --                 layout_gravity="center";
                      --                 textColor="#333333";
                      --                 layout_height="fill";
                      --                 layout_width="fill";
                      --                 style="?android:attr/borderlessButtonStyle";
                      --                 id="hy1";
                      --               };
                      --             };--屏蔽元素--屏蔽元素--布局开始--屏蔽元素--布局开始
                      --           };--屏蔽元素--布局结束


                      --      };
                      --     };

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


  --设置字体
    import "android.graphics.Typeface"
    idmid.getPaint().setTypeface(Typeface.DEFAULT_BOLD)
    scys.getPaint().setTypeface(Typeface.DEFAULT_BOLD)

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

      ganbei_dh2.setDuration(400);

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
      ganbei_dh3.setDuration(200);
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

    function CircleButton(view,InsideColor,radiu)
      import "android.graphics.drawable.GradientDrawable"
      drawable = GradientDrawable()
      drawable.setShape(GradientDrawable.RECTANGLE)
      drawable.setColor(InsideColor)
      drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
      view.setBackgroundDrawable(drawable)
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


    --波纹用法
    波纹(gy1,0xFF888888)--屏蔽元素

    波纹(gy2,0xFF888888)--模拟点击

    波纹(gy3,0xFF888888)--自动填写

    波纹(gy4,0xFF888888)--输入提示

    波纹(gy5,0xFF888888)--输入隐藏

    波纹(gy6,0xFF888888)--修改图片

    波纹(gy7,0xFF888888)--元素链接

    波纹(gy8,0xFF888888)--复制元素

    波纹(gy9,0xFF888888)--会员*点击事件
    -- 波纹(gy9,0xFF888888)--编辑样式

    波纹(gg1,0xFF888888)--反馈
    --波纹(hy1,0xFF888888)--反馈

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
        textSize="15sp",
        hint=" 请输入要修改的文本内容",
      },
    }
    --输入框布局-----结束
    --自定义对话框
    --sqys为索取元素


    --URL解码器
   function 网址解码器(s)
      s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
      return s
    end
    --URL解码器
    --print(urlDecode(str));
    ---------------------------------------判断标签名定义功能开始---------------------------------------
    -- gn1=屏蔽元素--***
    -- gn2=模拟点击--***
    -- gn3=自动填写--input
    -- gn4=输入提示--input
    -- gn5=输入隐藏--input
    -- gn6=修改图片--img
    -- gn7=元素链接--***
    -- gn8=复制元素--***
    -- gn9=编辑样式--***
    if(webView.title:match('onclick="(.-)"')==nil)then
      gy9.text="点击事件"
    end


    if(bqm~="input")and(bqm~="textarea")then
      gn3.setVisibility(View.GONE)
      gn4.setVisibility(View.GONE)
    end

    if(bqm~="input")then
      gn5.setVisibility(View.GONE)
    end

    if(bqm~="img")then
      gn6.setVisibility(View.GONE)
    end

    function 返回上级()
     加载Js([[
          var mrdh = document.getElementsByClassName("eruda-parent");//默认导航
          if(mrdh[0]==undefined){}else{//判断是否 返回上一级
          mrdh[mrdh.length-1].click();//点击返回一级导航
          }//判断结束

         var zfc =document.getElementsByClassName("eruda-breadcrumb")[0].innerHTML
          var result=zfc.replace(/<.*?>/ig,"");
          document.title = result;
         ]])

    end
    ---------------------------------------判断标签名定义功能结束---------------------------------------

    szbqnr=sqys..'.innerHTML="zdyth自定义替换";'--设置标签内容 .innnerHTML="******"

    qcys=sqys..'.setAttribute("style","display:none");'--设置去除元素
    cxqcys=sqys..'.setAttribute("style","display:block");'--设置撤销去除元素

    mndj=sqys..'.click();'--模拟点击

    zdtx=sqys..'.value="zdtx自定义替换";'--自动填写
    cxzdtx=sqys..'.value=""'--撤销自动填写

    xgts=sqys..'.setAttribute("placeholder","xgts自定义替换");'--修改提示文字
    cxxgts=sqys..'.setAttribute("placeholder","xgts自定义替换");'--修改提示文字

    sryc=sqys..'.setAttribute("type","password");'--输入隐藏
    sryc2=sqys..'.setAttribute("type","");'--输入显示


    xgtp=sqys..'.setAttribute("src","xgtp自定义替换");'--修改图片

    --tzlj=sqys..'.setAttribute("href","tzlj自定义替换")'--设置跳转
    --tzlj=sqys..'.setAttribute("href","tzlj自定义替换")'--设置跳转

    tzlj='var dqbq='..sqys..';if(dqbq.tagName.toLowerCase()=="a"){dqbq.setAttribute("href","tzlj自定义替换")}else{if(dqbq.parentElement.tagName.toLowerCase()=="a"){dqbq.parentElement.setAttribute("href","tzlj自定义替换")}else{if(dqbq.parentElement.parentElement.tagName.toLowerCase()=="a"){dqbq.parentElement.parentElement.setAttribute("href","tzlj自定义替换")}else{};};};'

    fzys='var cln='..sqys..';cln.parentElement.appendChild(cln.cloneNode(true));'--复制元素
    cxfzys=sqys..'.parentElement.lastChild.remove();'--撤销复制元素

    --djsj='var sqm = '..sqys..';var yysj = sqm.getAttribute("onclick");function strToVar(str) {var json = (new Function("return " + str))();return json;}'..'sqm.setAttribute("onclick",yysj+'.."'"..';自定义事件'.."')"
    --点击事件

    djsj=sqys..'.setAttribute("onclick","JsHD_djsj_随机编号();"+'..sqys..[[.getAttribute("onclick"));]]..[[function JsHD_djsj_随机编号() {自定义事件;}]]
    cxdjsj=sqys..'.removeAttribute("onclick");'


    bqm3=bqm.."["..bqm2.."]"


    ------------------------------------------点击事件

    ------------------------------------------定位调用函数
      function dwhq(动态变量)
        下滑动画(dc)
        dqdw=动态变量
        dwjsurl={}--定位Jsurl-id
        dwcssurl={}--定位cssurl-id
        dwurl_hz_mc={}
        dwurl_hz_sj={}
        --过渡加载框("class定位","正在定位当前class，请稍等...",600,"定位完成")
        caching_res=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_res.data"
        caching_script=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_script.data"--script标签
        caching_style=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_style.data"--style标签
        xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"--赋值xml路径

          task(220,function ()
            import "java.io.*"--导入类
            file,err=io.open(caching_res)--res资源文件
            if err==nil then --存在文件的时候执行
              dqres=io.open(caching_res):read("*a")
              qgfz=切割字符串(dqres,"&&&")
              qgfz_js=切割字符串(qgfz[1],"*-JsHD_js-*")
              qgfz_css=切割字符串(qgfz[2],"*-JsHD_css-*")
              MD提示("系统正在定位文件...")
              高级列表弹窗("选择定位",dwurl_hz_mc,dwurl_hz_sj,"复制","1|!|*qg*|!|"..dqdw)

                if(替换特殊字符串(io.open(caching_script):read("*a")):find(替换特殊字符串(动态变量))) then
                   table.insert(dwjsurl,io.open(xml):read("*a").."</script>")
                   table.insert(dwurl_hz_mc,io.open(xml):read("*a").."</script>")
                   table.insert(dwurl_hz_sj,"")
                   adapter.add{xvhao={text=tostring(io.open(xml):read("*a").."</script>")}}
                   --MD提示("已定位到Js脚本文件：\n"..io.open(xml):read("*a").."</script>")
                end

                if(替换特殊字符串(io.open(caching_style):read("*a")):find(替换特殊字符串(动态变量))) then
                   table.insert(dwcssurl,io.open(xml):read("*a").."</style>")
                   table.insert(dwurl_hz_mc,io.open(xml):read("*a").."</style>")
                   table.insert(dwurl_hz_sj,"")
                   adapter.add{xvhao={text=tostring(io.open(xml):read("*a").."</style>")}}
                   --MD提示("已定位到css样式文件：\n"..io.open(xml):read("*a").."</style>")
                end

              for i=1,#qgfz_js do
                遍历Js=qgfz_js[i]
                Http.get(遍历Js,nil,"utf8",nil,function(code,html,b,c)
                    if(替换特殊字符串(html):find(替换特殊字符串(动态变量))) then
                       table.insert(dwjsurl,qgfz_js[i])
                       table.insert(dwurl_hz_mc,qgfz_js[i])
                       table.insert(dwurl_hz_sj,"")
                       adapter.add{xvhao={text=tostring(qgfz_js[i])}}
                       --MD提示("已定位到Js脚本文件：\n"..qgfz_js[i])
                    end
                end)

              end

              for i=1,#qgfz_css do
                遍历css=qgfz_css[i]
                Http.get(遍历css,nil,"utf8",nil,function(code,html,b,c)
                    if(替换特殊字符串(html):find(替换特殊字符串(动态变量))) then
                       table.insert(dwcssurl,qgfz_css[i])
                       table.insert(dwurl_hz_mc,qgfz_css[i])
                       table.insert(dwurl_hz_sj,"")
                       adapter.add{xvhao={text=tostring(qgfz_css[i])}}
                       --MD提示("已定位到css样式文件：\n"..qgfz_css[i])
                    end
                end)

              end


             -- print("含有class的js文件："..#dwjsurl..'\n含有class的css文件：'..#dwcssurl)
              else
            end
          end)
      end
    ------------------------------------------定位调用函数

      -- hy1.onClick=function()
      --   弹出消息("开发中...")
      -- end

      function idmid.onClick()
        function idmid_xzgn()
          if(idwb~="")then
           dwhq(string.sub(idwb,2,nil))
           else
           弹出消息("程序出错！请您重新锁定元素")
          end
        end

        datafile=File(activity.getLuaDir()).getParentFile().getParentFile()
        hsml=tostring(datafile).."/fx.lua"
        import "java.io.*"--导入类
        file,err=io.open(hsml)
        if err==nil then  --存在文件
           idmid_xzgn()
          else
           task(220,function ()
           版本功能限制("id定位")
           end)
           下滑动画(dc)
        end--创建结束
      end

      function classmclass.onClick()
        function classmclass_xzgn()
          if(classwb~="")then
             --过渡加载框("class定位","正在定位当前class，请稍等...",600,"定位完成")
             class_qgmc=切割字符串(string.sub(classwb,2,nil)," ")
             class_qgsj={}
             class_dqclass=""--当前元素class
             for i=1,#class_qgmc do
              table.insert(class_qgsj,"dwhq('"..class_qgmc[i].."')")
             end
            if(#class_qgmc~=1)then
              列表弹窗("选择class",class_qgmc,class_qgsj)
             else
              dwhq(class_qgmc[1])
            end
           else
            弹出消息("程序出错！请您重新锁定元素")
          end
        end

        datafile=File(activity.getLuaDir()).getParentFile().getParentFile()
        hsml=tostring(datafile).."/fx.lua"
        import "java.io.*"
        file,err=io.open(hsml)
        if err==nil then
           classmclass_xzgn()
          else
           task(220,function ()
           版本功能限制("class定位")
           end)
           下滑动画(dc)
        end--判断函数结束
      end

      bqnr.onClick=function()--自定义标签内容 事件开始
          下滑动画(dc)
          对话框()
                .设置标题("设置标签内的文本内容")
                .setView(loadlayout(input2layout))--设置输入框布局
                .设置积极按钮("修改",function()
                       th=edit1.text
                       jzjs = string.gsub(szbqnr,"zdyth自定义替换",th)--加载js
                       dzgzdm = jzjs
                       dzgzmc = "设置标签内容:"..th
                       加载Js(jzjs)
                       ----------------下面是撤销需要代码
                       bt=webView.title
                        if(bt:find"bqnr=") then--判断是否有标签内容--开始
                        bqnr=""..bt:match('bqnr=%"(.-)%"')--<>****<>
                        else--判断xmlurl否则
                        bqnr=""--<>****<>
                        end--判断是否有标签内容--结束
                        cxjsdm = string.gsub(szbqnr,"zdyth自定义替换",bqnr)--撤销js代码
                       添加动作跟踪("设置"..bqm3.."标签内容："..th,jzjs,cxjsdm,"内容撤销成功！",1)
                       -----------------上面是撤销需要代码
                       --动作跟踪()
                       弹出消息("已跟踪记录！")
                                    end)
                .设置消极按钮("取消",function()--设置消极按钮("退出")
                                    --return (canoffline or 退出程序())--退出功能
                                    end)
                .显示()
      end--自定义标签内容 事件结束

      scys.onClick=function()--审查元素 事件开始
       下滑动画(dc)
       webView.evaluateJavascript(sqys..[[.outerHTML]],function(a)
        zyth1_1 = string.gsub(a,[[\u003C]],"<")
        zyth1_2 = string.gsub(zyth1_1,[[\"]],'"')
        zyth1_3 = string.gsub(zyth1_2,[[\n]],' ')
        zyth1_4 = string.gsub(zyth1_3,[[\t]],'')

          c={}
          for i=1,50 do
            table.insert(c,".")--名称
          end
          lss=""
          lsdm={}
          for i=1,#c do
            lss=lss..c[i]
            if(lsdm[1]==nil)then
              zyth_1 = string.gsub(zyth1_4,' bqm="'..lss..'"','')
              zyth_2 = string.gsub(zyth_1,' clags="'..lss..'"','')
              zyth_3 = string.gsub(zyth_2,' idm="'..lss..'"','')
            else
              zyth_1 = string.gsub(lsdm[#lsdm],' bqm="'..lss..'"','')
              zyth_2 = string.gsub(zyth_1,' clags="'..lss..'"','')
              zyth_3 = string.gsub(zyth_2,' idm="'..lss..'"','')
            end
            table.insert(lsdm,zyth_3)--名称
          end

          zzth_1 = string.gsub(lsdm[#lsdm],'"<','<')
          zzth_2 = string.gsub(zzth_1,'>"','>')

          dialog= LuaDialog(this)
          .setTitle(bqm3)--设置标题
          --.setMessage(zzth_2)--设置消息
          .setView(loadlayout(input2layout))--设置输入框布局
          .setPositiveButton("复制全部",function(v)--设置积极按钮
            复制文本(zzth_2)
            弹出消息("复制成功！")
          end)
          .setNeutralButton("",function(v)--设置中立按钮
          end)
          .setNegativeButton("取消",nil)--设置消极按钮
          .show()
          edit1.text=zzth_2
          linkhint.setVisibility(View.GONE)--隐藏
       end)
      end--审查元素 事件结束

      gy1.onClick=function()--去除元素 事件开始
                  下滑动画(dc)
                  加载Js(qcys)
                  添加动作跟踪("去除"..bqm3.."标签",qcys,cxqcys,"屏蔽撤销成功！",2)
                  弹出消息("已跟踪记录！")
      end--去除元素 事件结束

      gy2.onClick=function()--模拟点击 事件开始
                  下滑动画(dc)
                  加载Js(mndj)
                  添加动作跟踪("点击"..bqm3.."标签",mndj,"","点击撤销成功！",3)
                  弹出消息("已跟踪记录！")
      end--模拟点击 事件结束

      gy3.onClick=function()--自动填写 事件开始
        if(bqm=="input")or(bqm=="textarea")then
         下滑动画(dc)
                    对话框()
                    .设置标题("自动填写")
                     .setView(loadlayout(input2layout))--设置输入框布局
                     .设置积极按钮("确定",function()
                            th=edit1.text
                            zdtxjs = string.gsub(zdtx,"zdtx自定义替换",th)
                            加载Js(zdtxjs)

                            添加动作跟踪("填写"..bqm3.."内容："..th,zdtxjs,cxzdtx,"填写撤销成功！",4)
                            弹出消息("已跟踪记录！")

                     end)

                     .设置消极按钮("取消",function()--设置消极按钮("退出")
                                      --return (canoffline or 退出程序())--退出功能
                                      end)
                     .显示()
                    linkhint.setText("运行js后自动填写如下内容");
                    edit1.setHint(" 请输入自动填写内容")--定义提示

        else
                 下滑动画(dc)
                  对话框()
                  .设置标题("提示")
                  .设置消息("该功能只对input和textarea标签有效")
                  .设置积极按钮("知道了",function()
                    --显示消息("点击了确定")
                  end)
                  .设置消极按钮("取消")
                  .显示()
        end
      end--自动填写 事件结束

      gy4.onClick=function()--修改输入框提示 事件开始
        if(bqm=="input")or(bqm=="textarea")then
              下滑动画(dc)
                    对话框()
                    .设置标题("修改提示")
                     .setView(loadlayout(input2layout))--设置输入框布局
                     .设置积极按钮("修改",function()
                            th=edit1.text
                            xgtsjs = string.gsub(xgts,"xgts自定义替换",th)
                            加载Js(xgtsjs)

                            bt=webView.title--撤销准备
                            ybts=bt:match('placeholder="(.-)"')--xxxxx[*]
                            cxxgtsjs = string.gsub(cxxgts,"xgts自定义替换",ybts)
                            添加动作跟踪("修改"..bqm3.."输入框提示："..th,xgtsjs,cxxgtsjs,"提示撤销成功！",5)
                            弹出消息("已跟踪记录！")
                     end)

                     .设置消极按钮("取消",function()--设置消极按钮("退出")
                                      --return (canoffline or 退出程序())--退出功能
                                      end)
                     .显示()
                    linkhint.setText("修改&添加输入框提示文字");
                    edit1.setHint(" 请输入提示内容")--定义提示
        else
           下滑动画(dc)
                  对话框()
                  .设置标题("提示")
                  .设置消息("该功能只对input和textarea标签有效")
                  .设置积极按钮("知道了",function()
                    --显示消息("点击了确定")
                  end)
                  .设置消极按钮("取消")
                  .显示()
        end
      end--修改输入框提示 事件结束

      gy5.onClick=function()--输入隐藏 事件开始
        if(bqm=="input")then--判断input开始
          下滑动画(dc)
          if(bt:find'type="password"') then
            状态="隐藏"
            积极按钮="显示"
          else
            状态="显示"
            积极按钮="隐藏"
          end
              对话框()
            .设置标题("显示/隐藏输入")
            .设置消息("该功能可以隐藏输入框内容\n当前输入框内容状态："..状态)
            .设置积极按钮(积极按钮,function()
              if(积极按钮=="隐藏")then
              加载Js(sryc)
              添加动作跟踪("隐藏输入框内容"..bqm3,sryc,sryc2,"显示输入撤销成功！",6)
              弹出消息("已跟踪记录！")
              else
              加载Js(sryc2)

              添加动作跟踪("显示输入框内容"..bqm3,sryc2,sryc,"隐藏输入撤销成功！",6)
              弹出消息("已跟踪记录！")
              end
            end)
            .设置消极按钮("取消")
            .显示()
        else--判断input否则
         下滑动画(dc)
                对话框()
                .设置标题("提示")
                .设置消息("该功能只对input标签有效")
                .设置积极按钮("知道了",function()
                  --显示消息("点击了确定")
                end)
                .设置消极按钮("取消")
                .显示()
        end
      end--输入隐藏 事件结束

      gy6.onClick=function()--修改图片 事件开始
        if(bqm=="img")then
         下滑动画(dc)
                    对话框()
                    .设置标题("修改图片")
                     .setView(loadlayout(input2layout))--设置输入框布局
                     .设置积极按钮("确定",function()
                            th=网址解码器(edit1.text)
                            xgtpjs = string.gsub(xgtp,"xgtp自定义替换",th)--定义xgtpjs
                            加载Js(xgtpjs)

                            bt=webView.title--撤销准备
                            sqsxz=bt:match('src="(.-)"')--索取属性值
                            cxxgtsjs = string.gsub(xgtp,"xgtp自定义替换",sqsxz)
                            添加动作跟踪("修改"..bqm3.."直链："..edit1.text,xgtpjs,cxxgtsjs,"图片撤销成功！",7)
                            弹出消息("已跟踪记录！")
                     end)

                     .设置消极按钮("取消",function()--设置消极按钮("退出")
                                      --return (canoffline or 退出程序())--退出功能
                                      end)
                     .显示()
                    linkhint.setText("注意此处必须输入图片直链 以.jpg或.png为后缀的直链");
                    edit1.setHint(" 请输入图片直链")--定义提示

        else
                 下滑动画(dc)
                  对话框()
                  .设置标题("提示")
                  .设置消息("该功能只对img标签有效")
                  .设置积极按钮("知道了",function()
                    --显示消息("点击了确定")
                  end)
                  .设置消极按钮("取消")
                  .显示()
        end
      end--修改图片 事件结束

      gy7.onClick=function()--跳转链接 事件开始
        --该js用于获取当前跳转链接
        加载Js('var dqbq='..sqys..[[;if(dqbq.tagName.toLowerCase()=="a"){document.title=document.title+';tzlj="'+dqbq.getAttribute("href")+'"'}else{if(dqbq.parentElement.tagName.toLowerCase()=="a"){document.title=document.title+';tzlj="'+dqbq.parentElement.getAttribute("href")+'"'}else{if(dqbq.parentElement.parentElement.tagName.toLowerCase()=="a"){document.title=document.title+';tzlj="'+dqbq.parentElement.parentElement.getAttribute("href")+'"'}else{};};}]])

        function img()--定义函数 img--开始
            tzljjs = string.gsub(tzlj,"tzlj自定义替换",网址解码器(edit1.text))--定义xgtpjs
            加载Js(tzljjs)
             sqsxz=webView.title:match('tzlj="(.-)"')--索取属性值
             cxtzljjs = string.gsub(tzlj,"tzlj自定义替换",sqsxz)
            添加动作跟踪("设置"..bqm3.."跳转："..网址解码器(edit1.text),tzljjs,cxtzljjs,"跳转撤销成功！",8)
            过渡加载框("稍等","设置跳转链接中...",400,"已跟踪记录！")
        end--定义函数 img--结束

        function qt()--定义函数 qt--开始
            tzljjs = string.gsub(tzlj,"tzlj自定义替换",网址解码器(edit1.text))--定义xgtpjs
            加载Js(tzljjs)
             sqsxz=webView.title:match('tzlj="(.-)"')--索取属性值
             cxtzljjs = string.gsub(tzlj,"tzlj自定义替换",sqsxz)
            添加动作跟踪("设置"..bqm3.."跳转："..网址解码器(edit1.text),tzljjs,cxtzljjs,"跳转撤销成功！",8)
            过渡加载框("稍等","设置跳转链接中...",400,"已跟踪记录！")
        end--定义函数 qt--结束

            下滑动画(dc)
            对话框()
            .设置标题("设置点击跳转链接")
             .setView(loadlayout(input2layout))--设置输入框布局
             .设置积极按钮("确定",function()
              if(bqm=="img")then
                img()
              else
                qt()
              end
             end)
             .设置消极按钮("取消",function()--设置消极按钮("退出")
                         end)
             .显示()
                task(100,function()
                  if(webView.title:find"tzlj=") then
                    dqtzdz=webView.title:match('tzlj="(.-)"')
                    linkhint.setText("当前跳转链接："..dqtzdz);
                    edit1.setHint(" 请输入跳转链接")--定义提示
                  else
                    dqtzdz="无"
                    linkhint.setText("当前跳转链接："..dqtzdz);
                    edit1.setHint(" 请输入跳转链接")--定义提示
                  end
                end)
                linkhint.setText("当前跳转链接：查询中...");
                edit1.setHint(" 请输入跳转链接")--定义提示
      end--元素链接 事件结束

      gy8.onClick=function()--复制元素 事件开始
        下滑动画(dc)

         对话框()
        .设置标题("提示")
        .设置消息("使用该功能后网页会发生布局变化，系统会自动删除动作跟踪里除整合和复制外的其他动作，如果使用复制功能，请务必将该动作运行在最前面,其他动作在使用该功能后在添加，以免导致脚本失效！")
         --.setView(loadlayout(input2layout))--设置输入框布局
         .设置积极按钮("确定",function()
           加载Js(fzys)
           初始化标签()
             import("android.app.ProgressDialog");
             pd = ProgressDialog.show(this,"稍候","开启动态编辑中...");
             id =import "android.os.Build"
             dd=id.SERIAL
             set=import "android.provider.Settings"
             id = set.System.getString(this.getContentResolver(), "android_id")
             codeid =dd..id

              qcsj_1={}--清除数据 i
              if(#dzlb~=nil)then
                for i=1,#dzlb do
                  if(dzlb[i]==15)then
                    table.insert(qcsj_1,i)--名称
                  end

                  if(dzlb[i]==10)then
                    table.insert(qcsj_1,i)--名称
                  end
                end
              end
              if(#qcsj_1==nil)then
                for i=1,#qcsj_1 do
                  删除动作跟踪(i)
                end
              end
               function jzxh()--加载循环开始
                        task(200,function()
                          if(webView.title:find"url=")then
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
           添加动作跟踪("复制"..bqm3.."标签",fzys,cxfzys,"复制撤销成功！",15)
         end)

         .设置消极按钮("取消",function()--设置消极按钮("退出")
          end)
         .显示()
         -- linkhint.setVisibility(View.GONE)
         -- edit1.setVisibility(View.GONE)
      end--复制元素 事件结束

      -- gy9.onClick=function()--编辑样式 事件开始
      --   下滑动画(dc)
      --   催更()
      -- end--编辑样式 事件结束


      gy9.onClick=function()--点击事件 事件开始
        function djsj_sj()
         dqyssj={}--记录当前元素数据 [1]=onclick [2]=onclick所在位置 [3]=id [4]=id所在位置  [5]=class [6]=class所在位置
         弹出消息("该功能还在开发中...功能还不完整")
          下滑动画(dc)
          if(webView.title:match('onclick="(.-)"')==nil)then
            点击事件="无事件或事件存在脚本标签中"
           else
            点击事件=webView.title:match('onclick="(.-)"')
          end
          if(idwb=="")and(classwb=="")then
            dqys="当前无ID/class"
           else
            if(idwb~="")and(classwb~="")then
               dqys=idwb.."(id)/"..classwb.."(class)"
            else
              if(idwb~="")then
                dqys=idwb.."(id)"
              else
                dqys=classwb.."(class)"
              end

            end
          end

          task(220,function ()
             自定义布局事件对话框("事件管理","消息","添加","取消","定位")
              webView.evaluateJavascript([[
                document.title.match(/onclick=.(\S*)\(/)[1]
               ]],function(a)
                  caching_res=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_res.data"
                  caching_script=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_script.data"--script标签
                  caching_style=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_style.data"--style标签
                  xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"--赋值xml路径

                  dqres=io.open(caching_res):read("*a")
                  qgfz=切割字符串(dqres,"&&&")
                  qgfz_js=切割字符串(qgfz[1],"*-JsHD_js-*")
                  if(a~="null")then
                    fx=string.sub(a,2,-2)
                    fxurl=""
                    dqyssj[1]=fx
                    if(替换特殊字符串(io.open(caching_script):read("*a")):find(替换特殊字符串(fx))) then
                       fxurl=io.open(xml):read("*a").."</script>"
                       dqyssj[2]=io.open(xml):read("*a").."</script>"
                    end

                    for i=1,#qgfz_js do
                        遍历Js=qgfz_js[i]
                          Http.get(遍历Js,nil,"utf8",nil,function(code,html,b,c)
                            if(html:find(fx)) then
                              if(fxurl=="")then
                                fxurl=fxurl..qgfz_js[i]
                                linkhint.text='当前元素：'..dqys..'\n当前事件：'..点击事件.."\n函数位置："..fxurl
                                dqyssj[2]=qgfz_js[i]
                               else
                                fxurl=fxurl..qgfz_js[i].."\n"
                                linkhint.text='当前元素：'..dqys..'\n当前事件：'..点击事件.."\n函数位置："..fxurl
                                dqyssj[2]=dqyssj[2].."*/*/qhf/*/*"..qgfz_js[i]
                              end
                            else
                            end
                          end)
                    end


                  else
                    linkhint.text='当前元素：'..dqys..'\n当前事件：'..点击事件.."\n函数位置：无"
                    dqyssj[1]=""
                    dqyssj[2]=""

                  end
              end)
              GONE()
              szedit_0('当前元素：'..dqys..'\n当前事件：'..点击事件.."\n函数位置：正在查询...",0xFF757575)
              if(点击事件~="无事件或事件存在脚本标签中")then
                webView.evaluateJavascript([[
                  function strToVar(str) {
                          var json = (new Function("return " + str))();
                          return json;
                      }

                  var sjhsmc = strToVar(document.title.match(/onclick=.(\S*)\(/)[1])
                  sjhsmc.toString()
                ]],function(a)

                   szedit_1('当前事件函数(原函数)',"暂无当前事件",0xFF33A7AA)
                    th_zy_1=string.gsub(string.sub(a,2,-2),"\\n","\n")
                    editbj_1.text=string.gsub(th_zy_1,"\\","")
                    dyhs=string.gsub(th_zy_1,"\\","")
                 end)



               else
               szedit_1('当前事件函数(原函数)',"暂无当前事件函数",0xFF33A7AA)
              end
            dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--积极

              if(editbj_1.text~="")and(editbj_1.text~=dyhs)then
                dyhs=editbj_1.text
              else
                dyhs=""
              end

                  dialog.dismiss();
                  task(220,function ()
                    自定义布局事件对话框("添加事件","消息","确定","取消","")
                    GONE()
                    --szedit_1('填写事件(*js)',"例如 alert('点击事件')",0xFF33A7AA)
                    szedit_2('填写事件(*js)',"例如 alert('点击事件')",0xFF33A7AA)
                    Switch_1("事件类型",0xFF33A7AA,"Js事件","开启后点击元素事件触发为js事件",true)
                    Switch_2("lua事件","开启后点击元素事件触发为lua事件",false)
                    if(dyhs~="")then
                       editbj_2.text=dyhs
                      else
                       editbj_2.text=[[alert("网页弹出框");]]..'\nwindow.location.href="https://bk.yyge.net/";'
                    end

                    Switch_01_sw.onClick=function()
                        if(Switch_02_sw.checked==true)then
                         Switch_02_sw.checked=false
                          linkhint_2.text="填写事件(*js)"
                          editbj_2.text=[[alert("网页弹出框");]]..'\nwindow.location.href="https://bk.yyge.net/";'
                          editbj_1.hint=[[例如 alert("弹出消息")]]
                        end

                        if(Switch_01_sw.checked==true)then
                         Switch_01_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         Switch_02_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFF1F1F1,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         linkhint_1.setVisibility(View.GONE)
                         editbj_1.setVisibility(View.GONE)
                         else
                         Switch_01_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFF1F1F1,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         Switch_02_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         Switch_02_sw.checked=true
                         szedit_1('填写WebView控件ID(选填)',"例如 webView",0xFF33A7AA)
                         linkhint_2.text="填写事件(*lua)"
                         editbj_2.text='  AlertDialog.Builder(this)\n  .setTitle("标题")\n  .setMessage("消息")\n  .setPositiveButton("积极",{onClick=function(v)\n   print("点击了积极按钮")\n  end})\n  .setNeutralButton("中立",nil)\n  .setNegativeButton("否认",nil)\n  .show()'
                         editbj_1.text="webView"
                        end
                    end

                    Switch_02_sw.onClick=function()
                        if(Switch_01_sw.checked==true)then
                           Switch_01_sw.checked=false
                          linkhint_2.text="填写事件(*js)"
                          editbj_2.text='  AlertDialog.Builder(this)\n  .setTitle("标题")\n  .setMessage("消息")\n  .setPositiveButton("积极",{onClick=function(v)\n   print"点击了积极按钮"\n  end})\n  .setNeutralButton("中立",nil)\n  .setNegativeButton("否认",nil)\n  .show()'
                          editbj_1.hint=[[例如 print("弹出消息")]]
                        else

                        end
                        if(Switch_02_sw.checked==true)then
                         Switch_02_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         Switch_01_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFF1F1F1,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         szedit_1('填写WebView控件ID(选填)',"例如 webView",0xFF33A7AA)
                         linkhint_2.text="填写事件(*lua)"
                         editbj_1.text="webView"
                         else
                         Switch_02_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFF1F1F1,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜色
                         Switch_01_sw.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));--Switch控件点的颜
                         Switch_01_sw.checked=true
                         linkhint_1.setVisibility(View.GONE)
                         editbj_1.setVisibility(View.GONE)
                         linkhint_2.text="填写事件(*js)"
                         editbj_2.text=[[alert("网页弹出框");]]..'\nwindow.location.href="https://bk.yyge.net/";'
                        end
                    end

                    dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--预加载
                      dialog.dismiss();
                      function sjsj_jstj()
                        szdjsj_1=string.gsub(djsj,"自定义事件",editbj_2.text)
                        szdjsj_2=string.gsub(szdjsj_1,"随机编号",math.random(00000,99999))
                        -- print(szdjsj_2)
                        -- 复制文本(szdjsj_2)
                        加载Js(szdjsj_2)
                        task(220,function()
                         加载对话框("稍等","脚本生成中....",500,"已跟踪记录！")
                        end)
                        添加动作跟踪("设置"..bqm3.."Js事件",szdjsj_2,cxdjsj,"事件撤销成功！",18)
                        --弹出消息("已跟踪记录！")
                      end

                      function sjsj_luatj(随机数)
                        szdjsj_1=string.gsub(djsj,"自定义事件",'function setCookie(name,value){var Days = 30;var exp = new Date();exp.setTime(exp.getTime() + Days*24*60*60*1000);document.cookie = name + "="+ value + ";expires=" + exp.toGMTString();};setCookie("JsHD_onclick_key", "随机编号");window.location.href="https://bk.yyge.net/index.html?jshd=随机编号";')
                        szdjsj_2=string.gsub(szdjsj_1,"随机编号",随机数)
                        luawebsj='import "android.webkit.CookieSyncManager"\nimport "android.webkit.CookieManager"\n'..[[if(CookieManager.getInstance().getCookie(浏览器控件ID.url)~=nil)and(CookieManager.getInstance().getCookie(浏览器控件ID.url):find("JsHD_onclick_key=随机编号"))then]]..'\n  浏览器控件ID.stopLoading()'..editbj_2.text..'\nend'
                        szdjlua_1=string.gsub(luawebsj,"浏览器控件ID",editbj_1.text)
                        szdjlua_2=string.gsub(szdjlua_1,"随机编号",随机数)

                          input2layout={
                            LinearLayout,
                            orientation="vertical",
                            Focusable=true,
                            FocusableInTouchMode=true,
                            {
                              EditText,
                              id="edit1",
                              hint="Input here",
                              layout_marginTop="5dp",
                              layout_width="80%w",
                              layout_gravity="center",
                            },
                          }

                        task(220,function()
                         --加载对话框("稍等","脚本生成中....",500,"已跟踪记录！")
                         弹出消息("已跟踪记录！")
                         添加动作跟踪("设置"..bqm3.."Lua事件",szdjsj_2,cxdjsj,"事件撤销成功！",18)
                            -- 对话框()
                            -- .设置标题("*lua代码")
                            -- .setMessage("请复制如下代码到浏览器布局的即将加载事件中，别忘了还要导出动作动作跟踪代码才有效哦~")--设置消息
                            -- .setView(loadlayout(input2layout))
                            -- .设置积极按钮("复制全部",function()
                            --   复制文本(szdjlua_2)
                            --   弹出消息("复制成功")
                            -- end)
                            -- .设置消极按钮("取消")
                            -- .显示()
                             dialog=AlertDialog.Builder(this)
                             .setTitle("*lua代码")
                             .setMessage("请将如下代码粘贴到浏览器布局的即将加载事件中(即将加载)，别忘了还要导出动作动作跟踪代码才有效哦~")--设置消息
                             .setView(loadlayout(input2layout))
                             .setPositiveButton("复制全部",nil)
                             .setNegativeButton("完成",nil)
                             .show()
                            edit1.text=szdjlua_2

                            dialog.getButton(dialog.BUTTON_POSITIVE).onClick=function()--积极
                              复制文本(szdjlua_2)
                              弹出消息("复制成功")
                            end

                            dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--消极
                             弹出消息("别忘了还要导出动作动作跟踪代码才有效哦~")
                            dialog.dismiss();
                            end

                        end)
                      end


                      if(sjgl[3]~=nil)then
                        if(tostring(sjgl[2])>tostring(sjgl[4]))then
                          task(220,function()
                            hyxx_1="设备ID："..android_id.."\n到期时间：".."已到期"..'\n您的会员特权已到期哦~ 赶快购买会员支持一波作者吧 ヾ(❀╹◡╹)ﾉ~'..'\n\n￥0/月(五星好评限1次)\n￥6.6/月\n￥28.6/半年\n￥52.6/年(限时购)\n￥66.6/年(+3月)\n￥108.8/永久\n\n强大会员特权：\n1.设置点击事件Js&lua\n2.悬浮调试功能(开发中)\n3.嗅探网页资源(开发中)\n4.爬虫网页元素数据(开发中)\n5.会员模型&背景&点击特效'
                            会员对话框("会员特权",hyxx_1,"续费","取消")
                          end)
                         else
                          if(Switch_01_sw.checked==true)then
                            sjsj_jstj()
                          end
                          if(Switch_02_sw.checked==true)then
                            sjsj_luatj(math.random(00000,99999))
                          end
                        end
                        else
                          task(220,function()
                            hyxx_1="设备ID："..android_id..'\n您还不是会员用户哦~ 赶快购买会员支持一波作者吧 ヾ(❀╹◡╹)ﾉ~'..'\n\n￥0/月(五星好评限1次)\n￥6.6/月\n￥28.6/半年\n￥52.6/年(限时购)\n￥66.6/年(+3月)\n￥108.8/永久\n\n强大会员特权：\n1.设置点击事件Js&lua\n2.悬浮调试功能(开发中)\n3.嗅探网页资源(开发中)\n4.爬虫网页元素数据(开发中)'
                            会员对话框("会员特权",hyxx_1,"开通","取消")
                          end)

                      end


                    end

                    dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--预加载
                      dialog.dismiss();
                    end

                    -- dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--催更
                    --  联系QQ(203455278)
                    -- end
                  end)
               end

            dialog.getButton(dialog.BUTTON_NEGATIVE).onClick=function()--消极
                dialog.dismiss();
            end

            dialog.getButton(dialog.BUTTON_NEUTRAL).onClick=function()--中立
              if(dqyssj[2]~="")then
                lssjsz={}--临时事件数组
                for i=1,#切割字符串(dqyssj[2],"*/*/qhf/*/*") do
                  table.insert(lssjsz,"")
                end
                高级列表弹窗("定位事件",切割字符串(dqyssj[2],"*/*/qhf/*/*"),lssjsz,"复制","1|!|*qg*|!|"..dqyssj[1])
               else
                弹出消息("暂无函数事件")
              end
               --print(dqyssj[1]..'\n'..dqyssj[2])
               --dialog.dismiss();
            end
          end)
        end


        datafile=File(activity.getLuaDir()).getParentFile().getParentFile()
        hsml=tostring(datafile).."/fx.lua"
        import "java.io.*"--导入类
        file,err=io.open(hsml)
        if err==nil then  --存在文件
           djsj_sj()
          else
           task(220,function ()
           版本功能限制("点击事件")
           end)
           下滑动画(dc)
        end--创建结束

      end--复制元素 事件结束

    ------------------------------------------点击事件

    --调用渐变函数
    --渐变颜色
    import "android.graphics.drawable.GradientDrawable"
    function 渐变(left_jb,right_jb,id)
      drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
        right_jb,--右色
        left_jb,--左色
      });
      id.setBackgroundDrawable(drawable)
    end
    --调用渐变函数
    渐变(0xFFFF6845,0xFFFF2317,card)

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