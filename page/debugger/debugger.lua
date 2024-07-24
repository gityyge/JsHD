-- 当前文件 对应 调试模式 子页面的 启动事件 非远程
if(Build.VERSION.SDK+1>=31)then
  datawjj=Environment.getExternalStorageDirectory().toString().."/JsHD/"--赋值文件夹路径
  settings=Environment.getExternalStorageDirectory().toString().."/JsHD/.settings.ini"--软件设置文件
  xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
  pdjz=Environment.getExternalStorageDirectory().toString().."/JsHD/pd.jh"--赋值预加载文件
  wybt=Environment.getExternalStorageDirectory().toString().."/JsHD/网页标题.txt"
  caching_code=Environment.getExternalStorageDirectory().toString().."/JsHD/files/caching_code.data"
 else
  datawjj=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName()--赋值文件夹路径
  settings=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/.settings.ini"--软件设置文件
  xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
  pdjz=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/pd.jh"--赋值预加载文件
  wybt=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/网页标题.txt"
  caching_code=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_code.data"
end

 GrabMod=1--模式限定
--程序启动时会执行的事件

--调试子页面
--启动动画淡入淡出
--activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)

--页面初始化
--自定义函数[[------------------------]]
--自定义函数[[------------------------]]


webView.settings.cacheMode=webView.settings.LOAD_CACHE_ELSE_NETWORK
dqzt={}--当前状态
qxgl={}--管理权限
sjgl={}
--默认nli==默认状态
--状态1==样式编辑
--状态0==无布局状态
jzcs={}--加载次数
jzwbcs={}--加载完毕事件执行次数
luamw=activity.getPackageName()
点击次数=0

import "android.provider.Settings$Secure"
android_id = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)

function 判断网络()--该函数固定
  local NETWORN_NONE = 0;--没有网络连接
  local NETWORN_WIFI = 1;--Wi-Fi 连接
  local NETWORN_2G = 2;-- 2G
  local NETWORN_3G = 3;-- 3G
  local NETWORN_4G = 4;-- 4G
  local NETWORN_MOBILE = 5;-- 未识别的网络信号

  connManager = activity.getSystemService(Context.CONNECTIVITY_SERVICE);  --获取系统的网络服务

  if (nil == connManager) then  --如果当前没有网络
    return NETWORN_NONE;
  end


  activeNetInfo = connManager.getActiveNetworkInfo(); --获取当前网络类型，如果为空，返回无网络
  if (activeNetInfo == nil or activeNetInfo.isAvailable() == false) then
    return NETWORN_NONE;
  end

  --判断是不是连接的是不是wifi
  wifiInfo = connManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
  if (nil ~= wifiInfo) then
    state = wifiInfo.getState();
    if (null ~= state) then
      if (state == NetworkInfo.State.CONNECTED or state == NetworkInfo.State.CONNECTING) then
        return NETWORN_WIFI;
      end
    end
  end

  --如果不是wifi，则判断当前连接的是运营商的哪种网络 2G、3G、4G 等
  networkInfo = connManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);

  if (nil ~= networkInfo) then
    state = networkInfo.getState();
    strSubTypeName = tostring(networkInfo.getSubtypeName());
    if (nil ~= state) then
      if (state == NetworkInfo.State.CONNECTED or state == NetworkInfo.State.CONNECTING) then
        local NetInfo = tonumber(activeNetInfo.getSubtype());

        if (NetInfo == 1 or NetInfo == 2 or NetInfo == 4 or NetInfo == 7 or NetInfo == 11) then
          return NETWORN_2G;
        end

        if (NetInfo == 3 or NetInfo == 5 or NetInfo == 6 or NetInfo == 8 or NetInfo == 9 or NetInfo == 10 or NetInfo == 12 or NetInfo == 14 or NetInfo == 15) then
          return NETWORN_3G;
        end

        if (NetInfo == 13) then
          return NETWORN_4G;
        end

        function myfunction ()
          if (strSubTypeName.equalsIgnoreCase("TD-SCDMA") or strSubTypeName.equalsIgnoreCase("WCDMA") or strSubTypeName.equalsIgnoreCase("CDMA2000")) then
            return NETWORN_3G;
           else
            return NETWORN_MOBILE;
          end
        end

        function myerrorhandler( err )
        end

        xpca=xpcall(myfunction, myerrorhandler)

        if(xpca==false)then
          return NETWORN_MOBILE;
        end
      end
    end
    return NETWORN_NONE;
  end
end

--重要函数
function 布局初始化()
      	function 布局初始()
		 加载Js([===[
		  setTimeout(funcion (){
		  var pdnr = document.getElementsByClassName("eruda-children")[0]
		  if (pdnr===undefined){
		  var zfc =document.getElementsByClassName("eruda-breadcrumb")[0].innerHTML
		  var result=zfc.replace(/<.*?>/ig,"");
		  document.title = result;
		  }else{
		  var pdnrbq = pdnr.getElementsByTagName("li")[0].getElementsByTagName("span")[0];
		  if(pdnrbq===undefined){
		  var zfc =document.getElementsByClassName("eruda-breadcrumb")[0].innerHTML
		  var result=zfc.replace(/<.*?>/ig,"");
		  var linr=document.getElementsByClassName("eruda-children")[0].getElementsByTagName("li")[0].innerHTML
		  var nrtz=result+"bqnr=\""+linr+"\""
		  document.title = nrtz;
		  }else{
		  var zfc =document.getElementsByClassName("eruda-breadcrumb")[0].innerHTML
		  var result=zfc.replace(/<.*?>/ig,"");
		  document.title = result;
		  }
		  }
		  }, 100);
		  ]===])
      	end
        布局初始()
