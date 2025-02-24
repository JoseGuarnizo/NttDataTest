Ý
FC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\WeatherForecast.cs
	namespace 	
TestApiNttData
 
{ 
public 
class 
WeatherForecast 
{ 
public 
DateOnly	 
Date 
{ 
get 
; 
set !
;! "
}# $
public 
int	 
TemperatureC 
{ 
get 
;  
set! $
;$ %
}& '
public		 
int			 
TemperatureF		 
=>		 
$num		 
+		  !
(		" #
int		# &
)		& '
(		' (
TemperatureC		( 4
/		5 6
$num		7 =
)		= >
;		> ?
public 
string	 
? 
Summary 
{ 
get 
; 
set  #
;# $
}% &
} 
} ‘
RC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Services\JwtServicesNttData.cs
	namespace 	
TestApiNttData
 
. 
Services !
;! "
public		 
class		 
JwtServicesNttData		 
{

 
private 
readonly	 
string 
_keySecretNttData *
;* +
public 
JwtServicesNttData 
( 
IConfiguration )
confJwtNttData* 8
)8 9
{ 
_keySecretNttData 
= 
confJwtNttData $
[$ %
$str% A
]A B
;B C
} 
public 
string 
TokenGenerate 
( 
RequestNttData +

requestNtt, 6
)6 7
{ 
var 
tokenApi 
= 
new #
JwtSecurityTokenHandler ,
(, -
)- .
;. /
var 
key 	
=
 
Encoding 
. 
UTF8 
. 
GetBytes "
(" #
_keySecretNttData# 4
)4 5
;5 6
var  
responseTokenDescrip 
= 
new  #
SecurityTokenDescriptor! 8
{ 
Subject 

= 
new 
ClaimsIdentity 
(  
new  #
[# $
]$ %
{ 
new 
Claim 
( 
$str 
, 

requestNtt #
.# $
message$ +
)+ ,
,, -
new 
Claim 
( 
$str 
, 

requestNtt 
. 
to !
)! "
," #
new 
Claim 
( 
$str 
, 

requestNtt  
.  !
from! %
)% &
,& '
new 
Claim 
( 
$str 
, 

requestNtt )
.) *
timeToLifeSec* 7
.7 8
ToString8 @
(@ A
)A B
)B C
,C D
new 
Claim 
( 
$str 
, 
Guid #
.# $
NewGuid$ +
(+ ,
), -
.- .
ToString. 6
(6 7
)7 8
)8 9
}   
)   
,   
Expires!! 

=!! 
DateTime!! 
.!! 
UtcNow!! 
.!! 

AddMinutes!! '
(!!' (
$num!!( *
)!!* +
,!!+ ,
SigningCredentials"" 
="" 
new"" 
SigningCredentials"" .
("". /
new""/ 2 
SymmetricSecurityKey""3 G
(""G H
key""H K
)""K L
,""L M
SecurityAlgorithms""N `
.""` a
HmacSha256Signature""a t
)""t u
}## 
;## 
var%% 
token%% 
=%% 
tokenApi%% 
.%% 
CreateToken%% "
(%%" # 
responseTokenDescrip%%# 7
)%%7 8
;%%8 9
return&& 
tokenApi&&	 
.&& 

WriteToken&& 
(&& 
token&& "
)&&" #
;&&# $
}'' 
}(( §
>C:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder		 
.		 
Services		 
.		 
AddControllers		 
(		  
)		  !
;		! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddSingleton 
< 
JwtServicesNttData 0
>0 1
(1 2
)2 3
;3 4
builder 
. 
WebHost 
. 
ConfigureKestrel  
(  !
options! (
=>) +
{ 
options 
. 	
ListenAnyIP	 
( 
$num 
) 
; 
} 
) 
; 
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app!! 
.!! 
UseMiddleware!! 
<!! 
ApiKeyMidleware!! !
>!!! "
(!!" #
)!!# $
;!!$ %
app## 
.## 
UseHttpsRedirection## 
(## 
)## 
;## 
app%% 
.%% 
UseAuthorization%% 
(%% 
)%% 
;%% 
app'' 
.'' 
MapControllers'' 
('' 
)'' 
;'' 
app)) 
.)) 
Run)) 
()) 
))) 	
;))	 
¸
QC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Middleware\ApiKeyMidleware.cs
	namespace 	
TestApiNttData
 
. 

