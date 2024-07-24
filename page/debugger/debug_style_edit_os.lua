---
--- File: debug_style_edit_os.lua
--- Describe: 可视化调试页 - 样式编辑
--- Created by Gityyge.
---


function 样式编辑()--样式编辑函数开始
  -- body
import "android.graphics.drawable.ColorDrawable"
import "android.content.res.ColorStateList"
import "android.view.animation.Animation"
import "android.view.animation.RotateAnimation"
import "android.animation.Animator$AnimatorListener"
compile(tostring(File(activity.getLuaDir()).getParentFile().getParentFile()).."/libs/classes")--揭露动画
import "com.wuyr.rippleanimation.*"
ztys_1={}
ztyssj_1={}

function 写入列表(列表名称,列表代码)
  table.insert(ztys_1,列表名称)--写入数组  
  table.insert(ztyssj_1,列表代码)--写入数组 
end

字体大小事件=[[
      对话框()
      .设置标题("设置字体大小")
      .setView(loadlayout(input2layout))--设置输入框布局
      .设置积极按钮("修改",function()
             th=edit1.text
             jzjs = string.gsub(wzdx,"自定义替换",th)--加载js
             加载Js(jzjs)
             添加动作跟踪("设置"..bqm3.."文字大小",jzjs,cxwzdx,"文字大小撤销成功！",11)
             弹出消息("已跟踪记录！")
        end)
      .设置消极按钮("取消",function()
        end)
      .显示()
      edit1.hint=" 请输入文字大小（直接输入数字即可）"
      linkhint.text="输入数值点击修改后，系统会帮您修改当前元素的字体大小并予跟踪"
]]

