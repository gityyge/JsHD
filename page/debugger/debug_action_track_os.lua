---
--- File: debug_action_track_os.lua
--- Describe: 可视化调试页 - 动作跟踪
--- Created by Gityyge.
---

dmsj={}--代码数据
cxsj={}--撤销数据
cxmc={}--撤销提示
mcsj={}--名称数据
zxdz={}--执行地址
dzlb={}--动作类别
--1=自定义标签内容
--2=屏蔽元素
--3=模拟点击
--4=自动填写
--5=修改输入提示
--6=输入隐藏
--7=修改图片
--8=修改跳转链接
--9=位置样式信息
--10=整合跟踪
--11=文字大小
--12=文字颜色
--13=标签阴影
--14=背景颜色
--15=复制元素
--16=全局高度body
--17=引导功能
--18=点击事件
mcsjgl={}
dzbj={"动作置顶","添加延时","修改备注","修改代码"}--动作编辑

--检查文件文件夹-------------------检查文件文件夹---------------------检查文件文件夹
datawjj=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName()--赋值文件夹路径
--判断文件夹是否存在
import "java.io.*"
if File(datawjj).isDirectory()then
--  print("存在")
else
--  print("不存在")
  --创建文件夹
import "java.io.File"--导入File类
File(datawjj).mkdir()
end


jsxml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/js.xml"--赋值xml路径
jsyjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/jsyjz.js"--赋值预加载文件

--判断文件是否存在
import "java.io.*"--导入类
file,err=io.open(jsxml)
if err==nil then
  --存在文件
  else
 --创建文件（index.xml）
io.open(jsxml, 'w')
end--创建结束

--判断预加载文件是否存在
import "java.io.*"--导入类
file,err=io.open(jsyjz)
if err==nil then
  --存在文件
  else
 --创建文件（index.xml）
io.open(jsyjz, 'w')
end--创建结束
--检查文件文件夹-----------------检查文件文件夹-------------------检查文件文件夹


    --公共布局------
    local inputlayout={
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
       -- linkhint.setText('该网站无法访问')-------自定义文本

      };

      {
        EditText,
        id="edit1",
        layout_marginTop="5dp",
        layout_width="80%w",
        layout_gravity="center",
        --hint="自定义提示文本！"
      },
    }
    --公共布局--------





--[[---------------------]]----自定义函数--开始
--[[---------------------]]----

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


function 动作备注()--动作备注开始
       对话框()
       .setTitle("动作备注")
       .setView(loadlayout(inputlayout))
       .设置积极按钮("修改",function()
 
        for i=1, #(mcsj) do
            if (mcsj[i]==qths11[1]) then
                if(edit1.text=="")then
                       对话框()
                      .设置标题("错误！")
                      .设置消息("您没有输入字符串")
                      .设置积极按钮("重新输入",function()
                        动作备注()
                      end)
                      .设置消极按钮("取消",function()
                        动作跟踪()

                      end)
                      .显示()--]]
                else
                    if(edit1.text:find"（") then
                        对话框()
                        .设置标题("错误！")
                        .设置消息("不能设置含有中文括号的字符")
                        .设置积极按钮("重新输入",function()
                          动作备注()
                                    end)
                      .设置消极按钮("取消",function()
                        动作跟踪()

                      end)
                        .显示()
                    else
                             if(qths11[1]:find"（") then
                              mcsj[i]=edit1.text.."   （"..string.match(qths11[1],"（(.-)）").."）"
                              弹出消息("备注成功！")
                              动作跟踪()

                             else
                               mcsj[i]=edit1.text
                               弹出消息("备注成功！")
                               动作跟踪()

                             end
                    end
               


                end
           end
        end
       --动作跟踪()--重新打开动作跟踪
       --弹出消息("备注成功！")
        end)
       .设置消极按钮("取消")
       .显示()
  edit1.setHint(" 请输入动作备注")--定义提示
  linkhint.setText('设置该动作的备注，以方便查阅')--定义文本
end--动作备注结束