end

--重要函数
function 初始化标签()
		function 标签初始()
          加载Js([===[var __encode ='sojson.com', _0xb483=["\x5F\x64\x65\x63\x6F\x64\x65","\x68\x74\x74\x70\x3A\x2F\x2F\x77\x77\x77\x2E\x73\x6F\x6A\x73\x6F\x6E\x2E\x63\x6F\x6D\x2F\x6A\x61\x76\x61\x73\x63\x72\x69\x70\x74\x6F\x62\x66\x75\x73\x63\x61\x74\x6F\x72\x2E\x68\x74\x6D\x6C"];(function(_0xd642x1){_0xd642x1[_0xb483[0]]= _0xb483[1]})(window);var __Ox74174=["\x2A","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x73\x42\x79\x54\x61\x67\x4E\x61\x6D\x65","\x62\x6F\x64\x79","\x6C\x65\x6E\x67\x74\x68","\x74\x61\x67\x4E\x61\x6D\x65","\x74\x6F\x4C\x6F\x77\x65\x72\x43\x61\x73\x65","\x70\x75\x73\x68","\x69\x6E\x64\x65\x78\x4F\x66","\x62\x71\x6D","\x5B","\x5D","\x73\x65\x74\x41\x74\x74\x72\x69\x62\x75\x74\x65","\x5B\x30\x5D","\x68\x65\x61\x64","\x69\x64","\x67\x65\x74\x41\x74\x74\x72\x69\x62\x75\x74\x65","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64","\x69\x64\x6D","\x63\x6C\x61\x73\x73","\x63\x6C\x61\x73\x73\x4E\x61\x6D\x65","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x73\x42\x79\x43\x6C\x61\x73\x73\x4E\x61\x6D\x65","\x63\x6C\x61\x67\x73","\x6F\x6E\x6D\x6F\x75\x73\x65\x64\x6F\x77\x6E","\x65\x72\x75\x64\x61\x2D\x63\x68\x69\x6C\x64\x72\x65\x6E","\x69\x6E\x6E\x65\x72\x48\x54\x4D\x4C","\x65\x72\x75\x64\x61\x2D\x62\x72\x65\x61\x64\x63\x72\x75\x6D\x62","","\x72\x65\x70\x6C\x61\x63\x65","\x74\x69\x74\x6C\x65","\x73\x70\x61\x6E","\x6C\x69","\x62\x71\x6E\x72\x3D\x22","\x22","\x75\x72\x6C\x3D","\x68\x6F\x73\x74","\x6C\x6F\x63\x61\x74\x69\x6F\x6E","\x70\x61\x74\x68\x6E\x61\x6D\x65"];var arr=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](__Ox74174[0x0]);var bb=[];for(var i=0;i< arr[__Ox74174[0x3]];i++){if(arr[i]){var mm=arr[i][__Ox74174[0x4]];mn= mm[__Ox74174[0x5]]();bb[__Ox74174[0x6]](mn)}};function uniq(_0x33bdx6){var _0x33bdx7=[];for(var i=0;i< _0x33bdx6[__Ox74174[0x3]];i++){if(_0x33bdx7[__Ox74174[0x7]](_0x33bdx6[i])==  -1){_0x33bdx7[__Ox74174[0x6]](_0x33bdx6[i])}};return _0x33bdx7}var rel=uniq(bb);for(var m=0;m< rel[__Ox74174[0x3]];m++){var clsys=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](rel[m]);for(var n=0;n< clsys[__Ox74174[0x3]];n++){clsys[n][__Ox74174[0xb]](__Ox74174[0x8],__Ox74174[0x9]+ rel[m]+ __Ox74174[0x9]+ n+ __Ox74174[0xa]+ __Ox74174[0xa])}};document[__Ox74174[0x2]][__Ox74174[0xb]](__Ox74174[0x8],__Ox74174[0x9]+ __Ox74174[0x2]+ __Ox74174[0xc]+ __Ox74174[0xa]);document[__Ox74174[0xd]][__Ox74174[0xb]](__Ox74174[0x8],__Ox74174[0x9]+ __Ox74174[0xd]+ __Ox74174[0xc]+ __Ox74174[0xa]);var arr=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](__Ox74174[0x0]);var bb=[];for(var i=0;i< arr[__Ox74174[0x3]];i++){if(arr[i][__Ox74174[0xf]](__Ox74174[0xe])){bb[__Ox74174[0x6]](arr[i][__Ox74174[0xf]](__Ox74174[0xe]))}};for(var m=0;m< bb[__Ox74174[0x3]];m++){var clsys=document[__Ox74174[0x10]](bb[m]);clsys[__Ox74174[0xb]](__Ox74174[0x11],__Ox74174[0x9]+ bb[m]+ __Ox74174[0xa])};var arr=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](__Ox74174[0x0]);var bb=[];for(var i=0;i< arr[__Ox74174[0x3]];i++){if(arr[i][__Ox74174[0xf]](__Ox74174[0x12])){bb[__Ox74174[0x6]](arr[i][__Ox74174[0x13]])}};for(var m=0;m< bb[__Ox74174[0x3]];m++){var clsys=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x14]](bb[m]);for(var n=0;n< clsys[__Ox74174[0x3]];n++){clsys[n][__Ox74174[0xb]](__Ox74174[0x15],__Ox74174[0x9]+ bb[m]+ __Ox74174[0x9]+ n+ __Ox74174[0xa]+ __Ox74174[0xa])}};document[__Ox74174[0x16]]= function(_0x33bdxc){setTimeout(function(){var arr=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](__Ox74174[0x0]);var bb=[];for(var i=0;i< arr[__Ox74174[0x3]];i++){if(arr[i][__Ox74174[0xf]](__Ox74174[0xe])){bb[__Ox74174[0x6]](arr[i][__Ox74174[0xf]](__Ox74174[0xe]))}};for(var m=0;m< bb[__Ox74174[0x3]];m++){var clsys=document[__Ox74174[0x10]](bb[m]);if(clsys[__Ox74174[0xf]](__Ox74174[0x11])== __Ox74174[0x9]+ bb[m]+ __Ox74174[0xa]){}else {clsys[__Ox74174[0xb]](__Ox74174[0x11],__Ox74174[0x9]+ bb[m]+ __Ox74174[0xa])}};var arr=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x1]](__Ox74174[0x0]);var bb=[];for(var i=0;i< arr[__Ox74174[0x3]];i++){if(arr[i][__Ox74174[0xf]](__Ox74174[0x12])){bb[__Ox74174[0x6]](arr[i][__Ox74174[0x13]])}};for(var m=0;m< bb[__Ox74174[0x3]];m++){var clsys=document[__Ox74174[0x1]](__Ox74174[0x2])[0x0][__Ox74174[0x14]](bb[m]);for(var n=0;n< clsys[__Ox74174[0x3]];n++){if(clsys[n][__Ox74174[0xf]](__Ox74174[0x15])== __Ox74174[0x9]+ bb[m]+ __Ox74174[0x9]+ n+ __Ox74174[0xa]+ __Ox74174[0xa]){}else {clsys[n][__Ox74174[0xb]](__Ox74174[0x15],__Ox74174[0x9]+ bb[m]+ __Ox74174[0x9]+ n+ __Ox74174[0xa]+ __Ox74174[0xa])}}};var _0x33bdxd=document[__Ox74174[0x14]](__Ox74174[0x17])[0x0];if(_0x33bdxd=== undefined){var _0x33bdxe=document[__Ox74174[0x14]](__Ox74174[0x19])[0x0][__Ox74174[0x18]];var _0x33bdxf=_0x33bdxe[__Ox74174[0x1b]](/<.*?>/ig,__Ox74174[0x1a]);document[__Ox74174[0x1c]]= _0x33bdxf}else {var _0x33bdx10=_0x33bdxd[__Ox74174[0x1]](__Ox74174[0x1e])[0x0][__Ox74174[0x1]](__Ox74174[0x1d])[0x0];if(_0x33bdx10=== undefined){var _0x33bdxe=document[__Ox74174[0x14]](__Ox74174[0x19])[0x0][__Ox74174[0x18]];var _0x33bdxf=_0x33bdxe[__Ox74174[0x1b]](/<.*?>/ig,__Ox74174[0x1a]);var _0x33bdx11=document[__Ox74174[0x14]](__Ox74174[0x17])[0x0][__Ox74174[0x1]](__Ox74174[0x1e])[0x0][__Ox74174[0x18]];var _0x33bdx12=_0x33bdxf+ __Ox74174[0x1f]+ _0x33bdx11+ __Ox74174[0x20];document[__Ox74174[0x1c]]= _0x33bdx12}else {var _0x33bdxe=document[__Ox74174[0x14]](__Ox74174[0x19])[0x0][__Ox74174[0x18]];var _0x33bdxf=_0x33bdxe[__Ox74174[0x1b]](/<.*?>/ig,__Ox74174[0x1a]);document[__Ox74174[0x1c]]= _0x33bdxf}}},200)};document[__Ox74174[0x1c]]= document[__Ox74174[0x1c]]+ __Ox74174[0x21]+ __Ox74174[0x20]+ window[__Ox74174[0x23]][__Ox74174[0x22]]+ window[__Ox74174[0x23]][__Ox74174[0x24]]+ __Ox74174[0x20]]===])
		end

        标签初始()
	end

