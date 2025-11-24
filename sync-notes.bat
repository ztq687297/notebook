@echo off
chcp 65001
REM 自动同步 Typora 笔记到 GitHub

cd /d "F:\笔记" || (
    echo 路径不存在，请检查 F:\笔记 是否正确
    pause
    exit /b
)

git add .

for /f "tokens=1-5 delims=/-: " %%a in ("%date% %time%") do (
    set commitmsg=Update %%a-%%b-%%c %%d:%%e
)

git commit -m "%commitmsg%" 2>nul
git push

echo.
echo ================================
echo 笔记同步完成！
echo ================================
pause