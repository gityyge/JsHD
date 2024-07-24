-- 当前文件 对应 关于我们 子页面的 启动事件 非远程
require"import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.text.*"
import "android.content.pm.PackageManager"
versionName={}--最新版本
local 版本号 = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName


table.insert(versionName,"1.00.00")  --记录版本 用于更新检测 开源版本设置最小


datafile=File(activity.getLuaDir()).getParentFile().getParentFile()
loadstring(io.open(tostring(datafile).."/fx.lua"):read("*a"))()
loadstring(io.open(tostring(datafile).."/preload_fx.lua"):read("*a"))()


  function string.split(input, delimiter)
      input = tostring(input)
      delimiter = tostring(delimiter)
      if (delimiter=='') then return false end
      local pos,arr = 0, {}
      for st,sp in function() return string.find(input, delimiter, pos, true) end do
          table.insert(arr, string.sub(input, pos, st - 1))
          pos = sp + 1
      end
      table.insert(arr, string.sub(input, pos))
      return arr
  end

  bbsz_0=string.split(版本号,".")
  bbxh_0=""
  for i=1,#bbsz_0 do
    if(i~=1)then
      bbxh_0=bbxh_0..bbsz_0[i]
    end
  end

function xhjz()
  if(versionName[1]==nil)then
    更新数据="V"..版本号
      task(100,function ()
        xhjz()
      end)
   else
   bbsz_1=string.split(versionName[1],".")
    bbxh_1=""
    for i=1,#bbsz_1 do
      if(i~=1)then
        bbxh_1=bbxh_1..bbsz_1[i]
      end
    end

    当前版本号=tonumber(bbsz_0[1].."."..bbxh_0)
    最新版本号=tonumber(bbsz_1[1].."."..bbxh_1)
    if(最新版本号>当前版本号)then
      更新数据="V"..当前版本号.."   可更新！"
     else
      更新数据="V"..当前版本号
    end
  end
end

xhjz()

  

layout={
  LinearLayout,
  layout_width="fill",
  layout_height="fill",
  orientation="vertical",
  backgroundColor="#fb5957",
  id="jb",
  {
    RelativeLayout,
    layout_width="fill",
    layout_height="150dp",
    layout_marginTop="35dp",
    {
      ImageView,
      id="logo",
      layout_width="130dp",
      layout_height="130dp",
      layout_marginLeft="30dp",
      layout_centerVertical=true,
      src="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/js.png",
      onClick=function()
    弹出消息("点我没用哒！哼")     
 end
   

    },
    {
      TextView,
      layout_toRightOf="logo",
      layout_marginLeft="20dp",
      layout_centerVertical=true,
      text=Html.fromHtml("<b>欢迎使用<br/>JsHD调试器<br/>@Gityyge</b>"),
      textSize="20sp",
      textColor="#ffffff",
    }
  },
  {
    RelativeLayout,
    layout_width="fill",
    layout_height="fill",
    layout_marginTop="20dp",
    {
      ListView,
      id="list",
      layout_width="fill",
      layout_marginTop="20dp",
      layout_marginLeft="60dp",
      layout_marginRight="60dp",
      dividerHeight="0dp",
    },
    {
      CardView,
      layout_width="200dp",
      layout_height="200dp",
      layout_alignParentRight=true,
      layout_alignParentBottom=true,
      layout_marginRight="-80dp",
      layout_marginBottom="-80dp",
      radius="100dp",
      elevation="0dp",
      CardBackgroundColor="#FFFFE8BA",
    },
    {
      CardView,
      layout_width="150dp",
      layout_height="150dp",
      layout_alignParentRight=true,
      layout_alignParentBottom=true,
      layout_marginRight="-60dp",
      layout_marginBottom="-60dp",
      radius="75dp",
      elevation="0dp",
      CardBackgroundColor="#ffffff",
    },
    {
      LinearLayout,
      layout_alignParentLeft=true,
      layout_alignParentBottom=true,
      layout_margin="20dp",
      orientation="horizontal",
      {
        TextView,
        text="隐私政策",
        textSize="15sp",
        textColor="#ffffff",
        onClick=function()
            import "android.graphics.Color"
            Alert=AlertDialog.Builder(this)
            Alert.setTitle("标题")
            Alert.setMessage("消息")
            Alert.setPositiveButton("确定",nil)--积极按钮
            Alert.setNegativeButton("取消",nil)--消极按钮
            Alert.setCancelable(false)
            Dialog=Alert.show();--定义显示对话框为Dialog

            function 隐私政策()
              import "android.text.Html"
              import "android.content.Context"
              message=Dialog.findViewById(android.R.id.message)
              message.setTextColor(0xFF434343)--设置消息颜色
              message.setTextSize(14);
              message.setPadding(message.getPaddingLeft(),0,message.getPaddingRight(),-message.getPaddingRight())--左、上、右、下

              params = Dialog.getWindow().getAttributes();
              params.width = activity.getWidth()*0.9;
              params.height = activity.getHeight()*0.9;
              Dialog.getWindow().setAttributes(params);

              field=Class.forName("android.app.AlertDialog").getDeclaredField("mAlert")
              field.setAccessible(true)
              field2=field.get(Dialog)
              field3=field2.getClass().getDeclaredField("mTitleView")
              field3.setAccessible(true)
              tv=field3.get(field2)
              import "android.graphics.Color"
              tv.setText("JsHD调试器隐私政策")
              tv.setGravity(Gravity.CENTER)--设置居中
              tv.getPaint().setFakeBoldText(true);--设置粗体

              message=Dialog.findViewById(android.R.id.message)
              message.setTextColor(0xFF434343)--设置消息颜色
              message.setTextSize(14);
              message.setText(Html.fromHtml(PrivacyPolicy_2))
              Dialog.getButton(Dialog.BUTTON_NEUTRAL).setText("条款说明")--设置消极按钮颜色
            end

            Dialog.getButton(Dialog.BUTTON_POSITIVE).onClick=function()--积极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
             Dialog.dismiss();
            end

            Dialog.getButton(Dialog.BUTTON_NEGATIVE).onClick=function()--消极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
             Dialog.dismiss();
            end

            弹窗圆角(Dialog.getWindow(),0xFFFFFFFF)
            隐私政策()
        end
      },
      {
        FrameLayout,
        layout_width="10dp",
      },
      {
        TextView,
        text="设备信息",
        textSize="15sp",
        textColor="#ffffff",
        onClick=function()
    device_model = Build.MODEL
    version_xtbb = Build.VERSION.RELEASE
    version_cpxh = Build.PRODUCT
    version_bbxx = Build.DISPLAY
    version_cpmc = Build.PRODUCT
    version_xtdz = Build.BRAND
    version_sbcs = Build.DEVICE
    version_kfdh = Build.VERSION.CODENAME
    version_sdk = Build.VERSION.SDK
    version_cpu = Build.CPU_ABI
    version_yjlx = Build.HARDWARE
    version_zjdz = Build.HOST
    version_id = Build.ID
    version_rom = Build.MANUFACTURER
version_release = Build.VERSION.RELEASE 
import "android.provider.Settings$Secure"
android_id = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
     对话框()
    .设置标题("全部参数")
    .设置消息("手机型号："..device_model.."\n\n安卓版本："..version_xtbb.."\n\n产品型号："..version_cpxh.."\n\n版本显示：" ..version_bbxx.."\n\n系统定制商："..version_xtdz.."\n\n设备参数：" ..version_sbcs.."\n\n开发代号："..version_kfdh.."\n\nSDK版本号:"..version_sdk.."\n\nCPU类型："..version_cpu.."\n\n硬件类型：" ..version_yjlx.."\n\n主机地址:"..version_zjdz.."\n\n生产ID："..version_id.."\n\nROM制造商："..version_rom.."\n\n安卓ID："..android_id)
    .设置消极按钮("关闭").设置积极按钮("复制设备ID",function()
    复制文本(android_id)
    弹出消息("已复制设备ID")
end)
.设置消极按钮("取消")
.显示()
        end        
      },
    },
  },
}