function 动作编辑()---自定义函数开始
 --判断状态
        --qths11[1]
        --qths12[1]
      --  弹出消息(qths12[1])
        --复制文本(qths12[1])
        if(qths12[1]:find"//延时加载") then
          for i=1, #(dzbj) do
            if (dzbj[i]=="添加延时") then
                dzbj[i]="重设延时"--设置数组第i个
            end
          end
        end
 --判断状态

      AlertDialog.Builder(this)
      .setTitle("编辑动作")
      .setItems(dzbj,{onClick=function(l,v) 


          if(v==0)then--------------------动作置顶--开始

                   for i=1, #(mcsj) do
                      if(mcsj[i]==qths11[1])then
                        删除动作跟踪(i)
                      end
                   end

                    table.insert(mcsj,1,qths11[1])
                    table.insert(dmsj,1,qths12[1])
                    table.insert(cxsj,1,qths13[1])
                    table.insert(cxmc,1,qths14[1])
                    table.insert(zxdz,1,qths15[1])
                    table.insert(dzlb,1,qths16[1])
                    动作跟踪()
          end-----------------------------动作置顶--结束




          if(v==1)then--------------------------添加延时--开始
            弹出消息(qths12[1])
            复制文本(qths12[1])

                 对话框()
                 .setTitle("设置延时加载")
                 .setView(loadlayout(inputlayout))
                 .设置积极按钮("添加",function()
                  ysgn="setTimeout(function (){".."\n"..qths12[1].."\n".."},"..edit1.text..");"--延时功能

                  for i=1, #(mcsj) do
                      if (mcsj[i]==qths11[1]) then
                          mcsj[i]=qths11[1].."   （延时"..edit1.text.."毫秒）"--设置数组第i个
                      end
                  end

                  for i=1, #(dmsj) do
                      if (dmsj[i]==qths12[1]) then
                          dmsj[i]=ysgn--设置数组第i个
                      end
                  end

                 动作跟踪()--重新打开动作跟踪
                 弹出消息("添加成功！")
                  end)
                    .设置消极按钮("取消",function()
                      动作跟踪()

                end)
                 .显示()


              import "android.text.InputType"--设置只能输入数字--1
              import "android.text.method.DigitsKeyListener"--设置只能输入数字--2
              edit1.setInputType(InputType.TYPE_CLASS_NUMBER)--设置只能输入数字--3
              edit1.setKeyListener(DigitsKeyListener.getInstance("0123456789"))--设置只能输入数字--4

              edit1.setHint(" 请输入延时时间/ms")--定义提示
              linkhint.setText('设置该动作的延时加载，延时时间以毫秒为单位 \n例如：填入1000=1秒')--定义文本
          end------------------------------添加延时--结束

          if(v==2)then--动作备注
            动作备注()
          end

          if(v==3)then--动作备注
            
                    对话框()
                   .setTitle("修改代码")
                   .setView(loadlayout(inputlayout))
                   .设置积极按钮("保存",function()
                       th=edit1.text
                       for i=1,#(dmsj) do
                         if(qths12[1]==dmsj[i])then
                          dmsj[i]=edit1.text
                         end
                       end
                   动作跟踪()--重新打开动作跟踪
                   弹出消息("修改成功！")
                    end)
                      .设置消极按钮("取消",function()
                        动作跟踪()

                  end)
                   .显示()
                     edit1.text=qths12[1]
                     edit1.setHint(" 当前无动作代码")--定义提示
                     linkhint.setText('无特殊需求请勿修改，注意结尾处务必带;符号，否则会导致复制错误!')--定义文本
          end
      end})


    .setPositiveButton("导入运行本",DialogInterface
    .OnClickListener{
      onClick=function(v)
                dqnr=io.open(jsxml):read("*a")
                 if(dqnr=="")then
                    换行=""
                  else
                    换行="\n"
                  end
            写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..qths12[1]
            io.open(jsxml,"w"):write(写入内容):close()
            加载对话框("导入运行本","动作中导入中....",1000,"导入完成！")
      end})

    .setNegativeButton("导入预加载",DialogInterface
    .OnClickListener{
      onClick=function(v)
                 dqnr=io.open(jsxml):read("*a")
                 if(dqnr=="")then
                    换行=""
                  else
                    换行="\n"
                  end
                 写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..qths12[1]
                 io.open(jsyjz,"w"):write(写入内容):close()
               加载对话框("导入预加载","动作中导入中....",1000,"导入完成！")
      end
    })

    .setNeutralButton("删除",DialogInterface
    .OnClickListener{
      onClick=function(v)
          for i=1, #(mcsj) do
                if(mcsj[i]==qths11[1])then
                    table.remove(mcsj,i)--删除第i个元素
                    弹出消息("删除成功！")
                    动作跟踪()
                end
          end
      end
    })
    .show();


end---自定义函数结束