--重要函数
function 初始化标题()--初始化标题开始
        function 标题初始()
	        if(bt:find"idm=") then
	        a=0
	        else--判断xmlurl否则
	        a=1
	        end

	        if(bt:find"clags=") then
	        b=0
	        else--判断xmlurl否则
	        b=1
	        end

	        pdsx=a..b

	        if(pdsx=="00")then--既有id也有class------------既有id也有class
	        idm=bt:match('idm="%[(.-)%]"')--最后选取出的id名
	        classm1=bt:match('clags="%[(.-)%]"')--xxxxx[*]
	        classm2=classm1:match("%[(.-)%]")----*
	        classm = string.gsub(classm1,"%["..classm2.."%]","")--最后选取出的class名

	        idwb="#"..idm--设定id文本
	        classwb="."..classm--设定class文本
	        sqys='document.getElementById("'..idm..'")'
	        --弹出消息(sqys)
	        end

	        if(pdsx=="01")then--有id没有class-----------------------有id没有class
	        idm=bt:match('idm="%[(.-)%]"')--最后选取出的id名

	        idwb="#"..idm--设定id文本
	        classwb=""--设定class文本

	        sqys='document.getElementById("'..idm..'")'
	        --弹出消息(idm)
	        end

	        if(pdsx=="11")then--啥都没有-------------------啥都没有
	          if(bt=="加载完成")then
	            bqm2="0"
	            bqm = "html"--最红选取出的标签名
	            idwb=""
	            classwb=""
	            sqys='document.getElementsByTagName("html")[0]'
	          else
	            bqm1=bt:match('bqm="%[(.-)%]"')--xxxxx[*]
	            bqm2=bqm1:match("%[(.-)%]")----*

	            bqm = string.gsub(bqm1,"%["..bqm2.."%]","")--最红选取出的标签名
	            idwb=""
	            classwb=""
	            sqys='document.getElementsByTagName("'..bqm..'")'..'['..bqm2..']'

	          end

	        --弹出消息(sqys)
	          --弹出消息("11")
	        end

	        if(pdsx=="10")then--有class没有id--------------有class没有id
	        classm1=bt:match('clags="%[(.-)%]"')--xxxxx[*]
	        classm2=classm1:match("%[(.-)%]")----*
	        classm = string.gsub(classm1,"%["..classm2.."%]","")--最后选取出的class名

	        idwb=""--设定id文本
	        classwb="."..classm--设定class文本

	        sqys='document.getElementsByClassName("'..classm..'")'..'['..classm2..']'

	        --弹出消息(sqys)
	         -- 弹出消息("10")
	        end


	        if(bt:find"bqnr=") then--判断是否有标签内容--开始
	        bqnr=""..bt:match('bqnr=%"(.-)%"')--<>****<>
	        else--判断xmlurl否则
	        bqnr="该标签无内容    "--<>****<>
	        end--判断是否有标签内容--结束


	        if(bt:find"href=") then--判断是否有标签内容--开始
	        an2=""..bt:match('href=%"(.-)%"')--<>****<>
	        --弹出消息(ljnr)
	        else--判断xmlurl否则
	        --ljnr="该元素无点击链接"--<>****<>
	        end--判断是否有标签内容--结束

	        --分离出标签名
	        if(bt=="加载完成") then
	        bqm2="0"
	        bqm="html"
	        else
	        bqm1=bt:match('bqm="%[(.-)%]"')--xxxxx[*]
	        bqm2=bqm1:match("%[(.-)%]")----*
	        bqm = string.gsub(bqm1,"%["..bqm2.."%]","")--最红选取出的标签名
	        bqm3=bqm.."["..bqm2.."]"
	          end
	        --分离出标签名
        end
       标题初始()
    end--初始化标题结束
