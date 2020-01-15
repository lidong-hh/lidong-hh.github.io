<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%option explicit%><!--#include file="config.asp"--><%
'聊天室高级功能与管理功能使用说明
'在聊天窗口输入@@加自己的名字，可以直接改名；
'通过输入会员密钥（在config.asp文件中可以设置），升级聊天会员等级，可以使用不同颜色来聊天，加以区分；
'管理员的管理功能使用方法：在聊天窗口中输入【##eesai.com】按回车键提交即可升级为管理员，再次输入【##guanli】按回车键提交便可进入管理员功能界面，再次返回聊天窗口将可以执行禁言与删除聊天内容的功能。
'———————————————以下是聊天设置相关内容———————————————
dim eurstr,eurr,eur0,eur1,eur2,eur3
eurstr=Request.ServerVariables("QUERY_STRING")'get request
'response.Write eurstr
eurstr=replace(eurstr,".html","")
eurr=split(eurstr&"////","/")
eur0=lcase(eurr(0))'pass and app
eur1=lcase(eurr(1))'action
eur2=lcase(eurr(2))'action admin
eur3=eurr(3)'action user
'下面这句可以去掉，用于限制聊天室开放。
IF eur0="" THEN RESPONSE.Redirect("?"&eckk)
dim esusns,esusn,esuxy,esuty,esuer,esubt,esurr,esulin,esuling
esuxy=0
dim ecin,ecfo,ecft
ecin="请输入您的称呼"'登入默认文本提示字符
ecfo="请输入发言内容"'发言默认文本提示字符
ecft="发言"'发言提交按钮文字

'response.Write Request.Cookies(ecue)=聊友编码sn|是否黑名单xy|用户等级ty|用户名er|用户昵称bt
esulin=Request.Cookies(ecue)
function mfomz(fufsn,fufer,fufbt)
mfomz=fufer
if len(fufbt&"0")>1 then mfomz=fufbt
if len(mfomz&"0")=1 then mfomz=fufsn
End function
'———————————————以下处理聊友的过程———————————————
esurr=split(esulin&"|","|")
if ubound(esurr)=5 then
esusn=esurr(0)
esuxy=aiint(esurr(1))
esuty=aiint(esurr(2))
esuer=esurr(3)
esubt=esurr(4)
esuer=mfomz(esusn,esuer,esubt)
else
if ecus=1 then
esulin=""
else
esusn=aisn(1)
esuxy=1
esuty=0
esulin=esusn&"|"&esuxy&"|"&esuty&"||"
esurr=split(esulin,"|")
esuer=mfomz(esusn,esuer,esubt)
if eccc=1 then
Call anfw(esulin&ecgg&anfr(eckk&"/EESaiChatu.txt"),eckk&"/EESaiChatu.txt")
else
application.lock
application(ecsn&eckk&"sayu")=esulin&ecgg&application(ecsn&eckk&"sayu")
application.unlock
end if
Response.Cookies(ecue)=esulin
end if
end if
if esulin="" then
if Request.Cookies(ecue)<>"" then
Response.Cookies(ecue)=""
RESPONSE.Redirect("?"&eckk)
else
Response.Write(Request.Cookies(ecue)&eckk&" close(only for member)!")
end if
else
if ecos=1 then Response.Cookies(eckk&ecog)=ecog
'-----------------------------------
'response.Write espz(esfstr)
'content doing
'-----------------------------------
Function espz(esfstr)
espz=esfstr
End Function
'-----------------------------------
'=esplz()
'-----------------------------------
Function esplz(esfstr)
esplz=esfstr
End Function
'-----------------------------------
'response.Write mfoer()
'user show
'-----------------------------------
Function mfoer()
dim fuds,fudrr,fudii,fudrx,fudjj,fudmz,fudlin
if Request.Cookies(eckk&ecop&"b")=ecou then
mfoer=""
elseif request.Cookies(eckk&ecop&"b")="0" then
mfoer="<div class=""hhm""><a title=""查看聊天室用户"" href=""?"&eur0&"/"&eur1&"//1.html"">查看聊天室用户</a></div>"
elseif ecxu=1 or request.Cookies(eckk&ecop&"b")="1" then
fudjj=0
fudlin=""
if eccc=1 then
fuds=anfr(eckk&"/EESaiChatu.txt")
else
fuds=application(ecsn&eckk&"sayu")
end if
fudrr=split(fuds,ecgg)
for fudii=0 to ubound(fudrr)-1
if len(fudrr(fudii))>10 then
fudjj=fudjj+1
fudrx=split(fudrr(fudii)&"|||||","|")
fudmz=mfomz(fudrx(0),fudrx(3),fudrx(4))
fudlin=fudlin&"<li title="""&fudrx(0)&""" class=""p"&aiint(fudrx(2))&""">"&fudmz
if aiint(fudrx(1))=0 then fudlin=fudlin&"<sup>[禁]</sup>"
fudlin=fudlin&"<i>"
if esuty>3 and aiint(fudrx(2))<4 then fudlin=fudlin&"<a title=""清除Ta的聊天记录"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/say/"&fudrx(0)&".html'"" target=""_self"">清</a> <a title=""禁止Ta说话"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/sayx/"&fudrx(0)&".html'"" target=""_self"">禁</a> "
fudlin=fudlin&"<a href=""#pl"" onclick=""parent.say.document.getElementById('"&eckk&"say').value='@"&fudmz&" '"">@Ta</a>"
fudlin=fudlin&"</i></li>"
end if
next
mfoer="<div class=""hht"">聊天室用户</div>"
mfoer=mfoer&"<div class=""hhm"">在线"&fudjj&"人</div>"
mfoer=mfoer&"<div class=""hhc"">"
mfoer=mfoer&fudlin
mfoer=mfoer&"</div>"
mfoer=mfoer&"<div class=""hhm""><a title=""刷新聊天室用户"" href=""#pl"" onClick=""javascript:if(confirm('您需要刷新聊天室用户吗？'))window.parent.location.reload();"">[刷新]</a>&nbsp;&nbsp;<a title=""关闭聊天室用户（该命令可以通过在聊天框中输入"&ecou&"命令来实现）"" href=""?"&eur0&"/"&eur1&"//0.html"">[关闭]</a></div>"
end if
End Function
'-----------------------------------
'response.Write mfochat()
'chat show
'-----------------------------------
Function mfochat()
dim fdclo
if eccc=1 then
mfochat=anfr(eckk&"/EESaiChat.txt")
else
mfochat=application(ecsn&eckk&"say")
end if
if ecnr<>"" then
mfochat=mfochat&ecgx&""&ecgg&aisnm(6)&ecgg&aiip()&ecgg&now()&ecgg&ecnr&ecgg&""&ecgg&""&ecgg&""&ecgg&ecbt&ecgg&"5"
elseif mfochat="" then
mfochat=ecgx&""&ecgg&aisnm(6)&ecgg&aiip()&ecgg&now()&ecgg&"我的第一位朋友，欢迎您！"&ecgg&""&ecgg&""&ecgg&""&ecgg&ecbt&ecgg&"5"
end if

