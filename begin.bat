::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaLNxeo7Pug==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaLBvKdnDjODAOO0fig==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaLBvKdnDguLAOO0fig==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaLBvKdbDjODAOO0fig==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaLBvKdbDguLAOO0fig==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaOAwd5vS1KeabuUL7yU=
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaOAwd5vJ36eabuUL7yU=
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaME6apvS3L2NIfQWpF32eNsgxRo=
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaOEqaoOV36yLQA==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaOkya7DR0vqLOOVz
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaO8+cYGV2LWaQA==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPE6bJrLlLGWJYA=
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPE3d5jfyL2YJa4W8kCE
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPQ6asHZ26Du
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPQzdYzIlLGWJYA=
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPVodIvJug==
::fBE1pAF6MU+EWHreyHcjLQlHcFfSajroOpEZ++Pv4Pq7qUAOaPU4fZuV36yLQA==
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRmP/EU6SA==
::Yhs/ulQjdF65
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSTk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEgEGlXQAE+/Fb4I5/jH+++UtgMYTOdf
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
color 3f
set my=20.03.08
@title Windows全版本激活工具-校准时间
echo. 正在为您校准时间，请稍后...（使用中国科学院国家授时中心的ntp服务器即ntp.ntsc.ac.cn）
::net stop w32time >nul
::w32tm /unregister >nul
w32tm /register >nul
net start w32time >nul
w32tm /config /manualpeerlist:"ntp.ntsc.ac.cn" /syncfromflags:manual /reliable:yes /update >nul
w32tm /resync >nul
call main.bat