datafile=File(activity.getLuaDir()).getParentFile().getParentFile()
loadstring(io.open(tostring(datafile).."/fx.lua"):read("*a"))()


判断文件夹(datawjj)
判断文件(settings)

--settings--初始设置
function initiUAcode()
  settings_text=[[false||true||||utf-8||]]
  io.open(settings,"w"):write(settings_text):close()
  settings_ua=""
  settings_code="utf-8"
  settings_pattern="缓存"
end

if(io.open(settings):read("*a")=="")then
  initiUAcode()
 else
       if (#切割字符串(io.open(settings):read("*a"),"||")==5)then
        if(切割字符串(io.open(settings):read("*a"),"||")[3]~="")then
          qg_1=切割字符串(io.open(settings):read("*a"),"||")[3]
          qg_2=切割字符串(qg_1,"@|@")[2]
          qg_3=切割字符串(io.open(settings):read("*a"),"||")[2]
          settings_ua=qg_2
          settings_code=切割字符串(io.open(settings):read("*a"),"||")[4]
          if(qg_3=="true")then
            settings_pattern="缓存"
           else
            settings_pattern="常规"
          end
        else
          qg_3=切割字符串(io.open(settings):read("*a"),"||")[2]
          if(qg_3=="true")then
            settings_pattern="缓存"
           else
            settings_pattern="常规"
          end
            settings_ua=""
            settings_code="utf-8"
        end
       else
         initiUAcode()
       end
end
--settings----初始设置

function 强制对话框(标题,消息,积极按钮名称,消极按钮名称)
  对话框()
  .设置标题(标题)
  .设置消息(消息)
  .设置积极按钮(积极按钮名称,function()
     loadstring(事件1)()
  end)
  .设置消极按钮(消极按钮名称,function()
     loadstring(事件2)()
  end)
  .setCancelable(false)--禁用返回键
  .显示()
end
事件1=([[退出页面()]])



function 加载框(标题,消息)--001开始
  import("android.app.ProgressDialog");
   pd = ProgressDialog.show(this,标题,消息);
   id =import "android.os.Build"
   dd=id.SERIAL
   set=import "android.provider.Settings"
   id = set.System.getString(this.getContentResolver(), "android_id")
   codeid =dd..id
end--001结束

function 关闭加载框()--002开始
  pd.dismiss();
end--002结束

function 延时(时间)--003开始
 --在调用代码之前写a
  task(时间,function()
      loadstring(执行)()
    end)
end--003结束


function 加载lua(路径)--004开始
  url = 路径
    Http.get(url,nil,"utf8",nil,function(code,html,b,c)
        if (url:find"http://") then
        p="1"
        else
        p="0"
        end

        if (url:find"https://") then
        d="1"
        else
        d="0"
        end
       pd=p..d
    if (pd:find"1") then
               if(code==-1)then--识别网络返回值为-1无网！！--开始
                       弹出消息("lua调用地址出错！")
                --
                       else
                         if (html=="Not Found") then
                         弹出消息("lua调用服务器出错 Not Found！")
                         else
                         loadstring(html)()
                         end
                       end


    else
        if (url:find".lua") then
               dofile(url)
        else
               弹出消息("非法lua调用路径！")
        end
    end
    end)
end--004结束

function 会员对话框(标题,消息,积极名称,消极名称)
    对话框()
    .设置标题(标题)
    .设置消息(消息)
    .设置积极按钮(积极名称,function()
      复制文本(android_id)
      弹出消息("已复制设备ID")
      联系QQ(20455278)
    end)
    .设置消极按钮(消极名称)
    .显示()
end


function 赋值目录(目录)--005开始
  根目录=Environment.getExternalStorageDirectory().toString()
  fzml=根目录..目录
end--005开始
--自定义函数[[------------------------]]
--字定义函数[[------------------------]]
--页面初始化


--自定义函数----
  自定义函数="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/debug_funs_os.lua"
    Http.get(自定义函数,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
       调试页数组()--导入数组
       侧边栏设置()--侧边栏设置
      end --判断网络--结束
    end)
--自定义函数----

--普通长按函数----
  普通长按="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/debug_main_tools_os.lua"
    Http.get(普通长按,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
        loadstring(html)()
      end --判断网络--结束
    end)
--普通长按函数----


--样式长按函数----
  样式长按="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/debug_style_tools_os.lua"
    Http.get(样式长按,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      end --判断网络--结束
    end)
--样式长按函数----

--样式编辑函数----
  样式编辑="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/debug_style_edit_os.lua"
    Http.get(样式编辑,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      end --判断网络--结束
    end)
--样式编辑函数----


--插件&判断函数----
  插件判断1="https://yyyp.oss-cn-beijing.aliyuncs.com/OpenSource/JsHD/2_1_9/debug_plugin_os.lua"
    Http.get(插件判断1,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      end --判断网络--结束
    end)
--插件&判断函数----


if(判断网络()==0)then
     task(2000,function()
      强制对话框("网络错误","您的网络似乎出现了问题，系统无法进行下一步操作,请切换网络后再试","退出","")
     end)
  else
end --判断网络--结束


  --判断文件是否存在
  import "java.io.*"--导入类
   file,err=io.open(pdjz)
  if err==nil then  --存在文件
   else
   io.open(pdjz, 'w') --创建文件（pd）
  end--创建结束

io.open(pdjz,"w"):write("0"):close()--写入当前状态

加载框("初始化","脚本运行中，请稍后……")
执行=[===[
   --配置加载

        if(Build.VERSION.SDK+1>=31)then
          caching_html=Environment.getExternalStorageDirectory().toString().."/JsHD/files/caching_html.data"
          caching_cookies=Environment.getExternalStorageDirectory().toString().."/JsHD/files/caching_cookies.data"
          caching_code=Environment.getExternalStorageDirectory().toString().."/JsHD/files/caching_code.data"
          xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
         else
          caching_html=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_html.data"
          caching_cookies=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_cookies.data"
          caching_code=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/files/caching_code.data"
          xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
        end
        webView.loadUrl(io.open(xml):read("*a"))--加载网页
        if(io.open(caching_code):read("*a")=="200_1")then
         if webView.url:find"^https?:" then

            --_isreplaced=true
            Http.get(webView.url,CookieManager.instance.getCookie(webView.url),"utf-8",{UserAgent=webView.settings.userAgentString},function(code,body)

               --print(CookieManager.instance.getCookie(webView.url))

                    CSP = io.open(caching_html):read("*a"):gsub([=[<meta%s-http%-equiv="Content%-Security%-Policy"%s-content="(.-)"%s*/?>]=],"<!--CSP规则已删除-->")

                    tjjs1 = CSP:match("(.+)</title>").."</title>"
                    tjjs2 = CSP:match("</title>(.+)")
                    headjs = [[
                    <script src="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/Js/1.4.4/eruda.ming.js" type="text/javascript"></script>
                    <script>eruda.init({tool: [ 'elements','console','resources','sources','snippets'],});</script>
                    <script src="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/js/loading/head-M.js" type="text/javascript"></script>
                    ]]
                    bj1 = tjjs1..headjs..tjjs2

                    sxtjdm1=bj1:match("(.+)</body>")
                    sxtjdm2=sxtjdm1.."</body>"
                    sxtjdm3=bj1:match("</body>(.+)")
                    lxjsdm=[[<script src="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/js/loading/footer-M.js" type="text/javascript"></script>]]
                    sxtjdm4=sxtjdm2.."\n"..lxjsdm.."\n"..sxtjdm3
                    ]===]..[[diyUA="]]..settings_ua..[["
                    if(diyUA~="")then
                      webView.getSettings().setUserAgentString("diyUA");
                    end
                    webView.loadDataWithBaseURL(webView.url,sxtjdm4,"text/html","]]..settings_code..[[",null)

                --刷新网页()
                --加载代码()--函数
            end)
         end
        end
   --配置加载
  关闭加载框()
]]

if(settings_pattern=="缓存")then
  table.insert(jzcs,"2")--写入加载次数
  延时(1500)
 else
  task(1500,function()
    webView.getSettings().setUserAgentString(settings_ua);
    关闭加载框()
    webView.loadUrl(io.open(xml):read("*a"))--加载网页
  end)
end


--顶栏渐变
import "android.graphics.drawable.GradientDrawable"
function 渐变(left_jb,right_jb,id)
  drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
    right_jb,--右色
    left_jb,--左色
  });
  id.setBackgroundDrawable(drawable)