Middleware #
;# $
public 
class 
ApiKeyMidleware 
{ 
private 
readonly	 
RequestDelegate !
_nextApi" *
;* +
private 
const	 
string 
	KeyHeader 
=  !
$str" 8
;8 9
private 
readonly	 
string 
apiKeyValidate '
;' (
public		 
ApiKeyMidleware		 
(		 
RequestDelegate		 '
apiNext		( /
,		/ 0
IConfiguration		1 ?
confApi		@ G
)		G H
{

 
_nextApi 

= 
apiNext 
; 
apiKeyValidate 
= 
confApi 
[ 
$str *
]* +
;+ ,
} 
public 
async 
Task 
InvokeAsync 
( 
HttpContext *
contextApiKey+ 8
)8 9
{ 
if 
( 
! 
contextApiKey 
. 
Request 
. 
Headers $
.$ %
TryGetValue% 0
(0 1
	KeyHeader1 :
,: ;
out< ?
var@ C
extractedApiKeyD S
)S T
||U W
extractedApiKeyX g
!=h j
apiKeyValidatek y
)y z
{ 
contextApiKey 
. 
Response 
. 

StatusCode $
=% &
StatusCodes' 2
.2 3!
Status401Unauthorized3 H
;H I
await 
contextApiKey	 
. 
Response 
.  

WriteAsync  *
(* +
$str+ J
)J K
;K L
return 	
;	 

} 
await 
_nextApi 
( 
contextApiKey 
) 
;  
} 
} 
OC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Entities\ResponseNttData.cs
	namespace 	
TestApiNttData
 
. 
Entities !
;! "
public 
class 
ResponseNttData 
{ 
public 
string 
message 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
} €!
QC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Controllers\ApiTestNttData.cs
	namespace 	
TestApiNttData
 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public		 
class		 
ApiTestNttData		 
:		 
ControllerBase		 -
{

 
private 	
readonly
 
ILogger 
< 
ApiTestNttData )
>) *
_logger+ 2
;2 3
private 	
readonly
 
JwtServicesNttData %
_jwtServicesNtt& 5
;5 6
public 
ApiTestNttData	 
( 
ILogger 
<  
ApiTestNttData  .
>. /
logger0 6
,6 7
JwtServicesNttData8 J
jwtServicesNttK Y
)Y Z
{ 
_logger 

= 
logger 
; 
_jwtServicesNtt 
= 
jwtServicesNtt #
;# $
} 
[ 
HttpPost 
( 
Name 
= 
$str 
) 
] 
[  
ProducesResponseType 
( 
StatusCodes #
.# $
Status200OK$ /
)/ 0
]0 1
[  
ProducesResponseType 
( 
StatusCodes #
.# $
Status204NoContent$ 6
)6 7
]7 8
[  
ProducesResponseType 
( 
StatusCodes #
.# $
Status400BadRequest$ 7
)7 8
]8 9
[  
ProducesResponseType 
( 
StatusCodes #
.# $(
Status500InternalServerError$ @
)@ A
]A B
public 
async	 
Task 
< 
ActionResult  
<  !
ResponseNttData! 0
>0 1
>1 2
postDevopsNttData3 D
(D E
[ 
FromBody 
] 
RequestNttData 
queryNttData )
)) *
{ 
try 
{ 
if 
( 
queryNttData 
== 
null 
) 
{   
return!! 

BadRequest!! 
(!! 
$str!! )
)!!) *
;!!* +
}"" 
string%% 

tokenJwtApiNttData%% 
=%% 
_jwtServicesNtt%%  /
.%%/ 0
TokenGenerate%%0 =
(%%= >
queryNttData%%> J
)%%J K
;%%K L
var'' 
responseNttData'' 
='' 
new'' 
ResponseNttData'' -
{(( 
message)) 
=)) 
$")) 
$str)) 
{)) 
queryNttData)) $
.))$ %
to))% '
}))' (
$str))( B
"))B C
}** 
;** 
return,, 

Ok,, 
(,, 
responseNttData,, 
),, 
;,, 
}-- 
catch.. 
(.. 	
	Exception..	 
ex.. 
).. 
{// 
return00 


StatusCode00 
(00 
StatusCodes00 !
.00! "
Status400BadRequest00" 5
,005 6
$str007 R
)00R S
;00S T
}11 
}22 
[44 
HttpGet44 

,44
 
HttpPut44 
,44 

HttpDelete44 
,44  
	HttpPatch44! *
,44* +
HttpOptions44, 7
,447 8
HttpHead449 A
]44A B
public55 
IActionResult55	 
MethodsNotPermited55 )
(55) *
)55* +
{66 
return77 	

StatusCode77
 
(77 
StatusCodes77  
.77  !%
Status405MethodNotAllowed77! :
,77: ;
$str77< C
)77C D
;77D E
}88 
}:: 
};; ó
NC:\Users\viejo\DevOps\TestApiNttData\TestApiNttData\Entities\RequestNttData.cs
	namespace 	
TestApiNttData
 
. 
Entities !
;! "
public 
class 
RequestNttData 
{ 
public 
string 
message 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 
string 
to 
{ 
get 
; 
set 
; 
} 
=  !
string" (
.( )
Empty) .
;. /
public		 
string		 
from		 
{		 
get		 
;		 
set		 
;		 
}		  !
=		" #
string		$ *
.		* +
Empty		+ 0
;		0 1
public

 
int

 
timeToLifeSec

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
} 