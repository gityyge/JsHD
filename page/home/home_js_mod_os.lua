---
--- File: home_js_mod_os.lua
--- Describe: 首页 - 侧边栏调试模块
--- Created by Gityyge.
---

--检查文件文件夹-------------------检查文件文件夹---------------------检查文件文件夹
 if(Build.VERSION.SDK+1>=31)then
   datawjj=Environment.getExternalStorageDirectory().toString().."/JsHD/"--赋值文件夹路径
  else
   datawjj=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName()--赋值文件夹路径
 end

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

 if(Build.VERSION.SDK+1>=31)then
   JsMod=Environment.getExternalStorageDirectory().toString().."/JsHD/JsMod.xml"--赋值xml路径
  else
   JsMod=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/JsMod.xml"--赋值xml路径
 end

--判断文件是否存在
import "java.io.*"--导入类
file,err=io.open(JsMod)
if err==nil then
  --存在文件
  else
 --创建文件（index.xml）
io.open(JsMod, 'w')
end--创建结束

--检查文件文件夹-----------------检查文件文件夹-------------------检查文件文件夹
import "android.text.Html"
import "android.content.Context"

   PrivacyPolicy_1=[[<p>  
    <strong><span style="text-decoration: underline;">&nbsp; &nbsp; 欢迎您使用JsHD调试器v2.1.9-13新增调试模块的特别功能，我们非常重视您的使用体验，所以我们将使用的一些基本方法和问题进行了汇总具体如下。<br>&nbsp; &nbsp; <span style="text-decoration: underline;"></span></strong>
    <strong><br> 1.调试模块功能介绍</strong>
    <br>&nbsp; &nbsp;<strong>机制：</strong>调试模块功能主要是在当前网页注入特殊Js代码获取网页当中的数据如浏览器性能使用情况、图片直链、视频直链、浏览器版本数据等，然后利用evaluateJavascript方法将数据返回生成列表供用户调试网页，所有数据均可自行复制。
    <br>&nbsp; &nbsp;<strong>自定义：</strong>注入的Js代码除了官方提供的默认功能外，用户还可以自定义返回数据，但是需要将返回数据的Js使用alert方法返回，多个数据用换行符隔开('\n')<br>例如：alert(document.title)  返回网页标题
<strong><br> <br>2.使用场景</strong>
<br>&nbsp; &nbsp;<strong>常用1：</strong>可利用浏览器相关数据获取当前页面的UA及cookie数据用于调试页面
<br>&nbsp; &nbsp;<strong>常用2：</strong>可获取网页中视频、图片直链列表，利用第三方下载工具批量下载，也可获取视频直链利用第云盘工具进行离线下载等
<br>&nbsp; &nbsp;<strong>常用3：</strong>可批量筛选网页中有用数据，如文字信息、磁力链接等等...
<br>&nbsp; &nbsp;<strong>更多用法：</strong>其他更多用法等你自定义开发...</p>]]
function 测试反馈(str)
  对话框()
  .设置标题("测试返回")
  .设置消息(str)
  .设置积极按钮("确定",function()
    显示消息("点击了确定")
  end)
  .设置消极按钮("取消")
  .显示()

end

function 获取字符串长度(str)
	function SubStringGetByteCount(str, index)
	  local curByte = string.byte(str, index)
	  local byteCount = 1;
	  if curByte == nil then
	    byteCount = 0
	   elseif curByte > 0 and curByte <= 127 then
	    byteCount = 1
	   elseif curByte>=192 and curByte<=223 then
	    byteCount = 2
	   elseif curByte>=224 and curByte<=239 then
	    byteCount = 3
	   elseif curByte>=240 and curByte<=247 then
	    byteCount = 4
	  end
	  return byteCount;
	end
	function SubStringGetTotalIndex(str)--获取中英混合UTF8字符串的真实字符数量
	  local curIndex = 0;
	  local i = 1;
	  local lastCount = 1;
	  repeat
	    lastCount = SubStringGetByteCount(str, i)
	    i = i + lastCount;
	    curIndex = curIndex + 1;
	  until(lastCount == 0);
	  return curIndex - 1;
	end

	return SubStringGetTotalIndex(tostring(str));
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
function MD提示(Activity,消息,type,hight)
  import "android.view.animation.*"
  SnackerBar={shouldDismiss=true}
  if(hight==2)then
    str_gravity_1="top"
    number_translationY_1=-300
    number_translationY_2=-500
   else
    str_gravity_1="bottom"
    number_translationY_1=300
    number_translationY_2=500
  end
  function Snakebar(fill)
    local w=activity.width
    local layout={
      LinearLayout,
      Gravity=str_gravity_1,
      paddingTop=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height);
      {
        CardView,
        layout_height=-2,
        layout_width=-1,
        CardElevation="0",
        CardBackgroundColor="#FF202124",
        Radius="4dp",
        layout_margin="16dp";
        {
          FrameLayout,
          layout_height="fill",
          layout_width="fill",
          id="fram",
          {
            LinearLayout,
            layout_height=-2,
            layout_width=-1,
            gravity="left|center",
            padding="16dp";
            {
              TextView,
              textColor=0xffffffff,
              textSize="14sp";
              layout_height=-2,
              layout_width=-2,
              text=fill;
              --Typeface=字体("product")
            },
          }
        }
      }
    }

    local function addView(view)
      local mLayoutParams=ViewGroup.LayoutParams
      (-1,-1)
      Activity.addView(view,mLayoutParams)
      -- left=string.sub(4,-1)
      -- right=string.sub(right_jb,4,-1)

      if(type==1)then
        渐变(0xFFF02014,0xFFF02A55,fram)
      end

    end

    local function removeView(view)
      activity.Window.DecorView.removeView(view)
    end

    function indefiniteDismiss(snackerBar)
      task(3000,function()
        if snackerBar.shouldDismiss==true then
          snackerBar:dismiss()
         else
          indefiniteDismiss(snackerBar)
        end
      end)
    end
    function SnackerBar:dismiss()
      local view=self.view
      view.animate().translationY(number_translationY_2)
      .setDuration(800)
      .setInterpolator(AccelerateDecelerateInterpolator())
      .setListener(Animator.AnimatorListener{
        onAnimationEnd=function()
          removeView(view)
        end
      }).start()
    end

    SnackerBar.__index=SnackerBar

    function SnackerBar.build()
      local mSnackerBar={}
      setmetatable(mSnackerBar,SnackerBar)
      mSnackerBar.view=loadlayout(layout)
      mSnackerBar.bckView=mSnackerBar.view
      .getChildAt(0)
      mSnackerBar.textView=mSnackerBar.bckView
      .getChildAt(0)
      local function animate(v,tx,dura)
        ValueAnimator().ofFloat({v.translationX,tx}).setDuration(dura)
        .addUpdateListener( ValueAnimator.AnimatorUpdateListener
        {
          onAnimationUpdate=function( p1)
            local f=p1.animatedValue
            v.translationX=f
            v.alpha=1-math.abs(v.translationX)/w
          end
        }).addListener(ValueAnimator.AnimatorListener{
          onAnimationEnd=function()
            if math.abs(tx)>=w then
              removeView(mSnackerBar.view)
            end
          end
        }).start()
      end
      local frx,p,v,fx=0,0,0,0
      return mSnackerBar
    end
    function SnackerBar:show()
      local view=self.view
      addView(view)
      view.translationY=number_translationY_1
      view.animate().translationY(0)
      .setInterpolator(AccelerateDecelerateInterpolator())
      .setDuration(800).start()
      indefiniteDismiss(self)
    end

    SnackerBar.build():show()
  end
  Snakebar(消息)--这是函数  开始
end--这是函数  结束

function MD_Task(Activity,消息,type,hight)
	if(MD_Task_state==1)then
	  task(2800,function ()
	  	MD_Task_state=0
	    MD提示(Activity,消息,type,hight)
	  end)
	else
      MD提示(Activity,消息,type,hight)
	end

end
import "android.graphics.Typeface"--加粗

模块名称_内置={}
模块代码_内置={}
模块名称={}
模块代码={}
Modinit_name={}
Modinit_js={}
Modinit_arr={}
Modinit_cookie={}
Modinit_div={}
Modinit_str_x=[[sysz="";var sysz_arr=[];
  Array.from(Modinit_arr).map(
  function (x){sysz_arr.push(x);if(x.id!=""){idstr="#"+x.id}else{idstr=""};
  if(x.className!=""){classstr="."+x.className}else{classstr=""};
  ElementName=x.localName+"||"+idstr+"||"+classstr;
  sysz=sysz+""+Modinit_div+"\n"});alert(sysz)]]
Modinit_str_y=[[sysz="";var sysz_arr=[];
  Array.from(Modinit_arr).map(
  function (x){sysz_arr.push(x);if(x.id!=""){idstr="#"+x.id}else{idstr=""};
  if(x.className!=""){classstr="."+x.className}else{classstr=""};
  ElementName=x.localName+"||"+idstr+"||"+classstr;
  Modinit_div});alert(sysz)]]

function Addmodinit(x,y,z,v,type)
  -- 参数1 名称
  -- 参数2 自定义Js
  -- 参数3 数组 z
  -- 参数4 属性验证 v
  -- 参数5 自定义Js-div 1为自定义div
  table.insert(Modinit_name,x)
  table.insert(Modinit_div,y)
  table.insert(Modinit_arr,z)
  table.insert(Modinit_cookie,v)
  if(type~=0)then
    if(type==2)then
      Modinit_str=y
     else
      Modinit_str=Modinit_str_y
    end
  else
    Modinit_str=Modinit_str_x
  end



  if(v~="null")then
    if(type==2)then
      table.insert(Modinit_js,y)
     else
      Modinit_str_1=Modinit_str:gsub("Modinit_arr",z):gsub("Modinit_div",y)
      --print(Modinit_str_1)
      --复制文本(Modinit_str_1)
      table.insert(Modinit_js,Modinit_str_1)
    end
   else
    table.insert(Modinit_js,y)
  end

end
Addmodinit("标题",[[alert(document.title)]],"nil","null",0)
Addmodinit("网址",[[alert(window.location.href)]],"nil","null",0)
Addmodinit("加载耗时",[[if (window.performance) {
  const info = window.performance.timing;
  str="";
  str=str+'网页重定向的耗时:'+(info.redirectEnd - info.redirectStart) + 'ms'+"\n"
  str=str+'检查本地缓存的耗时:'+(info.domainLookupStart - info.fetchStart) + 'ms'+"\n"
  str=str+'DNS查询的耗时:'+(info.domainLookupEnd - info.domainLookupStart) + 'ms'+"\n"
  str=str+'TCP连接的耗时:'+(info.connectEnd - info.connectStart) + 'ms'+"\n"
  str=str+'客户端发起请求的耗时:'+(info.responseStart - info.requestStart) + 'ms'+"\n"
  str=str+'服务端响应的耗时:'+(info.responseEnd - info.responseStart) + 'ms'+"\n"
  str=str+'渲染页面的耗时:'+(info.domComplete - info.responseEnd) + 'ms'+"\n"
  str=str+'解析DOM树耗时:'+(info.domComplete - info.domInteractive) + 'ms'+"\n"
  str=str+'白屏时间:'+(info.domLoading - info.fetchStart) + 'ms'+"\n"
  str=str+'DOMContentLoaded:'+(info.domContentLoadedEventEnd - info.fetchStart) + 'ms'+"\n"
  str=str+'Loaded:'+(info.loadEventEnd - info.connectStart) + 'ms'+"\n"
  str=str+'加载总耗时:'+(info.loadEventEnd - info.navigationStart) + 'ms'+"\n"
  alert(str);
};]],"nil","null",0)