end
--调用渐变函数
渐变(0xFFFF6845,0xFFFF2317,toolbarParent)
--渐变(0xFFFF6845,0xFFFF2317,zhacai)


判断加载={}

  --长按监控-----开始
  --加载外部lua
  --dofile(jsxml)
 --
  --赋值目录("/$MuMu共享文件夹/临时编辑.lua")
  --加载本地lua(fzml)


--dianji()


require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "java.lang.Math"
import "android.view.*"
import "com.androlua.Ticker"
import "android.graphics.Color"
import "android.animation.Animator"
import "android.animation.AnimatorSet"
import "android.view.animation.*"


layout={
  FrameLayout,
  layout_width="fill",
  layout_height="fill",

  --你的界面布局
  {
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    background="#00ffffff";
    id="q";
    {
      TextView,
      layout_width="fill",
      layout_height="fill",
      gravity="center",
      textSize="15sp",
      text="",
    },
  },

  --帧动画布局1
  {
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    background="#FFD61D13";
    id="qdy";
  },

  {
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    background="#FFD61D13",
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
            id="qdwb"
;
            gravity='center';--重力属性
            textColor='#ffffff';--文字颜色
            text='正在分析网页中...';--显示的文字
            textSize='15sp';--文字大小
          };
        };
      };
     --旋转结束-----------
  },--旋转图标
}--动画布局