dim esplar,esplrr,espli,esplsm,esplsl,esplsll,esplss,esplsc,esplsy
esplss=""
esplsc=""
esplar=split(mfochat,ecgx)
for espli=1 to ubound(esplar)
esplrr=split(esplar(espli)&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg&ecgg,ecgg)
if esplrr(0)="" then
esplsl="<p>"
esplsl=esplsl&"<b title='"&esplrr(7)&"("&esplrr(2)&")'>"
if esplrr(2)=aiip() or esplrr(6)=aiip() or (esplrr(8)=esuer and esuer<>"") or (esplrr(6)=esuer and esuer<>"")  or (esplrr(7)=esusn and esusn<>"") or (esplrr(6)=esusn and esusn<>"") then
esplsy=" m"
else
esplsy=" n"
end if
if esplrr(8)<>"" then
esplsm=esplrr(8)
elseif esplrr(7)<>"" then
esplsm=esplrr(7)
elseif esplrr(2)<>"" then
esplsm=esplrr(2)
else
esplsm=""
end if
esplsl=esplsl&esplsm
if esplrr(6)<>"" then esplsl=esplsl&" @"&esplrr(6)
esplsl=esplsl&"</b>"
if esplrr(3)<>"" then esplsl=esplsl&esplrr(3)
esplsl=esplsl&"</p>"

if eclf=1 then
if esplrr(5)<>"" then
Execute("esplsll=S_"&esplrr(5)&"")
end if
Execute("dim S_"&esplrr(1)&":S_"&esplrr(1)&"=""<div class='p"&aiint(esplrr(9))&esplsy&"'>""&esplsl&espz(esplrr(4))&""</div>""")
esplsl=esplsl&espz(esplrr(4))&esplsll
else
esplsll="<i># "&esplrr(5)&" </i>"
esplsl=esplsl&esplsll&espz(esplrr(4))
end if

