@ECHO OFF
call config.bat
echo =======================
echo ===== FantuScript =====
echo ===== Dl - Kemono =====
echo ===== V : %version% =====
echo ===== FantuScript =====
echo =======================
:verifpython
if exist "%pythonpath%" goto :verifrequirement else
echo. & echo. & echo Have you installed Python and these updates ? & set /p python3= Non (1) : 
if %python3%== 1 echo Install Python here :https://www.python.org/downloads/ . To use Kemono ! & pause & goto :fin2

:verifrequirement
if exist "%pythonpath%\Lib\site-packages\beautifulsoup4-4.11.1.dist-info" goto:verifcookie else goto:requirement
if exist "%pythonpath%\Lib\site-packages\requests-2.27.1.dist-info" goto:verifcookie else goto:requirement
if exist "%pythonpath%\Lib\site-packages\yt_dlp-2022.4.8.dist-info" goto:verifcookie else goto:requirement

:requirement
echo Wish to set up these requirements to you ? (Python must be installed.)
set /p requirement= Yes (1) or No (2) : 
if %requirement%== 1 goto :install
if %requirement%== 2 pause & goto :fin2

:verifcookie
if exist "kemono.party_cookies.txt" goto :language else
echo. & echo. & echo Do you have the cookie with the .bat?
set /p cookies= Non (1) : 
if %cookies%== 1 echo installer get-cookiestxt here [chrome] https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid?hl=en Place the Kemono cookies with the .Bat then. & pause & goto :fin2

:install 
set r1=beautifulsoup4==4.11.1
set r2=requests==2.27.1
set r3=yt_dlp==2022.4.8
pip install %r1% 
pip install %r2% 
pip install %r3% 
echo.
echo.
echo Script ready to use!
goto :language

:language
echo.
echo.
echo Wich language went you to use ?
set /p lng= Fr (1) ou En (2) : 
if %lng%== 1 set lngu= fr & goto :start1
if %lng%== 2 set lngu= en & goto :start1

:start1
echo.
echo.
if %lngu%== fr echo %restartfr%
if %lngu%== fr echo %acceptation%
if %lngu%== en echo %reloaden%
if %lngu%== en echo %accept%
set /p restart=:
if %restart%== 1 goto :timer
if %restart%== 2 goto :Start

:timer 
echo.
echo.
if %lngu%== fr echo %timerfr%
if %lngu%== en echo %timeren%
set /p time= :
set /a time=%time%
if %time% GEQ 1 goto :Start 
if %time% LSS 1 if %lngu%== fr echo %timerfrer% & pause & goto :timer
if %time% LSS 1 if %lngu%== en echo %timerener% & pause & goto :timer

:Start
echo.
echo.
if %lngu%== fr echo %dlzonefr%
if %lngu%== fr echo %acceptation%
if %lngu%== en echo %dlzoneen%
if %lngu%== en echo %accept%
set /p changement= :
if %changement%== 1 set changement2= true
if %changement%== 2 set changement2= false
if %changement2%== true if %lngu%== fr echo %dlsetfr%
if %changement2%== true if %lngu%== en echo %dlseten%
if %changement2%== true set /p fichiernom= :
if %changement2%== false set fichiernom=Dl
if %lngu%== fr echo. & echo. & echo %dluserfr% : %~dp0%fichiernom%
if %lngu%== en echo. & echo. & echo %dluseren% : %~dp0%fichiernom%
if exist "%fichiernom%" goto :fin
echo.
echo.
if %lngu%== fr if not exist "%fichiernom%" echo %repfr%
if %lngu%== fr echo %acceptation%
if %lngu%== en if not exist "%fichiernom%" echo %repen%
if %lngu%== en echo %accept%
set /p fcre= :
if %fcre%== 1 mkdir %fichiernom% & goto :fin
if %fcre%== 2 goto :Start

:fin
echo.
echo.
if %lngu%== fr echo %urlfr%
if %lngu%== en echo %urlen%
set /p url= :
echo.
echo.
if %lngu%== fr echo %varenitfr% & echo %pixivfr1fr% & echo %fantia2fr%
if %lngu%== en echo %vareniten% & echo %pixivfr1en% & echo %fantia2en% 
set /p t= :
if %t%== 1 goto :option1
if %t%== 2 goto :option2

:option1
python kemono-dl.py --cookies "kemono.party_cookies.txt" --links %url% --filename-pattern "{service} {filename}_p{index} by {username}.{ext}" --dirname-pattern "%fichiernom%"
if %time% GEQ 1 set /a time=%time%-1
if %time% GEQ 1 if %lngu%== fr echo %dltfr%%time%Dl & goto :Start
if %time% GEQ 1 if %lngu%== en echo %dlten%%time%Dl & goto :Start
if %time% LSS 1 goto :fin2

:option2
python kemono-dl.py --cookies "kemono.party_cookies.txt" --links %url% --filename-pattern "{service} {title}_p{index} by {username}.{ext}" --dirname-pattern "%fichiernom%"
if %restarty%== true echo Et c'est re partie ! & goto :Start
if %time% LSS 1 goto :fin2

:fin2
echo ==> Fermeture du programme. <==
echo.
echo.
echo =======================
echo ===== FantuScript =====
echo ===== Dl - Kemono =====
echo ===== V : 1.0.0-A =====
echo ===== FantuScript =====
echo =======================
pause