--activity.setContentView(loadlayout(layout))
--activity.setContentView(layout)
--webView.addView(loadlayout(layout))
--drawerLayout.getParent().addView(loadlayout(layout))
--webView.addView(loadlayout(shamrock))


drawerLayout.getParent().addView(loadlayout(layout))

function CircleButton(view,InsideColor,radiu)
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end


--状态栏,导航栏背景
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFFD61D13);
activity.getWindow().setNavigationBarColor(Color.parseColor("#FFD61D13"));


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

  --        qdt.setVisibility(View.GONE)
   --       qdy.setVisibility(View.GONE)

  end)
end--揭露动画
--退出动画结束


--开始
--AppStartupAnimation(10200,1000)

 --赋值文件夹路径

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

   --赋值xml路径

--判断文件是否存在
import "java.io.*"--导入类
file,err=io.open(wybt)
if err==nil then
  --存在文件
  else
 --创建文件（index.xml）
io.open(wybt, 'w')
end--创建结束


--退出动画()

--调用渐变函数
渐变(0xFFFF6845,0xFFFF2317,qdy) --注意，这里是x不是×
渐变(0xFFFF6845,0xFFFF2317,qdt) --注意，这里是x不是×
--activity.setContentView(loadlayout(YL))
--webView.addView(loadlayout(YL))

进度条布局.setVisibility(View.VISIBLE)--显示控件
 -- onPageStarted=function(view,url,favicon)
    --网页加载
--  end,
 -- onPageFinished=function(view,url)
 --
 -- end}
--导入类
--import "android.graphics.PorterDuffColorFilter"
--import "android.graphics.PorterDuff"
进度条.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xffffff,PorterDuff.Mode.SRC_ATOP))
--效果图如下

--task(5500,function()
 --进度条布局.setVisibility(View.GONE)--隐藏控件

--end)--延迟结束

function sdys()
  加载Js([[
        document.getElementsByClassName("eruda-btn eruda-select")[0].click();
        document.getElementsByClassName("eruda-btn eruda-highlight eruda-active")[0].click();
        var mrdh = document.getElementsByClassName("eruda-parent");//默认导航
        if(mrdh[0]==undefined){}else{
        mrdh[0].click();
        };
    ]])
end

function pdsdys()
  加载Js([[
      var sdbq = document.getElementsByClassName("eruda-elements-highlight")[0].getAttribute("style")
      if(sdbq.indexOf("display: none")>-1){//未打开
        document.getElementsByClassName("eruda-btn eruda-select")[0].click();
        document.getElementsByClassName("eruda-btn eruda-highlight eruda-active")[0].click();
        var mrdh = document.getElementsByClassName("eruda-parent");//默认导航
        if(mrdh[0]==undefined){}else{
        mrdh[0].click();
        };
    }else{}
    ]])
end
function 加载中()
  task(200,function()
   bt=webView.title
   if bt=="加载完成" then
    if(判断网络()~=0)then--判断网络
     部署完成()
     task(100,function()
      task(100,function()
        sdys()
        task(100,function()
          sdys()
          task(100,function()
            sdys()
            弹出消息("加载完成！")
              task(100,function()
                pdsdys()
                退出动画()
              end)
          end)
        end)
      end)


      table.insert(jzcs,"2")--写入加载次数
      end)
    end--判断网络
     else

    加载中()

     end
  end)--延迟结束
end

task(200,function()
  bt=webView.title
   if bt=="加载完成" then
    if(判断网络()~=0)then--判断网络
      部署完成()
        task(100,function()
          task(100,function()
            sdys()
            task(100,function()
              sdys()
              task(100,function()
                sdys()
                弹出消息("加载完成！")
                  task(100,function()
                    pdsdys()
                    退出动画()
                  end)
              end)
            end)
          end)

         table.insert(jzcs,"2")--写入加载次数
        end)
     end--判断网络
     else
     加载中()
     end
end)--延迟结束