Addmodinit("资源数(resource)",[[sysz=""
  Array.from(window.performance.getEntriesByType("resource")).map(
  function (x){sysz=sysz+x.initiatorType+": "+x.name+"\n"});alert(sysz)
]],"nil","null",0)
Addmodinit("图片资源(img)",[[x.width+"x"+x.height+": "+x.src]],"document.images","src",0)
Addmodinit("跳转链接(a)",[==[ElementName+": "+x.href]==],"document.links","href",0)
Addmodinit("视频标签(video)",[==[x.videoWidth+"x"+x.videoHeight+": "+x.currentSrc]==],'document.getElementsByTagName("video")',"currentSrc",0)
Addmodinit("音频标签(audio)",[==[ElementName+": "+x.currentSrc]==],'document.getElementsByTagName("audio")',"currentSrc",0)
Addmodinit("嵌套标签(iframe)",[[x.scrollWidth+"x"+x.scrollHeight+": "+x.src]],'document.getElementsByTagName("iframe")',"src",0)
Addmodinit("最大层级(z-index)",[[sysz="";var sysz_arr=[];var zIndex_number=[];var zIndex_element=[];
   Array.from(top.document.getElementsByTagName("*")).map(function(x) {
    var elemcss_zIndex = (function() {
      var zIndex_auto = window.getComputedStyle(x, null).zIndex;
      var zIndex_before =window.getComputedStyle(x,":before").zIndex;
      if(zIndex_before!="auto"){zIndex_number.push(zIndex_before)};
      if(zIndex_auto!="auto"){zIndex_number.push(zIndex_auto)};
    })()
  })

  function func(a,b){
    return a-b;
  }
  var zIndex_number_1=zIndex_number.sort(func)
  if(zIndex_number_1[zIndex_number_1.length-1]==undefined){zIndex_number_2=1}else{zIndex_number_2=zIndex_number_1[zIndex_number_1.length-1]};

   Array.from(top.document.getElementsByTagName("*")).map(function(x) {
    var elemcss_zIndex = (function() {
      var zIndex_auto = window.getComputedStyle(x, null).zIndex;
      var zIndex_before =window.getComputedStyle(x,":before").zIndex;
      if(zIndex_before==zIndex_number_2){zIndex_element.push(x)};
      if(zIndex_auto==zIndex_number_2){zIndex_element.push(x)};
    })()
  })

Array.from(zIndex_element).map(function(x) {
    sysz_arr.push(x);
    if(x.id!=""){idstr="#"+x.id}else{idstr=""};
  if(x.className!=""){classstr="."+x.className}else{classstr=""};
  ElementName=x.localName+"||"+idstr+"||"+classstr;
  sysz=sysz+ElementName+": "+x.scrollWidth+"x"+x.scrollHeight+"\n"
})
  alert(sysz);
]],"all","window.getComputedStyle(x, null).zIndex",2)
Addmodinit("纯文本标签(innerHTML)",[[ str="";var sysz_arr=[];
  var DocumentAll=document.body.getElementsByTagName("*")
    function AllTextDocument(x) {
       var Data_Text= new Array();
       for(var m=0;m<x.length;m++){
        if(x[m].innerHTML.indexOf("<")<=-1 &&
          x[m].innerHTML.indexOf(">")<=-1 &&
          x[m].innerHTML!="" &&
          x[m].localName!="script" &&
          x[m].localName!="style"){
         Data_Text.push(x[m])
        }
       };
       sysz_arr=Data_Text;
       return Data_Text;
    };

Array.from(AllTextDocument(DocumentAll)).map(function(x) {
  if(x.id!=""){idstr="#"+x.id}else{idstr=""};
  if(x.className!=""){classstr="."+x.className}else{classstr=""};
  ElementName=x.localName+"||"+idstr+"||"+classstr;
  str=str+ElementName+": "+x.innerText.replace(/\n/g,"").replace(/\t/g,"").replace(/\r/g,"").replace(/ /g,"").replace("&nbsp;","")+"\n";
});alert(str)]],"all",[[innerHTML]],2)
Addmodinit("Js资源文件",[[sysz=""
Array.from(syzybq_js).map(
function (x){sysz=sysz+x+"\n"});alert(sysz);]],"nil","null",0)
Addmodinit("Css资源文件",[[sysz=""
Array.from(syzybq_css).map(
function (x){sysz=sysz+x+"\n"});alert(sysz);]],"nil","null",0)
Addmodinit("Head内标签",[[sysz="";var sysz_arr=[];
  Array.from(document.head.getElementsByTagName("*")).map(
  function (x){sysz_arr.push(x);if(x.id!=""){idstr="#"+x.id}else{idstr=""};
  if(x.className!=""){classstr="."+x.className}else{classstr=""};
  ElementName=x.localName+"||"+idstr+"||"+classstr;
  attributes_str="";
  for (var i = 0; i < x.attributes.length; i++) {
    attributes_str=attributes_str+x.attributes[i].localName+"=\""+x.attributes[i].value+"\"; "
  }
  sysz=sysz+""+ElementName+": "+attributes_str+"\n"});alert(sysz);]],[[document.head.getElementsByTagName("*")]],"null",0)