esplss=esplss&"<li class='p"&aiint(esplrr(9))&esplsy&"' onmouseover='Asaigk(""g"&espli&""")' onmouseout='Asaigg(""g"&espli&""")'>"&esplsl
esplss=esplss&"<p id=""g"&espli&""" class=g>"
if esuty>3 and aiint(esplrr(9))<4 then esplss=esplss&"<a title=""收藏这条聊天记录"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/saym/"&esplrr(1)&".html'"" target=""_self"">藏</a> <a title=""删除这条聊天记录"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/sayd/"&esplrr(1)&".html'"" target=""_self"">删</a> <a title=""清除Ta的聊天记录"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/say/"&esplrr(7)&".html'"" target=""_self"">清</a> <a title=""禁止Ta说话"" href=""javascript:if(confirm('确认这么做吗?'))window.location='?"&eur0&"/"&ecvx&"/sayx/"&esplrr(7)&".html'"" target=""_self"">禁</a>"
if esplsm<>"" and aiint(esplrr(9))<5 then esplss=esplss&"<a href=""#pl"" onclick=""parent.say.document.getElementById('"&eckk&"say').value='@"&esplsm&" '"">@Ta</a>"
if esplsm<>"" and aiint(esplrr(9))<5 then esplss=esplss&"<a title=引用#"&esplrr(1)&"回复 href=""#pl"" onclick=""parent.say.document.getElementById('"&eckk&"say').value='@"&esplsm&" #"&esplrr(1)&" '"">回复</a>"
esplss=esplss&"</p></li>"
elseif left(esplrr(0),1)="!" then
esplsc=esplsc&"<i>"&replace(esplrr(0),"!","")&"</i>"
end if
next
mfochat=esplss
if Request.Cookies(eckk&ecop)=ecop or (Request.Cookies(eckk&ecop)="" and ecxp=1) then
mfochat="<div style=""padding-bottom:28px;"" class=""pls"">"&espbq(mfochat)&"</div>"
else
mfochat="<div class=""pls"">"&espbq(mfochat)&"</div>"
end if
End Function
'-----------------------------------
'mfotm
'-----------------------------------
Function mfotm()
dim mfodtm
mfodtm=Request.Cookies(eckk&"tm")
if mfodtm="" then
mfotm=ectm
elseif mfodtm<>"" then
mfotm=aiint(mfodtm)
end if
if mfotm=0 then mfotm=2
End Function
'-----------------------------------
'mfous(u=user/x=del user)
'-----------------------------------
Function mfous(mfofile)
dim fuuds,fuudm
mfous=""
if request("act")="1" then
mfous=mfous&aigo("恭喜您，提交成功.",0)
end if
if mfofile="" then
fuudm="聊天内容"
elseif mfofile="u" then
fuudm="在线人员"
elseif mfofile="x" then
fuudm="禁言人员"
elseif mfofile="o" then
fuudm="聊天数目"
elseif mfofile="m" then
fuudm="聊天收藏"
else
fuudm="聊天记录"
end if
if eccc=1 then
fuuds=anfr(eckk&"/EESaiChat"&mfofile&".txt")
else
fuuds=application(ecsn&eckk&"say"&mfofile&"")
end if
mfous=mfous&"<div class=""ct"">"&fuudm&" - 管理</div>"
mfous=mfous&"<div class=""cc""><form action="""" method=""post"" target=""_self"">"
mfous=mfous&"<textarea name=""ecnr"" id=""ecnr"" class=""cct"">"&fuuds&"</textarea>"
mfous=mfous&"<input type=""hidden"" name=""act"" value=""1""><input class=""ccs"" type=""submit"" value=""确认提交"">"
mfous=mfous&"</form></div>"
End Function
'-----------------------------------
'mfogx
'-----------------------------------
Function mfogx(mfofa,mfofb)
if mfofa<>mfofb then
if mfofb="" or mfofb="0" then
Response.Cookies(ecue)=""
if eccc=1 then
Call anfw(replace(anfr(eckk&"/EESaiChatu.txt"),mfofa&ecgg,""),eckk&"/EESaiChatu.txt")
else
application.lock
application(ecsn&eckk&"sayu")=replace(application(ecsn&eckk&"sayu"),mfofa&ecgg,"")
application.unlock
end if
else
Response.Cookies(ecue)=mfofb
if eccc=1 then
Call anfw(mfofb&ecgg&replace(anfr(eckk&"/EESaiChatu.txt"),mfofa&ecgg,""),eckk&"/EESaiChatu.txt")
else
application.lock
application(ecsn&eckk&"sayu")=mfofb&ecgg&replace(application(ecsn&eckk&"sayu"),mfofa&ecgg,"")
application.unlock
end if
end if
end if
End Function
'-----------------------------------
'mfogm@@
'-----------------------------------
Function mfogm(mfofstr)
mfogm=""
if len(mfofstr)>ecla and len(mfofstr)<eclb then
esuling=esusn&"|"&esuxy&"|"&esuty&"|"&esurr(3)&"|"&mfofstr
mfogm=mfogm&mfogx(esulin,esuling)
mfogm=mfogm&aigo("恭喜您，您的名字顺利改为"&mfofstr&"（您可以在发言框中输入@@加您的名字提交进行改名）.",0)
else
mfogm=mfogm&aigo("不符合规定的名字（名字长度请控制在"&ecla&"-"&eclb&"之间）！",0)
end if
End Function
'-----------------------------------
'mfosj##
'-----------------------------------
Function mfosj(mfofstr)
if mfofstr=ecv1 then
esuling=esusn&"|"&esuxy&"|1|"&esurr(3)&"|"&esubt&""
mfosj=mfosj&mfogx(esulin,esuling)
mfosj=aigo("恭喜您，您的聊天内容可以更好看了（1）.",0)
elseif mfofstr=ecv2 then
esuling=esusn&"|"&esuxy&"|2|"&esurr(3)&"|"&esubt&""
mfosj=mfosj&mfogx(esulin,esuling)
mfosj=aigo("恭喜您，您的聊天内容可以更好看了（2）.",0)
elseif mfofstr=ecv3 then
esuling=esusn&"|"&esuxy&"|3|"&esurr(3)&"|"&esubt&""
mfosj=mfosj&mfogx(esulin,esuling)
mfosj=aigo("恭喜您，您的聊天内容可以更好看了（3）.",0)
elseif mfofstr=ecv4 then
esuling=esusn&"|"&esuxy&"|4|"&esurr(3)&"|"&esubt&""
mfosj=mfosj&mfogx(esulin,esuling)
mfosj=aigo("恭喜您，您成了管理员了（4）.",0)
'进入管理界面
elseif mfofstr=ecvx then
Response.Redirect("?"&eur0&"/"&ecvx&".html")
elseif aiint(mfofstr)>0 then
mfosj=mfosp(aiint(mfofstr))
end if
End Function
'-----------------------------------
'mfosp
'-----------------------------------
Function mfosp(mfofstr)
Response.Cookies(eckk&"tm")=mfofstr
mfosp=aigo("恭喜您，现在开始，"&mfofstr&"秒刷屏一次.",0)
End Function
'-----------------------------------
'mfosin
'-----------------------------------
Function mfosin(mfofstr)
if eccc=1 then
Call anfw(right(anfr(eckk&"/EESaiChat.txt")&mfofstr,ecll),eckk&"/EESaiChat.txt")
Call anfw(aiint(anfr(eckk&"/EESaiChato.txt"))+1,eckk&"/EESaiChato.txt")
else
application.lock
application(ecsn&eckk&"say")=right(application(ecsn&eckk&"say")&mfofstr,ecll)
application(ecsn&eckk&"sayo")=aiint(application(ecsn&eckk&"sayo"))+1
application.unlock
end if
End Function
'-----------------------------------
'response.Write mfosay(mfofty)
'say
'-----------------------------------
Function mfosay(mfofty)
dim fdml,fdux
if mfofty>0 then
if eccc=1 then
fdux=anfr(eckk&"/EESaiChatx.txt")
else
fdux=application(ecsn&eckk&"sayx")
end if
if instr(fdux,esusn&ecgg)>1 then
esuling=esusn&"|0|"&esuty&"|"&esuer&"|"&esubt
mfosay=mfogx(esulin,esuling)
mfofty=0
end if
end if
mfosay=""
if mfofty>0 and aiint(esuty)>=ecvm then
if fureq(eckk&"code")=ecky&"code" and instr(fureq(eckk&"say"),ecin)=0 and instr(fureq(eckk&"say"),ecfo)=0 and fureq(eckk&"say")<>"" then
fdml=fureq(eckk&"say")
'打开/关闭聊天室用户
if fdml=ecou then
if Request.Cookies(eckk&ecop&"b")=ecou then
Response.Cookies(eckk&ecop&"b")="1"
mfosay=mfosay&aigo("已经成功打开聊天室用户(输入命令"&ecou&"并提交可以关闭提示).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
else
Response.Cookies(eckk&ecop&"b")=ecou
mfosay=mfosay&aigo("已经关闭聊天室用户(输入命令"&ecou&"并提交可以再次打开提示).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
end if
'打开/关闭设置功能界面
elseif fdml=ecop then
if Request.Cookies(eckk&ecop)="" or Request.Cookies(eckk&ecop)=ecop then
Response.Cookies(eckk&ecop)="0"
mfosay=mfosay&aigo("已经关闭帮助提示(输入命令"&ecop&"并提交可以再次打开提示).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
else
Response.Cookies(eckk&ecop)=ecop
mfosay=mfosay&aigo("已经成功打开帮助提示(输入命令"&ecop&"并提交可以关闭提示).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
end if
'打开/关闭屏幕滚动命令
elseif fdml=ecog then
if Request.Cookies(eckk&ecog)="" or Request.Cookies(eckk&ecog)=ecog then
Response.Cookies(eckk&ecog)="0"
mfosay=mfosay&aigo("聊天窗口停止滚动(输入命令"&ecog&"可以继续滚动).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
else
Response.Cookies(eckk&ecog)=ecog
mfosay=mfosay&aigo("聊天窗口自动滚动(输入命令"&ecog&"可以停止滚动).",0)&"<script type=""text/javascript"">window.parent.frames.chat.location.reload()</script>"
end if
'改名字
elseif left(fdml,2)="@@" then
fdml=replace(fdml,"@@","")
if eclm=1 then fdml=trim(replace(fdml,",",""))
mfosay=mfosay&mfogm(fdml)
mfosay=mfosay&"<script>window.parent.location.reload();</script>"
'发言升级命令
elseif left(fdml,2)="##" then
fdml=replace(fdml,"##","")
mfosay=mfosay&mfosj(fdml)
'聊天内容处理
else
if len(fureq(eckk&"say")&"0")<eclc then
if ecsm=0 or Request.Cookies(eckk&"say")<>fureq(eckk&"say") then
'处理聊天内容并存入0
dim eslpls,eslplshr,eslplshw
eslpls=replace(replace(replace(fureq(eckk&"say"),ecgg,""),ecgx,""),"!","！")'format
if left(eslpls,1)="@" then
eslplshr=replace(split(eslpls," ")(0),"@","")
eslpls=replace(eslpls,"@"&eslplshr&" ","")
end if
if left(eslpls,1)="#" then
eslplshw=replace(split(eslpls," ")(0),"#","")
eslpls=replace(eslpls,"#"&eslplshw&" ","")
end if
eslpls=ecgx&""&ecgg&aisnm(6)&ecgg&aiip()&ecgg&now()&ecgg&eslpls&ecgg&eslplshw&ecgg&eslplshr
eslpls=eslpls&ecgg&esusn&ecgg&esuer&ecgg&esuty
mfosin(eslpls)
'处理聊天内容并存入1
if ecsm=1 then Response.Cookies(eckk&"say")=fureq(eckk&"say")
mfosay=mfosay&"<script type=""text/javascript"">AsaiSay()</script>"
else
mfosay=mfosay&aigo("不能发言相同内容！",0)
end if
else
mfosay=mfosay&aigo("发言失败，发言超过"&eclc&"字！",0)
end if
end if
end if
'无权发言的时候
else
mfosay=mfosay&aigo("发言失败，您的权限不足！（"&ecvm&"）",0)
end if
End Function

'———————————————以下是公共过程———————————————
'-----------------------------------
'=fureq(fufnm)
'-----------------------------------
Function fureq(fufnm)
fureq=trim(Request.Form(fufnm))
fureq=replace(fureq,"|",ecgt)
fureq=aith(fureq,ecgx&"|"&ecgg&"|"&ecgv)
End Function
'-----------------------------------
'PS:replace the words
'=aith("aifstr","aifst0"/"s1,s2,s3")
'-----------------------------------
Function aith(aifstr,aifst0)
dim ais0rr,ais0j,aithi,aithli,aithl
ais0rr=split(aifst0,"|")
ais0j=ubound(ais0rr)
aith=aifstr
aithl=""
for aithi=0 to ais0j
if ais0rr(aithi)<>"" then
for aithli=1 to len(ais0rr(aithi))
aithl=aithl&ecgt
next
aith=replace(aith,ais0rr(aithi),aithl)
end if
next
End Function
Function aiint(aifstr)
aiint=0
aifstr=trim(aifstr)
if isNumeric(aifstr) then aiint=int(aifstr)
End Function
'-----------------------------------
'PS:get user ip
'=aiip()
'-----------------------------------
Function aiip()
Dim aiiaddr,aiihttp
aiihttp=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
If aiihttp="" Or InStr(aiihttp,"unknown")>0 Then
aiiaddr=Request.ServerVariables("REMOTE_ADDR")
ElseIf InStr(aiihttp,",")>0 Then
aiiaddr=Mid(aiihttp,1,InStr(aiihttp,",") -1)
ElseIf InStr(aiihttp,";")>0 Then
aiiaddr=Mid(aiihttp,1,InStr(aiihttp,";") -1)
Else
aiiaddr=aiihttp
End if
aiip=Trim(Mid(aiiaddr,1,15))
if aiip="::1" then:aiip="127.0.0.1"
End Function
'-----------------------------------
'PS:alert
'=aigo("aifstr","aifurl")
'-----------------------------------
Function aigo(aifstr,aifurl)
aigo="<script language=javascript>"
if aifurl="0" then
aigo=aigo&"alert('"&aifstr&"');"
elseif aifurl="1" then
aigo=aigo&"alert('"&aifstr&"');history.go(-1);"
else
aigo=aigo&"if(confirm("""&aifstr&""")){window.location.href="""&aifurl&"""}else{window.history.back(-1);}"
end if
aigo=aigo&"</script>"
End Function
'response.Write aisn(1)
'-----------------------------------
'PS:get asai code-sn,num=9
'=aisn(0clean/1make)
'-----------------------------------
Function aisn(aifty)
dim aisnlin
if aifty=1 then
aisnlin=Request.Cookies(eckk&"sn")
if len(aisnlin)=6 then
aisn=aisnlin
else
aisn=aisnm(6)
Response.Cookies(eckk&"sn")=aisn
end if
else
Response.Cookies(eckk&"sn")=""
'Response.Cookies(eckk&"sn").delete
end if
End Function
Function aisnm(aiflen)
aisnm=aisnk(aisnn(),0)
if len(aisnm)<aiflen then
Randomize
aisnm=left(aisnm&aisnk(int(9999*Rnd)&"123456789",0)&aisnk(int(9999*Rnd)&"987654321",0),aiflen)
else
aisnm=left(aisnm,aiflen)
end if
End Function
Function aisnk(aifstr,aifty)
dim aisncs,aisnnr,aisnrr,aisnii,aisnla,aisnlb,aisnzz
dim aisnjj,aisnlc,aisnld,aisnlen
if aifty=1 then
aisnzz=aifstr
aisnk=0
else
aisnzz=int(aifstr)
aisnk=""
if aisnzz<10 then
aisnk=aisnzz
Exit Function
end if
end if
aisnlen=len(aisnzz)
aisnnr="0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z"'the sn character
aisnrr=split(aisnnr,"|")'the chr. Array
aisncs=ubound(aisnrr)+1
for aisnii=1 to aisnlen
if aifty=1 then'open
aisnlc=mid(aisnzz,aisnii,1)
for aisnjj=0 to aisncs-1
if aisnlc=aisnrr(aisnjj) then
aisnld=aisnjj
exit for
end if
next
if aisnii=aisnlen then
aisnk=aisnk+aisnld
else
aisnk=(aisnk+aisnld)*aisncs
end if
else'make
aisnla=int(aisnzz/aisncs)
if aisnla>0 then
aisnlb=int(aisnzz-aisnla*aisncs)
aisnk=aisnrr(aisnlb)&aisnk
aisnzz=aisnla
else
aisnk=aisnrr(aisnzz)&aisnk
exit for
end if
end if
next
End Function
Function aisnn()
dim asdck,asday,asdtm,asdtt,asdrr,asdip
asdck="aisnEESai"
asday=date()
asdtm=timer()
asdip=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
asdrr=split(asdtm&".",".")
asdtt=asdrr(0)
if len(asdip)<7 then
Randomize
asdip=right("000"&int(998*Rnd),3)
else
asdip=right(replace(asdip,".",""),3)
end if
aisnn="2"&right("0"&year(asday),1)&right("00"&month(asday),2)&right("00"&day(asday),2)&right("0000000"&asdtt,5)&right("00"&asdrr(1),2)&asdip
End function
'-----------------------------------
'PS:file read
'-----------------------------------
Function anfr(anko)
dim ankols
ankols=Server.MapPath(anko)
dim anfrfsou
Set anfrfsou=CreateObject("adodb.stream")
anfrfsou.Open
anfrfsou.Type=2
anfrfsou.Charset="utf-8"
anfrfsou.LoadFromFile(ankols)
anfr=anfrfsou.ReadText
anfrfsou.Close
Set anfrfsou=Nothing
End Function
'-----------------------------------
'PS:file write
'-----------------------------------
Function anfw(anfstr,anko)
dim ankols
ankols=Server.MapPath(anko)
dim anfwtado
set anfwtado=server.CreateObject("adodb.stream")
With anfwtado
.type=2
.mode=3
.charset="utf-8"
.open
.WriteText=anfstr
.savetofile ankols,2
.flush
.Close
End With
set anfwtado=nothing
End Function
'-----------------------------------
'=espbq(esfstr)
'-----------------------------------
Function espbq(esfstr)
dim espbqxp
Set espbqxp=new RegExp'regular expression
espbqxp.IgnoreCase=true'Ignore case
espbqxp.Global=true'Search string matching for all text
espbqxp.Pattern="\[(\d{1,10})\]"'Find E-mail link
if ecem<>"" then
espbq=espbqxp.replace(esfstr,"<img src='"&eced&"$1.gif'>")
else
espbq=espbqxp.replace(esfstr,"")
end if
Set espbqxp=nothing
End Function

'———————————————以下是聊天页面过程———————————————
Function fcwtop()
fcwtop=""
fcwtop=fcwtop&"<!doctype html><html><head><meta charset=""utf-8""><meta name=""viewport"" content=""width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=30.0,user-scalable=yes""><meta http-equiv=""Cache-Control"" content=""no-cache""><meta name=""format-detection"" content=""telephone=no""><title>"&ecbt&"</title><link rel=""stylesheet"" type=""text/css"" rev=""stylesheet"" ID=""AsaiSkin"" href=""css.css""></head>"
End Function
'———————————————以下是聊天页面———————————————
if eur0=lcase(eckk) then
if eur1="nr" then
response.charset=ecar
response.ContentType="text/html; charset="&ecar'编码
response.Buffer=True
response.Expires=-1
response.ExpiresAbsolute=Now()-1
response.Expires=0
response.CacheControl="no-cache"
response.write mfochat()
elseif eur1="out" then%><%=fcwtop()%>
<body>
<%
'Response.Cookies(eckk&"sn")=""
Call mfogx(esulin,"")
Response.Cookies(eckk&"say")=""
response.Write aigo("恭喜您，成功退出登录.",0)
%>
</body>
</html>

<%elseif eur1=ecvx then%><%=fcwtop()%>
<body class="cb">
<%if esuty>3 then
if eur2="say" then
if eur3="" then
response.Write mfous("")
else
response.Write aigo("恭喜您，操作成功。","?"&eur0&"/chat.html")
end if
elseif eur2="sayo" then
response.Write mfous("o")
elseif eur2="sayu" then
response.Write mfous("u")
elseif eur2="sayx" then
if eur3="" then
response.Write mfous("x")
else
response.Write aigo("恭喜您，操作成功。","?"&eur0&"/chat.html")
end if
elseif eur2="sayd" then
if eur3="" then
response.Write mfous("")
else
response.Write aigo("恭喜您，操作成功。","?"&eur0&"/chat.html")
end if
elseif eur2="saym" then
if eur3="" then
response.Write mfous("m")
else
response.Write aigo("恭喜您，操作成功。","?"&eur0&"/chat.html")
end if
elseif eur2="reset" then
if eccc=1 then
Call anfw("",eckk&"/EESaiChat.txt")
Call anfw("0",eckk&"/EESaiChato.txt")
Call anfw("",eckk&"/EESaiChatu.txt")
Call anfw("",eckk&"/EESaiChatx.txt")
else
application.lock
application(ecsn&eckk&"say")=""
application(ecsn&eckk&"sayo")=0
application(ecsn&eckk&"sayu")=""
application(ecsn&eckk&"sayx")=""
application.unlock
end if
Response.Cookies(eckk&"tm")=""
Response.Cookies(eckk&ecog)=""
Response.Cookies(eckk&ecop)=""
Response.Cookies(eckk&ecop&"a")=""
Response.Cookies(eckk&"say")=""
Response.Cookies(eckk&"sayo")=""
'Response.Cookies(ecue)=""
Response.Cookies(eckk&"sn")=""
response.Write aigo("恭喜您，成功复位！",1)
elseif eur2="save" then
Call aisn(0)
if eccc=1 then
Call anfw(anfr(eckk&"/EESaiChat.txt"),eckk&"/EESaiChat_"&aisn(1)&".txt")
Call anfw("",eckk&"/EESaiChat.txt")
else
Call anfw(application(ecsn&eckk&"say"),eckk&"/EESaiChat_"&aisn(1)&".txt")
application.lock
application(ecsn&eckk&"say")=""
application.unlock
end if
response.Write aigo("恭喜您，成功保存（"&aisn(1)&"）！",1)
else
%>
<table class="cm" align="center" border="0" cellspacing="0" cellpadding="0"><tr>
<td><a class="cma" target="chat" href="?<%=eur0%>/<%=ecvx%>/say.html">发言</a>(<a class="cma" href="?<%=eur0%>/<%=ecvx%>/sayo.html" target="chat">数量</a>)</td>
<td><a class="cma" href="?<%=eur0%>/<%=ecvx%>/saym.html" target="chat">收藏</a></td>
<td><a class="cma" target="chat" href="?<%=eur0%>/<%=ecvx%>/sayu.html">聊友</a>(<a class="cma" target="chat" href="?<%=eur0%>/<%=ecvx%>/sayx.html">禁言</a>)</td>
<td><a class="cma" target="_self" href="?<%=eur0%>/<%=ecvx%>/save.html">保存</a>(<a class="cma" target="_self" href="javascript:if(confirm('确认这么做吗?'))window.location='?<%=eur0%>/<%=ecvx%>/reset.html'">复位</a>)</td>
<td><a class="cma" target="_top" href="?<%=eur0%>">返回</a>(<a class="cma" target="chat" href="?<%=eur0%>/chat.html">预览</a>)</td>
</tr></table>
<%end if
else%>
<div class="cc"><input class="ccst" type="button" onClick="top.location.href='?<%=eur0%>'" value="对不起，您没有这个权限。"></div>
<%end if%>
</body>
</html>

<%elseif eur1="say" then%><%=fcwtop()%>
<%if esuxy>0 then%>
<script type="text/javascript">
function AsaiSay(){
parent.frames.chat.location.reload();
parent.say.document.getElementById('<%=eckk%>say').focus();
}
</script>
<body class="yb" onLoad="document.getElementById('<%=eckk%>say').focus();">
<%=mfosay(esuxy)%>
<table class="plk" align="center" border="0" cellspacing="0" cellpadding="0"><form action="" name="EESaichatForm" id="EESaichatForm" method="post" target="_self"><tr>
<td>
<%if eclm=1 and esubt="" then%><input type="hidden" name="<%=eckk%>say" value="@@"><input class="plki" title="<%=ecin%>" onClick="this.className='plki1';" type="text" id="<%=eckk%>say" name="<%=eckk%>say" value="<%=ecin%>" onBlur="this.className='plki';if(this.value==''){this.value='<%=ecin%>';}" onFocus="if(this.value=='<%=ecin%>'){this.value='';}"><%else%><input class="plki" title="<%=ecfo%>" onClick="this.className='plki1';" type="text" id="<%=eckk%>say" name="<%=eckk%>say" value="<%=ecfo%>" onBlur="this.className='plki';if(this.value==''){this.value='<%=ecfo%>';}" onFocus="if(this.value=='<%=ecfo%>'){this.value='';}"><%end if%><input type="hidden" name="<%=eckk%>code" id="<%=eckk%>code" value="<%=ecky%>code" />
</td><td width="34">
<%if eclm=1 and esubt="" then%><input class="plks" type="submit" value="登入"><%else%><input class="plks" type="submit" value="<%=ecft%>"><%end if%>
</td>
</form></tr></table>
<%else'被禁言%>
<body class="yb">
<input class="yst" type="button" onClick="top.location.href='?<%=eur0%>'" value="您暂时无权发言，欢迎浏览聊天室。">
<%end if%>
</body>
</html>

<%elseif eur1="chat" then
%><%=fcwtop()%>
<script language="JavaScript">
function Asaigk(aid){document.getElementById(aid).className="gk";}
function Asaigg(aid){document.getElementById(aid).className="gg";}
function AsaiXmlHTTP(){
var AsaiXml;
if(window.ActiveXObject)
{AsaiXml=new ActiveXObject("Microsoft.XMLHTTP");}
else if(window.XMLHttpRequest)
{AsaiXml=new window.XMLHttpRequest();}
AsaiXml.open("POST","?<%=eckk%>/nr.html",false);
AsaiXml.send(null);
document.getElementById("AsaiPrints").innerHTML=unescape(AsaiXml.responseText);
<%if Request.Cookies(eckk&ecog)=ecog then%>window.scroll(0,document.body.scrollHeight);<%end if%>
}
</script>
<script language="JavaScript">function AsaiXmlRead(){window.setInterval("AsaiXmlHTTP();",<%=mfotm()*1000%>);}</script>
<body class="pg" onLoad="AsaiXmlHTTP();<%if mfotm()<1000 then%>AsaiXmlRead();<%end if%>">
<div id="AsaiPrints"></div>
<div id="hh"><%=mfoer()%></div><%
if Request.Cookies(eckk&ecop)=ecop or (Request.Cookies(eckk&ecop)="" and ecxp=1) then
if eur2<>"" then Response.Cookies(eckk&ecop&"a")=eur2
if eur3<>"" then
Response.Cookies(eckk&ecop&"b")=eur3
response.Redirect("?"&eur0&"/"&eur1&".html")
end if
%>
<%if Request.Cookies(eckk&ecop&"a")<>"0" then%>
<div id="hk">
<div id="hkb"><a title="关闭辅助窗口（该命令可以通过在聊天框中输入<%=ecop%>命令来实现）" onClick="document.getElementById('hkc').style.display='none';" href="?<%=eur0%>/<%=eur1%>/0.html">×</a></div>
<div id="hkc"><ul>
<%if ecqq<>"" then%><li class="hl"><input type="button" class="hkh" onClick="javascript:if(confirm('您即将直接与聊天室的管理员取得联系。'))window.open('http://wpa.qq.com/msgrd?v=3&uin=<%=ecqq%>&site=http://eesai.com/&menu=yes')" value="联系管理员"></li><%end if%>
<%if mfotm()>ects  then%><li class="hl"><input type="button" class="hkh" onClick="javascript:if(confirm('您需要刷新聊天窗口吗？'))window.parent.location.reload();" value="刷新聊天室"></li><%end if%>
<li class="hl"><%if Request.Cookies(eckk&ecog)=ecog then%><input type="button" class="hkh" onClick="javascript:if(confirm('即将开启手动滚屏，此模式下聊天窗口不会自动上升到最新聊天信息的位置，需手动滑动滚动条浏览（该命令可以通过在聊天框中输入<%=ecog%>命令来实现）。'))location.href='?<%=eur0%>/eesai-<%=ecog%>0';" value="开手动滚屏"><%else%><input type="button" class="hkh" onClick="javascript:if(confirm('即将开启自动滚屏，此模式下无法正常使用滚动条滑动浏览（该命令可以通过在聊天框中输入<%=ecog%>命令来实现）。'))location.href='?<%=eur0%>/eesai-<%=ecog%>';" value="开自动滚屏"><%end if%></li>
<li class="hl"><form name="eesgm" action="?<%=eur0%>/eesai-gm" method="post" target="_self"><input class="hki" title="输入新名字，点击改名按钮即可改名字了（该命令可以通过在聊天框中输入 @@新名字 命令来实现）。" type="text" name="gm" value="<%=esubt%>"><input class="hks" type="submit" value="改名"></form></li>
<li class="hl"><form name="eestm" action="?<%=eur0%>/eesai-tm" method="post" target="_self">
<input class="hki" title="输入聊天室刷新频率，单位：秒，点击刷屏按钮即可按规定的时间刷屏了（当设置的刷屏时间大于<%=ects%>，将开启手动刷新按钮，可节约服务器与客户资源。）。" type="text" name="tm" value="<%=mfotm()%>"><input class="hks" type="submit" value="刷屏"></form></li>
<li class="hl"><select onChange="parent.say.document.getElementById('<%=eckk%>say').value=this.options[this.options.selectedIndex].value;" class="hkt">
<%if esuty>=ecvm then
dim fdemrr,fdemi
fdemrr=split(ecem,"|")
for fdemi=0 to ubound(fdemrr)%>
<option value="[<%=fdemi%>]"><%=fdemrr(fdemi)%></option>
<%next
end if%>
</select></li>
<%if esubt<>"" then%><li class="hl"><input type="button" class="hkh" onClick="javascript:if(confirm('您即将退出聊天室？'))location.href='?<%=eckk%>/out.html';" value="离开聊天室"></li><%end if%>
<li class="cr"></li>
<ul>
</div>
</div>
<%else%>
<div id="hko"><a title="打开辅助窗口" onClick="document.getElementById('hkc').style.display='block';" href="?<%=eur0%>/<%=eur1%>/1.html">辅助</a></div>
<%end if%>
<%end if%>
</body>
</html>
<%elseif left(eur1,6)="eesai-" then%><%=fcwtop()%>
<%
dim hkdr
hkdr=replace(lcase(eur1),"eesai-","")
if left(hkdr,len(ecop))=ecop then
Response.Cookies(eckk&ecop)=hkdr
elseif left(hkdr,len(ecog))=ecog then
Response.Cookies(eckk&ecog)=hkdr
elseif hkdr="gm" then
response.Write mfogm(fureq("gm"))
elseif hkdr="tm" then
response.Write mfosp(aiint(fureq("tm")))
end if
response.Write("<script>window.parent.location.reload();</script>")
%>
</body>
</html>
<%else%><%
response.Write(fcwtop()&"<frameset rows=""*,"&ecgd&""" frameborder=""no"" border=""0"" framespacing=""0""><frame src=""?"&eur0&"/chat.html"" name=""chat"" id=""chat""><frame src=""?"&eur0&"/say.html"" scrolling=""No"" noresize=""noresize"" name=""say"" id=""say""></frameset><noframes><body></body></noframes></html>")
%></html>
<%end if
end if
end if%>