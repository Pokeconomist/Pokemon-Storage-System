@echo off
setLocal EnableDelayedExpansion
if exist data\tempFiles\temp_stats.txt del /q data\tempFiles\temp_stats.txt

set skip=%~1
if %skip% equ 0 (
	goto specialCase
) else (
	goto standardCase
)

:standardCase
for /f "tokens=2 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set name=%%A
	goto stn_next1
)
:stn_next1
for /f "tokens=3 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set hp=%%A
	goto stn_next2
)
:stn_next2
for /f "tokens=4 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set atk=%%A
	goto stn_next3
)
:stn_next3
for /f "tokens=5 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set def=%%A
	goto stn_next4
)
:stn_next4
for /f "tokens=6 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set spd=%%A
	goto stn_next5
)
:stn_next5
for /f "tokens=7 delims=, skip=%skip%" %%A in (data\pokemonStats.txt) do (
	set spc=%%A
	goto stn_next6
)
:stn_next6
:specialCase

echo %name%,%hp%,%atk%,%def%,%spd%,%spc%>data\tempFiles\temp_stats.txt