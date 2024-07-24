
---
--- File: debug_js_grab_os.lua
--- Describe: 可视化调试页 - js爬虫抓取
--- Created by Gityyge.
---

function JsGrab(sqys)
	webView.evaluateJavascript("document.documentElement.style.webkitTouchCallout='none';",nil)
  webView.evaluateJavascript("document.documentElement.style.webkitUserSelect='none';",nil)
  function 弹窗圆角(控件,背景色,上角度,下角度)
    import "android.graphics.drawable.GradientDrawable"
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


  end
  import "android.text.Html"
  import "android.content.Context"
  function 设置对话框(view,widt)
    params = view.getWindow().getAttributes();
    params.width = activity.getWidth()*widt;
    --height = activity.getHeight()*0.9;
    view.getWindow().setAttributes(params);
    弹窗圆角(view.getWindow(),0xFFFFFFFF)
  end
  js_str_1="OriElement = "..sqys..";"..[==[xunhuan=""
	  GetREGEX=function(in_x,or_y_x,number)/*当前元素/父类元素 number 为类别*/  {
	    //in_x 当前计算的元素
	    //判断这个数组 是否是数组还是元素
	    if(or_y_x.length==undefined/*单个元素 否则为元素列表*/){or_y=or_y_x;}else{or_y_q=[];Array.from(or_y_x).map(function (m){if(m.contains(in_x)==true/*判断为包含关系*/){or_y_q[0]=m};});or_y=or_y_q[0];};

	    indexOf_X=or_y.getElementsByTagName(in_x.localName).length
	    reEmestr=function(in_x,or_y) {
	     if(in_x.className!=""){if(or_y.getElementsByClassName(in_x.className).length==indexOf_X || or_y.getElementsByTagName(in_x.localName).length==indexOf_X){xxi=1}else{xxi=0}}else{xxi=0}
	     if(or_y.getElementsByTagName(in_x.localName).length==indexOf_X||xxi==1){xxi=1}else{xxi=0}
	     if(xxi==1){
	      return 1
	     }else{if(in_x.parentElement==or_y){xxi=2}}
	     if(xxi==2){alert("抓取出错！错误代码：xxi=2")}
	    }
	    reCodeEm=function (in_x,or_y) {
	     if(reEmestr(in_x,or_y)==1){mm=in_x}else{reCodeEm(in_x.parentElement,or_y)}
	      return mm
	    }
	    
	    GetAttribute = function (in_x) {
	      if(in_x.id!=""){snatch_id="id=\""+in_x.id+"\""}else{snatch_id=""};
	      if(in_x.className!=""){snatch_class="class=\""+in_x.className+"\""}else{snatch_class=""};
	      if(snatch_class=="" && snatch_id!=""){snatch_str = " "+snatch_id }
	      if(snatch_class!="" && snatch_id==""){snatch_str = " "+snatch_class}
	      if(snatch_class!="" && snatch_id!=""){snatch_str=" "+snatch_class+" "+snatch_id}
	      if(snatch_class=="" && snatch_id==""){snatch_str=""}
	      if(snatch_str==""){snatch_str2=""}else{snatch_str2="[^]*?"+snatch_str}
	      if(in_x.nodeType==3){return_str=">"}else{return_str=in_x.localName+snatch_str2}
	      return return_str
	    };
	    UpStr=function(in_x) {return GetAttribute(in_x)}
	    UnderStr=function (in_x) {
	     if(in_x!=document.body){
	       if(in_x.nextElementSibling){
	        if (UpStr(m)!=GetAttribute(in_x.nextElementSibling)){str=GetAttribute(in_x.nextElementSibling);}else{UnderStr(in_x.parentElement)}
	       }else{UnderStr(in_x.parentElement)}
	     }else{str="[^]*?</body>"}

	     return str
	    };

	    if(reCodeEm(in_x,or_y)!=in_x){sttr_3=GetAttribute(reCodeEm(in_x,or_y))+"[^]*?"+GetAttribute(in_x)}else{sttr_3=GetAttribute(in_x)}
	    if(number==1){sttr_1="[^]*?"+sttr_3+"[^]*?"+">";if(in_x.nodeType==3){sttr_2="<[^]*?\"";}else{sttr_2="<\\\/"+in_x.localName;}}
	    if(number==2){sttr_1="[^]*?a href=\"";sttr_2="\"";}
	    if(number==3){sttr_1="[^]*?img src=\"";sttr_2="\"";}
	    if(or_y==in_x){sttr_1="[^]*?>"}
	    ElNameStr=UpStr(or_y)+"|!+!|"+UnderStr(or_y)+"|!+!|"+sttr_1+"|!+!|"+sttr_2;
	    //console.log(ElNameStr)
	    //ElNameStr="[(?<="+UpStr(or_y)+sttr_1+")[^<>{}]*?(?="+sttr_2+"[^]*?"+UnderStr(or_y)+")]"
	    //ElNameStr="(?<="+UpStr(or_y)+sttr_1+")[^<>{}]*?(?="+sttr_2+"[^]*?"+UnderStr(or_y)+")"
	    //js_re=`str=document.body.outerHTML;strarr=str.match(/`+ElNameStr+`/g);console.log(strarr)`
	    //console.log(js_re)
	    // Data_REGEX_Arr[0].push(UpStr(or_y)+"|!+!|"+UnderStr(or_y)+"|!+!|"+sttr_1+"|!+!|"+sttr_2)
	    // Data_REGEX_Arr[1].push("(?<="+UpStr(or_y)+sttr_1+")[^<>{}]*?(?="+sttr_2+"[^]*?"+UnderStr(or_y)+")")
	    // GetAttribute_Js(or_y,in_x,number)
	    return ElNameStr
	  }

	  function xx_0(v,type) /*返回单个元素数据 type=0时直接返回*/{
	    if(v.id!="" && v.id!=undefined){snatch_id=v.id;}else{snatch_id=""};
	    if(v.className!="" && v.className!=undefined){snatch_class=v.className;}else{snatch_class=""};
	    if(snatch_class=="" && snatch_id!=""){snatch_str = id_1+snatch_id+"\")"+xunhuan;Element_att=document.getElementById(v.id);}
	    if(snatch_class!="" && snatch_id==""){snatch_str = class_1+snatch_class+"\")"+xunhuan;Element_att=document.getElementsByClassName(v.className);}
	    if(snatch_class!="" && snatch_id!=""){snatch_str= id_1+snatch_id+"\")"+xunhuan;Element_att=document.getElementById(v.id);}
	    if(snatch_class=="" && snatch_id==""){snatch_str="";Element_att=null}
	    if(type==0 && snatch_class=="" && snatch_id==""/**没有ID没有class**/){snatch_str = name_1+v.localName+"\")"+xunhuan;Element_att=document.getElementsByTagName(v.localName);}
	    return [snatch_str,Element_att]
	  }
	  function xx_1(v,type,t,p) {/*type=1为父类 =2为子类 =3为获取单个元素的父类，配合xx_0使用 t为当前父类 p为辅助元素配合xx_0找到元素的父类*/
	    snatch_str=xx_0(v,1)[0]
	    Element_att=xx_0(v,1)[1]
	    //if(type==2){console.log(Element_att)}//console.log(xx_1(v,2,v))
	    if(Element_att==null/**没有ID没有class**/){
	      if(type==1){snatch_str= name_1+v.localName+"\")"+xunhuan;Element_att=document.getElementsByTagName(v.localName);}else{
	        if(type==3){snatch_str= name_1+v.localName+"\")"+xunhuan;Element_att=document.getElementsByTagName(v.localName);}
	        xx_1(v.parentElement,2,t)[1]
	        // if(Data_Data_All[l].length==t.getElementsByTagName(v.localName).length/**父类内该标签的长度等于列表长度**/){
	        //   snatch_str= name_1+v.localName+"\")"+xunhuan;Element_att=document.getElementsByTagName(v.localName);
	        // }else{xx_1(v.parentElement,2,t)[1]};
	      }
	    };

	    function Repeat(x) {
	      if(Element_att.length!=undefined && Element_att.length!=1 /*判断长度*/){
	        a=[];for (var i = 0; i < Element_att.length; i++) {
	          if(Element_att[i].contains(x)==true/*判断为包含关系*/){
	            if(snatch_str.indexOf("getElementsByClassName")>-1/*元素必须含有class*/){
	              if(v.className==Element_att[i].className/*元素的值必须一致，不能是包含关系*/){a.push(i);}}else{a.push(i);}}
	        };if(a.length==0){a_index=0}else{a_index=a[0]};snatch_str=snatch_str+"["+a_index+"]";Element_att=Element_att[a];
	       }else/*长度只有一个的时候，取[0]*/{if(snatch_str.indexOf("getElementById")>-1){snatch_str=snatch_str;Element_att=Element_att}else{snatch_str=snatch_str+"[0]";Element_att=Element_att[0]};};
	    };
	    if(type==1){Repeat(v);};
	    if(type==3){Repeat(p);};

	    if(Element_att==undefined){length_str="?"/*设置type=3的显示个数*/;Element_att=xx_1(v,2,v)[1]}else{length_str=Element_att.length}
	    return [snatch_str,Element_att,length_str/*只有type不为1时才会有长度*/]/**参数1为字符串，参数2为元素**/
	  };

	  Data_RE=[];
	  Data_RE[0]=[]/*原始元素*/
	  Data_RE[1]=[]/*上位元素*/
	  Data_RE[2]=[]/*下位元素*/
	  Data_RE[6]=[]/*元素类别*/
	  Data_RE[3]=[]/*资源内容*/
	  Data_RE[4]=[]/*Js字符串*/
	  Data_RE[5]=[]/*正则字符串*/
	  function AddDataElem(x,y,z,m) {
	    Data_RE[0].push(x);Data_RE[1].push(y);Data_RE[2].push(z);Data_RE[6].push(m);
	  }
	  function AddDataStr(x,y,z) {
	    Data_RE[3].push(x);Data_RE[4].push(y);Data_RE[5].push(z);
	  }
	  
	  /*先返回原本元素的内容*/
	  StrLog_1="";
	  StrLog_2="";
	  StrLog_3="";
	  StrLog_a=1;
	  StrLog_text=1;
	  StrLog_img=1;
	  var Data_Element = new Array();
	  if(OriElement.localName!="a" && OriElement.localName!="img" ){Data_Element.push(OriElement)}
	  GetJsRE=function (str,type) {
	    if(type==1/*链接*/){restr_1="a";restr_2="href"}
	    if(type==2/*图片*/){restr_1="img";restr_2="src"}
	    if(type==3/*文本innerHTML*/){restr_1="";restr_2="innerText"}
	    if(type==4/*文本textContent*/){restr_1="";restr_2="textContent"}
	    if(type==1||type==2){strRE=`str="";Array.from(`+"document"+str+`).map(function (x){ if(x.localName=="`+restr_1+`"){str=str+x.`+restr_2+`+"\\n"}else{Array.from(x.getElementsByTagName("`+restr_1+`")).map(function (y){str=str+y.`+restr_2+`+"\\n"})};});alert(str)`}
	    if(type==3||type==4){strRE=`str="";Array.from(`+"document"+str+`).map(function (x){str=str+x.`+restr_2+`.replace(/\\n/g,"").replace(/\\t/g,"").replace(/\\s/g,"").replace(/\\r/g,"").replace("  ","").replace("&nbsp;","")+"\\n";});alert(str)`}
	    return strRE
	  }
	    /*判断本身元素*/
	  REPlace=function (str) {
	   return str.replace(/\n/g,"").replace(/\t/g,"").replace(/\s/g,"").replace(/\r/g,"").replace("  ","").replace("&nbsp;","")
	  }

	  if(OriElement.getElementsByTagName("*").length<=5){
	    TextStr=REPlace(OriElement.innerText)
	    TextContentStr=REPlace(OriElement.textContent)
	    if(TextStr!=""){
	      bb_0=0;
	      bb_1=0;
	      Array.from(list_origin_3).map(function (m){
	       if(m.contains(OriElement)==true){bb_1=m;bb_0++;}
	      })
	      ReStr_3=xx_1(OriElement,3,OriElement,OriElement);
	      ReStr_4=xx_1(OriElement,2,OriElement);
	      if(ReStr_3[0].indexOf(xx_0(OriElement,0)[0])>-1){ReStr=ReStr_4;str_2=""}else{ReStr=ReStr_3;str_2=xx_0(OriElement,0)[0]}
	      StrLog_3=StrLog_3+"文本"+StrLog_text+">innerText"+"*"+ReStr[2]+"."+GetElName(OriElement)+"|$+$|"+TextStr+'\n';
	      StrLog_text++;
	      if(bb_0==0){
	        AddDataElem(OriElement,ReStr[1],null,1)
	        jsRE=GetJsRE(ReStr[0]+str_2,3)
	        AddDataStr(TextStr,/*Js获取*/jsRE,null)
	        //console.log(ReStr_3[1])
	       }else{
	        AddDataElem(OriElement,bb_1,null,1)
	        jsRE=GetJsRE(xx_1(bb_1,1,bb_1)[0]+xx_1(OriElement,2,bb_1)[0],3)
	        //AddDataStr(TextStr,/*Js获取*/jsRE,GetREGEX(OriElement,bb_1,1/*2表示为链接*/))
	        AddDataStr(TextStr,/*Js获取*/jsRE,null)
	       }
	    }
	    if(TextContentStr!=""){
	      bb_0=0;
	      bb_1=0;
	      Array.from(list_origin_3).map(function (m){
	       if(m.contains(OriElement)==true){bb_1=m;bb_0++;}
	      })

	      ReStr_3=xx_1(OriElement,3,OriElement,OriElement);
	      ReStr_4=xx_1(OriElement,2,OriElement);
	      if(ReStr_3[0].indexOf(xx_0(OriElement,0)[0])>-1){ReStr=ReStr_4;str_2=""}else{ReStr=ReStr_3;str_2=xx_0(OriElement,0)[0]};
	      StrLog_3=StrLog_3+"文本"+StrLog_text+">TextContent"+"*"+ReStr[2]+"."+GetElName(OriElement)+"|$+$|"+TextContentStr+'\n';
	      StrLog_text++;
	      if(bb_0==0){
	        AddDataElem(OriElement,ReStr[1],null,1)
	        jsRE=GetJsRE(ReStr[0]+str_2,4)
	        AddDataStr(TextContentStr,/*Js获取*/jsRE,null)
	       }else{
	        AddDataElem(OriElement,bb_1,null,1)
	        jsRE=GetJsRE(xx_1(bb_1,1,bb_1)[0]+xx_1(OriElement,2,bb_1)[0],4)
	        AddDataStr(TextContentStr,/*Js获取*/jsRE,null)
	       }

	    };

	    for (var i = 0; i < list_origin_3.length; i++) {
	          or=list_origin_3[i]
	          if(or.contains(OriElement)==true){
	              for (var x = 0; x < or.children.length; x++) {
	                if(or.children[x].contains(OriElement)==true){
	                   Array.from(Data_ArrContext[i][x]).map(function (y){
	                      if(y.localName=="img"){
	                        Data_Element.push(y);
	                        StrLog_2=StrLog_2+"图片"+StrLog_img+"*"+xx_1(y,2,or)[2]+"."+GetElName(y)+"|$+$|"+y.src+'\n';
	                        //str=`str="";Array.from(`+"document"+xx_1(or,1,or)[0]+xx_1(y,2,or)[0]+`).map(function (x){ if(x.localName=="img"){str=str+x.src+"\\n"}else{Array.from(x.getElementsByTagName("img")).map(function (y){str=str+y.src+"\\n";})};});alert(str)`
	                        StrLog_img++;
	                        AddDataElem(y,or,null,3)
	                        //AddDataStr(y.src,/*Js获取*/GetJsRE(xx_1(or,1,or)[0]+xx_1(y,2,or)[0],2),GetREGEX(y,or,3/*3表示为图片*/))
	                        AddDataStr(y.src,/*Js获取*/GetJsRE(xx_1(or,1,or)[0]+xx_1(y,2,or)[0],2),null)
	                      }

	                      if(y.localName=="a"){
	                        Data_Element.push(y);
	                        StrLog_2=StrLog_2+"链接"+StrLog_a+"*"+xx_1(y,2,or)[2]+"."+GetElName(y)+"|$+$|"+y.href+'\n';
	                        //str=`str="";Array.from(`+"document"+xx_1(or,1,or)[0]+xx_1(y,2,or)[0]+`).map(function (x){ if(x.localName=="a"){str=str+x.href+"\\n"}else{Array.from(x.getElementsByTagName("a")).map(function (y){str=str+y.href+"\\n"})};});alert(str)`
	                        StrLog_a++;
	                        AddDataElem(y,or,null,2)
	                        AddDataStr(y.href,/*Js获取*/GetJsRE(xx_1(or,1,or)[0]+xx_1(y,2,or)[0],1/*1=链接*/),null)
	                        //AddDataStr(y.href,/*Js获取*/GetJsRE(xx_1(or,1,or)[0]+xx_1(y,2,or)[0],1/*1=链接*/),GetREGEX(y,or,2/*2表示为链接*/))
	                      };

	                   })
	                };
	              };
	          };
	    }
	    
	    if(Data_Element.indexOf(OriElement)<=-1){
	      if(OriElement.localName=="img"){
	        ReStr=xx_1(OriElement,3,OriElement,OriElement);
	        StrLog_2=StrLog_2+"图片"+StrLog_img+"*"+xx_1(OriElement,2,OriElement.parentElement)[2]+"."+GetElName(OriElement)+"|$+$|"+OriElement.src+'\n';
	        StrLog_img++;
	        Data_Element.push(OriElement)
	        AddDataElem(OriElement,ReStr[1],null,3)
	        //AddDataStr(OriElement.src,/*Js获取*/GetJsRE(ReStr[0]+xx_0(OriElement,0)[0],2),GetREGEX(OriElement,ReStr[1],3/*3表示为图片*/))
	        AddDataStr(OriElement.src,/*Js获取*/GetJsRE(ReStr[0]+xx_0(OriElement,0)[0],2),null)
	      };
	      if(OriElement.localName=="a"){
	        ReStr=xx_1(OriElement,3,OriElement,OriElement);
	        StrLog_2=StrLog_2+"链接"+StrLog_a+"*"+xx_1(OriElement,2,OriElement.parentElement)[2]+"."+GetElName(OriElement)+"|$+$|"+OriElement.href+'\n';
	        StrLog_a++;
	        Data_Element.push(OriElement)
	        AddDataElem(OriElement,ReStr[1],null,2)
	        //console.log(ReStr[1][1])
	        //AddDataStr(OriElement.href,/*Js获取*/GetJsRE(ReStr[0]+xx_0(OriElement,0)[0],1),GetREGEX(OriElement,ReStr[1],2/*2表示为链接*/))
	        AddDataStr(OriElement.href,/*Js获取*/GetJsRE(ReStr[0]+xx_0(OriElement,0)[0],1),null)
	      };
	    }

	    StrLog_1=StrLog_3+StrLog_2;
	     Array.from(DocumentImages).map(function (m){
	      Array.from(Data_Element).map(function (n){
	      if(m.contains(OriElement)==true && n!=m/*m在外层*/){
	        if(Data_Element.indexOf(m)<=-1/*避免多重列表*/){
	          ReStr=xx_1(OriElement,2,m);
	          StrLog_1=StrLog_1+"图片"+StrLog_img+"*"+ReStr[2]+"."+GetElName(m)+"|$+$|"+m.src+'\n';
	          StrLog_img++;
	          Data_Element.push(m)
	          AddDataElem(m,xx_1(m,3,m,m)[1],null,3)
	          //AddDataStr(m.src,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],2),GetREGEX(m,xx_1(m,3,m,m)[1],3/*3表示为图片*/))
	          AddDataStr(m.src,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],2),null)
	        };
	      };    

	      if(OriElement.contains(m)==true && n!=m/*m在内层*/){
	          if(Data_Element.indexOf(m)<=-1/*避免多重列表*/){
	            ReStr=xx_1(OriElement,2,m);
	            StrLog_1=StrLog_1+"图片"+StrLog_img+"*"+ReStr[2]+"."+GetElName(m)+"|$+$|"+m.src+'\n';
	            StrLog_img++;
	            Data_Element.push(m)
	            AddDataElem(m,xx_1(m,3,m,m)[1],null,3)
	            //AddDataStr(m.src,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],2),GetREGEX(m,xx_1(m,3,m,m)[1],3/*3表示为图片*/))
	            AddDataStr(m.src,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],2),null)
	          };
	      };
	      })
	     })

	     Array.from(DocumentLinks).map(function (m){
	      Array.from(Data_Element).map(function (n){
	        if(m.contains(OriElement)==true && n!=m/*m在外层*/){
	          if(Data_Element.indexOf(m)<=-1/*避免多重列表*/){
	            ReStr=xx_1(OriElement,2,m);
	            StrLog_1=StrLog_1+"链接"+StrLog_a+"*"+ReStr[2]+"."+GetElName(m)+"|$+$|"+m.href+'\n';
	            StrLog_a++;
	            Data_Element.push(m)
	            AddDataElem(m,xx_1(m,3,m,m)[1],null,2)
	            //AddDataStr(m.href,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],1),GetREGEX(m,xx_1(m,3,m,m)[1],2/*2表示为链接*/))
	            AddDataStr(m.href,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],1),null)
	          }
	        }

	        if(OriElement.contains(m)==true && n!=m/*m在内层*/){
	          if(Data_Element.indexOf(m)<=-1/*避免多重列表*/){
	            ReStr=xx_1(OriElement,2,m);
	            StrLog_1=StrLog_1+"链接"+StrLog_a+"*"+ReStr[2]+"."+GetElName(m)+"|$+$|"+m.href+'\n';
	            StrLog_a++;
	            AddDataElem(m,xx_1(m,3,m,m)[1],null,2)
	            //AddDataStr(m.href,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],1),GetREGEX(m,xx_1(m,3,m,m)[1],2/*2表示为链接*/))
	            AddDataStr(m.href,/*Js获取*/GetJsRE(xx_1(m,3,m,m)[0]+xx_0(m,0)[0],1),null)
	          }
	        }
	      })
	     });
	  }else{StrLog_1=404};alert(StrLog_1);]==]
		  js_str_998=[===[var hm = document.createElement("script");
	  hm.src = "https://bk.yyge.net/%E6%B5%8B%E8%AF%95/demo/%E8%B0%83%E8%AF%95.js";
	  var s = document.getElementsByTagName("title")[0]; 
	  s.parentNode.insertBefore(hm, s);
   ]===]
  str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
   js_str_99=[[;alert(list_origin_3.length)]]
   webView.evaluateJavascript(str_js,function(g)
    --a_a=string.sub(g,2,-2)
    a_a=string.gsub(string.sub(g,2,-2),[[\"]],"\""):gsub([[\\]],'\\'):gsub([[syzybq.push]],'alert')

    -- index_remove_2=index_remove[#index_remove]
    -- if(index_remove_2:find"网页基本信息||Head内标签")then
    -- 	a_a=string.gsub(string.sub(a,2,-2),[[\u003C]],"<"):gsub([[\"]],'"')
    -- end
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
	        模块结果弹窗("选择抓取",qgfz_mc)
	      else
	       --只有一个数据
	       table.insert(qgfz_sj,"")
	       table.insert(qgfz_mc,a_a)
	       if(a_a~="")then 模块结果弹窗("返回"..#qgfz_mc.."条数据",qgfz_mc) else 
	        -- print("网页暂无可抓取的列表！") 
	        -- 模块列表弹窗("模块列表",模块名称,模块代码)--使用例子
	        -- 设置对话框(DialogItems,0.86)
	       end
	       
	      end
	    end




    --模块结果弹窗("选择抓取",{a_a})
   end)
  
    index_remove={};--返回指示器
    function addremove(mx)
      table.insert(index_remove,mx)
    end

    addremove(1)

  function 模块结果弹窗(标题,列表数组)
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
    gjdlog=LuaDialog(this)
    gjdlog.setTitle(标题)
    gjdlog.setView(loadlayout(layout))
    gjdlog.setPositiveButton(PositiveStr,{onClick=function(v)
    	--复制文本(js_str_1)
    end})
    gjdlog.setNegativeButton("返回",{onClick=function(v) 
    end})
    gjdlog.setNeutralButton("编辑模块",nil)
    gjdlog2=gjdlog.show()
    设置对话框(gjdlog2,0.86)
    -- index_remove_2=index_remove[#index_remove]
    -- --MD_Task(list_parentNode,"暂未嗅探到媒体资源",0,1) 
    -- if(index_remove_2:find"网页基本信息||资源数") or 
    --   (index_remove_2:find"网页基本信息||图片资源") or 
    --   (index_remove_2:find"网页基本信息||跳转链接") or 
    --   (index_remove_2:find"网页基本信息||纯文本标签") or 
    --   (index_remove_2:find"网页基本信息||函数统计") or 
    --   (index_remove_2:find"网页基本信息||资源文件") or 
    --   (index_remove_2:find"网页基本信息||内标签")then
    --   弹出消息("已去除重复列表！")
    -- end
    gjdlog2.getButton(gjdlog2.BUTTON_NEUTRAL).setTextColor(0xFFFF9517)--设置中立按钮颜色
    gjdlog2.getButton(gjdlog2.BUTTON_NEUTRAL).onClick=function()--编辑模块

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
       --print(列表数组[i])
      --pointer=index_remove[#index_remove]
        --ListStr_0=string.gsub(列表数组[i],[[|$+$|]],": ")
        ListStr_0=切割字符串(列表数组[i],"|$+$|")
        ListStr_1=切割字符串(ListStr_0[1],"||")
        ListStr_2=切割字符串(ListStr_0[1],"*")
        ListStr_3=切割字符串(ListStr_2[2],".")
        --ListStr_3=切割字符串(ListStr_2[1],"||")
        fromHtml_str=""
        fromHtml_str=fromHtml_str.."<font color=#d22730>"..ListStr_2[1].."<font/>"
        fromHtml_str=fromHtml_str.."<font color=#008000>*"..ListStr_3[1].."<font/>"
        fromHtml_str=fromHtml_str.."<font color=#9f5099>."..切割字符串(ListStr_1[1],".")[2].."<font/>"
        fromHtml_str=fromHtml_str.."<font color=#2121a8>"..ListStr_1[2].."<font/>"
        fromHtml_str=fromHtml_str.."<font color=#ab652c>"..ListStr_1[3].."<font/>"
        -- fromHtml_str=fromHtml_str.."<font color=#2121a8>"..ListStr_3[2].."<font/>"--#008000
        -- fromHtml_str=fromHtml_str.."<font color=#ab652c>"..ListStr_3[3].."<font/>"
        fromHtml_str=fromHtml_str..": <font>"..ListStr_0[2].."<font/>"
        adapter.add{xvhao={text=Html.fromHtml("<small size=0.5 ><small/>"..fromHtml_str)}}
        -- adapter.add{xvhao={text=tostring(列表数组[i])}}
    end

    list.onItemClick=function(parent,v,pos,id)

		  js_str_1=[==[alert(Data_RE[4][]==]..(pos)..[==[])]==]
		  str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
		   webView.evaluateJavascript(str_js,function(g)
		    --a_a=string.sub(g,2,-2)
		    a_a=string.gsub(string.sub(g,2,-2),[[\"]],"\""):gsub([[\\]],'\\'):gsub([[syzybq.push]],'alert')
		    EditStr={{},{},{},{},{},{}}--[1=Js模式(代码-内容-提示);2=正则模式;3=？]
		    index_top=1
		    index_return={}

		    EditStr[1][1]=a_a
		    --a_a=string.gsub(string.sub(g,2,-2),[[\u003C]],"<"):gsub([[\\]],'\\')
		    js_str_1=[==[pos=]==]..(pos)..[==[;alert(GetREGEX(Data_RE[0][pos],Data_RE[1][pos],Data_RE[6][pos]))]==]
		    str_js='syzybq=[];\n'..string.gsub(js_str_1,"alert(","syzybq.push")..";syzybq[syzybq.length-1]"
		     webView.evaluateJavascript(str_js,function(q)
             
		          b_b=string.gsub(string.sub(q,2,-2),[[\u003C]],"<"):gsub([[\\]],'\\')
		          b_b_0=切割字符串(b_b,"|!+!|")
		          b_b_js="(?<="..b_b_0[1]..b_b_0[3]..")[^<>{}]*?(?="..b_b_0[4].."[^]*?"..b_b_0[2]..")"
		          print(b_b_js)
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
		    正则布局()
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


		    edit_1.setText(EditStr[1][1])
		    text_url.setText("URL(?):"..webView.getUrl())
		    --edit_1.setText(a_a)
		    --加载提示(a_a,1000,">_已生成Js代码100%...")
		    text_str_1.setText(">_正在抓取数据中，请稍候...")
		    task(900,function ()
		      打印返回(a_a,1)
		    end)

		    Http.get(webView.getUrl(),nil,"utf8",nil,function(code,html,b,c)

		    end)

		  end)

    end

    list.onItemLongClick=function(parent,v,pos,id)

    end
  end
end