activity.setContentView(loadlayout(layout))

远程路径="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC.lua"
    Http.get(远程路径,nil,"utf8",nil,function(code,html,b,c)
   loadstring(html)()  
    end)

adpd={
  {
    img={
      src="drawable/ic_cog_box.png",
    },
    title={
      text="当前版本",
    },
    content={
      text=更新数据,
    },
  },
    {
    img={
      src="drawable/ic_account.png",
    },
    title={
      text="作者",
    },
    content={
      text="@壹影阁",
    },
  },
  {
    img={
      src="drawable/ic_bug.png",
    },
    title={
      text="技术支持",
    },
    content={
      text="@诸位大佬",
    },
  },

   {
    img={
      src="drawable/component.png",
    },
    title={
      text="开源代码",
    },
    content={
      text="开源部分函数代码",
    },
  },

  {
    img={
      src="drawable/ic_group.png",
    },
    title={
      text="官方交流群",
    },
    content={
      text="JsHD官方QQ群",
    },
  },
  {
    img={
      src="drawable/ic_share.png",
    },
    title={
      text="评论分享",
    },
    content={
      text="好东西大家享",
    },
  },
}

items={
  LinearLayout,
  layout_width="fill",
  orientation="horizontal",
  gravity="center|left",
  {
    ImageView,
    id="img",
    layout_margin="10dp",
    layout_width="30dp",
    layout_height="30dp",
  },
  {
    LinearLayout,
    layout_width="fill",
    layout_marginLeft="10dp",
    layout_marginRight="10dp",
    orientation="vertical",
    {
      TextView,
      id="title",
      textColor="#FFFFFFFF",
      textSize="15sp",
    },
    {
      TextView,
      id="content",
      textColor="#FFFFFFFF",
      textSize="12sp",
    },
  },
}

onclick={
  function()
    if(更新数据:find"可更新") then
      分享应用()
      弹出消息("正在前往更新...")
    else
      弹出消息("恭喜！当前版本为最新版本~")
    end
    
  end,
  function()
    this.startActivity(Intent(Intent.ACTION_VIEW,Uri.parse("mqqapi://card/show_pslcard?uin=203455278")))
  end,
  function()
      技术支持()
  end,
  function()
      开源代码()
  end,
  function()
    官方交流群()
  end,
  function()
    分享应用()
  end
}


--调用渐变函数
渐变(0xFFFE7200,0xFFFE2215,jb) --注意，这里是x不是×
--渐变(0xFFFE2215,0xFFFE7200,jb) --注意，这里是x不是×
--#FFFB5A5A#FFFB4266
--(0xFFFF6845,0xFFFF2317


adapter=LuaAdapter(this,adpd,items)
list.Adapter=adapter
list.onItemClick=function(adp,view,pos,id)
  if onclick[id] then
    onclick[id]()
  end
end