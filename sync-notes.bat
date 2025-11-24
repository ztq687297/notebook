@echo off
REM 自动同步 Typora 笔记到 GitHub

REM 进入笔记目录
cd /d F:\笔记

REM 添加所有改动（新增、修改、删除）
git add .

REM 使用当前日期和时间作为 commit 信息
for /f "tokens=1-5 delims=/-: " %%a in ("%date% %time%") do (
    set commitmsg=Update %%a-%%b-%%c %%d:%%e
)

git commit -m "%commitmsg%"

REM 推送到远程仓库
git push

echo.
echo ================================
echo 笔记同步完成！
echo ================================
pause