Addmodinit("Body内标签",[[ElementName+": "+x.scrollWidth+"x"+x.scrollHeight]],[[document.body.getElementsByTagName("*")]],"innerHTML",0)
Addmodinit("函数统计",[[x]],"top.Object.keys(document.defaultView)","2222",0)
Addmodinit("UA(UserAgent)",[[alert(navigator.userAgent)]],"nil","null",0)
Addmodinit("Cookies",[[sysz="";if(document.cookie==""){cookie_str="无"}else{cookie_str=document.cookie};
  var str=str+"Cookies："+cookie_str+"\n";
  alert(str);]],"all","null",2)
  -- Addmodinit("标题",[[alert(document.title)]])
  -- Addmodinit("标题",[[alert(document.title)]])
  -- Addmodinit("标题",[[alert(document.title)]])


  function 写入内置模块(x,y)
    table.insert(模块名称,x)
    table.insert(模块代码,y)
    table.insert(模块名称_内置,x)
    table.insert(模块代码_内置,y)
  end
  写入内置模块('网页基本信息',[[var str="";
  var str=str+"标题："+document.title+"\n";
  var str=str+"网址："+window.location.href+"\n";
  var str=str+"加载耗时："+(window.performance.timing.loadEventEnd - window.performance.timing.navigationStart)+"ms\n";
  var str=str+"资源数(resource)："+window.performance.getEntriesByType("resource").length+"\n";
  var str=str+"图片资源(img)："+document.images.length+"\n";
  var str=str+"跳转链接(a)："+document.links.length+"\n";
  var str=str+"视频标签(video)："+document.getElementsByTagName("video").length+"\n";
  var str=str+"音频标签(audio)："+document.getElementsByTagName("audio").length+"\n";
  var str=str+"嵌套标签(iframe)："+document.getElementsByTagName("iframe").length+"\n";
  var zIndex_number=[];
   Array.from(top.document.getElementsByTagName("*")).map(function(x) {
    var elemcss_zIndex = (function() {
      var zIndex_auto = window.getComputedStyle(x, null).zIndex;
      var zIndex_before =window.getComputedStyle(x,":before").zIndex;
      if(zIndex_before!="auto"){zIndex_number.push(zIndex_before)};
      if(zIndex_auto!="auto"){zIndex_number.push(zIndex_auto)};
    })()
  })


  function func(a,b){
    return a-b;
  }
  var zIndex_number_1=zIndex_number.sort(func)
  if(zIndex_number_1[zIndex_number_1.length-1]==undefined){zIndex_number_2=1}else{zIndex_number_2=zIndex_number_1[zIndex_number_1.length-1]}

  var str=str+"最大层级(z-index)："+zIndex_number_2+"\n";
  var DocumentAll=document.body.getElementsByTagName("*")
    function AllTextDocument(x) {
       var Data_Text= new Array();
       for(var m=0;m<x.length;m++){
        if(x[m].innerHTML.indexOf("<")<=-1 && 
          x[m].innerHTML.indexOf(">")<=-1 && 
          x[m].innerHTML!="" &&
          x[m].localName!="script" &&
          x[m].localName!="style"){
         Data_Text.push(x[m])
        }
       }
       return Data_Text;
    }
  var str=str+"纯文本标签(innerHTML)："+AllTextDocument(DocumentAll).length+"\n";
  var syzybq_js=[]
  var syzybq_css=[]
    var sysz=""
    Array.from(window.performance.getEntriesByType("resource")).map(
    function (x){
      var hzjq=x.name.replace(/.+\./,"")
        if(x.initiatorType=="script"){
        if(hzjq=="js"){
             syzybq_js.push(x.name);
            }else{
             if(hzjq.indexOf("?")>-1){ if(hzjq.split("?")[0]=="js"){syzybq_js.push(x.name.split(hzjq)[0]+"js");}}
          } 
        } 

        if(x.initiatorType=="link"){
          if(hzjq=="js"){
             syzybq_js.push(x.name);
            }else{
             if(hzjq.indexOf("?")>-1){ if(hzjq.split("?")[0]=="js"){syzybq_js.push(x.name.split(hzjq)[0]+"js");}}
          }
        }

        if(x.initiatorType=="link"){
        if(hzjq=="css"){
           syzybq_css.push(x.name);
          }else{
           if(hzjq.indexOf("?")>-1){ if(hzjq.split("?")[0]=="css"){syzybq_css.push(x.name.split(hzjq)[0]+"css");}}
        }
        }    
    });
  var str=str+"Js资源文件："+syzybq_js.length+"\n";
  var str=str+"Css资源文件："+syzybq_css.length+"\n";
  var str=str+"Head内标签："+document.head.getElementsByTagName("*").length+"\n";
  var str=str+"Body内标签："+document.body.getElementsByTagName("*").length+"\n";
  var str=str+"函数统计："+top.Object.keys(document.defaultView).length+"\n";
  var str=str+"UA(UserAgent)："+navigator.userAgent+"\n";
  if(document.cookie==""){cookie_str="无"}else{cookie_str=document.cookie};
  var str=str+"Cookies："+cookie_str+"\n";
  alert(str);]]) 
  写入内置模块('获取所有图片',[[str="";
  Array.from(document.images).map(function (x){str=str+x.src+"\n";});
  alert(str);]]) 
  写入内置模块('Cookies列表',[[str="";
  var aCookie = document.cookie.split("; ");
  Array.from(aCookie).map(function (x){str=str+x+"\n";});
  alert(str);]]) 
  写入内置模块('获取媒体资源',[[]])  
  写入内置模块('获取所有磁力',[[var JsHDStr="";
   strarr=document.body.outerHTML.match(/magnet:\?xt=urn:btih:[0-9a-fA-F]{40,}/g);//这里面是正则 末尾的g表示截取多次，不加则只会截取1次
   if(strarr!=null){
    for (var i = 0; i < strarr.length; i++) {JsHDStr=JsHDStr+strarr[i]+"\n"};
   };
   //弹出所有截取数据
   alert(JsHDStr);]]) 
  写入内置模块('获取所有Class名',[[var JsHDStr="";
    //从网页源码里面截取class="开头,并且"结尾的字符串
  strarr=document.body.outerHTML.match(/(?<=class=\")[\s\S]*?(?=\")/g);
  for (var i = 0; i < strarr.length; i++) {
    if(strarr[i].replace(/\n/g,"").replace(/  /g,"")!=""){JsHDStr=JsHDStr+strarr[i].replace(/\n/g,"").replace(/  /g,"")+"\n"}//获取元素的class名
    //过滤换行和空白
  };
  //弹出所有截取数据
  alert(JsHDStr);]]) 
  写入内置模块('获取浏览器UA',[[alert(navigator.userAgent)]]) 



  function 写入模块(x,y)
    table.insert(模块名称,x)--写入名称
    table.insert(模块代码,y)--写入事件
  end

  function 更新模块文件(type,number)
    --type==1 默认 初始化加载
    --type==2 删除 删除模块
    --number==只在删除时有用
    JsModNew=""
    JsMod_str=io.open(JsMod):read("*a")
    if(JsMod_str~="")and(JsMod_str:find"%$%$%$")then
      if(JsMod_str:find"|||")then
        JsMod_arr_1=切割字符串(JsMod_str,"|||")
        for i=1,#JsMod_arr_1 do
          if(JsMod_arr_1[i]~="")then
            JsMod_arr_2=切割字符串(JsMod_arr_1[i],"$$$")
            if(type==1)then
              写入模块(JsMod_arr_2[1],JsMod_arr_2[2])
            end
            if(type==2)then
              if(模块名称[number].."$$$"..模块代码[number]~=JsMod_arr_2[1].."$$$"..JsMod_arr_2[2])then
                JsModNew=JsModNew..JsMod_arr_2[1].."$$$"..JsMod_arr_2[2].."|||"
              end
            end
          end
        end
       else
        JsMod_arr_1=切割字符串(JsMod_str,"$$$")
        写入模块(JsMod_arr_1[1],JsMod_arr_1[2])
      end
    end

    if(type==2)then
    	table.remove(模块名称,number)
    	table.remove(模块代码,number)
      io.open(JsMod,"w"):write(JsModNew):close()
    end
  end

  更新模块文件(1)
  写入模块("自定义...","")

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

	function 弹出浏览器(url,type,text_1,text_2)
		--type=1 为嗅探模式
		--type=2 为查阅模式
	  layout={
	      FrameLayout,
	      layout_width="fill",
	      layout_height="fill",
	      id="wzparent",
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
	      {
	        LinearLayout,
	        layout_width="fill",
	        layout_height="fill",
	        background="#00000000";
	        id="top_layouty";
	      },
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
	                text=text_1;--显示的文字
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

	    srclist={}
	    进度条布局.setVisibility(View.VISIBLE)--显示控件
	    进度条.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xffffff,PorterDuff.Mode.SRC_ATOP))
	    wz.getSettings().setJavaScriptEnabled(true)--设置支持JS
	    wz.getSettings().setUseWideViewPort(true);
      --wz.getSettings().setUserAgentString("Mozilla/5.0 (Linux; Android 11; RMX3161 Build/RKQ1.201217.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/76.0.3809.89 Mobile Safari/537.36 T7/12.16 SearchCraft/3.9.1 (Baidu; P1 11)")
      dialog2.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
      dialog2.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);



	    wz.onLongClick=function()--浏览器长按
		    if(type==1)then
		        qgfz_sj={}
		        if(#srclist~=0)then
		          for i=1,#srclist do table.insert(qgfz_sj,"") end
		          模块结果弹窗("返回"..#srclist.."条数据",srclist,qgfz_sj,"复制",i)
		         else
               MD_Task(wz.getParent().getParent(),"暂未嗅探到媒体资源",0,1) 
		        end
		    end

		    if(type==2)then

		    end
	    end--长按监控-----结束
	     
	    task(500,function ()
	      wz.loadUrl(url)
	    end)
	     
	     task(200,function ()
	     	if(type==1)then
	     	 MD_Task_state=1
	       MD提示(wzparent,text_2,0,2)
	      end
	     end)
	     
	    task(1000,function()
	      退出动画() 
	    end)
	    m3u8_tips=0
	    if(type==1)then
		    wz.setWebViewClient{
		      onLoadResource=function(view,url)
		        if(url:find"%.m3u8")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.m3u8)",0,1) m3u8_tips=1 end
		        if(url:find"%.mp4")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.mp4)",0,1) end
		        if(url:find"%.ts")then 
		          table.insert(srclist,url) 
		          if(m3u8_tips~=1)then
		           MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.tc)",0,1) 
		          end
		        end

		        if(url:find"%.flv")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.flv)",0,1) end
		        if(url:find"%.avi")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.avi)",0,1) end
		        if(url:find"%.mp3")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.mp3)",0,1) end
		        if(url:find"%.wav")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.wav)",0,1) end
		        if(url:find"%.flac")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.flac)",0,1) end
		        if(url:find"%.ape")then table.insert(srclist,url) MD_Task(wz.getParent().getParent(),"嗅探到媒体资源(.ape)",0,1) end
		      end,
		    }
	    end
      if(type==2)then
        wz.setWebViewClient{
          onPageFinished=function(view,url)
              remove_ad=[[arr=document.getElementById("results").childNodes
                ad=document.getElementsByClassName("c-padding-left-s cpc-adtext")
                ad_logo=document.getElementsByClassName("c-padding-left-m cpc-adtext")
                Array.from(arr).map(function(v) {
                  for (var i = 0; i < ad.length; i++) {
                    if(v.contains(ad[i])==true){
                     v.setAttribute('style',"display:none")
                    }
                  };
                  for (var i = 0; i < ad_logo.length; i++) {
                    if(v.contains(ad_logo[i])==true){
                     v.setAttribute('style',"display:none")
                    }
                  }
                });

                a=document.getElementsByClassName("ad-alert-info")
                Array.from(a).map(function(v) {
                  v.childNodes[1].setAttribute('style',"display:none")
                  v.childNodes[0].innerHTML="本页搜索关键词由JsHD调试器app提供 - 夸克搜索引擎"
                });


                var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver
                var target = document.getElementById("results");

                var observer = new MutationObserver(function(mutations) {
                mutations.forEach(function(mutation) { 
                  if(mutation.addedNodes[0]!=undefined && mutation.addedNodes[0].nodeName!="#text"){
                    add=[]
                    Add_childNodes=mutation.addedNodes[0].getElementsByTagName("*")
                    Array.from(Add_childNodes).map(function(v) {
                     if(v.innerHTML=="广告"){add.push(mutation.addedNodes[0]);}
                     if(v.innerHTML=="投诉"){v.setAttribute('style',"display:none");}
                     if(v.innerHTML=="本页搜索结果包含商业推广，请注意可能的风险。"){v.innerHTML="本页搜索关键词由JsHD调试器app提供 - 夸克搜索引擎";}
                    });
                    for (var i = 0; i < add.length; i++) {add[i].remove();}
                  }
                }); 
                }); 
                var config = { attributes: true, childList: true, characterData: true }
                observer.observe(target, config);
                ]]
                wz.evaluateJavascript(remove_ad,nil) 
          end
        }
      end
	end
  function 模块编辑(number)
    --输入对话框（自定义布局对话框，带输入框的）
    if(number==nil)then
      text_str_1=""
      text_str_2=""
      text_str_3="新建模块"
     else
      text_str_1=模块名称[number]
      text_str_2=模块代码[number]
      text_str_3="编辑模块"
    end
    InputLayout={
      LinearLayout;
      orientation="vertical";--重力属性
      Focusable=true,--可聚焦
      FocusableInTouchMode=true,--可聚焦在触摸模式下，可变色
      {
        TextView;--文本控件
        id="Text",
        layout_width='80%w';--文本宽度
        layout_marginTop='10dp';--布局顶距
        layout_marginLeft="25dp";
        layout_marginRight="25dp";
        gravity="center|left";
        text="模块名称：";--显示的文字
        textSize='15sp';--文字大小
      };
      {
       LinearLayout;
        layout_gravity="center",
        layout_width='76%w';--编辑框宽度
        gravity="center";
        {
          EditText;--编辑框控件
          id="edit";
          layout_marginTop='5dp';--布局顶距
          layout_gravity="center",--重力属性
          layout_width='76%w';--编辑框宽度
          Hint='请输入...';--设置编辑框为空时的提示文字
          text=text_str_1;
        };
      };

      {
        TextView;--文本控件
        id="Text_2",
        layout_width='80%w';--文本宽度
        layout_marginTop='10dp';--布局顶距
        layout_marginLeft="25dp";
        layout_marginRight="25dp";
        gravity="center|left";
        text="模块代码：";--显示的文字
        textSize='15sp';--文字大小
      };
      {
       LinearLayout;
        layout_gravity="center",
        layout_width='76%w';--编辑框宽度
        gravity="center";
        {
          EditText;--编辑框控件
          id="edit_2";
          layout_width='76%w';--编辑框宽度
          layout_marginTop='5dp';--布局顶距
          layout_gravity="center",--重力属性
          Hint='请输入...';--设置编辑框为空时的提示文字
          text=text_str_2;
        }; 
      };
    };

    DlogEdit=AlertDialog.Builder(this)
    DlogEdit.setTitle(text_str_3)--设置标题
    DlogEdit.setView(loadlayout(InputLayout))--设置布局
    DlogEdit.setPositiveButton("保存",nil)--设置积极按钮

    if(number~=nil)and(number>#模块名称_内置)then
      DlogEdit.setNeutralButton("删除",function(v)
      	加载对话框("请稍等","模块删除中....",500,"删除完成！")
        更新模块文件(2,number)
        task(500,function()
			    模块列表弹窗("模块列表",模块名称,模块代码)
			    设置对话框(DialogItems,0.86)
        end)

      end)
    end


    DlogEdit.setNegativeButton("取消",function (v)
      模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
      设置对话框(DialogItems,0.86)
    end)--设置消极按钮
    DlogEditShow=DlogEdit.show()--显示弹窗
    设置对话框(DlogEditShow,0.86)
    if(number~=nil)and(number>#模块名称_内置)then
      DlogEditShow.getButton(DlogEditShow.BUTTON_NEUTRAL).setTextColor(0xFFFF1724)--设置中立按钮颜色
    end

    DlogEditShow.getButton(Dialog.BUTTON_POSITIVE).onClick=function()--积极按钮事件
      
      if(number==nil)then
        if(edit.Text=="")then
          edit.setError("模块名称不能为空")
        end
        if(edit.Text=="")then edit_str_1="新建模块" else edit_str_1=edit.Text end
        if(edit_2.Text:find"alert%(")then 
          edit_str_2=edit_2.Text 
          JsMod_str=io.open(JsMod):read("*a")
          edit_str_3=JsMod_str..edit_str_1.."$$$"..edit_str_2.."|||"
          io.open(JsMod,"w"):write(edit_str_3):close()
          if(edit.Text~="") and (获取字符串长度(edit.Text)<=10) then
	          DlogEditShow.dismiss();
		      	加载对话框("请稍等","添加模块中....",500,"添加完成！")
		        task(500,function()
		        	模块名称[#模块名称]=edit_str_1
		        	模块代码[#模块代码]=edit_str_2
		        	写入模块("自定义...","")
					    模块列表弹窗("模块列表",模块名称,模块代码)
					    设置对话框(DialogItems,0.86)
		        end)
	        end
         else
          edit_2.setError("模块代码需要包含alert()方法")
        end
        --写入标题
        
        else
        模块名称[number]=edit.Text
        模块代码[number]=edit_2.Text
        模块列表弹窗("模块列表",模块名称,模块代码)
        设置对话框(DialogItems,0.86)
      end
    end

    import "android.view.View$OnFocusChangeListener"
		edit.addTextChangedListener{
		  onTextChanged=function(s)
	      if(获取字符串长度(s)>10)then
	      	edit.setError("字符不能超过10个("..获取字符串长度(s)..")")
	      end
		  end
		}

    edit.setOnFocusChangeListener(OnFocusChangeListener{ 
      onFocusChange=function(v,hasFocus)
        if hasFocus then
          Text.setTextColor(0xFD009688)--当编辑框被点击时修改标题下的文本颜色
          Text_2.setTextColor(0xFF757575)--当编辑框被点击时修改标题下的文本颜色
        end
      end})

    edit_2.setOnFocusChangeListener(OnFocusChangeListener{ 
      onFocusChange=function(v,hasFocus)
        if hasFocus then
          Text_2.setTextColor(0xFD009688)--当编辑框被点击时修改标题下的文本颜色
          Text.setTextColor(0xFF757575)
        end
      end})
  end

  function 模块结果弹窗(标题,列表数组,单击事件数组,长按事件,number)
      layout={
        LinearLayout;
        layout_height="fill";
        layout_width="fill";
        background="#ffffffff";
        {
          ListView;
          id="list";
          layout_height="fill";
          layout_width="fill";
          dividerHeight="0";
          layout_marginTop="7dp";
        }
      }
      if(index_remove[#index_remove]=="网页列表元素||1")then PositiveStr="抓取全部" else PositiveStr="复制全部" end
      gjdlog=AlertDialog.Builder(this)
      gjdlog.setTitle(标题)
      gjdlog.setView(loadlayout(layout))
      gjdlog.setPositiveButton(PositiveStr,{onClick=function(v)
      js_str_1=[==[var message="";get_message(Data_Data_All[indexNoti[indexNoti.length-1]],]==]..(1)..[==[,3,2,indexNoti[indexNoti.length-1]);message=message;alert(message)]==]
      str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
       if(index_remove[#index_remove]=="网页列表元素||1")then
            AlertItems=AlertDialog.Builder(this)
            AlertItems.setTitle("选择类别")
            AlertItems.setItems({"源码正则抓取(需Get)","Js抓取返回(需浏览器环境)"},{onClick=function(l,q) 

            end})
            DialogItems=AlertItems.show()
            设置对话框(DialogItems,0.86)

        else  
        url=""  for i=1,#列表数组 do url=url..列表数组[i].."\n" end   复制文本(url)  弹出消息("已复制所有链接") 
       end  
      end})
      gjdlog.setNegativeButton("返回",{onClick=function(v) 
        str_remove=切割字符串(index_remove[#index_remove],"||")
        str_remove_1=""

        for i=1, #(模块名称) do
          if(index_remove[#index_remove]==模块名称[i])then
            模块列表弹窗("模块列表",模块名称,模块代码)
            设置对话框(DialogItems,0.86) 
          end
        end

        for i=1, #(Modinit_name) do
          if(index_remove[#index_remove]=="网页基本信息||"..Modinit_name[i])then
            模块数据转换(模块代码,1,1)--1表示打开网页基本信息(参数2)
          end
        end


        for i=1,#str_remove do
          if(i~=#str_remove)then
            if(i==#str_remove-1)then
              str_remove_1=str_remove_1..str_remove[i]
             else
              str_remove_1=str_remove_1..str_remove[i].."||"
            end
            
          end
        end
        if(index_remove[#index_remove]=="网页列表元素||1" or index_remove[#index_remove]=="网页列表元素||2")then
          index_remove[#index_remove]=""
          模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
          设置对话框(DialogItems,0.86)
        end
        index_remove[#index_remove]=str_remove_1
        -- loadstring(index_remove[#index_remove-1])()
        -- if(type==1)then

        -- end      
        -- if(type==2)then
        --   模块列表弹窗("模块列表",模块名称,模块代码)
        --   设置对话框(DialogItems,0.86) 
        -- end      
 
      end})
      gjdlog.setNeutralButton("编辑模块",nil)
      gjdlog2=gjdlog.show()
      index_remove_2=index_remove[#index_remove]
      --MD_Task(list_parentNode,"暂未嗅探到媒体资源",0,1) 
      if(index_remove_2:find"网页基本信息||资源数") or 
        (index_remove_2:find"网页基本信息||图片资源") or 
        (index_remove_2:find"网页基本信息||跳转链接") or 
        (index_remove_2:find"网页基本信息||纯文本标签") or 
        (index_remove_2:find"网页基本信息||函数统计") or 
        (index_remove_2:find"网页基本信息||资源文件") or 
        (index_remove_2:find"网页基本信息||内标签")then
        弹出消息("已去除重复列表！")
      end
      gjdlog2.getButton(gjdlog2.BUTTON_NEUTRAL).setTextColor(0xFFFF9517)--设置中立按钮颜色
      gjdlog2.getButton(gjdlog2.BUTTON_NEUTRAL).onClick=function()--编辑模块
        index_remove_2=index_remove[#index_remove]
        if(index_remove_2=="网页基本信息" or index_remove_2:find"网页基本信息||" or index_remove_2:find"网页列表元素")then
          弹出消息("当前模块不可编辑查看！")
         else
          模块编辑(number)
          gjdlog2.dismiss();
        end
      end

      if(#列表数组>13)then
        params = gjdlog2.getWindow().getAttributes();
        params.width = activity.getWidth()*0.86;
        params.height = activity.getHeight()*0.85;
        gjdlog2.getWindow().setAttributes(params);
        弹窗圆角(gjdlog2.getWindow(),0xFFFFFFFF)
       else
        params = gjdlog2.getWindow().getAttributes();
        params.width = activity.getWidth()*0.86;
        gjdlog2.getWindow().setAttributes(params);
        弹窗圆角(gjdlog2.getWindow(),0xFFFFFFFF)
      end

      item={
        LinearLayout;
        layout_height="fill";
        layout_width="fill";
        {
          TextView;
          id="xvhao";
          layout_height="fill";
          layout_width="fill";
          layout_marginLeft="25dp";
          layout_marginRight="25dp";
          layout_marginTop="5dp";
          layout_marginBottom="5dp";
          textSize="15sp";
          textColor="#FF000000",
          gravity="center|left";
        }
      }
      adapter=LuaAdapter(activity,item)
      list.setAdapter(adapter)

      for i=1,#(列表数组) do
      	pointer=index_remove[#index_remove]
      	--adapter.add{xvhao={text=tostring(列表数组[i])}}
        -- -- adapter.add{xvhao={text=tostring(列表数组[i])}}
        -- --<small> 小字符
        -- --<b> 加粗
        -- --color=#008000 绿色
        -- --<big>标签是比自己周围的字体大上一号的标签。
        -- --#828282 灰色
        -- #c83b40 红色
				-- 视频标签(video)
				-- 音频标签(audio)
				-- 嵌套标签(iframe)
				-- 最大层级(z-index)
				-- 纯文本标签(innerHTML)
				-- Js资源文件
				-- Css资源文件
				-- Head内标签
				-- Body内标签
				-- 函数统计
				-- UA(UserAgent)
				-- Cookies
        if(pointer=="网页基本信息")then
          ListStr_1=切割字符串(列表数组[i],"：")
          if(ListStr_1[2]=="0" or ListStr_1[2]=="无")then color_2="#828282" else color_2="2" end 
          adapter.add{xvhao={text=Html.fromHtml(ListStr_1[1].."：".."<font color="..color_2..">"..ListStr_1[2].."<font/>")}}
         else
           if(pointer=="网页基本信息||资源数(resource)" or 
              pointer=="网页基本信息||图片资源(img)" or
              pointer=="网页基本信息||视频标签(video)" or 
              pointer=="网页基本信息||嵌套标签(iframe)")then
            	ListStr_1=切割字符串(列表数组[i],": ")
           	if(ListStr_1[2]=="")then color_2="#828282" ListStr_1_text2="null" else color_2="2" ListStr_1_text2=ListStr_1[2] end
           	adapter.add{xvhao={text=Html.fromHtml("<font color=#c83b40>"..ListStr_1[1]..": <font/>".."<font color="..color_2..">"..ListStr_1_text2.."<font/>")}}
           end
           if(pointer=="网页基本信息||跳转链接(a)") or 
           	 (pointer=="网页基本信息||音频标签(audio)") or
           	 (pointer=="网页基本信息||最大层级(z-index)") or
           	 (pointer=="网页基本信息||纯文本标签(innerHTML)") or
             (pointer=="网页基本信息||Head内标签") or
             (pointer=="网页基本信息||Body内标签") or
             (pointer:find"网页列表元素") then

              if(pointer=="网页列表元素||1")then
                ListStr_0=string.gsub(列表数组[i],[[|!!!|]],"<br/>"):gsub([[|$%-$|]],'|')
                ListStr_1=切割字符串(ListStr_0,"<br/>")
                function IsOuNumber(num)
                    local num1,num2=math.modf(num/2)
                    if(num2==0)then
                        return true
                    else
                        return false
                    end
                end
                fromHtml_str=""
                for i=1,#ListStr_1 do
                  from_str=切割字符串(ListStr_1[i],"|!-!|")
                   if(from_str[1]~=nil and from_str[1]~="")then fromHtml_str=fromHtml_str.."<font color=#d22730>"..from_str[1]..": <font/>" end
                    if(from_str[2]~=nil and from_str[2]~="")then
                     if(i==#ListStr_1-1 and #ListStr_1<=3)then fromHtml_str=fromHtml_str.."<font>"..from_str[2].."<font/>"  else fromHtml_str=fromHtml_str.."<font>"..from_str[2].."<font/><br/>" end
                    end
                end
                adapter.add{xvhao={text=Html.fromHtml("<small size=0.5 ><small/>"..fromHtml_str)}}
              end

              if(pointer=="网页列表元素||2")then
                  ListStr_0=string.gsub(列表数组[i],[[|!%-!|]],": ")
                  ListStr_1=切割字符串(ListStr_0,"[")
                  ListStr_2=切割字符串(ListStr_1[2],"]")
                  ListStr_3=切割字符串(ListStr_2[1],"||")
                fromHtml_str=""
                fromHtml_str=fromHtml_str.."<font color=#d22730>"..string.sub(切割字符串(ListStr_1[1],"-")[1],1,-2)..切割字符串(ListStr_1[1],"-")[2]..".<font/>"
                fromHtml_str=fromHtml_str.."<font color=#9f5099>"..ListStr_3[1].."<font/>"
                fromHtml_str=fromHtml_str.."<font color=#2121a8>"..ListStr_3[2].."<font/>"
                fromHtml_str=fromHtml_str.."<font color=#ab652c>"..ListStr_3[3].."<font/>"
                fromHtml_str=fromHtml_str.."<font>"..ListStr_2[2].."<font/>"
                adapter.add{xvhao={text=Html.fromHtml("<small size=0.5 ><small/>"..fromHtml_str)}}

              end

              if(pointer=="网页列表元素")then
                ListStr_0=切割字符串(列表数组[i],"|d$b|")
                ListStr_1=切割字符串(ListStr_0[1],": ")
                if(ListStr_1[2]=="")then color_2="#828282" ListStr_1_text2="null" else color_2="#d22730" ListStr_1_text2=ListStr_1[2] end
                ListStr_2=切割字符串(ListStr_1[1],"||")

                ListStr_3=string.gsub(ListStr_0[2],[[|!!!|]],"<br/>"):gsub([[|!%-!|]],': '):gsub([[|$%-$|]],'|')
                adapter.add{xvhao={text=Html.fromHtml("<font color=#9f5099>"..ListStr_2[1].."<font/><font color=#2121a8>"..ListStr_2[2].."<font/><font color=#ab652c>"..ListStr_2[3].."<font/><br><font color="..color_2..">"..ListStr_1[2].."<font/><br><small color=#d22730 size=0.5 >"..ListStr_3.."<small/>")}}
               else
                if(pointer~="网页列表元素||1" and pointer~="网页列表元素||2")then
                  ListStr_1=切割字符串(列表数组[i],": ")
                  if(ListStr_1[2]=="")then color_2="#828282" ListStr_1_text2="null" else color_2="2" ListStr_1_text2=ListStr_1[2] end
                  ListStr_2=切割字符串(ListStr_1[1],"||")
               	  adapter.add{xvhao={text=Html.fromHtml("<font color=#9f5099>"..ListStr_2[1].."<font/><font color=#2121a8>"..ListStr_2[2].."<font/><font color=#ab652c>"..ListStr_2[3].."<font/>: "..ListStr_1[2])}}
                end
              end
           end
           if(pointer=="网页基本信息||标题") or
             (pointer=="网页基本信息||网址") or
             (pointer=="网页基本信息||加载耗时") or
             (pointer=="网页基本信息||Js资源文件") or
             (pointer=="网页基本信息||Css资源文件") or
             (pointer=="网页基本信息||函数统计") or
             (pointer=="网页基本信息||UA(UserAgent)") or
             (pointer=="网页基本信息||Cookies")then
             adapter.add{xvhao={text=tostring(列表数组[i])}}
           end

           if(pointer:find"网页基本信息") or (pointer:find"网页列表元素")then else adapter.add{xvhao={text=tostring(列表数组[i])}} end
           --adapter.add{xvhao={text=Html.fromHtml("<font color=#9f5099>div<font/><font color=#2121a8>#MathJax_Message<font/><font color=#ab652c>.toolbar-container<font/>"..tostring(列表数组[i]))}}
        end
        --adapter.add{xvhao={text=Html.fromHtml("<strong>机制：</strong>调试模块功能主要是在当前网页注入特")}}
      end

			-- function 颜色字体(文本,颜色)
			--   import "android.text.SpannableString"
			--   import "android.text.style.ForegroundColorSpan"
			--   import "android.text.Spannable"
			--   local sp = SpannableString(文本)
			--   sp.setSpan(ForegroundColorSpan(颜色),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
			--   return sp
			-- end

      list.onItemClick=function(parent,v,pos,id)--[[]]
          ListStr_1=切割字符串(列表数组[pos+1],"：")
					for i=1,#Modinit_name do
	          if(index_remove[#index_remove]=="网页基本信息||"..Modinit_name[i])then
              import "android.content.*"
              activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(列表数组[pos+1])
              弹出消息("已复制内容")
	          end
					end

          if(index_remove[#index_remove]=="网页列表元素||2")then
           -- index_remove[#index_remove]="网页列表元素||3"console.log(Data_JsRE_Arr)
                    --js_str_1=[==[alert(Data_JsRE_Arr[0])]==]
                    js_str_1=[==[alert(Data_JsRE_Arr[0][]==]..(pos)..[==[])]==]
                    str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
                     webView.evaluateJavascript(str_js,function(g)
                      --a_a=string.sub(g,2,-2)
                      a_a=string.gsub(string.sub(g,2,-2),[[\"]],"\""):gsub([[\\]],'\\'):gsub([[syzybq.push]],'alert')
                      EditStr={{},{},{},{},{},{}}--[1=Js模式(代码-内容-提示);2=正则模式;3=？]
                      index_top=1
                      index_return={}

                      EditStr[1][1]=a_a
                      --a_a=string.gsub(string.sub(g,2,-2),[[\u003C]],"<"):gsub([[\\]],'\\')
                      js_str_1=[==[alert(Data_REGEX_Arr[0][]==]..(pos)..[==[])]==]
                      str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
                       webView.evaluateJavascript(str_js,function(q)

                            b_b=string.gsub(string.sub(q,2,-2),[[\u003C]],"<"):gsub([[\\]],'\\')
                            b_b_0=切割字符串(b_b,"|!+!|")
                            b_b_js="(?<="..b_b_0[1]..b_b_0[3]..")[^<>{}]*?(?="..b_b_0[4].."[^]*?"..b_b_0[2]..")"
                            -- b_b_0=string.gsub(b_b,[[-]],"%%-")
                            -- b_b_2=切割字符串(b_b_0,"[^<>{}]*?")
                            -- b_b_3=切割字符串(b_b_2[1],"[^]*?")
                            -- b_b_4=切割字符串(b_b_2[2],"[^]*?")
                            -- str_re_1=""
                            -- str_re_2=""
                            -- for i=1,#b_b_3 do
                            --   if(i==1)then 
                            --     str_re_1=切割字符串(b_b_3[i],"(?<=")[2]..".-" 
                            --    else
                            --     if(i==#b_b_3)then str_re_1=str_re_1..string.sub(b_b_3[i],1,-2) else str_re_1=str_re_1..b_b_3[i]..".-" end
                            --   end
                            -- end

                            -- for i=1,#b_b_4 do
                            --   if(i==1)then 
                            --     print(b_b_4[i])
                            --     str_re_2=切割字符串(b_b_4[i],"(?=")[2]..".-" 
                            --    else
                            --     if(i==#b_b_4)then str_re_2=str_re_2..string.sub(b_b_4[i],1,-2) else str_re_2=str_re_2..b_b_4[i]..".-" end
                            --   end
                            -- end
                            EditStr[2][1]=b_b_js
                       end)

                      --print(a_a_js)
                      --测试反馈(a_a_js)
                      function 正则布局()

                       function 列表弹窗(标题,列表数组,事件数组)--列表弹窗函数
                          AlertDialog.Builder(this)
                          .setTitle(标题)
                          .setItems(列表数组,{onClick=function(l,v) 
                              for i=0, #(列表数组) do
                                   if(v==i)then
                                     loadstring(事件数组[v+1])() 
                                   end
                              end
                          end})
                          .show()
                       end
                        layk={
                          LinearLayout;
                          layout_height="fill";
                          layout_width="fill";
                          orientation="vertical";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";--高度
                              layout_width="fill";--宽度
                              layout_gravity="center";
                              

                              {
                                LinearLayout;
                                orientation="vertical";
                                background="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/login_top.png";
                                id='bg';
                                --layout_height="fill";--高度
                                layout_height="63%h";--高度
                                layout_width="137%w";
                                layout_gravity="center";
                                {
                                  ProgressBar;
                                  layout_width="-1";
                                  layout_gravity="top";
                                  style="?android:attr/progressBarStyleHorizontal";
                                  id="jdt";
                                  layout_marginTop="-6dp";
                                  background="#FF4A4E57";
                                  Indeterminate=true;
                                };
                                {
                                  CardView;
                                  layout_marginTop="0.5%h";
                                  layout_gravity="center";
                                  layout_height="5%h";--高度
                                  layout_width="85%w";--宽度
                                  radius=10;
                                  elevation="0";
                                  CardBackgroundColor="#FF333333";
                                  {
                                    LinearLayout;
                                    background="#00000000";
                                    layout_width="fill";
                                    layout_height="fill";
                                    gravity="center";
                                    {
                                      TextView;
                                      background="#00000000";
                                      id="Text_v1";
                                      text="Js:";
                                      layout_width="-2";
                                      textSize="13sp";
                                      textColor="0xFFFFFFFF";
                                    };
                                    {
                                      EditText;
                                      hint="正则代码 (待生成)";
                                      singleLine=true;
                                      background="#00000000";
                                      id="edit_1";
                                      layout_width="60%w";
                                      textSize="12sp";
                                      textColor="0xFFFFFFFF";
                                      hintTextColor='#FFA0A0A0';
                                    };
                                    {
                                      LinearLayout;
                                      background="#00000000";
                                      layout_width="8%w";
                                      layout_height="fill";
                                       layout_marginRight="-10dp";
                                       id="fz";
                                      {
                                        CircleImageView;
                                        layout_height="fill";--高度
                                        layout_width="wrap";--宽度
                                        src="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/%E5%A4%8D%E5%88%B6-3.png";
                                      };
                                    };
                                  };
                                };--输入框*1

                                {
                                  CardView;
                                  layout_marginTop="1.5%h";
                                  layout_gravity="center";
                                  layout_height="5%h";--高度
                                  layout_width="85%w";--宽度
                                  id="edit_2_top";
                                  Visibility=8;
                                  radius=10;
                                  elevation="0";
                                  CardBackgroundColor="#FF333333";
                                  {
                                    LinearLayout;
                                    orientation="horizontal";
                                    background="#00000000";
                                    layout_width="fill";
                                    layout_height="fill";
                                    gravity="center";
                                    {
                                      LinearLayout;
                                      orientation="horizontal";
                                      layout_width="55%w";
                                      layout_height="fill";
                                      gravity="center";
                                      layout_gravity="center";
                                        {
                                          LinearLayout;
                                          orientation="horizontal";
                                          layout_width="10%w";
                                          layout_height="fill";
                                          gravity="center";
                                          layout_gravity="center";
                                          {
                                            TextView;
                                            id="Text_v2";
                                            text="过滤:";
                                            layout_width="-2";
                                            layout_gravity="left|center";
                                            textSize="12sp";
                                            textColor="0xFFFFFFFF";
                                          };
                                        };
                                      {
                                        EditText;
                                        hint="多个用|隔开";
                                        singleLine=true;
                                        background="#00000000";
                                        id="edit_2";
                                        layout_gravity="left|center";
                                        layout_width="37%w";
                                        textSize="12sp";
                                        textColor="0xFFFFFFFF";
                                        hintTextColor='#FFA0A0A0';
                                      };
                                    };
                                    {
                                      LinearLayout;
                                      orientation="horizontal";
                                      layout_height="fill";
                                      gravity="right";
                                      layout_gravity="right";

                                          {
                                            CardView;
                                            layout_gravity="center|right";
                                            elevation="0dp";
                                            --radius=20;
                                            layout_marginRight="1%w";
                                            layout_marginLeft="1%w";
                                            layout_width="10%w";
                                            layout_height="3%h";
                                            cardBackgroundColor="#FF616266";
                                            radius="1.5%h";
                                            {
                                              LinearLayout;
                                              layout_margin="0dp";
                                              layout_width="fill";
                                              layout_height="fill";
                                              gravity="center";
                                              id="sytj2";
                                              {
                                                TextView;
                                                textSize="10sp";
                                                id="gztext_2";
                                                text="去空",
                                                textColor="#ffffffff";
                                              };
                                            };
                                          },

                                          {
                                            CardView;
                                            layout_gravity="center|right";
                                            elevation="0dp";
                                            layout_marginRight="1%w";
                                            layout_width="14%w";
                                            layout_height="3%h";
                                            cardBackgroundColor="#FF616266";
                                            radius="1.5%h";
                                            {
                                              LinearLayout;
                                              layout_margin="0dp";
                                              layout_width="fill";
                                              layout_height="fill";
                                              gravity="center";
                                              id="sytj3";
                                              {
                                                TextView;
                                                textSize="10sp";
                                                id="gztext_2";
                                                text="去制表符",
                                                textColor="#ffffffff";
                                              };
                                            };
                                          },
                                    }
                                  };
                                };--输入框*1
                        
                                {
                                  LinearLayout;
                                  orientation="vertical";
                                  layout_height="70%h";--高度
                                  layout_width="fill";--宽度
                                  layout_gravity="center";
                                    {
                                      CardView;
                                      layout_marginTop="1%h";
                                      layout_width="85%w";--宽度
                                      layout_gravity="center";
                                      elevation="0";
                                      CardBackgroundColor="#00000000";
                                      {
                                        LinearLayout;
                                        orientation="horizontal";
                                        background="#00000000";
                                        layout_width="fill";
                                        layout_height="fill";
                                        gravity="center|left";
                                        layout_marginLeft="3%w";
                                        {
                                          CardView;
                                          layout_width="1%h";--宽度
                                          layout_height="1%h";
                                          layout_gravity="center";
                                          radius="0.5%h";
                                          elevation="0";
                                          id="code_index";
                                          CardBackgroundColor="#FFFF1751";
                                        };
                                        {
                                          TextView;
                                          textSize="10sp";
                                          layout_marginLeft="1%w";
                                          maxLines="1";
                                          ellipsize="end";
                                          layout_gravity="left|center";
                                          textColor="0x92DFDFDF";
                                          id="text_url";
                                        };
                                      };
                                    };
                                  {
                                    CardView;
                                    layout_marginTop="1%h";
                                    layout_height="26%h";--高度
                                    layout_width="85%w";--宽度
                                    layout_gravity="center";
                                    id='zfcsrk';
                                    radius=30;
                                    elevation="0";
                                    CardBackgroundColor="#FF616266";

                                    {
                                      LinearLayout;
                                      background="#00000000";
                                      orientation="vertical";
                                      layout_width="fill";
                                      layout_height="fill";
                                      gravity="center";
                                      {
                                        LinearLayout;
                                        id="jdt_2_1";
                                        gravity="center";
                                        Visibility=8;
                                        {
                                          ProgressBar;
                                          layout_gravity="center";
                                          id="jdt_2";
                                        };
                                      };
                                      {
                                        EditText;
                                        layout_marginLeft="12dp";
                                        layout_marginRight="15dp";
                                        hint="数据抓取中，请稍等.....";
                                        gravity="center";
                                        background="#00000000";
                                        id="edit_3";
                                        textColor="0xFFFFFFFF";
                                        layout_width="fill";
                                        textSize="11.5sp";
                                        hintTextColor='#FFA0A0A0';
                                      };
                                    };
                                  };
                              
                                  {
                                    LinearLayout;
                                    orientation="horizontal";
                                    Elevation="300dp";
                                    layout_width="85%w";--宽度
                                    layout_marginTop="1.5%h";
                                    gravity="center|left";
                                    layout_gravity="center";
                                    --layout_marginLeft="21%w";
                                    layout_height="7%h";
                                    {
                                      LinearLayout;
                                      orientation="horizontal";
                                      layout_width="85%w";
                                      layout_height="7%h";
                                      --layout_marginLeft="21%w";
                                      --layout_marginTop="4%h";
                                      layout_gravity="center";
                                   
                                      {
                                        CardView;
                                        layout_gravity="center";
                                        elevation="0dp";
                                        layout_width="30%w";
                                        layout_height="36dp";
                                        id="web_but";
                                        cardBackgroundColor="#FFFF1751";
                                        radius="18dp";
                                        {
                                          LinearLayout;
                                          layout_margin="0dp";
                                          layout_width="fill";
                                          layout_height="fill";
                                          gravity="center";
                                          id="sytj0";                                            
                                          {
                                            TextView;
                                            textSize="12sp";
                                            id="text_v3";
                                            text="网页运行",
                                            textColor="#FFFFFFFF";
                                          };
                                        };
                                      },

                                      {
                                        CardView;
                                        layout_gravity="center";
                                        elevation="0dp";
                                        layout_width="36dp";
                                        layout_height="36dp";
                                        layout_marginLeft="1%w";
                                        cardBackgroundColor="#FF333333";
                                        radius="18dp";
                                        id="sytj1_f";
                                        {
                                          LinearLayout;
                                          layout_margin="0dp";
                                          layout_width="fill";
                                          layout_height="fill";
                                          gravity="center";
                                          id="sytj1";                                            
                                            {
                                              LinearLayout;
                                              background="#00000000";
                                              layout_width="4%w";
                                              layout_height="fill";
                                               --layout_marginRight="-10dp";
                                              {
                                                CircleImageView;
                                                id="dl";
                                                layout_height="fill";--高度
                                                layout_width="wrap";--宽度
                                                src="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/Z/%E8%BD%AC%E6%8D%A2.png";
                                              };
                                            };
                                        };
                                      }, 
                                      {
                                        CardView;
                                        layout_gravity="center";
                                        elevation="0dp";
                                        layout_width="36dp";
                                        layout_height="36dp";
                                        layout_marginLeft="1%w";
                                        cardBackgroundColor="#FF333333";
                                        id="sytj4_f";
                                        radius="18dp";
                                        {
                                          LinearLayout;
                                          layout_margin="0dp";
                                          layout_width="fill";
                                          layout_height="fill";
                                          gravity="center";
                                          id="sytj4";                                            
                                            {
                                              LinearLayout;
                                              background="#00000000";
                                              layout_width="4.2%w";
                                              layout_height="fill";
                                               --layout_marginRight="-10dp";
                                              {
                                                CircleImageView;
                                                layout_height="fill";--高度
                                                layout_width="wrap";--宽度
                                                src="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/Z/%E6%AD%A3%E5%88%99%E5%BC%8F.png";
                                              };
                                            };
                                        };
                                      }, 
                                      {
                                        CardView;
                                        layout_gravity="center";
                                        elevation="0dp";
                                        layout_width="36dp";
                                        layout_height="36dp";
                                        layout_marginLeft="1%w";
                                        cardBackgroundColor="#FF333333";
                                        id="sytj5_f";
                                        radius="18dp";
                                        {
                                          LinearLayout;
                                          layout_margin="0dp";
                                          layout_width="fill";
                                          layout_height="fill";
                                          gravity="center";
                                          id="sytj5";                                            
                                            {
                                              LinearLayout;
                                              background="#00000000";
                                              layout_width="5%w";
                                              layout_height="fill";
                                               --layout_marginRight="-10dp";
                                              {
                                                CircleImageView;
                                                layout_height="fill";--高度
                                                layout_width="wrap";--宽度
                                                src="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/Z/%E5%A4%8D%E5%88%B6-5.png";
                                              };
                                            };
                                        };
                                      }, 
                                      {
                                        CardView;
                                        layout_gravity="center";
                                        elevation="0dp";
                                        layout_width="36dp";
                                        layout_height="36dp";
                                        layout_marginLeft="1%w";
                                        cardBackgroundColor="#FF333333";
                                        id="sytj6_f";
                                        Visibility=8;
                                        radius="18dp";
                                        {
                                          LinearLayout;
                                          layout_margin="0dp";
                                          layout_width="fill";
                                          layout_height="fill";
                                          gravity="center";
                                          id="sytj6";                                            
                                            {
                                              LinearLayout;
                                              background="#00000000";
                                              layout_width="4.2%w";
                                              layout_height="fill";
                                               --layout_marginRight="-10dp";
                                              {
                                                CircleImageView;
                                                layout_height="fill";--高度
                                                layout_width="wrap";--宽度
                                                src="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/Z/555.png";
                                              };
                                            };
                                        };
                                      },              
                                    };
                        
                                  };----自定义通配
                                  --[[当前为提示内容：2]]
                                  {
                                    CardView;
                                    layout_marginTop="1%h";
                                    --layout_height="1%h";--高度
                                    layout_width="85%w";--宽度
                                    layout_gravity="center";
                                    --radius=10;
                                    elevation="0";
                                    CardBackgroundColor="#00000000";
                                    {
                                      LinearLayout;
                                      orientation="horizontal";
                                      background="#00000000";
                                      layout_width="fill";
                                      layout_height="fill";
                                      gravity="center|left";
                                      layout_marginLeft="3%w";
                                      {
                                        CardView;
                                        layout_width="1%h";--宽度
                                        layout_height="1%h";
                                        layout_gravity="center";
                                        radius="0.5%h";
                                        elevation="0";
                                        id="code_index_2";
                                        CardBackgroundColor="#FFFF1751";
                                      };
                                      {
                                        TextView;
                                        textSize="10sp";
                                        layout_marginLeft="1%w";
                                        maxLines="1";
                                        ellipsize="end";
                                        layout_gravity="left|center";
                                        textColor="0x92DFDFDF";
                                        id="text_str_1";
                                      };
                                    };
                                  };
                                };--输入框*2
                              };
                        
                            };
                          };
                        };
                        --webView.addView(loadlayout(layk))
                        LuaDialog(this)
                        --.setTitle("代码生成")
                        .setView(loadlayout(layk))
                        .setPositiveButton("帮助",nil)
                        .setNeutralButton("会员",nil)
                        .setNegativeButton("返回",nil)
                        .show()

                       jdt.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF1751,PorterDuff.Mode.SRC_ATOP))--修改颜色
                       jdt_2.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF1751,PorterDuff.Mode.SRC_ATOP))--修改颜色
                       function 设置高度_1(id,x)
                          linearParams = id.getLayoutParams()
                          linearParams.height = x
                          id.setLayoutParams(linearParams)
                       end
                        function 加载提示(str,time,tips)
                          jdt_2_1.setVisibility(0)
                          edit_3.setGravity(Gravity.CENTER)
                          edit_3.setText("")
                          text_str_1.setText(">_代码生成中，请稍等...")
                          task(time,function ()
                            jdt_2_1.setVisibility(8)
                            edit_3.setGravity(Gravity.LEFT)
                            edit_3.setText(str)
                            text_str_1.setText(tips)
                          end)
                        end
                        function 卡片边框(控件ID,边框宽度,边框颜色,背景颜色,边框圆角)
                          import "android.graphics.drawable.GradientDrawable"
                          控件ID.setBackgroundDrawable(GradientDrawable()
                          .setShape(GradientDrawable.RECTANGLE)
                          .setStroke(边框宽度,tonumber(边框颜色))
                          .setColor(tonumber(背景颜色))
                          .setCornerRadius(边框圆角))
                          return drawable
                        end



                        function 打印返回(js,index)
                          str_js_2='syzybq=[];\n'..string.gsub(js,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
                          webView.evaluateJavascript(str_js_2,function(v)
                            a_a_2=string.sub(v,2,-2)
                            a_a_3=切割字符串(a_a_2,"\\n")
                            str_list=""
                            mm=0
                            for i=1,#a_a_3 do
                              if(i==#a_a_3)then
                                mm=i-1
                                if(a_a_3[i]~="")then
                                  str_list=str_list..i.."→"..a_a_3[i]
                                end
                              else
                                str_list=str_list..i.."→"..a_a_3[i].."\n"
                              end
                            end

                            EditStr[index][2]=str_list
                            EditStr[index][3]=">_数据返回完毕！共抓取"..mm.."条数据"
                            加载提示(str_list,1000,">_数据返回完毕！共抓取"..mm.."条数据")
                          end)
                        end

                        Clswitch={0,0,0}--开关控制0为关1为开;sytj1=转换、sytj2=正则、sytj3=分享
                        function 切换设置(number,type)
                          --type=0 为get模式
                          --type=1 为设置模式
                          if(type==1)then
                              if(Clswitch[number]==0)then
                                color_1=0xFFFF1751
                                color_2=0xFF000000
                                Clswitch[number]=1
                              else
                                color_1=0xFF333333
                                color_2=0x57DFDFDF
                                Clswitch[number]=0
                              end

                              if(number==1)then
                                sytj1_f.setCardBackgroundColor(color_1)
                                波纹(sytj1,color_2)
                              end
                              if(number==2)then
                                sytj4_f.setCardBackgroundColor(color_1)
                                波纹(sytj4,color_2)
                              end
                              if(number==3)then
                                sytj5_f.setCardBackgroundColor(color_1)
                                波纹(sytj5,color_2)
                              end
                              switchOx=""
                            else
                              switchOx=Clswitch[number]
                          end
                         return switchOx;
                        end
                        sytj0.onClick=function ()--网页运行
                          if(index_top~=0)then
                            if(切换设置(2,0)==0)--[[判断Js模式]]then
                              webView.evaluateJavascript(EditStr[1][1],nil)
                            end

                            if(切换设置(2,0)==1)--[[判断Js模式]]then
                              js_arr_auto={}
                              js_re=[===[str=document.body.outerHTML;
                              strarr=str.match(/]===]..EditStr[2][1]..[===[/g)
                              regex_str_js=""
                              for (var i = 0; i < strarr.length; i++) {regex_str_js=regex_str_js+strarr[i]+"\n"}
                              alert(regex_str_js)]===]
                              打印返回(js_re,2)
                              --webView.evaluateJavascript(js_re,nil)
                            end
                          else
                            text_v3.setText("网页运行")
                            sytj1_f.setVisibility(0)
                            sytj4_f.setVisibility(0)
                            sytj6_f.setVisibility(8)
                            index_top=index_return[1]
                            edit_3.setText(index_return[2])
                            text_v3.setText(index_return[3])
                            卡片边框(zfcsrk,5,0x00000000,0xFF616266,30);
                          end
                         --print(edit_3.getText())
                          -- 复制文本(a_a)
                          -- 
                        end


                        sytj1.onClick=function ()--转换
                         if(index_top==1)then str_tips=">_已切换至Js源码..." end
                         if(index_top==2)then str_tips=">_已切换至正则源码..." end
                          if(切换设置(1,0)==0)--[[]]then
                            加载提示(EditStr[index_top][1],600,str_tips)
                          else
                            加载提示(EditStr[index_top][2],600,EditStr[index_top][3])
                            code_index.setCardBackgroundColor(0xFFFF1751)
                          end

                          切换设置(1,1)
                        end

                        sytj2.onClick=function ()--去空
                         print(2222)
                        end
                        sytj3.onClick=function ()--去制表符
                         print(3333)
                        end

                        sytj4.onClick=function ()
                          if(切换设置(2,0)==0)then
                            index_top=2
                            edit_1.setHint("正则代码 (待生成)")
                            Text_v1.setText("正则:")
                            text_v3.setText("正则抓取(Js)")
                            edit_2_top.setVisibility(0)
                            加载提示(EditStr[2][1],600,">_已切换至正则模式...")
                            edit_1.setText(EditStr[3][1])
                            设置高度_1(zfcsrk,activity.height*0.25)
                            卡片边框(zfcsrk,5,0xFFFF1751,0xFF333333,30);
                          else
                            index_top=1
                            卡片边框(zfcsrk,5,0x00000000,0xFF616266,30);
                            Text_v1.setText("Js:")
                            edit_1.setText(EditStr[1][1])
                            text_url.setText("当前为Js模式，模式系统只会生成Js，点击底部按钮可切换模式")
                            加载提示(EditStr[1][1],600,">_已切换至Js源码...")
                            code_index.setCardBackgroundColor(0xFFFF1751)
                            text_v3.setText("网页运行")
                            edit_2_top.setVisibility(8)
                            设置高度_1(zfcsrk,activity.height*0.30)
                          end
                          切换设置(2,1)
                         --print(edit_2_top.getVisibility())

                        end
                        sytj5.onClick=function ()--复制按钮
                         print("我是复制！！")
                        end

                        sytj6.onClick=function ()--复制按钮
                         print("我是分享！！")
                        end
                        fz.onClick=function ()--复制按钮
                         table_copy_1={}
                         if(index_top==1)then
                           table_copy_1[1]="复制纯Js代码"
                           table_copy_1[2]="转换并复制lua用法(evalua)"
                         end
                         if(index_top==2)then
                           table_copy_1[1]="复制纯正则代码"
                           table_copy_1[2]="转换并复制Js用法(match)"
                           table_copy_1[3]="转换并复制lua用法(Get)"
                         end

                            AlertItems=AlertDialog.Builder(this)
                            AlertItems.setTitle("转换复制")
                            AlertItems.setItems(table_copy_1,{onClick=function(l,v) 
                                for i=0, #(table_copy_1) do
                                     if(v==i)then
                                        if(table_copy_1[v+1]=="复制纯Js代码")then 

                                           加载提示(edit_3.getText(),500,text_str_1.getText())
                                           task(500,function ()
                                            弹出消息("已复制原生Js代码！")
                                           end)
                                           
                                        end
                                        if(table_copy_1[v+1]=="转换并复制lua用法(evalua)")then
                                          stringfxurl="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/2.0/string/string.lua"
                                          Http.get(stringfxurl,nil,"utf8",nil,function(code,html,b,c)
                                            index_return[1]=index_top
                                            index_return[2]=edit_3.getText()
                                            index_return[3]=text_v3.getText()
                                             loadstring(html)()--#56A902
                                             Str_0=StringArr[1]..EditStr[1][1]..StringArr[2]
                                             复制文本(Str_0..StringArr[3])
                                             加载提示(Str_0..StringArr[3],500,text_str_1.getText())
                                             task(500,function ()
                                              弹出消息("已转换并复制lua用法！")
                                              text_v3.setText("上一步")
                                              sytj1_f.setVisibility(8)
                                              sytj4_f.setVisibility(8)
                                              sytj6_f.setVisibility(0)
                                              index_top=0
                                              卡片边框(zfcsrk,5,0xFFEFD600,0xFF333333,30);
                                             end)
                                             --0xFF51A900 绿色
                                             --0xFF28ADDE 蓝色#3B4E32
                                             --0xFFEFD600 黄色
                                            -- code_index.setCardBackgroundColor(0xFFEFD600)
                                            -- web_but.setCardBackgroundColor(0xFFEFD600)
                                             --jdt.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xFFEFD600,PorterDuff.Mode.SRC_ATOP))
                                             
                                          end) 
                                        end
                                     end
                                end
                            end})
                            DialogItems=AlertItems.show()
                            设置对话框(DialogItems,0.86)
                        end
                        设置高度_1(zfcsrk,activity.height*0.30)
                        text_url.setText("当前为Js模式，模式系统只会生成Js，点击底部按钮可切换模式")
                        function 波纹(id,颜色)
                          import "android.content.res.ColorStateList"
                          local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
                          local typedArray =activity.obtainStyledAttributes(attrsArray)
                          ripple=typedArray.getResourceId(0,0)
                          Pretend=activity.Resources.getDrawable(ripple)
                          Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
                          id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
                        end
                        波纹(sytj2,0xFF000000)
                        波纹(sytj3,0xFF000000)
                        波纹(sytj0,0x57DFDFDF)
                        波纹(sytj1,0xFF000000)
                        波纹(sytj4,0xFF000000)
                        波纹(sytj5,0xFF000000)
                        function 限制编辑(id)
                          id.setFocusableInTouchMode(false);--不可编辑
                          id.setKeyListener(null);--不可粘贴，长按不会弹出粘贴框
                          id.setClickable(false);--不可点击
                          id.setFocusable(false);--不可编辑
                        end
                        限制编辑(edit_1)
                        限制编辑(edit_3)
                      end

                      正则布局()

                      edit_1.setText(EditStr[1][1])
                      text_url.setText("URL(?):"..webView.getUrl())
                      --edit_1.setText(a_a)
                      --加载提示(a_a,1000,">_已生成Js代码100%...")
                      text_str_1.setText(">_正在抓取数据中，请稍候...")
                      task(900,function ()
                        打印返回(a_a,1)
                      end)
                      --code.setCardBackgroundColor(0xFFFF1751)--FF616266
                      


                      Http.get(webView.getUrl(),nil,"utf8",nil,function(code,html,b,c)
                        -- if(code>=200 and code<300)then code_index.setCardBackgroundColor(0xFF11C715) end
                        -- if(code>=400 and code<500)then code_index.setCardBackgroundColor(0xFFFF1751) end
                        -- text_url.setText("URL("..code.."):"..webView.getUrl())
                        -- edit_3.setText(html)
                        -- data={}--截取的所有数据&数组
                        -- print(html)
                        -- 复制文本(str_re_1.."(.-)"..str_re_2.."====="..webView.getUrl())
                        -- for k, v in string.gmatch(html,str_re_1.."(.-)"..str_re_2) do table.insert(data,k) end

                        -- for i=1,#data do--使用
                        --   print(data[i])--弹出第i的截取结果
                        -- end

                      end)



                      -- table.insert(js_arr_auto,js_re)
                      -- 模块数据转换(js_arr_auto,1)
                    end)

            --print("2222233")
            -- gjdlog2.dismiss()
            -- Modinit_list={}
            -- js_str_1=[==[var message="";get_message(Data_Data_All[indexNoti[indexNoti.length-1]],]==]..(pos)..[==[,3,1,0);message=message;alert(message)]==]
            -- for i=1,#列表数组 do table.insert(Modinit_list,js_str_1) end
            -- 模块数据转换(Modinit_list,(pos+1))
          end

          if(index_remove[#index_remove]=="网页列表元素||1")then
            index_remove[#index_remove]="网页列表元素||2"
            gjdlog2.dismiss()
            Modinit_list={}
            js_str_1=[==[var message="";get_message(Data_Data_All[indexNoti[indexNoti.length-1]],]==]..(pos)..[==[,3,1,indexNoti[indexNoti.length-1]);message=message;alert(message);get_message(Data_Data_All[indexNoti[indexNoti.length-1]],]==]..(pos)..[==[,3,2,indexNoti[indexNoti.length-1]);]==]
            for i=1,#列表数组 do table.insert(Modinit_list,js_str_1) end
            模块数据转换(Modinit_list,(pos+1))
          end

          if(index_remove[#index_remove]=="网页基本信息")then
          	if(ListStr_1[2]~="0") and (ListStr_1[2]~="无") then
	            for i=0, #(Modinit_name) do
	              if(ListStr_1[1]==Modinit_name[i])then
	              	index_remove[#index_remove]="网页基本信息||"..Modinit_name[i]
	                gjdlog2.dismiss()
	                模块数据转换(Modinit_js,i)
	              end
	            end
	           else
	           	弹出消息("当前无内容null!")
	          end
          else

           if(index_remove[#index_remove]=="网页列表元素")then
            index_remove[#index_remove]="网页列表元素||1"
            gjdlog2.dismiss()
             Modinit_list={}
             js_str_1=[[var message="";for (var i = 0; i < Data_Data_All[]]..(pos)..[[].length; i++) {get_message(Data_Data_All[]]..(pos)..[[],i,2,0);message=message+"\n"};var indexNoti = new Array();indexNoti.push(]]..(pos)..[[);alert(message)]]
              for i=1,#列表数组 do table.insert(Modinit_list,js_str_1) end
              模块数据转换(Modinit_list,(pos+1))
            else
  		        for i=1, #(模块名称) do
  		          if(index_remove[#index_remove]==模块名称[i])then
  		            import "android.content.*"
  		            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(列表数组[pos+1])
  		            弹出消息("已复制内容")
  		          end
  		        end
            end

          end
      end

      list.onItemLongClick=function(parent,v,pos,id)
        ListStr_1=切割字符串(列表数组[pos+1],"：")
        ListStr_2=切割字符串(列表数组[pos+1],": ")
        index_str=index_remove[#index_remove]
          for i=1,#Modinit_name do
            if(index_str=="网页基本信息||"..Modinit_name[i])then
              --验证属性
              --sysz_index_1 = 选中元素
              --sysz_index_2 = 父类元素
              --sysz_index_3 = 验证的值
              --sysz_index_number =父类次数
              --sysz_cookie = 属性验证
              if(Modinit_name[i]=="最大层级(z-index)")then
              	sysz_index_3_str="zIndex_number_2"
              end
              if(Modinit_name[i]=="纯文本标签(innerHTML)")then
                ListStr_2_str=""
                for i=1,#ListStr_2 do
                  if(i~=1)then
                     if(i~=#ListStr_2)then
                       ListStr_2_str=ListStr_2_str..ListStr_2[i]..": "
                       else
                       ListStr_2_str=ListStr_2_str..ListStr_2[i]
                     end
                  end
                end

                sysz_index_3_str="'"..ListStr_2_str.."'"
                --sysz_index_3_str="zIndex_number_2"
              end

              if(Modinit_name[i]~="最大层级(z-index)")and(Modinit_name[i]~="纯文本标签(innerHTML)")then
                sysz_index_3_str="sysz_index_1."..Modinit_cookie[i]
              end

              加载Js([[var sysz_index_1=sysz_arr[]]..pos..[[];var sysz_index_2=sysz_index_1;var sysz_index_3=]]..sysz_index_3_str..[[;var sysz_index_number=0;var sysz_cookie="]]..Modinit_cookie[i].."\";")
              gjdlog2.dismiss()
              数据操作列表("操作选项",string.gsub(列表数组[pos+1],"||",""),"网页基本信息||"..Modinit_name[i],Modinit_arr[i],Modinit_cookie[i],Modinit_js,i)
              index_remove[#index_remove]="网页基本信息||"..Modinit_name[i]

            end
          end

          if(index_str:find"网页基本信息")then else 
          	for i=1,#模块名称 do
          		if(index_str==模块名称[i])then
              gjdlog2.dismiss()
              数据操作列表("操作选项",列表数组[pos+1],index_str,"","",模块代码,i)
          		end
          	end

          end
      end
  end

  --数组事件
  function 模块数据转换(事件数组,循环变量)
    funstr=事件数组[循环变量]
    
    if(funstr:find"alert%(")then
       str_js='syzybq=[];\n'..string.gsub(事件数组[循环变量],"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
        webView.evaluateJavascript(str_js,function(a)
          a_a=string.sub(a,2,-2)
          
           --if(pointer=="网页列表元素||2")then end

		      index_remove_2=index_remove[#index_remove]
		      if(index_remove_2:find"网页基本信息||Head内标签")then
		      	a_a=string.gsub(string.sub(a,2,-2),[[\u003C]],"<"):gsub([[\"]],'"')
		      end
          --print(a_a)
          --测试反馈(a_a)
          qgfz_sj={}
          qgfz_mc={}
          
          if(a_a~=nil)then
            if(a_a:find"\\n")then
              arr_1=切割字符串(a_a,"\\n")
              for l=1,#arr_1 do
                if(arr_1[l]~="")or(l ~= #arr_1)then
                  if(#qgfz_mc==0)then
                     table.insert(qgfz_sj,"")
                     table.insert(qgfz_mc,arr_1[l])
                   else
                    --去重
                    a={}
                    for x=1,#qgfz_mc do
                      if(arr_1[l]==qgfz_mc[x])then 
                        table.insert(a,1)
                      end
                    end
                    if(#a==0)then
                     table.insert(qgfz_sj,"")
                     table.insert(qgfz_mc,arr_1[l])
                    end
                  end

                end
              end
              模块结果弹窗("返回"..#qgfz_mc.."条数据",qgfz_mc,qgfz_sj,"复制",循环变量)
            else
             --只有一个数据
             table.insert(qgfz_sj,"")
             table.insert(qgfz_mc,a_a)
             if(a_a~="")then 模块结果弹窗("返回"..#qgfz_mc.."条数据",qgfz_mc,qgfz_sj,"复制",循环变量) else 
              print("网页暂无可抓取的列表！") 
              模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
              设置对话框(DialogItems,0.86)
             end
             
            end

          end
        end)
     else
       if(模块名称[循环变量]~="自定义...")then
        弹出消息("模块规则不合法！！！")
       end
    end
  end

	function 数据操作列表(标题,数据,指示器,Modinit_arr,Modinit_cookie,代码数组,index)
    if(Modinit_arr=="all")then Arr='document.getElementsByTagName("*")' else Arr=Modinit_arr end
    ModinitStr_From_1=[[Array.from(]]..Arr..[[).map(function (x){if(]]
    if(指示器=="网页基本信息||最大层级(z-index)")then
      ModinitStr_From_1=ModinitStr_From_1..Modinit_cookie
     else
      ModinitStr_From_1=ModinitStr_From_1.."x."..Modinit_cookie
    end 
    if(指示器=="网页基本信息||纯文本标签(innerHTML)")then
      ModinitStr_From_3=[[.replace(/\n/g,"").replace(/\t/g,"").replace(/\r/g,"").replace(/ /g,"").replace("&nbsp;","")]]
     else
      ModinitStr_From_3=""
    end
    Adjust1=[["){x.setAttribute('style',"display:none");};})]]
    Adjust2=[["){x.remove();};})]]
    Adjust3=[["){x.setAttribute('style',"display:none");
     var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver
     var target = document.body; var observer = new MutationObserver(function(mutations) {  
      mutations.forEach(function(mutation) {
       mutation.addedNodes[0] && mutation.addedNodes[0].setAttribute('style',"display:none") 
      }); 
    });var config = { attributes: true, childList: true, characterData: true};observer.observe(target, config);};})]]
    function setModinitStr_From(Adjust,text)
      return ModinitStr_From_1..ModinitStr_From_3..[[=="]]..text..Adjust
    end
	  init_fun_1={"复制","分享"}
    if(指示器=="网页基本信息||图片资源(img)" or 
       指示器=="网页基本信息||跳转链接(a)" or
       指示器=="网页基本信息||视频标签(video)" or
       指示器=="网页基本信息||音频标签(audio)" or
       指示器=="网页基本信息||嵌套标签(iframe)" or
       指示器=="网页基本信息||最大层级(z-index)" or
       指示器=="网页基本信息||纯文本标签(innerHTML)")then 
      table.insert(init_fun_1,"屏蔽(display)") 
      table.insert(init_fun_1,"删除(remove)") 
      table.insert(init_fun_1,"动态屏蔽(会员)")
      table.insert(init_fun_1,"强力删除(会员)") 
      table.insert(init_fun_1,"编辑元素") 
      table.insert(init_fun_1,"百度一下") 
    end
    function 编辑元素(outerHTML)
        InputLayout={
          LinearLayout;
          orientation="vertical";
          Focusable=true,
          FocusableInTouchMode=true,
            {
             LinearLayout;
              layout_gravity="center",
              layout_width='76%w';
              gravity="center";
              {
                EditText;
                id="edit";
                layout_marginTop='5dp';
                layout_gravity="center",
                layout_width='76%w';
                Hint='请输入...';
                text=outerHTML;
              };
            };
        };

        function 输出(text,路径)
          webView.evaluateJavascript([[sysz_index_3+"||"+sysz_index_number]],function(a)--[[sysz_index_1 = 选中元素;sysz_index_2 = 父类元素;sysz_index_3 = 验证的值;sysz_index_number =父类次数;sysz_cookie = 属性验证]]
            strliist=切割字符串(string.sub(a,2,-2),"||")
            jsstr=""
            for i=0,strliist[2]-1 do
              jsstr=jsstr..".parentNode"
            end
              Modinit_str_js="//"..os.date("%Y-%m/%d_%H:%M")..'\n//'..webView.getUrl().."\n"..setModinitStr_From([["){x]]..jsstr..[[.outerHTML=`]]..text..[[`;};})]],strliist[1]) 
              加载Js(Modinit_str_js)
              jsnr=io.open(路径):read("*a")--取读 js运行本的代码
              if(jsnr=="")then xryjz=Modinit_str_js else xryjz=jsnr.."\n\n"..Modinit_str_js end
              io.open(路径,"w"):write(xryjz):close()--写入运行本
              加载对话框("请稍等","代码导入中....",500,"导入完成！")
          end)
        end
    


        DlogEdit=AlertDialog.Builder(this)
        DlogEdit.setTitle("编辑元素")
        DlogEdit.setView(loadlayout(InputLayout))
        DlogEdit.setPositiveButton("导入运行本",function(v) 输出(edit.text,jsxml) end)
        DlogEdit.setNeutralButton("父类",nil)
        DlogEdit.setNegativeButton("导入预加载",function (v) 输出(edit.text,jsyjz) end)--设置消极按钮
        DlogEditShow=DlogEdit.show()--显示弹窗

        DlogEditShow.getButton(gjdlog2.BUTTON_NEUTRAL).onClick=function()--编辑模块
          webView.evaluateJavascript([[var sysz_index_2=sysz_index_2.parentNode;sysz_index_number++;sysz_index_2.outerHTML]],function(a)
          --编辑元素(zyth1_4)
          strtext_1=string.gsub(string.sub(a,2,-2),[[\u003C]],"<"):gsub([[\"]],'"'):gsub([[\n]],' '):gsub([[\t]],'')
          edit.setText(strtext_1)
          end)
        end

        if(number~=nil)and(number>#模块名称_内置)then
          DlogEditShow.getButton(DlogEditShow.BUTTON_NEUTRAL).setTextColor(0xFFFF1724)--设置中立按钮颜色
        end
    end
	  AlertItems=AlertDialog.Builder(this)
    AlertItems.setTitle(标题)
    AlertItems.setItems(init_fun_1,{onClick=function(l,v) 
        for i=0, #(init_fun_1) do
             if(v==i)then
                if(init_fun_1[v+1]=="复制")then
                  	模块数据转换(代码数组,index)
                    复制文本(数据)
                    弹出消息("已复制内容")
                end
                if(init_fun_1[v+1]=="分享")then 分享(数据) 模块数据转换(代码数组,index) end
                if(init_fun_1[v+1]=="编辑元素")then 
                  webView.evaluateJavascript([[sysz_index_2.outerHTML]],function(a)
                   编辑元素(string.sub(a,2,-2):gsub([[\u003C]],"<"):gsub([[\"]],'"'):gsub([[\n]],' '):gsub([[\t]],''))
                  end) 
                end
                if(init_fun_1[v+1]=="屏蔽(display)")then 
                    --sysz_index_1 = 选中元素
                    --sysz_index_2 = 父类元素
                    --sysz_index_3 = 验证的值
                    --sysz_index_number =父类次数
                    --sysz_cookie = 属性验证
                    webView.evaluateJavascript([[sysz_index_3]],function(a)
                    strliist=string.sub(a,2,-2)
                     Modinit_str_js="//"..os.date("%Y-%m/%d_%H:%M")..'\n//'..webView.getUrl().."\n"..setModinitStr_From(Adjust1,strliist) 
                    加载Js(Modinit_str_js)
                    jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
                    if(jsnr=="")then xryjz=Modinit_str_js else xryjz=jsnr.."\n\n"..Modinit_str_js end
                    io.open(jsxml,"w"):write(xryjz):close()--写入运行本
                    加载对话框("请稍等","代码导入中....",500,"导入完成！")

                   end)
                end
                if(init_fun_1[v+1]=="删除(remove)")then 
                    webView.evaluateJavascript([[sysz_index_3]],function(a)
                    strliist=string.sub(a,2,-2)
                     Modinit_str_js="//"..os.date("%Y-%m/%d_%H:%M")..'\n//'..webView.getUrl().."\n"..setModinitStr_From(Adjust2,strliist) 
                    加载Js(Modinit_str_js)
                    jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
                    if(jsnr=="")then xryjz=Modinit_str_js else xryjz=jsnr.."\n\n"..Modinit_str_js end
                    io.open(jsxml,"w"):write(xryjz):close()--写入运行本
                    加载对话框("请稍等","代码导入中....",500,"导入完成！")

                   end)
                end
                if(init_fun_1[v+1]=="动态屏蔽(会员)")then
                  function FunName_1()
                    webView.evaluateJavascript([[sysz_index_3]],function(a)
                      strliist=string.sub(a,2,-2)
                      NumberRandom=math.random(0,1000000)
                      Modinit_str_js="//"..os.date("%Y-%m/%d_%H:%M")..'\n//'..webView.getUrl().."\n"..setModinitStr_From(Adjust3,strliist) 
                      -- 复制文本(Modinit_str_js)
                      -- print(Modinit_str_js)
                      加载Js(Modinit_str_js)
                      jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
                      if(jsnr=="")then xryjz=Modinit_str_js else xryjz=jsnr.."\n\n"..Modinit_str_js end
                      io.open(jsxml,"w"):write(xryjz):close()--写入运行本
                      加载对话框("请稍等","代码导入中....",500,"导入完成！")
                    end)
                  end

                  VIPpermission([[FunName_1()]],"666666",3,[[会员特权(1)]])

                end

                if(init_fun_1[v+1]=="强力删除(会员)")then
                  function FunName_1()
                    webView.evaluateJavascript([[sysz_index_3]],function(a)
                      strliist=string.sub(a,2,-2)
                      NumberRandom=math.random(0,1000000)
                      str_r1=[[function checkTime_]]..NumberRandom..[[(){var nowtime=Date.parse(new Date());]]..setModinitStr_From(Adjust2,strliist)..[[;}setInterval("checkTime_]]..NumberRandom..[[()","200");]]
                      Modinit_str_js="//"..os.date("%Y-%m/%d_%H:%M")..'\n//'..webView.getUrl().."\n"..str_r1 
                      加载Js(Modinit_str_js)
                      jsnr=io.open(jsxml):read("*a")--取读 js运行本的代码
                      if(jsnr=="")then xryjz=Modinit_str_js else xryjz=jsnr.."\n\n"..Modinit_str_js end
                      io.open(jsxml,"w"):write(xryjz):close()--写入运行本
                      加载对话框("请稍等","代码导入中....",500,"导入完成！")
                    end)
                  end

                  VIPpermission([[FunName_1()]],"666666",3,[[会员特权(1)]])

                end

                if(init_fun_1[v+1]=="百度一下")then 
                	url="https://quark.sm.cn/s?q="..数据
                	弹出浏览器(url,2,"百度一下看看这是什么...","提示：长按页面可弹出资源列表")
                end
              end
        end
    end})
    DialogItems_2=AlertItems.show()	
    设置对话框(DialogItems_2,0.86)
	end


  function 模块列表弹窗(标题,列表数组,事件数组)
    index_remove={};--返回指示器
    function addremove(mx)
      table.insert(index_remove,mx)
    end
    AlertItems=AlertDialog.Builder(this)
    AlertItems.setTitle(标题)
    AlertItems.setItems(列表数组,{onClick=function(l,v) 
        for i=0, #(列表数组) do
             if(v==i)then
                addremove(列表数组[v+1])
                if(列表数组[v+1]=="自定义...")then
                  模块编辑(nil)
                end
                if(列表数组[v+1]=="获取媒体资源")then
                  弹出浏览器(webView.getUrl(),1,"网页副本加载中...","提示：长按页面可弹出资源列表")
                 else
                  模块数据转换(事件数组,v+1,1)
                end
             end
        end
    end})
    DialogItems=AlertItems.show()
  end--列表弹窗函数--用法:数组放在最前面 

  function 隐私政策()
    import "android.graphics.Color"
    Alert=AlertDialog.Builder(this)
    Alert.setTitle("标题")
    Alert.setMessage("消息")
    Alert.setPositiveButton("确定",nil)--积极按钮
    Alert.setNegativeButton("不再提醒",nil)--消极按钮
    Alert.setCancelable(false)
    Dialog=Alert.show();--定义显示对话框为Dialog

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
    tv.setText("调试模块使用向导")
    tv.setGravity(Gravity.CENTER)--设置居中
    tv.getPaint().setFakeBoldText(true);--设置粗体

    message=Dialog.findViewById(android.R.id.message)
    message.setTextColor(0xFF434343)--设置消息颜色
    message.setTextSize(14);
    message.setText(Html.fromHtml(PrivacyPolicy_1))
    Dialog.getButton(Dialog.BUTTON_NEUTRAL).setText("条款说明")--设置消极按钮颜色
    Dialog.getButton(Dialog.BUTTON_NEGATIVE).setTextColor(0xFFFF1724)--设置消极按钮颜色
    Dialog.getButton(Dialog.BUTTON_POSITIVE).onClick=function()--积极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
      Dialog.dismiss();
      --首先需要两个数组 一个是名称数组 一个是事件数组
      模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
      设置对话框(DialogItems,0.86)
    end

    Dialog.getButton(Dialog.BUTTON_NEGATIVE).onClick=function()--消极按钮事件 拦截原本事件 点击后对话框不会消失 需要自定义.dismiss();
     Dialog.dismiss();
     putData("JsModTips","clause","1")
     模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
     设置对话框(DialogItems,0.86)
    end

    弹窗圆角(Dialog.getWindow(),0xFFFFFFFF)
  end


  

  if(getData("JsModTips","clause")~="1")then
    隐私政策()
   else
    模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
    设置对话框(DialogItems,0.86)
  end