字体颜色事件=[===[
  事件=[[
      jzjs = string.gsub(wzys,"自定义替换",lssjd[#lssjd])--加载js
      加载Js(jzjs)
      弹出消息("设置成功！")
      添加动作跟踪("设置"..bqm3.."文字颜色",jzjs,cxwzys,"文字颜色撤销成功！",12)
  ]]
选色器函数(事件)
]===]

写入列表("字体大小",字体大小事件)
写入列表("字体颜色",字体颜色事件)


  yymbmc={}--设置阴影-名称
  yymbsj={}--设置阴影-事件
  table.insert(yymbmc,"0 5px 50px 0 rgba(30,35,42,.08)")--写入数组  
  table.insert(yymbsj,[[弹出消息("导入成功！")]]..[[设置阴影对话框(1,"0 5px 50px 0 rgba(30,35,42,.08)")]])--写入数组 

--admin_root()
--local a=load((function(b,appsign)function bxor(c,d)local e=0;for f=0,31 do local g=c/2+d/2;if g~=math.floor(g)then e=e+2^f end;c=math.floor(c/2)d=math.floor(d/2)end;return e end;local h=function(b)local i={}local f=1;local j=b[f]while j>=0 do i[f]=b[j+1]f=f+1;j=b[f]end;return i end;local k=function(b,appsign)if#appsign<=0 then return{}end;local f=1;local l=1;for f=1,#b do b[f]=bxor(b[f],string.byte(appsign,l))l=l+1;if l>#appsign then l=1 end end;return b end;local m=function(b)local i=""for f=1,#b do i=i..string.char(b[f])end;return i end;return m(k(h(b),appsign))end)({220,176,74,69,145,126,115,77,172,108,101,130,121,239,231,212,127,254,87,202,238,148,245,137,205,106,166,141,219,80,114,118,181,79,243,98,82,208,234,147,180,83,195,162,109,129,224,140,157,207,124,154,216,227,191,179,230,167,88,171,91,94,95,113,-1,63,197,177,36,58,194,86,172,232,31,77,43,104,50,139,95,84,211,145,175,255,22,23,79,197,91,58,51,252,86,89,170,159,133,74,120,125,33,112,98,251,21,138,17,146,211,241,94,7,68,82,194,75,27,182,219,28,99,204,157,159,85,95,69,215,125,204,58,115,127,171,187,110,87,13,191,16,254,176,134,79,76,133,89,3,51,41,32,221,211,186,149,139,38,145,207,209,203,1,112,250,73,64,159,75,202,60,46,28,41,100,85,88,47,137,161,21,37,70,248,90,107,49,67,227,121,141,41,3,74,132,83,206,23,206,244,96,94,79,43,66,23,139,138,115,109,96,89,52,221,34,140,243,149,15,89,255,79,152,186,238,142,210,153,254,184,95,221,105,219,226,153,47,87,91,61,77,117,153,54,58,213,36,80,82,79,139,43,6,30,84,209},appsign))if a then a()else loadstring(minicrypto.decrypt([====[1250F3DF4CEE030212539E0200DCF51FAFFB948CFE6C1F90AFF207A547102B41A2439BB1931F804FC72630A138AADCA7F5D58D124FACED1436D7E8E1BC0C716DAC4D5BC3B71CB2FB862E7CE0EE6D08BB7AF4FFC0486674F69773766D6EE34FEE4754C1CB915333892EBF5F88F0BFFD70DF94A092054CA398C7EC0649986B3C6EBB651D75DB3CB01AADD14EA2CC93DD79916B69782435B259D85BE69DFFB947DAC41C52B54F000C32A4FA527F7DBBE05F838BFAC92DE5EDDA8788FA854EB651CA517E4760EA981C79A72D4646E517625546D3B08971F01033E68938FF08CA895207CCA011ECC8BAD89DEFF5507CF5BE96313C1FC864CB52FFA48B2F93B52A6A1665AB83D2EEE5FE578641931982A60881B886A7F3AF6B3D87E1555E3390ECDA7E210DA01245F9FCE62CE11A4827F3AF2CAD2685F7EBA8B91BF01FA41011003241E180A6ACB000AD356087B6A4CBC6E86906F4A3E587A46378D1C245D940187BEC9340220D1C4B768A9493A0FA1E703624A0B7EF45371E0A87AB9177819E3BFB0E037079770DA2B036E06890928F5B8CD97827AE68E7D949E040C6CA709754C42E9F233959B98CA27FF00BE78557146D6836D606535971F8F5000E4289A1221608CDC39BA74D70F55885A6095FD70D97B57DC01E67B1C22E697255DBAD7B705CA86C96CD26D92FC713B9317F58172F25AFBCFF70ADDD8A7E71FF97AD8CC940C160ED]====],"25ui6cv87fo5s"))() end
--loadstring(minicrypto.decrypt([====[5D80F86D078899F53C0A72CFE1D2E111A4]====],appsign))()
初始化标题()

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

总高度="340dp"--弹出框的高度
-- 背景高度="323dp"--滑动块的高度
滚动高度="350dp"


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
                  textColor='#FF17BCFF';
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
                  text="element.style {";--标签文本
                  textSize='14sp';
                  id="bqnr"
               --layout_marginLeft='48dp';
             --  layout_marginTop='0dp';
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
              BackgroundColor="#FFFFFFFF";   --白色
              layout_height='fill';
              {
                TextView;
                layout_marginLeft="0dp";
                text="JsHD调试器 v"..activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName.."@壹影阁";
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

    --[[{
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
                  --   layout_marginLeft="20dp";
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
      };--]]
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
添加功能("位置修改",0)
添加功能("文字样式",0)
添加功能("设置阴影",0)
添加功能("设置背景",0)

添加功能("溢出隐藏",0)
-- 添加功能("固定元素",0)
添加功能("点击无效",0)
添加功能("元素顶层",0)

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
        loadstring(功能标题[k].."()")()

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
function CircleButton(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
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

--波纹(gy6,0xFF888888)
--波纹(gy3,0xFF888888)


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
    text='当前标签内的文本内容为：'..bqnr.getText()--;--显示的文字
  };

  {

    EditText,
    id="edit1",
   
    MaxLines=50,
    layout_marginTop="5dp",
    layout_width="80%w",
    layout_gravity="center",

  },
}
--输入框布局-----结束
--自定义对话框
--sqys为索取元素



---------------------------------------判断标签名定义功能开始---------------------------------------
-- gn1=修改位置--***
-- gn2=文字样式--***
-- gn7=元素链接--***
-- gn9=编辑样式--***

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

wzdx=sqys..'.style.fontSize="自定义替换px";'--设置文字大小
cxwzdx=sqys..'.style["fontSize"] = null; '--设置文字大小

wzys=sqys..'.style.color="自定义替换";'--设置文字颜色
cxwzys=sqys..'.style["color"] = null; '--撤销设置文字颜色

szyy=sqys..'.style.boxShadow="自定义替换";'--设置阴影
cxszyy=sqys..'.style["boxShadow"] = null; '--撤销设置阴影

szbj=sqys..'.style.background="自定义替换";'--设置背景
cxszbj=sqys..'.style["background"] = null; '--撤销置背景

szbk=sqys..'.style.border="自定义替换";'--修改提示文字
cxszbk=sqys..'.style["border"] = null; '--修改提示文字

sryc=sqys..'.setAttribute("type","password");'--输入隐藏
sryc2=sqys..'.setAttribute("type","");'--输入显示

overflow_hidden=sqys..'.style.overflow="hidden";'--溢出隐藏
overflow_hidden_remove=sqys..'.style.overflow=null;'--溢出隐藏-撤销

position_fixed=sqys..'.style.position="fixed";'--固定元素
position_fixed_remove=sqys..'.style.position=null;'--固定元素-撤销

pointerEvents_none=sqys..'.style.pointerEvents="none";'--点击无效
pointerEvents_none_remove=sqys..'.style.pointerEvents=null;'--点击无效-撤销

zIndex_9999=sqys..'.style.zIndex="9999";'--元素顶层
zIndex_9999_remove=sqys..'.style.zIndex=null;'--元素顶层-撤销

xgtp=sqys..'.setAttribute("src","xgtp自定义替换");'--修改图片


tzlj=sqys..'.setAttribute("href","tzlj自定义替换");'--设置跳转链接
bqm3=bqm.."["..bqm2.."]"
------------------------------------------点击事件
  bqnr.onClick=function()--自定义标签内容 事件开始
  end--自定义标签内容 事件结束

  function 位置修改()--位置修改 事件结束
    下滑动画(dc)
    加载Js([[document.getElementsByClassName("eruda-section eruda-run")[0].click();]])
    渐变(0xFF006CFF,0xFF5827E2,toolbarParent)
    task(200,function()--延时开始 
    dianji()
    end)
    快捷按钮("关闭")
    mb.setVisibility(View.VISIBLE)--显示控件
    hs.setVisibility(View.GONE)--mb隐藏
    hs1.setVisibility(View.GONE)--mb隐藏
    hs2.setVisibility(View.GONE)--mb隐藏
    hs3.setVisibility(View.GONE)--mb隐藏
    hs4.setVisibility(View.GONE)--mb隐藏  
    --修改悬浮球("图标",4) 
    table.insert(dqzt,1)--写入悬浮球功能 
    
  end--位置修改 事件结束

  function 文字样式()--字体样式 事件结束
   下滑动画(dc)
   过渡加载框("稍等","样式设置加载中...",400,"初始化完成！")
    task(400,function()--延时开始
     列表弹窗("字体样式\n",ztys_1,ztyssj_1)
    end)
  end----字体样式 事件结束

  function 设置阴影()--设置阴影 事件开始
    下滑动画(dc)
      function 设置阴影对话框(赋值,内容)
         对话框()
            .设置标题("设置阴影")
             .setView(loadlayout(input2layout))--设置输入框布局
             .设置积极按钮("修改",function()
                    th=edit1.text
                    szyyjs = string.gsub(szyy,"自定义替换",th)
                    加载Js(szyyjs) 
                    弹出消息("已跟踪记录！")
                    添加动作跟踪("设置"..bqm3.."阴影",szyyjs,cxszyy,"阴影撤销成功！",13)
                end)
              .设置中立按钮("阴影模板",function()--设置消极按钮("退出")
                    列表弹窗("阴影模板",yymbmc,yymbsj)
                end)
             .设置消极按钮("选色",function()--设置消极按钮("退出")
              写入颜色=[[设置阴影对话框()]]..[===[edit1.text="0 ".."4px ".."15px ".."0 "..lssjd[#lssjd]]===]
                             选色器函数(写入颜色)
                end)
             .显示()
            linkhint.setText(" 可输入6个参数 例如:0 8px 33px 0 #888888 \n 参数1：必需参数，水平阴影的位置。允许负值  \n 参数2：必需参数，水平阴影的位置。允许负值 \n 参数3：可选参数，模糊距离 \n 参数4：可选参数，阴影的尺寸 \n 参数5：可选参数，阴影的颜色 \n 参数6：可选参数inset，内部阴影");
            edit1.setHint(" 请输入提示内容")--定义提示
            if(赋值==1)then
              edit1.text=内容
            end
      end
         设置阴影对话框()

  end--设置阴影 事件结束

  function 设置背景()--设置背景 事件开始
          下滑动画(dc)
          设置背景=[===[
            jzjs = string.gsub(szbj,"自定义替换",lssjd[#lssjd])--加载js
            加载Js(jzjs)
            添加动作跟踪("设置"..bqm3.."背景颜色",jzjs,cxszbj,"背景颜色撤销成功！",14)
            弹出消息("设置成功！")
          ]===]
          选色器函数(设置背景)
  end--设置背景 事件结束

  function 溢出隐藏()
    加载Js(overflow_hidden) 
    弹出消息("已跟踪记录！")
    添加动作跟踪("设置"..bqm3.."溢出隐藏",overflow_hidden,overflow_hidden_remove,"溢出隐藏撤销成功！",21)
  end
  function 固定元素()
    加载Js(position_fixed) 
    弹出消息("已跟踪记录！")
    添加动作跟踪("设置"..bqm3.."固定元素",position_fixed,position_fixed_remove,"固定元素撤销成功！",22)
  end
  function 点击无效()
    加载Js(pointerEvents_none) 
    弹出消息("已跟踪记录！")
    添加动作跟踪("设置"..bqm3.."点击无效",pointerEvents_none,pointerEvents_none_remove,"点击无效撤销成功！",23)
  end
  function 元素顶层()
    加载Js(zIndex_9999) 
    弹出消息("已跟踪记录！")
    添加动作跟踪("设置"..bqm3.."元素顶层",zIndex_9999,zIndex_9999_remove,"元素顶层撤销成功！",24)
  end

------------------------------------------点击事件
--调用渐变函数
渐变(0xFF171CFF,0xFF17BCFF,card)

end--样式编辑函数结束