task(6000,function()
 if(jzcs[1]==nil)then
  停止加载()
  qdwb.setText("正在布局元素中...")
  end
 end)

task(15000,function()
    if(jzcs[1]==nil)then
        对话框()
     .设置标题("错误！")
     .设置消息("该网页无法调试，请重新配置新的网址再进入调试模式.")
     .设置积极按钮("确定",function()
        退出页面()
        --return (canoffline or 退出程序())--退出功能
     end)
     .设置消极按钮("")
     .setCancelable(false)--禁用返回键
     .显示()
      end

end)

目录图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/__ic_menu.png"
左图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E5%B7%A6.png"
上图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E4%B8%8A.png"
右图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E5%8F%B3.png"
下图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E4%B8%8B.png"
风车图标="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E9%A3%8E%E6%89%87-1.png"
渐变="jb_hh.jpg"
蓝紫渐变="jb_lz.jpg"
蓝紫渐变2="jb_zl.jpg"

--下面是悬浮按钮分列
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

遮罩=
{
    LinearLayout,
    layout_width="match_parent",
    layout_height="fill_parent",
    orientation="vertical",
   -- background="#7E2B2E43";
    background="#0000000";
    id="mb";
    {
        LinearLayout,
        layout_height="100dp",
        layout_width="match_parent",
        orientation="horizontal"
    },
    {
        LinearLayout,
        layout_height="match_parent",
        layout_width="match_parent",
        orientation="vertical",
        gravity="center",

        {
            LinearLayout,
            layout_height="match_parent",
            layout_width="match_parent",
            orientation="vertical",
            layout_gravity="bottom",
            gravity="bottom",
            {
                ImageView,
                layout_height="80dp",
                layout_width="80dp",
                layout_gravity="bottom|left|center_horizontal",
                id="jiaobiao",
                background="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/%E8%A7%92%E6%A0%87-%E7%A1%AE%E8%AE%A4-3.png"
            },
        },
    },
}

--webView.addView(loadlayout(遮罩))
fltBtn.parent.addView(loadlayout(遮罩))--将布局与fltBtn悬浮球同级
mb.setVisibility(View.GONE)--mb隐藏

fltBtn.addView(loadlayout({
  RelativeLayout;--相对布局
  layout_height="fill";
  layout_width="fill";
  background="#00FFFFFF";

  {
    CardView;
    layout_marginRight="4dp";
    -- background="#eeeeee";--这里设置颜色没用，因为我一会会用到圆角函数设置颜色
    layout_alignParentRight="true";
    --Visibility="visible";--创建布局后可见
    layout_width="50dp";
    id="cardview";--主按钮
    layout_alignParentBottom="true";
    layout_marginBottom="4dp";
    cardElevation="4dp";--阴影厚度
    layout_height="50dp";


    {
      ImageView;
        layout_width="fill";
        id="lzjb";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=蓝紫渐变;
    };--渐变背景--0

    {
      ImageView;
        layout_width="fill";
        id="hs";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=渐变;
    };--渐变背景--0




    {
      ImageView;
        layout_width="fill";
        id="text";
        layout_margin="0dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=目录图标;
    };--悬浮目录图标--0
  };--目录悬浮图标--0

  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";--创建布局后不可见
    --  background="#eeeeee";
    layout_alignLeft="cardview";
    layout_width="50dp";
    id="cardview1";--主按钮上面第一个按钮
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview";--位置在在主按钮上面


   {--渐变背景
      ImageView;
        layout_width="fill";
        layout_margin="-14dp";
        layout_height="fill";
        id="lzjb1";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=蓝紫渐变;
    };--渐变背景

    {
      ImageView;
        layout_width="fill";
        id="hs1";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=渐变;
    };--渐变背景--0

    {
      ImageView;
        layout_width="fill";
        id="text1";
        layout_margin="0dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=下图标;
    };--下图标

    --radius="28dp";
  };--下图标

  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    --   background="#eeeeee";
    layout_alignLeft="cardview1";
    layout_width="50dp";
    id="cardview2";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview1";
    --  radius="28dp";

    {--渐变背景
      ImageView;
        layout_width="fill";
        layout_margin="-14dp";
        layout_height="fill";
        id="lzjb2";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=蓝紫渐变;
    };--渐变背景

    {
      ImageView;
        layout_width="fill";
        id="hs2";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=渐变;
    };--渐变背景--0


    {
      ImageView;
        layout_width="fill";
        id="text2";
        layout_margin="0dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=上图标;
    };--上图标
  };--上图标

  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    -- background="#eeeeee";
    layout_alignLeft="cardview2";
    layout_width="50dp";
    id="cardview3";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview2";
    --radius="28dp";

    {--渐变背景
      ImageView;
        layout_width="fill";
        layout_margin="-14dp";
        layout_height="fill";
        id="lzjb3";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=蓝紫渐变;
    };--渐变背景

    {
      ImageView;
        layout_width="fill";
        id="hs3";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=渐变;
    };--渐变背景--0


    {
      ImageView;
        layout_width="fill";
        id="text3";
        layout_margin="0dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=右图标;
    };--右图标
  };--右图标

  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    -- background="#eeeeee";
    layout_alignLeft="cardview3";
    layout_width="50dp";
    id="cardview4";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview3";
    --layout_toLeftOf="cardview1";
    --radius="28dp";

    {--渐变背景
      ImageView;
        layout_width="fill";
        layout_margin="-14dp";
        layout_height="fill";
        id="lzjb4";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=蓝紫渐变;
    };--渐变背景

    {
      ImageView;
        layout_width="fill";
        id="hs4";
        layout_margin="-14dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=渐变;
    };--渐变背景--0



    {
      ImageView;
        layout_width="fill";
        id="text4";
        layout_margin="0dp";
        layout_height="fill";
        --background="0";
        padding="14dp";
        rotation="360";
        scaleType="fitXY";
        src=左图标;
    };--左图标
  };--左图标
}))--分列式悬浮图标