import "android.widget.ArrayAdapter"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "java.io.File"
import "android.widget.ListView"
import "android.app.AlertDialog"




--[[---------------------]]----
--[[---------------------]]----自定义函数--结束


function 动作跟踪()--自定义函数开始

    AlertDialog.Builder(this)
    .setTitle("动作跟踪\n")

    .setItems(mcsj,{onClick=function(l,v) 
    	qths11={}--存放名称
      qths12={}--存放代码
      qths13={}--存放撤销代码
      qths14={}--存放撤销提示
      qths15={}--存放验证
      qths16={}--存放类型
      table.insert(qths11,mcsj[v+1])--代码
      table.insert(qths12,dmsj[v+1])--名称
      table.insert(qths13,cxsj[v+1])--代码
      table.insert(qths14,cxmc[v+1])--名称
      table.insert(qths15,zxdz[v+1])--代码
      table.insert(qths16,dzlb[v+1])--名称
    	动作编辑()
    end})

    --[[.setItems(mcsj,{onClick=function(l,v) 
    弹出消息("123456")
    end})--]]

    .setPositiveButton("导入运行本",DialogInterface
    .OnClickListener{
      onClick=function(v)
       dqnr=io.open(jsxml):read("*a")--读取当前jsxml(运行本内容)
                 cdsj1={}
                 cdsj1[1]=""
                 cdsj1[2]=""--用于存放引导最后数据
                 for i=1, #(dmsj) do--遍历代码数组所有内容
                   if(dzlb[i]==17)then--为引导时
                      cdsj1[2]=i
                   end
                 end

                  if(cdsj1[2]~="")then
                    dmsj[cdsj1[2]]=dmsj[cdsj1[2]]..[[introJs().setOptions({'prevLabel':'&larr; 上一步','nextLabel':'下一步 &rarr;','skipLabel':'跳过','doneLabel':'完成','showStepNumbers':!1,'showBullets':!1}).start();]]
                  end

                 for i=1, #(dmsj) do--遍历代码数组所有内容
                    cdsj1[1]=cdsj1[1]..dmsj[i].."\n"
                 end

                  if(dqnr=="")then
                    换行=""
                  else
                    换行="\n"
                  end
            写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..cdsj1[1]
            io.open(jsxml,"w"):write(写入内容):close()

              for i=1, #(mcsj) do
                    mcsj[i]=nil--清空数组
              end

              for i=1, #(dmsj) do
                    dmsj[i]=nil--清空数组
              end

       加载对话框("导入运行本","动作中导入中....",1000,"导入完成！")

      end
    })

    .setNegativeButton("导入预加载",DialogInterface
    .OnClickListener{
      onClick=function(v)
     
       dqnr=io.open(jsyjz):read("*a")--读取当前jsxml(运行本内容)
                 cdsj1={}
                 cdsj1[1]=""
                 cdsj1[2]=""--用于存放引导最后数据
                 for i=1, #(dmsj) do--遍历代码数组所有内容
                   if(dzlb[i]==17)then--为引导时
                      cdsj1[2]=i
                   end
                 end

                  if(cdsj1[2]~="")then
                    dmsj[cdsj1[2]]=dmsj[cdsj1[2]]..[[introJs().setOptions({'prevLabel':'&larr; 上一步','nextLabel':'下一步 &rarr;','skipLabel':'跳过','doneLabel':'完成','showStepNumbers':!1,'showBullets':!1}).start();]]
                  end

                 for i=1, #(dmsj) do--遍历代码数组所有内容
                    cdsj1[1]=cdsj1[1]..dmsj[i].."\n"
                 end

                  if(dqnr=="")then
                    换行=""
                  else
                    换行="\n"
                  end
            写入内容=dqnr..换行.."//"..os.date("%H:%M-%S").."\n"..cdsj1[1]
            io.open(jsyjz,"w"):write(写入内容):close()

              for i=1, #(mcsj) do
                    mcsj[i]=nil--清空数组
              end

              for i=1, #(dmsj) do
                    dmsj[i]=nil--清空数组
              end

       加载对话框("导入预加载","动作中导入中....",1000,"导入完成！")

      end
    })


    .setNeutralButton("清空",DialogInterface
    .OnClickListener{
      onClick=function(v)
              -- for i=1, #(mcsj) do
              --       mcsj[i]=nil--清空数组
              -- end
       清空动作跟踪()
       加载对话框("清空","动作清空中....",1000,"清空完成！")
      end
    })
    .show()
end--自定义函数结束


