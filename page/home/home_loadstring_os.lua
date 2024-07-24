---
--- File: home_loadstring_os.lua
--- Describe: 首页 - 实现首页所必要的功能 如：手册等功能
--- Created by Gityyge.
---
---
function table_encrypt(table_encrypt)
	packinfo=this.getPackageManager().getPackageInfo(this.getPackageName(),64)
	appinfo=this.getPackageManager().getApplicationInfo(this.getPackageName(),0)
	applabel=this.getPackageManager().getApplicationLabel(appinfo)
	appsign=string.sub(tostring(packinfo.signatures[0].toCharsString()),-15,-1)

	local minicrypto = {}
	local insert, concat, modf, tostring,char = table.insert, table.concat, math.modf,tostring, string.char
	local function numberToBinStr(x)
	  local ret = {}
	  while x~=1 and x~=0 do
	    insert(ret, 1, x%2)
	    x=modf(x/2)
	  end
	  insert(ret, 1, x)
	  for i = 1, 8 - #ret do
	    insert(ret, 1, 0)
	  end
	  return concat(ret)
	end
	local function computeBinaryKey(str)
	  local t = {}
	  for i = #str, 1, -1 do
	    insert(t, numberToBinStr(str:byte(i,i)))
	  end
	  return concat(t)
	end
	local binaryKeys = setmetatable({}, {__mode = "k"})
	local function binaryKey(key)
	  local v = binaryKeys[key]
	  if v == nil then
	    v = computeBinaryKey(key)
	    binaryKeys[key] = v
	  end
	  return v
	end
	local function initialize_state(key)
	  local S = {}; for i = 0, 255 do S[i] = i end
	  key = binaryKey(key)
	  local j = 0
	  for i = 0, 255 do
	    local idx = (i % #key) +1
	    j = (j + S[i] + tonumber(key:sub(idx, idx))) % 256
	    S[i], S[j] = S[j], S[i]
	  end
	  S.i = 0
	  S.j = 0
	  return S
	end
	local function encrypt_one(state, byt)
	  state.i = (state.i+1) % 256
	  state.j = (state.j + state[state.i]) % 256
	  state[state.i], state[state.j] = state[state.j], state[state.i]
	  local K = state[(state[state.i] + state[state.j]) % 256]
	  return K ~ byt
	end
	function minicrypto.encrypt(text, key)
	  local state = initialize_state(key)
	  local encrypted = {}
	  for i = 1, #text do
	    encrypted[i] = ("%02X"):format(encrypt_one(state, text:byte(i,i)))
	  end
	  return concat(encrypted)
	end
	function minicrypto.decrypt(text, key)
	  local state = initialize_state(key)
	  local decrypted = {}
	  for i = 1, #text, 2 do
	    insert(decrypted, char(encrypt_one(state, tonumber(text:sub(i, i+1), 16))))
	  end
	  return concat(decrypted)
	end
	local a=load((function(b,appsign)function bxor(c,d)local e=0;for f=0,31 do local g=c/2+d/2;if g~=math.floor(g)then e=e+2^f end;c=math.floor(c/2)d=math.floor(d/2)end;return e end;local h=function(b)local i={}local f=1;local j=b[f]while j>=0 do i[f]=b[j+1]f=f+1;j=b[f]end;return i end;local k=function(b,appsign)if#appsign<=0 then return{}end;local f=1;local l=1;for f=1,#b do b[f]=bxor(b[f],string.byte(appsign,l))l=l+1;if l>#appsign then l=1 end end;return b end;local m=function(b)local i=""for f=1,#b do i=i..string.char(b[f])end;return i end;return m(k(h(b),appsign))end)(table_encrypt,appsign))if a then a()else loadstring(minicrypto.decrypt([====[1250F3DF4CEE030212539E0200DCF51FAFFB948CFE6C1F90AFF207A547102B41A2439BB1931F804FC72630A138AADCA7F5D58D124FACED1436D7E8E1BC0C716DAC4D5BC3B71CB2FB862E7CE0EE6D08BB7AF4FFC0486674F69773766D6EE34FEE4754C1CB915333892EBF5F88F0BFFD70DF94A092054CA398C7EC0649986B3C6EBB651D75DB3CB01AADD14EA2CC93DD79916B69782435B259D85BE69DFFB947DAC41C52B54F000C32A4FA527F7DBBE05F838BFAC92DE5EDDA8788FA854EB651CA517E4760EA981C79A72D4646E517625546D3B08971F01033E68938FF08CA895207CCA011ECC8BAD89DEFF5507CF5BE96313C1FC864CB52FFA48B2F93B52A6A1665AB83D2EEE5FE578641931982A60881B886A7F3AF6B3D87E1555E3390ECDA7E210DA01245F9FCE62CE11A4827F3AF2CAD2685F7EBA8B91BF01FA41011003241E180A6ACB000AD356087B6A4CBC6E86906F4A3E587A46378D1C245D940187BEC9340220D1C4B768A9493A0FA1E703624A0B7EF45371E0A87AB9177819E3BFB0E037079770DA2B036E06890928F5B8CD97827AE68E7D949E040C6CA709754C42E9F233959B98CA27FF00BE78557146D6836D606535971F8F5000E4289A1221608CDC39BA74D70F55885A6095FD70D97B57DC01E67B1C22E697255DBAD7B705CA86C96CD26D92FC713B9317F58172F25AFBCFF70ADDD8A7E71FF97AD8CC940C160ED]====],"25ui6cv87fo5s"))() end
end

function Js参考手册()
	require "import"
	import "android.app.*"
	import "android.os.*"
	import "android.widget.*"
	import "android.view.*"
	import "android.graphics.Typeface"
	import "android.content.res.ColorStateList"
	import "android.graphics.drawable.GradientDrawable"
	import "android.content.Context"
	import "android.view.inputmethod.InputMethodManager"
	import "android.view.inputmethod.EditorInfo"
	import "android.view.KeyEvent"
	import "android.text.SpannableString"
	import "android.graphics.Color"
	import "android.text.style.ForegroundColorSpan"
	import "android.text.Spanned"
	import "android.text.Spannable"
	import "android.graphics.Typeface"
	import "android.text.Spanned"
	import "android.text.style.ForegroundColorSpan"
	import "android.text.style.StyleSpan"
	import "android.text.SpannableString"

	function MD提示(Activity,消息,type)
	  import "android.view.animation.*"
	  SnackerBar={shouldDismiss=true}
	  function Snakebar(fill)
	    local w=activity.width
	    local layout={
	      LinearLayout,
	      Gravity="bottom",
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
	      view.animate().translationY(300)
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
	      -- mSnackerBar.bckView.setOnTouchListener(View.OnTouchListener{
	      --   onTouch=function(view,event)
	      --     if event.Action==event.ACTION_DOWN then
	      --       mSnackerBar.shouldDismiss=false
	      --       frx=event.x-dp2px(8)
	      --       fx=event.x-dp2px(8)
	      --      elseif event.Action==event.ACTION_MOVE then
	      --       if math.abs(event.rawX-dp2px(8)-frx)>=2 then
	      --         v=math.abs((frx-event.rawX-dp2px(8))/(os.clock()-p)/1000)
	      --       end
	      --       p=os.clock()
	      --       frx=event.rawX-dp2px(8)
	      --       view.translationX=frx-fx
	      --       view.alpha=1-math.abs(view.translationX)/w
	      --      elseif event.Action==event.ACTION_UP then
	      --       mSnackerBar.shouldDismiss=true
	      --       local tx=view.translationX
	      --       if tx>=w/5 then
	      --         animate(view,w,(w-tx)/v)
	      --        elseif tx>0 and tx<w/5 then
	      --         animate(view,0,tx/v)
	      --        elseif tx<=-w/5 then
	      --         animate(view,-w,(w+tx)/v)
	      --        else
	      --         animate(view,0,-tx/v)
	      --       end
	      --       fx=0
	      --     end
	      --     return true
	      --   end
	      -- })
	      return mSnackerBar
	    end
	    function SnackerBar:show()
	      local view=self.view
	      addView(view)
	      view.translationY=300
	      view.animate().translationY(0)
	      .setInterpolator(AccelerateDecelerateInterpolator())
	      .setDuration(800).start()
	      indefiniteDismiss(self)
	    end

	    SnackerBar.build():show()
	  end
	  Snakebar(消息)--这是函数  开始
	end--这是函数  结束

	--两角圆弧背景
	function ArcBackground(id)
	  drawable = GradientDrawable()
	  drawable.setColor(0xffffffff)
	  drawable.setCornerRadii({20,20,20,20,0,0,0,0});
	  id.setBackgroundDrawable(drawable)
	end

	--切割函数
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

	--控件点击波纹
	function ViewClickRipple(id,color)
	  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
	  local typedArray =activity.obtainStyledAttributes(attrsArray)
	  ripple=typedArray.getResourceId(0,0)
	  Pretend=activity.Resources.getDrawable(ripple)
	  Pretend.setColor(ColorStateList(int[0].class{int{}},int{color}))
	  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{color})))
	end


	--读取文件所有文本
	function ReadFileAllText(path)
	  return io.open(path):read("*a")
	end


	function 弹窗圆角(控件,背景色,上角度,下角度)
	  import "android.graphics.drawable.GradientDrawable"
	  import "android.graphics.drawable.BitmapDrawable"
	  if not 上角度 then
	    上角度=25
	  end
	  if not 下角度 then
	    下角度=上角度
	  end
	  控件.setBackgroundDrawable(GradientDrawable()
	  .setShape(GradientDrawable.RECTANGLE)
	  .setColor(背景色)
	  .setCornerRadii({上角度,上角度,上角度,上角度,下角度,下角度,下角度,下角度}))
	end

	--自定义窗口
	function DialogDiy(ID,Width,Height)
		params = ID.getWindow().getAttributes();
		params.width = activity.getWidth()*Width;--
		params.height = activity.getHeight()*Height ;
		ID.getWindow().setAttributes(params);
	end

	function 隐藏对话框按钮(ID)
		ID.getButton(ID.BUTTON_POSITIVE).setVisibility(View.GONE)--隐藏积极按钮
		ID.getButton(ID.BUTTON_NEGATIVE).setVisibility(View.GONE)--隐藏消极按钮
		ID.getButton(ID.BUTTON_NEUTRAL).setVisibility(View.GONE)--隐藏中立按钮
	end

	function 输入法(type,ID)
	  imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)
	  if(type==0)then imm.hideSoftInputFromWindow(ID.getWindowToken(), 0); end--关闭
	  if(type==1)then imm.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS) end--打开
	end
	--渐变
	function 渐变(left_jb,right_jb,id)
		import "android.graphics.drawable.GradientDrawable"
		drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
		  right_jb,--右色
		  left_jb,--左色
		});
		id.setBackgroundDrawable(drawable)
	end
	--渐变

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

	-- --状态栏,导航栏  背景色--
	activity.getWindow().setStatusBarColor(0xFF3F51B5)
	activity.getWindow().setNavigationBarColor(0xffffffff)


	datalist="https://bk.yyge.net/FTP/data.lua"--检查更新开始
	      Http.get(datalist,nil,"utf8",nil,function(code,html,b,c)
	      loadstring(html)()
	end)


	--列表页
	function ItemListActivity(v,Titledata,Jsdata)---Event_Title,Event_Explain
	  if(v==1)then ItemTitleTable=TableTitle_1 ItemCodeStrTable=TableData_1 left_jb=0xFF1265D9 right_jb=0xFF6793E6 img="drawable/01_1.jpg" end
	  if(v==2)then ItemTitleTable=Event_Title ItemCodeStrTable=Event_Explain left_jb=0xFF4600EB right_jb=0xFF8027E2 img="drawable/02_1.jpg" end
	  if(v==3)then ItemTitleTable=TableTitle_3 ItemCodeStrTable=TableData_3 left_jb=0xFFF74D15 right_jb=0xFFFEAB43 img="drawable/03_1.jpg" end
	  if(v==4)then ItemTitleTable=TableTitle_4 ItemCodeStrTable=TableData_4 left_jb=0xFF2EB60F right_jb=0xFF90EA14 img="drawable/04_1.jpg" end
	  if(v==5)then ItemTitleTable=TableTitle_5 ItemCodeStrTable=TableData_5 left_jb=0xFFFF0046 right_jb=0xFFF8599C img="drawable/05_1.jpg" end
	  Title=TitleTable[v]
	  layout={
	    FrameLayout,
	    layout_height="fill",
	    layout_width="fill",
	    id="ItemList",

	    --标题栏布局
	    {
	      LinearLayout,
	      orientation="vertical",
	      layout_height="fill",
	      layout_width="fill",
	      id="Top_bar",
	      background="#FF3F51B5",


	      {
	        LinearLayout,
	        layout_height="56dp",
	        layout_width="fill",
	        Gravity="center|left",
	        {
	          ImageView,
	          layout_height="56dp",
	          id="ItemList_off",
	          layout_width="56dp",
	          padding="16dp",
	          colorFilter="#ffffffff",
	          src="drawable/off.png",
	          onClick=function()
	            ItemList.setVisibility(View.GONE)--隐藏布局
	            --ItemList.removeViewAt(0)
	          end
	        },
	             {
	              TextView,
	              text=Title,
	              textSize="18sp",
	              textColor="#ffffffff",
	             },
	      },

	    },


	    --主体布局
	    {
	      LinearLayout,
	      orientation="vertical",
	      layout_height="fill",
	      layout_width="fill",
	      {
	        LinearLayout,
	        layout_marginTop="56dp",
	        layout_height="fill",
	        layout_width="fill",
	        Gravity="center",
	        id="zt",

	        {
	          GridView,
	          numColumns=2,
	          layout_height="fill",
	          layout_width="fill",
	          background="#00ffffff",
	          Gravity="center",
	          VerticalScrollBarEnabled=false,--垂直不显示滚动按钮
	          --OverScrollMode=2,--取消滚动到底/顶部的圆弧
	          id="list",
	        },
	      },
	    },

	  }

	 zy.addView(loadlayout(layout))

	  ArcBackground(zt)--圆角
	  ViewClickRipple(ItemList_off,0x21000000)--点击波纹-
	  function ItemAc(height,margin_bottom,visiblity)
	    item=
	    {
	      LinearLayout,
	      layout_width="50%w",
	      layout_height="13%h",
	      Gravity="center",
	      {
	        CardView,
	        layout_width="38%w",
	        layout_height="10%h",
	        cardElevation="15",
	        radius="15",
	        {
	          LinearLayout,
	          layout_width="fill",
	          layout_height="10%h",
	          Gravity="bottom",
	        {
	          FrameLayout,--帧布局
	          layout_width="fill",
	          layout_height="fill",--
	           
	            {
	              ImageView,
	              layout_width='fill';--图片宽度
	              layout_height='fill';--图片高度-
	              scaleType='centerCrop';--图片显示类型--
	               clickable="true",
	               focusable="true",
	              src=img,
	            },
	            {
	              LinearLayout,
	              layout_width="fill",
	              layout_height="fill",
	              orientation="vertical",--orientation（其它子类的排布方式）:vertical属性为垂直分布
	              Gravity="bottom",
	              onClick=function(e)
	                for i=1,#Titledata do
	                  if(Titledata[i]==e.getChildAt(0).text)then

	                    if(v==2)then 
	                      DetailActivity(ItemList,Titledata[i],e.getChildAt(1).text,Jsdata[i],left_jb,right_jb)
	                     else
	                      DetailActivity(ItemList,Titledata[i],"",Jsdata[i],left_jb,right_jb)
	                    end
	                   else 
	                    if(v==3)then
	                      if(Titledata[i]==e.getChildAt(0).text.."\n"..e.getChildAt(1).text)then
	                        DetailActivity(ItemList,e.getChildAt(0).text,e.getChildAt(1).text,Jsdata[i],left_jb,right_jb)
	                      end
	                    end


	                  end
	                end
	              end,
	                {
	                  TextView,
	                  id="title_ID",-------
	                  layout_width="fill",
	                  layout_height=height,--
	                  Gravity="center|left",
	                  --layout_marginBottom="3dp",--
	                  textColor="#ffffffff",
	                  background="FFB5311F",
	                  paddingLeft="10dp",
	                  textSize="16sp",
	                },

	                {
	                  TextView,
	                  id="event_name",
	                  layout_width="fill",
	                  --layout_height="10dp",--
	                  Gravity="center|left",
	                  visibility=visiblity,
	                  layout_marginBottom=margin_bottom.."dp",
	                  textColor="#ffffffff",
	                  background="FFB5311F",
	                  paddingLeft="10dp",
	                  textSize="12sp",
	                },
	            };
	          };
	        },
	      },
	    }
	  end

	  if(v==2)or(v==3)then ItemAc("22dp",9,View.VISIBLE) else ItemAc("40dp",0,View.GONE) end


	  datas={}
	  adp=LuaAdapter(activity,datas,item)





	  for i=1,#Titledata do
	    if(v==3)then
	        Titl_str_1=string.split(Titledata[i],"\n")[1]
	        Titl_str_2=string.split(Titledata[i],"\n")[2]
	        table.insert(datas,{title_ID=Titl_str_1,event_name=Titl_str_2})
	      else
	        table.insert(datas,{title_ID=Titledata[i],event_name=Event_Name[i]})
	    end    
	  end

	  list.setAdapter(adp)

		import "android.view.animation.TranslateAnimation"
		import "android.view.animation.LayoutAnimationController"
		import "android.view.animation.AlphaAnimation"

        animationSet = AnimationSet(true)--定义动画变量,使用AnimationSet类，使该动画可加载多种动画
        layoutAnimationController=LayoutAnimationController(animationSet,0.2);--设置布局动画，布局动画的意思是布局里面的控件执行动画，而非单个控件动画，参数:动画名，延迟
        layoutAnimationController.setOrder(LayoutAnimationController.ORDER_NORMAL); -- ORDER_   NORMAL  REVERSE  RANDOM


        start_dh1= AlphaAnimation(0,1);--渐变动画 从透明到不透明 0表示透明 1表示不透明
        start_dh1.setDuration(200);--动画时长
        animationSet.addAnimation(start_dh1);--添加动画 将动画添加到animationSet


        start_dh2=ScaleAnimation(1.1,1,1.1,1,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_PARENT,2)--伸缩动画
        start_dh2.setDuration(400);--动画时长
        animationSet.addAnimation(start_dh2);--添加动画  将动画添加到animationSet

        list.setLayoutAnimation(layoutAnimationController);--id控件加载动画 DialogExternal为控件ID



	  渐变(right_jb,left_jb,Top_bar)--设置顶栏颜色----

	end

	--代码页
	function DetailActivity(Activity,Title,Subtitle,Text,left_color,right_color)
	  if(string.sub(Text,1,1)=="`")then--
	    TextSp=string.sub(Text,2,-2)
	    style=0
	   else
	    TextSp=Text
	    style=1
	  end

	  for i=1,#TableData_1 do
	    if(Text==TableData_1[i])then
	      manual="语法手册"
	      Att=TableAtt_1[i]
	    end
	  end

	  for i=1,#Event_Explain do
	    if(Text==Event_Explain[i])then
	      manual="事件手册"
	      Att=Event_Att[i]
	    end
	  end

	  for i=1,#TableData_3 do
	    if(Text==TableData_3[i])then
	      manual="方法手册"
	      Att=TableAtt_3[i]
	    end
	  end

	  for i=1,#TableData_4 do
	    if(Text==TableData_4[i])then
	      manual="常用函数"
	      Att=TableAtt_4[i]
	    end
	  end

	  for i=1,#TableData_5 do
	    if(Text==TableData_5[i])then
	      manual="高级函数"
	      Att=TableAtt_5[i]
	    end
	  end

	  if(Att=="N/A")then
	    Name={"属性未知","属性未知","属性未知","属性未知","属性未知","属性未知","属性未知"}
	    Explain={"N/A! 开发者正在加班添加中...","N/A!,开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中..."}
	    Imgsrc="drawable/NA.png"
	  end

	  if(Att=="")then
	    Visibility=View.GONE--隐藏
	    Visibility_1=View.VISIBLE--显示反馈对话框
	    src="drawable/alert_circle.png"--关于反馈
	    Imgsrc="drawable/NA.png"--N/A图标
	   else
	    Visibility=View.VISIBLE--显示
	    Visibility_1=View.GONE--隐藏反馈对话框
	    src="drawable/cube_outline.png"
	    if(Att=="N/A")then
	      Imgsrc="drawable/NA.png"--N/A图标
	     else
	      Imgsrc="drawable/cube_outline.png"--属性图标
	    end
	  end

	  layout={
	    FrameLayout,
	    layout_height="fill",
	    layout_width="fill",
	    id="Detail",
	       --标题栏布局---
	    {
	      LinearLayout,
	      orientation="vertical",
	      layout_height="fill",
	      layout_width="fill",
	      background="#FFFFFFFF",--背景
	      --标题栏布局
	      {
	        LinearLayout,
	        orientation="vertical",
	        layout_height="fill",
	        layout_width="fill",
	        id="DetaliTop",
	        {
	          LinearLayout,
	          layout_height="56dp",
	          layout_width="fill",
	          Gravity="center|left",
	          {
	            ImageView,
	            id="Detali_off",
	            layout_height="56dp",
	            layout_width="56dp",
	            padding="16dp",
	            colorFilter="#ffffffff",
	            src="drawable/off.png",
	            onClick=function()
	              输入法(0,CodeID)
	              Detail.setVisibility(View.GONE)--隐藏布局
	              --ItemList.removeViewAt(0)
	            end
	          },
	             {
	              TextView,
	              text=Title,
	              textSize="18sp",
	              textColor="#ffffffff",
	             },

	          {
	            LinearLayout,
	            layout_height="56dp",
	            layout_width="fill",
	            Gravity="center|right",
	            {
	              ImageView,
	              id="Detali_copy",
	              layout_height="56dp",
	              layout_width="56dp",
	              padding="16dp",
	              colorFilter="#ffffffff",
	              src="drawable/content_copy.png",
	              onClick=function()
	              输入法(0,CodeID)
	               复制文本(CodeID.text)
	               MD提示(Detail,"已复制代码",0)
	                --ItemList.removeViewAt(0)                                                                                                                                                            
	              end
	            },
	            {
	              ImageView,
	              id="Detali_circle",
	              layout_height="56dp",
	              layout_width="56dp",
	              padding="16dp",
	              colorFilter="#ffffffff",
	              src=src,
	              --Visibility=Visibility,
	              onClick=function()
	               --Detail.setVisibility(View.GONE)--隐藏布局
	               输入法(0,CodeID)
	               --CodeID.setFocusable(false);
	               ProposalActivity(Detail,Title,Subtitle,Text)
	               Detali_circle.setVisibility(View.GONE)--隐藏反馈&属性
	               Detali_copy.setVisibility(View.GONE)--隐藏复制
	              end
	            },

	          },
	        },
	      },
	     },
	       --主体布局
	      {
	        LinearLayout,
	        orientation="vertical",
	        layout_height="fill",
	        layout_width="fill",
	        {
	          LinearLayout,
	          layout_marginTop="56dp",
	          layout_height="fill",
	          layout_width="fill",
	          Gravity="center",
	          background="#FFFFFFFF",
	          id="zt",
	        {
	          ScrollView;
	          layout_height="fill";
	          --DescendantFocusability=131072;
	          VerticalScrollBarEnabled=false,--隐藏滑动条
	          --layout_marginBottom="10dp",
	          id="Scroll";
	          layout_width="fill";
	            {
	              LinearLayout,
	              orientation="vertical",
	              layout_height="fill",
	              layout_marginTop="10dp",
	              layout_width="fill",--
	              paddingLeft="2%w",
	              paddingRight="2%w",
	          {
	            EditText;
	            id="CodeID";
	            text=TextSp;
	            textSize="15sp",--大小
	            layout_height="fill";
	            layout_width="85%w";
	            layout_marginBottom=Activity.getHeight()*0.03,

	            --HorizontallyScrolling=true,--
	            --inputType="textMultiLine",
	          };
	        };
	            };
	        },
	      },
	  }

	  Activity.addView(loadlayout(layout))

	  ArcBackground(zt)--圆角
	  ViewClickRipple(Detali_off,0x21000000)--点击波纹
	  ViewClickRipple(Detali_copy,0x21000000)--点击波纹
	  ViewClickRipple(Detali_circle,0x21000000)--点击波纹--
	  渐变(right_color,left_color,DetaliTop)
	  --CodeID.setFocusableInTouchMode(false);--不可编辑----
	  --CodeID.setKeyListener(null);--不可粘贴，长按不会弹出粘贴框
	  -- CodeID.setClickable(false);--不可点击，但是这个效果我这边没体现出来，不知道怎没用
	   --CodeID.setFocusable(false);--不可编辑
	 --setwidth
	 --width()
	 -- CodeID.setFocusable(false);
	 --CodeID.setWidth(Activity.getWidth()*0.5)--

	  --CodeID.getLayoutParams().width = Activity.getWidth()*0.5;
	  
	  --CodeID.setPadding(150,0,0,0)
	  function 绘制行号(type)
	    import "android.graphics.Color"
	    import "android.graphics.Paint"
	    --CodeID.setFocusable(true)--获取焦点

	    CodeID.background=LuaDrawable(function(canvas,paint,d)
	      function getTextWidth(paint,str)--计算文字宽度--------
	        local iRet = 0;
	        if str ~= nil and #str > 0 then
	          local len =#str;
	          local widths =float[len];
	          paint.getTextWidths(str, widths);
	          for j = 0,len-1 do
	            iRet=iRet+Math.ceil(widths[j]);
	          end
	        end
	        return iRet;
	      end
	      if(type==0)then else
	        paint.setColor(Color.GRAY);--颜色
	        paint.setAntiAlias(true);
	        paint.setStrokeWidth(2);--宽度

	          paint.setTextSize(CodeID.getTextSize()-5);--行号文字大小
	          paint.setStyle(Paint.Style.FILL);

	            for l=0,CodeID.getLineCount() do
	                Y=((l+1)*CodeID.getLineHeight())-(CodeID.getLineHeight()/10);
	                canvas.drawText(tostring(l+1),0,Y,paint);--行号
	                canvas.save();
	                
	            end

	        y=CodeID.getLineCount()*CodeID.getLineHeight();
	        canvas.drawLine(CodeID.getCompoundPaddingLeft()-5,0,CodeID.getCompoundPaddingLeft()-5,CodeID.getHeight()+y,paint);--左边的线条
	        canvas.save();
	        canvas.restore();
	      end

	    end)
	    Scroll.onTouch=function(v,event)
	      CodeID.requestFocusFromTouch();
	      return false;
	    end
	  end

	  function 高亮语法(type)
	      keywords={
	        ["&"]=0xFFBF4500,
	        ["+"]=0xFFBF4500,
	        ["-"]=0xFFBF4500,
	        ["%%"]=0xFFBF4500,
	        ["="]=0xFFBF4500,
	        ["*"]=0xFFBF4500,
	        ["^"]=0xFFBF4500,
	        ["|"]=0xFFBF4500,
	        ["^"]=0xFFBF4500,
	        ["?"]=0xFFBF4500,
	        ["<"]=0xFFBF4500,
	        [">"]=0xFFBF4500,
	        ["if"]=0xFFC511B9,
	        ["else"]=0xFFC511B9,
	        ["var "]=0xFFC511B9,
	        ["return"]=0xFFC511B9,
	        ["new"]=0xFFC511B9,
	        ["const"]=0xFFC511B9,
	        ["let"]=0xFFC511B9,
	        ["this"]=0xFFC511B9,
	        ["try"]=0xFFC511B9,
	        ["catch"]=0xFFC511B9,
	        ["null"]=0xFFC511B9,
	        ["undefined"]=0xFFC511B9,
	        ["false"]=0xFFC511B9,
	        ["true"]=0xFFC511B9,
	        ["function"]=0xFFC511B9,
	      }

	      function highlight(ss)
	          local str = tostring(ss);
	          local color_Alignstart={};--颜色校准起始点 -注释
	          local color_Alignend={};--颜色校准终点 -注释--
	          local str_start={};
	          local str_end={};

	           for s,e,c in str:gfind('function (.-)%(.-%)') do
	            keywords[c]=0xFF1B00E6
	           end

	           for s,e,c in str:gfind('var (.-)=') do
	            keywords[c]=0xFF1B00E6
	           end

	           for s,e,c in str:gfind('const (.-)=') do
	            keywords[c]=0xFF1B00E6
	           end

	           for s,e,c in str:gfind('let (.-)=') do
	            keywords[c]=0xFF1B00E6
	           end

	           if(left_color==0xFFF74D15)then
	             for s,e,c in str:gfind('方法：(.-)\n') do
	              keywords[c]=0xFFE01D13--
	             end

	             for s,e,c in str:gfind('属性：(.-)\n') do
	              keywords[c]=0xFFE01D13--
	             end
	           end

	          function divcolor_max(o,v)
	            for s,e,c in str:gfind(o) do
	              --s=起点位置；e=结束为止；c=字符串

	              function MaxWriteStr()--写入最大初始高亮数组--用于注释高亮
	                table.insert(color_Alignstart,s)
	                table.insert(color_Alignend,e)
	              end--写入初始高亮数组

	              function WriteStr()--写入初始高亮数组
	                table.insert(str_start,s)
	                table.insert(str_end,e)
	              end--写入初始高亮数组



	              function EditTextColor(dev_start,dev_end,Color)--设置颜色 参数1：起始位置 参数2：结尾位置 参数3：颜色
	                ss.setSpan(ForegroundColorSpan(Color), utf8.len(str,1,s)-dev_start, utf8.len(str,1,e)-dev_end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	              end

	              if(c~="")then
	                if s then
	                  -- print(c.."--")
	                 str_end_1=string.sub(c,-1,-1)
	                 str_end_2=string.sub(c,-2,-2)
	                 str_end_3=string.sub(c,1,1)
	                 --o:匹配参数
	                 if(o=="/(.-)/.")then--特殊字符重定义
	                   if (str_end_1=="i") or (str_end_1=="g") or  (str_end_1=="m") then
	                      EditTextColor(1,0,0xFFE01D13)
	                     else
	                      if (str_end_1=="*") and (str_end_3=="*") then
	                        WriteStr()
	                        EditTextColor(1,0,0xFF049100)
	                       else
	                        EditTextColor(1,1,0xFFE01D13)
	                      end
	                   end
	                    else
	                        if(#str_start~=0)then 
	                          for q=1,#str_start do--过滤
	                                if(e > str_start[q] and e < str_end[q] )then--判断注释里面是否含有其他符号
	                                  --print(string.sub(str,s,e))
	                                  MaxWriteStr()--写入校准颜色
	                                  if(e~=str_end[#str_end-1])then WriteStr() end--
	                                 else
	                                  EditTextColor(1,0,v)--设置颜色
	                                end
	                          end--过滤
	                          WriteStr()
	                         else
	                          WriteStr()
	                          EditTextColor(1,0,v)
	                        end

	                 end--写入注释和正则

	                 else

	                    EditTextColor(1,0,0xff808080)
	                end
	              end
	            end

	          end
	          if(type==0)then
	            divcolor_max('==(.-)==',0xFFE01D13)
	            divcolor_max('%d%.(.-)\n',0xFF049100)----
	            divcolor_max('  //(.-)：',0xFF049100)--单行注释1--中文冒号
	            divcolor_max(' //(.-)\n',0xFF049100)--单行注释2--空一格
	            divcolor_max('\n  /%*(.-)  %*/\n',0xFF049100)--多行注释
	           else
	            --divcolor_max('\n /%*(.-)\n %*/',0xFF049100)--多行注释
	            divcolor_max('//(.-)\n',0xFF049100)--设置注释颜色 //xx
	            divcolor_max('/(.-)/.',0xFFE01D13)--设置注释颜色 /xxx/ 匹配规则
	            divcolor_max('`(.-)`',0xFFE01D13)--设置多行字符串 `xx` 注释
	            divcolor_max('\'(.-)\'',0xFFE01D13)--设置单引号颜色 'xxx'字符串
	            divcolor_max('\"(.-)\"',0xFFE01D13)--设置双引号颜色  "xxx"字符串
	            --divcolor_max('\n/%*(.-)%*/\n',0xFF049100)--多行注释 /*xxx*/ 注释--
	            
	          end


	          for i=1,#color_Alignstart do--颜色校准
	            ss.setSpan(ForegroundColorSpan(0xFF049100), utf8.len(str,1,color_Alignstart[i])-1, utf8.len(str,1,color_Alignend[i]), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	          end

	          function divcolor_0(e,p)--设置基准符号颜色的函数
	            local arr_start={};
	            local arr_end={};
	              for s,e,c in str:gfind("("..e..")") do
	                local cey=keywords[c]
	                if cey then
	                  table.insert(arr_start,s)
	                  table.insert(arr_end,e)
	                 else--0xff808080--灰色
	                  ss.setSpan(ForegroundColorSpan(p), utf8.len(str,1,s)-1, utf8.len(str,1,e), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	                end
	              end
	              
	              for q=1,#str_start do--过滤
	                for v=1,#arr_end do
	                  if(#arr_start>0)then
	                    if(arr_end[v] > str_start[q] and arr_end[v] < str_end[q] )then
	                      arr_start[v]=0
	                      arr_end[v]=0
	                    end
	                  end
	                end
	              end--过滤
	              
	              for i=1,#arr_start do--设置基本颜色--
	                if(arr_start[i]~=0)then--0xFFE01D13--红色-
	                  if(e:match("(%a+)")==e) then 
	                      mat=string.sub(str,arr_start[i]-1,arr_end[i]+1)--判断当前字符串位置 -1 +1 是否等于字母 等于的话就不高亮-
	                       --e:高亮字符串
	                     
	                      if(mat:match("(%a+)")~=mat) then 
	                        if(string.sub(str,arr_start[i],arr_end[i]+1):match("(%a+)")==e)then --关键字符串+1 是的字母是否等于原字符串
	                         ss.setSpan(ForegroundColorSpan(p), utf8.len(str,1,arr_start[i])-1, utf8.len(str,1,arr_end[i]), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	                        end
	                         --print(string.sub(str,arr_start[i],arr_end[i]+1):match("(%a+)"))
	                        
	                      end
	                    
	                     else
	                      ss.setSpan(ForegroundColorSpan(p), utf8.len(str,1,arr_start[i])-1, utf8.len(str,1,arr_end[i]), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	                  end 
	                 
	                end
	              end--设置基本颜色
	          end--设置基准符号颜色的函数


	          function divcolor_1(e,v)--设置其他高亮颜色的函数
	            local arr_start={};
	            local arr_end={};
	            for s,e,c in str:gfind(e) do
	              --s=起点位置；e=结束为止；c=字符串
	              if s then
	                table.insert(arr_start,s)
	                table.insert(arr_end,e)
	                --ss.setSpan(ForegroundColorSpan(v), utf8.len(str,1,s)-1, utf8.len(str,1,e), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	               else
	                ss.setSpan(ForegroundColorSpan(0xff808080), utf8.len(str,1,s)-1, utf8.len(str,1,e), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	              end
	            end

	            for q=1,#str_start do--过滤
	              for p=1,#arr_end do
	                if(#arr_start>0)then
	                  if(arr_end[p] > str_start[q] and arr_end[p] < str_end[q] )then
	                    arr_start[p]=0
	                    arr_end[p]=0
	                  end
	                end
	              end
	            end--过滤
	            
	            for i=1,#arr_start do--设置基本颜色
	              if(arr_start[i]~=0)then
	               ss.setSpan(ForegroundColorSpan(v), utf8.len(str,1,arr_start[i])-1, utf8.len(str,1,arr_end[i]), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
	              end
	            end--设置基本颜色
	          end--设置其他高亮颜色的函数

	          if(type~=0)then
	            divcolor_1('(%d)',0xFF1B00E6)--数字高亮
	            divcolor_1('(-%d)',0xFF1B00E6)--数字高亮
	          end

	          for k,v in pairs(keywords) do
	              divcolor_0(k,v)
	          end

	        return ss
	      end

	      --EditText文字变化监听
	      CodeID.addTextChangedListener{
	        onTextChanged=function()
	          highlight(CodeID.getText())
	        end
	      }
	      --初始化高亮
	      highlight(CodeID.getText())
	  end

	 

	  if(style==0)then
	    --CodeID.setTextColor(0xFF049100)---
	   CodeID.getLayoutParams().width = Activity.getWidth()*0.95;
	   CodeID.setPadding(Activity.getHeight()*0.01,0,0,0)---
	   else
	    CodeID.getLayoutParams().width = Activity.getWidth()*0.95;--
	    CodeID.setPadding(Activity.getHeight()*0.03,0,0,0)---
	  end

	  绘制行号(style)
	  高亮语法(style)


	  if(Att~="N/A" and Att~="")then
	    datalist="https://bk.yyge.net/FTP/Att/"..Att..".lua"--
	    Http.get(datalist,nil,"utf8",nil,function(code,html,b,c)

	      if(code~=404)then
		      loadstring(html)()
		      Name=string.split(属性名称,"\n")
		      Explain=string.split(属性说明,"\n") 
	      else
		      Name=string.split(属性名称,"\n")
		      Explain=string.split(属性说明,"\n")
	      end --判断网络--结束 

	    end)
	  end
	end



	--属性&反馈
	function ProposalActivity(Activity,Title,Subtitle,Text)
	  if(Att=="")then
	    Title_1="反馈"
	   else
	    Title_1="属性"
	  end
	  layout={
	      FrameLayout,
	      layout_height="fill",
	      layout_width="fill",
	      id="Proposal",
	       --标题栏布局
	    {
	      LinearLayout,
	      orientation="vertical",
	      layout_height="fill",
	      layout_width="fill",
	      background="#FFFFFFFF",--背景
	      --标题栏布局
	      {
	        LinearLayout,
	        orientation="vertical",
	        layout_height="fill",
	        layout_width="fill",
	        id="ProposalTop",
	        {
	          LinearLayout,
	          layout_height="56dp",
	          layout_width="fill",
	          Gravity="center|left",
	          {
	            ImageView,
	            id="Proposal_off",
	            layout_height="56dp",
	            layout_width="56dp",
	            padding="16dp",
	            colorFilter="#ffffffff",
	            src="drawable/off.png",
	            onClick=function()
	              输入法(0,fk_edit)
	              Proposal.setVisibility(View.GONE)--隐藏布局
	               Detali_circle.setVisibility(View.VISIBLE)--显示反馈&属性
	               Detali_copy.setVisibility(View.VISIBLE)--显示复制
	              DialogDiy(argbDialog,0.92,0.92)

	            end
	          },
	            {
	              TextView,
	              text=Title_1.."!>>"..Subtitle,
	              textSize="18sp",
	              textColor="#ffffffff",
	            },

	            {
	              LinearLayout,
	              layout_height="56dp",
	              layout_width="fill",
	              paddingRight="1%w",
	              Gravity="center|right",
	              {
	                ImageView,
	                id="Proposal_check",
	                Visibility=Visibility_1,
	                layout_height="56dp",
	                layout_width="56dp",
	                padding="14.5dp",
	                colorFilter="#ffffffff",
	                src="drawable/check.png",
	                onClick=function()
	                输入法(0,CodeID)
	                if(fk_edit.text=="")then 
	                  MD提示(Proposal,"输入反馈建议后才可以提交哦~",1) 
	                 else
	                  MD提示(Proposal,"正在跳转聊天窗口...",0)
	                  联系QQ(203455278)
	                  复制文本("反馈手册："..manual..">"..Title.."\n反馈代码："..Subtitle.."\n修改建议：\n"..fk_edit.text)
	                end
	                                                                                                                                                      
	                end
	              },
	            },
	        },


	      },
	     },
	       --主体布局
	      {
	        LinearLayout,
	        orientation="vertical",
	        layout_height="fill",
	        layout_width="fill",
	        {
	          LinearLayout,
	           layout_marginTop="56dp",
	          layout_height="fill",
	          layout_width="fill",
	          Gravity="center",
	          background="#FFFFFFFF",
	          id="zt",
	          {
	            ScrollView;
	            layout_height="fill";
	            id="Scroll";
	            layout_width="fill";
	            VerticalScrollBarEnabled=false,--隐藏滑动条
	            {
	              LinearLayout,
	              orientation="vertical",
	              layout_height="fill",
	              -- layout_marginTop="10dp",
	              layout_width="fill",

	              -- paddingLeft="2%w",
	              -- paddingRight="2%w",
	              {
	                LinearLayout,
	                orientation="vertical",
	                layout_width="fill",
	                layout_height="fill",
	                
	                Visibility=Visibility,
	                id="mLinearLayout",
	              },

	              {
	                TextView;
	                text="如果您在查看当前代码的时候，发现了什么问题或者您有更好的建议，那么欢迎在下面反馈 点击\"提交反馈\"后系统会复制反馈内容并联系开发者,或者直接加入官方群组进行问题讨论\n\n反馈手册："..manual..">"..Title.."\n反馈代码："..Subtitle.."\n修改建议：";
	                textSize="16sp",--大小----
	                layout_height="fill";--
	                layout_width="fill";
	                Visibility=Visibility_1,
	                paddingLeft="3%w",
	                paddingRight="3%w",
	                paddingTop="2%w",
	                --textColor="#FFF02A55"
	                --HorizontallyScrolling=true,
	              };

	              {
	                LinearLayout,
	                orientation="vertical",
	                layout_height="fill",
	                layout_width="fill",
	                Visibility=Visibility_1,
	                paddingLeft="3%w",
	                paddingRight="3%w",--
	                {
	                  EditText;
	                  id="fk_edit";
	                  Hint="在此输入反馈建议...";
	                  --text="546666666666666666666";
	                  textSize="15sp",--大小--
	                  layout_height="fill";
	                  layout_width="90%w";
	                  HorizontallyScrolling=true,
	                };
	              };
	            };
	          };
	        },
	      },
	  }


	         Activity.addView(loadlayout(layout))
	          ArcBackground(zt)--圆角
	          ViewClickRipple(Proposal_off,0x21000000)--点击波纹
	          ViewClickRipple(Proposal_check,0x21000000)--点击波纹
	          渐变(0xFFF02014,0xFFF02A55,ProposalTop)
	          DialogDiy(argbDialog,0.92,0.5)--设置窗口大小
	        -- if(code==404)then
	        --   DialogDiy(argbDialog,0.92,0.5)
	        --   Name={"属性未知","属性未知","属性未知","属性未知","属性未知","属性未知","属性未知"}
	        --   Explain={"N/A! 开发者正在加班添加中...","N/A!,开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中...","N/A! 开发者正在加班添加中..."}
	        --   Imgsrc="https://bk.yyge.net/%E4%B8%B4%E6%97%B6%E5%9B%BE%E7%89%87/%E6%9C%AA%E7%9F%A5_.png"
	        --  else
	        --   loadstring(html)()
	        --   DialogDiy(argbDialog,0.92,0.5)
	        --   Name=string.split(属性名称,"\n")
	        --   Explain=string.split(属性说明,"\n")--
	        --   
	        --   --图标={"123132","123132","123132","123132","123132","123132"}
	        -- end

	       
	        function attribute_add()
	          for k,q in pairs(Name) do
	            if(q~="")then 
	              item={
	                LinearLayout;
	                gravity="center";
	                layout_width="fill";
	                layout_height="80dp";
	                orientation="horizontal";
	                id="mItem",
	                onClick=function()
	                  -- dialog=argbDialog.show()
	                  -- dialog.dismiss()
	                  str_0=string.gsub(Name[k],"只读","")
	                  str_1=string.gsub(str_0," ","")
	                  复制文本(str_1)
	                  MD提示(Proposal,"已复制"..str_1,0)

	                end,
	                {
	                  CardView;
	                  layout_margin="25dp";
	                  radius="24dp",
	                  elevation="0dp",
	                  layout_width="10%w";
	                  layout_height="10%w";
	                  id="c1";
	                  {
	                  LinearLayout;
	                  layout_width="fill";
	                  layout_height="fill";
	                  gravity="center",
	                  orientation="vertical";
	                  id="yls";
	                  {
	                      ImageView,
	                      layout_height="32dp",
	                      layout_width="32dp",
	                      id="jiaobiao",
	                      colorFilter="#FFF02A55",
	                      src=Imgsrc,
	                  },
	                  };
	                };


	                {
	                  LinearLayout;
	                  layout_width="fill";
	                  layout_height="80dp";
	                  orientation="vertical";
	                  layout_marginLeft="0dp";
	                  {
	                    TextView;
	                    layout_height="40dp";
	                    layout_width="fill";
	                    textStyle="bold",--加粗
	                    --textColor=颜色[k],
	                    gravity="left|bottom",
	                    textSize="16sp",
	                    text=Name[k],
	                  };
	                  {
	                    TextView;
	                    id="t2";
	                    layout_height="40dp";
	                    layout_width="fill";
	                    --textColor=颜色[k],
	                    gravity="left",
	                    textSize="12sp",
	                    text=Explain[k],
	                  };
	                };
	              };
	              --添加到容器
	              mLinearLayout.addView(loadlayout(item))

	              波纹({mItem},"方",0x21000000)
	            end
	          end
	        end

	        if(Att~="")then
	          attribute_add()
	        end        
	end



	--搜索页
	function SearchActivity()
	  layout={
	  FrameLayout,
	  id="sey",
	  layout_height="fill",
	  layout_width="fill",
	  background="#FFFFFF",

	  {
	    LinearLayout,
	    id="search",
	    orientation="vertical",
	    layout_height="fill",
	    layout_width="fill",
	    --background="#FF3F51B5",

	    {
	      LinearLayout,
	      layout_height="56dp",
	      layout_width="fill",
	      Gravity="center|left",
	      {
	        ImageView,
	        layout_height="56dp",
	        layout_width="56dp",
	        padding="16dp",
	        colorFilter="#ffffffff",
	        src="drawable/off.png",
	        onClick=function()
	          sey.setVisibility(View.GONE)--隐藏布局
	          sey.removeViewAt(0)
	        end
	      },
	      {
	        EditText,
	        layout_height="56dp",
	        layout_width="fill",
	        background="#00ffffff",--底线透明
	        hint="请输入关键字...",
	        hintTextColor="#50ffffff",
	        textColor="#eeeeee",
	        textSize="15sp",
	        imeOptions="actionSearch",
	        singleLine="true",
	        focusable="true",
	        focusableInTouchMode="true",
	        id="et",
	      },
	    },

	    --主体布局
	    {
	      LinearLayout,
	      orientation="vertical",
	      layout_height="fill",
	      layout_width="fill",
	      {
	        LinearLayout,
	        layout_height="fill",
	        layout_width="fill",
	        Gravity="center",
	        id="zt",
	        {
	          ListView,
	          layout_height="fill",
	          layout_width="fill",
	          background="#00000000",
	          VerticalScrollBarEnabled=false,
	          id="list",
	        },
	      },
	    },
	  }
	 }
	  --activity.setContentView(loadlayout(layout))

	  zy.addView(loadlayout(layout))
	  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
	   --自动显示输入法
	  task(1,function()
	    imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)
	    imm.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS)
	  end)

	  渐变(0xFFD313C6,0xFF393591,search)--设置渐变
	  item={
	    LinearLayout,
	    layout_width="fill",
	    layout_height="80dp",
	    orientation="vertical",
	    gravity="center",
	    {
	      TextView;
	      id="srct";
	      layout_height="30dp",
	      layout_width="85%w",
	      gravity="left|bottom",
	      textColor="#333333",
	      textSize="16sp",
	    },
	    {
	      TextView,
	      id="srcb",
	      layout_height="30dp",
	      layout_width="85%w",
	      gravity="left|center",
	      singleLine="true",
	      ellipsize="end",
	      textColor="#808080",
	      textSize="12sp",
	    },
	  }



	  datas={}
	  adp=LuaAdapter(activity,datas,item)
	  list.Adapter=adp


	  -- NoteStr=string.gsub(NoteStr,'●(.-)●',"")
	  -- NoteStr=string.gsub(NoteStr,'<<',"")
	  -- NoteStr=string.gsub(NoteStr,'/>>',"")
	  -- NoteStr=NoteStr:gsub("【","【【").."【"


	  function 加载列表(str)
	    adp.clear()
	    TitleTable={}
	    ContentTable={}

	    -- for k,v in NoteStr:gmatch("【(.-)】(.-)【") do
	    --   if (k..v):match(str) then
	    --   end
	    -- end--
	    for i=1,#Table_Data do
	      if(Table_Data[i]:match(str))then
	        split=string.split(Table_Title[i],"\n")
	        -- print(split[1])
	        --if(Table_Data[i]:find"\n")then print("11") end--table.insert(TitleTable,split) else table.insert(TitleTable,Table_Title[i]) end
	        table.insert(TitleTable,split[1])
	        table.insert(ContentTable,Table_Data[i])
	      end
	    end

	    for i=1,#TitleTable do
	      table.insert(datas,{srct=TitleTable[i],srcb=ContentTable[i]})
	    end

	  end



	  list.setOnItemClickListener(AdapterView.OnItemClickListener{
	    onItemClick=function(parent,v,pos,id)--
	      -- search.setVisibility(View.GONE)--隐藏布局
	      -- search.removeViewAt(0)
	      DetailActivity(sey,TitleTable[id],"",ContentTable[id],0xFF393591,0xFFD313C6)----
	      --activity.newActivity("DetailActivity",android.R.anim.fade_in,android.R.anim.fade_out,{TitleTable[id],ContentTable[id]})
	    end
	  })

	  ArcBackground(zt)
	  cc=false

	  et.setOnEditorActionListener(TextView.OnEditorActionListener{
	    onEditorAction=function(view,actionId,event)
	      if (actionId==EditorInfo.IME_ACTION_SEARCH or (event~=null and event.getKeyCode()== KeyEvent.KEYCODE_ENTER)) then
	        imm2 = activity.getSystemService(Context.INPUT_METHOD_SERVICE)--关闭输入法
	        imm2.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS)
	        et.setCursorVisible(false);--关闭光标
	        cc=true
	        加载列表(et.Text)
	        return true
	      end
	      return false
	    end
	  })


	  et.onClick=function()

	    if cc then
	      et.setCursorVisible(true);
	    end

	  end






	  --监听
	  et.addTextChangedListener{
	    beforeTextChanged=function( s, start, count, after)

	      --print("●")
	    end,

	    onTextChanged=function(str)
	      加载列表(tostring(str))
	    end,

	    afterTextChanged=function(str)

	      --print(str
	    end,

	  }
	end



	layout={
	  FrameLayout,
	  id="zy",
	  layout_height="fill",
	  layout_width="fill",
	  background="#FFFFFF",

	  {
	    LinearLayout,
	    id="home_top",
	    orientation="vertical",
	    layout_height="50%h",
	    layout_width="fill",
	    background="#FF3F51B5",
	      {
	        EditText,
	        id="edit_zy",
	      },
	      --
	    {
	      LinearLayout,
	      layout_height="56dp",
	      layout_width="fill",
	      Gravity="center",

	      {
	        ImageView,
	        layout_height="56dp",
	        layout_width="56dp",
	        padding="18dp",
	        src="drawable/ss.png",
	        colorFilter="#ffffffff",
	        id="ss",
	      },
	    },
	  },

	   --主体布局
	   {
	    LinearLayout,
	    orientation="vertical",
	    layout_height="fill",
	    layout_width="fill",
	      {
	        ScrollView,--垂直滑动控件
	        layout_height="fill",
	        layout_width="fill",
	        id="scrll",
	        layout_marginTop="56dp",
	        VerticalScrollBarEnabled=false,--隐藏滑动条

	        {
	          LinearLayout,
	          orientation="vertical",
	          layout_height="fill",
	          layout_width="fill",
	          Gravity="center",
	          id="zt",
	          {
	            LinearLayout,
	            orientation="vertical",
	            layout_height="fill",
	            layout_width="fill",
	            Gravity="center",
	            id="list",
	          },
	        },
	      },
	   },
	}








	argbBuild=AlertDialog.Builder(this)

	argbBuild.setView(loadlayout(layout))
	argbBuild.setPositiveButton("积极名称",nil)
	argbBuild.setNegativeButton("消极名称",nil)
	argbBuild.setNeutralButton("中立名称",nil)
	argbDialog=argbBuild.create()
	--argbDialog.setCancelable(true)--点击外层取消--
	argbDialog.show()


	 隐藏对话框按钮(argbDialog)

	params = argbDialog.getWindow().getAttributes();
	params.width = activity.getWidth()*0.92;----
	params.height = activity.getHeight()*0.92 ;--
	argbDialog.getWindow().setAttributes(params);
	弹窗圆角(argbDialog.getWindow(),0xFFFFFFFF,0)

	edit_zy.setVisibility(View.GONE)--这个edit主要用于弹出输入法 

	渐变(0xFF7D1DA7,0xFF393591,home_top)--设置渐变

	TitleTable={}
	NoteTitleTable={}
	IMG_0={}

	function setbook(Title,Note,img)
	  table.insert(TitleTable,Title)
	  table.insert(NoteTitleTable,Note)
	  table.insert(IMG_0,img)
	end
	------------
	setbook("基础语法","JavaNoteStr","drawable/01.jpg")
	setbook("常用事件","LuaNoteStr","drawable/02.jpg")
	setbook("属性方法","UINoteStr","drawable/03.jpg")
	setbook("实用函数","LuaLibsNoteStr","drawable/04.jpg")
	setbook("高级函数","LuaLibsNoteStr","drawable/05.jpg")


	for k,q in pairs(TitleTable) do
	  item=
	  {
	    LinearLayout,
	    layout_width="90%w",
	    layout_height="28%h",
	    Gravity="center",
	    onClick=function() end;
	    id="CaVi",


	    {
	      CardView,
	      layout_width="80%w",
	      layout_height="25%h",
	      cardElevation="20",
	      radius="20",

	      {
	        FrameLayout,--帧布局
	        layout_width="fill",
	        layout_height="25%h",
	        id="zy_bg",
	         
	        {
	          ImageView,
	          layout_width='fill';--图片宽度
	          layout_height='fill';--图片高度
	          scaleType='centerCrop';--图片显示类型
	          id="jiaobiao",
	          --clickable="true",
	          focusable="true",
	          src=IMG_0[k],
	        },

	        {
	          ImageView,
	          layout_width='fill';--图片宽度
	          layout_height='fill';--图片高度
	          scaleType='centerCrop';--图片显示类型
	        },

	        {
	          LinearLayout,
	          layout_width="fill",
	          layout_height="fill",
	          Gravity="bottom",

	          {
	            TextView,
	            id="title_ID",
	            Text=TitleTable[k],
	            layout_width="fill",
	            layout_height="60dp",
	            Gravity="center|left",
	            textColor="#ffffffff",
	            paddingLeft="20dp",
	            textSize="30sp"
	          },
	        },
	      },



	    {
	      FrameLayout,
	      layout_width="80%w",
	      layout_height="fill",
	      background="#00000000",--布局背景

	      
	        {
	          ImageView,
	          layout_width='100%w';--图片宽度
	          layout_height='100%h';--图片高度
	          onClick=function()  end;
	          id="dj"..k,
	        },
	    },
	    },
	  }
	 list.addView(loadlayout(item))
	end


	--圆弧背景
	ArcBackground(zt)


	--搜索按钮点击波纹
	ViewClickRipple(ss,0x21000000)

	 ViewClickRipple(dj1,0x21000000)  dj1.onClick=function()  ItemListActivity(1,TableTitle_1,TableData_1) end
	 ViewClickRipple(dj2,0x21000000)  dj2.onClick=function()  ItemListActivity(2,Event_Title,Event_Explain) end
	 ViewClickRipple(dj3,0x21000000)  dj3.onClick=function()  ItemListActivity(3,TableTitle_3,TableData_3) end
	 ViewClickRipple(dj4,0x21000000)  dj4.onClick=function()  ItemListActivity(4,TableTitle_4,TableData_4) end
	 ViewClickRipple(dj5,0x21000000)  dj5.onClick=function()  MD提示(zy,"会员专享开发中...",0) end

    --ItemListActivity(5,TableTitle_5,TableData_5) 
	ss.onClick=function()
	  SearchActivity()
	end
end

function 重新输入()--自定义函数-----重新输入()-----开始
  require "import"
  import "android.content.Context"
  import "android.net.ConnectivityManager"
  import "android.net.NetworkInfo"
  import "android.telephony.TelephonyManager"

  ----------------远程更新----------------
   function 远程更新()
      import "android.content.pm.PackageManager"
      versionName={}--最新版本
      gxnr={}--更新内容
      local 版本号 = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName
       
      --获取最新版本数据----
          获取版本="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/versionName.txt"
          Http.get(获取版本,nil,"utf8",nil,function(code,html,b,c)
            table.insert(versionName,html:match("【版本】(.-)【版本】")) 
            table.insert(gxnr,html:match("【更新内容】(.-)【更新内容】")) 
          end)
      --获取最新版本数据----
       
        function 分享应用()
          import "android.content.Intent"
          import "android.net.Uri"
          url="https://www.coolapk.com/apk/com.Yyge.JsHD"
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
          activity.startActivity(viewIntent)
        end


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
          更新数据="v"..版本号
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
              jzyx=1
              dialog=LuaDialog(this)
              .setTitle("发现新版本")
              .setMessage("调试器发现新版本\n"..版本号..">>"..versionName[1].." 更新内容："..gxnr[1])
              .setPositiveButton("更新",{onClick=function(v) 分享应用() end})
              .setNegativeButton("退出",{onClick=function(v) 退出程序() end})
              --.setCancelable(false)--禁用返回键
              .show()
           else

          end
        end
      end

      xhjz()
   end
  ----------------远程更新----------------

 if(Build.VERSION.SDK+1>=31)then
   xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
  else
   xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
 end
  xmlurl=io.open(xml):read("*a")--赋值xmlurl为index.xml文件内容

  function 自定义调用1()--自定义调用函数------自定义调用1()--开始
  Http.get(xmlurl,nil,"UTF-8",nil,function(code,content,cookie,header)--识别网络返回值---开始
    标题文字="错误！"..code
  -- if(code>=400 and code<450)then
  -- 提示框(标题文字,"客户端错误，您输入的网址无法正常访问，请求包含语法错误或无法完成请求，请重新输入")
  -- end
  if(code>=500)then
    当前网络()
    jzyx=1
    标题文字="错误！"..显示文字.." "..code
    强制输入框(标题文字,"服务器错误，您输入的网址无法正常访问，服务器在处理请求的过程中发生了错误，请重新输入","加载","退出")
  end

  if(code<0)then--状态吗为-1无网
  --无网络(标题文字,"您的网络似乎存在问题，请您切换网络再试")    
      当前网络()
      if(显示文字=="无网络")then
        else
          jzyx=1
        标题文字="错误！"..显示文字.." "..code
        强制输入框(标题文字,"该网址似乎存在问题，错误返回".." "..code.."请重新输入","加载","退出")
      end
  end

    if(code>=0 and code<420)then--识别网络返回值为200成功！！--开始
            --加载框S

    --加载时间判定
    加载时间={}
    网页标题={}
    时间={}
        function 加载完毕事件()
           jzyx=1
           退出动画()
           task(1500,function()
             远程更新()
             task(2000,function()--延时开始
                      教程()
             end)--延时结束             
           end)   
        end
    --加载时间判定




  function 加载判断()---加载判断开始
    task(100,function()
    bt=webView.title
   -- print(webView.title)
      if(bt=="") then
      table.insert(加载时间,"1")--写入数组  
    --print(加载时间)
      加载判断()
       else
       table.insert(加载时间,"0")--写入数组
                              for i=1, #(加载时间) do
                                   if (加载时间[i]=="0") then
                                    总时间=((i)/2)
                                    table.insert(时间,总时间)
                                    --弹出消息(网页标题)
                                            if(总时间<=8)then
                                                 加载完毕事件()
                                                 task(2000,function()
                                                   pdc1.dismiss();
                                                 --弹出消息("加载完毕("..总时间.."秒)")
                                                 end)
                                            else
                                               强制输入框("加载超时","您输入的网址加载较慢，建议更换网络或者重新输入","加载","退出")
                                            end
                                   end
                                   
                              end
      end

    end)
  end---加载判断结束

      加载判断()

      --AppStartupAnimation(1500,1000)--退出启动动画

    end--识别网络返回值为200成功！！--结束

  end)--识别网络返回值---结束
      end--自定义调用函数------自定义调用1()--结束






  function 强制输入框(标题,消息,积极按钮名称,消极按钮名称)
  对话框()
  .设置标题(标题)
  .setView(loadlayout(input2layout))--设置输入框布局
  .设置积极按钮(积极按钮名称,function()
     loadstring(事件1)()
  end)
  .设置消极按钮(消极按钮名称,function()
     loadstring(事件2)()
  end)
  .setCancelable(false)--禁用返回键
  .显示()
  linkhint.text=消息
  end
  事件1=([[wz=edit1.text--赋值输入框内容
           加载网页(wz)
	         if(Build.VERSION.SDK+1>=31)then
			   xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
			  else
			   xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
			 end
           io.open(xml,"w"):write(wz):close()--写入网址
           重新输入()]])

  事件2=([[return (canoffline or 退出程序())]])


  function 当前网络()--显示当前网络
     判断网络()
      if(判断网络()==0)then
      显示文字="无网络"
      end

      if(判断网络()==1)then
      显示文字="Wi-Fi"
      end

      if(判断网络()==2)then
      显示文字="2G"
      end

      if(判断网络()==3)then
      显示文字="3G"
      end

      if(判断网络()==4)then
      显示文字="4G"
      end

      if(判断网络()==5)then
      显示文字=""
      end
  end--显示当前网络



  if(xmlurl:find"http") then
    --加载网页(xmlurl)     
    自定义调用1()
  else
        对话框()
        .设置标题("错误！")
        .setView(loadlayout(input2layout))--设置输入框布局
        .设置积极按钮("加载",function()
           wz=edit1.text--赋值输入框内容
           加载网页(wz)
             if(Build.VERSION.SDK+1>=31)then
			   xml=Environment.getExternalStorageDirectory().toString().."/JsHD/index.xml"
			  else
			   xml=Environment.getExternalStorageDirectory().toString().."/Android/data/"..activity.getPackageName().."/index.xml"
			 end
           io.open(xml,"w"):write(wz):close()--写入网址
           重新输入()
                            end)
        .设置消极按钮("退出",function()--设置消极按钮("退出")
                               return (canoffline or 退出程序())--退出功能
                            end)
        .setCancelable(false)--禁用返回键
        .显示()
         linkhint.text="当前网页加载出错，请重新配置"

  end
end--自定义函数-----重新输入()-----结束