id=fltBtn;--这里把悬浮按钮名称简化为id
wi=activity.getWidth()*31/1--定义布局宽度
he=activity.getHeight()--定义屏幕高度

function CircleButton(view,InsideColor)--定义圆角
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.OVAL)
  drawable.setColor(InsideColor)
  view.setBackgroundDrawable(drawable)
  view.setElevation(4.0)
end

控件颜色=0xFFFFFFFF
CircleButton(cardview,控件颜色)
CircleButton(cardview1,控件颜色)
CircleButton(cardview2,控件颜色)
CircleButton(cardview3,控件颜色)
CircleButton(cardview4,控件颜色)


jiaobiao.onClick=function()
  角标事件()
end

cardview.onLongClick=function()--设置主悬浮球长按事件
 主悬浮球长按()
end

cardview.onClick=function()  --设置主悬浮球点击事件
  主悬浮球单击()
end


cardview1.onClick=function()--点击子类元素
 普通点击下()
end--点击子类元素


cardview2.onClick=function()--点击父类元素
 普通点击上()
end--点击父类元素


cardview3.onClick=function()--点击下一个元素
 普通点击右()
end--点击下一个元素


cardview4.onClick=function()--点击上一个元素
普通点击左()
end--点击上一个元素


webView.onLongClick=function()
    浏览器长按()
end--长按监控-----结束


  cardview1.onLongClick=function()--长按--下
    普通长按下()
  end

  cardview2.onLongClick=function()--长按--上
    普通长按上()
  end

  cardview3.onLongClick=function()--长按--右
      print("调用普通长按右()")
    普通长按右()
  end

  cardview4.onLongClick=function()--悬浮球--左键长按
    普通长按左()
  end


id.setVisibility(View.VISIBLE)--初始化设置fusionapp的悬浮球可见
linearParams = id.getLayoutParams()
linearParams.width=wi--修改fusionapp悬浮球宽
id.setLayoutParams(linearParams)
linearParams = id.getLayoutParams()
linearParams.height=wi
id.setLayoutParams(linearParams)
id.setBackgroundColor(0x00ffffff)

--下面是悬浮按钮分列

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



--动作跟踪器----
动作跟踪路径="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%BC%80%E6%BA%90/%E5%8A%A8%E4%BD%9C%E8%B7%9F%E8%B8%AA_oc_2_0.lua"
    Http.get(动作跟踪路径,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      end --判断网络--结束
    end)
--动作跟踪器----


--选色器----
选色器="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/2.0/%E9%80%89%E8%89%B2%E5%99%A82_0.lua"
    Http.get(选色器,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
       loadstring(html)()
      end --判断网络--结束
    end)
--选色器----


function Time_funtion()
  Time="https://quan.suning.com/getSysTime.do"
      Http.get(Time,nil,"utf8",nil,function(code,html,b,c)
        if(判断网络()~=0)then
          当前时间=html:match('":"(.-)","sysTime1')
          if(当前时间==nil)then
            task(1000,function ()
              Time_funtion()
            end)
           else
            当前日期=string.gsub(当前时间,"%s%d%d:%d%d:%d%d","")
            sjgl[1]=当前日期
            sjgl[2]=string.gsub(当前日期,"-","")
          end
        end --判断网络--结束
  end)
end
Time_funtion()

hy="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/hy.c"
    Http.get(hy,nil,"utf8",nil,function(code,html,b,c)
      if(判断网络()~=0)then
          hysz=切割字符串(html,"\n")
        for i=1,#hysz do
          if(hysz[i]:find(android_id))then
            qgrq=切割字符串(hysz[i],"||&&||")[2]
            sjgl[3]=qgrq
            sjgl[4]=string.gsub(qgrq,"-","")
          end
        end
      end
end)

if(settings_pattern=="缓存")then
  for i=1,20 do
    task(i*15,function()
      qdwb.setText("正在分析元素中"..tostring(i*5).."%...")
    end)

      if(i*5==100)then
          if(io.open(caching_code):read("*a")=="200_1")then
              task(1300,function ()
                判断文件(pdjz)
                io.open(pdjz,"w"):write("1"):close()--写入当前状态
                 退出动画()
                 弹出消息("加载完成！")
              end)
           else
            --print("否则")
              task(1300,function()
                 if(jzwbcs[1]==nil)then
                    判断文件(pdjz)
                    io.open(pdjz,"w"):write("1"):close()--写入当前状态
                     退出动画()
                     弹出消息("加载完成！")
                 end
              end)
          end
      end
  end
 else
  for i=1,20 do
   task(i*25,function()
      qdwb.setText("正在加载元素(常规模式)"..tostring(i*5).."%...")
    end)
  end
end