@echo off
setLocal EnableDelayedExpansion
set /a "n=0"
for %%A in (data\tempFiles\temp_player_pokemonStats.txt) do set /a "n+=1"
if n equ 1 (set /a "n=1")
:a
cls
echo %n%
echo ================
echo Pick k-dex number
echo ================
set /p x=":" || goto a
if not %x% leq 151 (echo NEED VALID VALUE & pause >nul & goto a)
call programs\pokemon_dataExtractor.bat %x%

for /f "tokens=1 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set name_pokemon%n%=%%A)
for /f "tokens=2 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set hp_base_pokemon%n%=%%A)
for /f "tokens=3 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set atk_base_pokemon%n%=%%A)
for /f "tokens=4 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set def_base_pokemon%n%=%%A)
for /f "tokens=5 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set spd_base_pokemon%n%=%%A)
for /f "tokens=6 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set spc_base_pokemon%n%=%%A)
del /q data\tempFiles\temp_stats.txt

set /a "dexNo_pokemon%n%=x"
set /a "lvl_pokemon%n%=50"
set /a "hp_iv_pokemon%n%=(%random%)%%32"
set /a "atk_iv_pokemon%n%=(%random%)%%32"
set /a "def_iv_pokemon%n%=(%random%)%%32"
set /a "spd_iv_pokemon%n%=(%random%)%%32"
set /a "spc_iv_pokemon%n%=(%random%)%%32"

set /a "move1_pokemon%n%=(%random%)%%167"
set /a "move2_pokemon%n%=(%random%)%%167"
set /a "move3_pokemon%n%=(%random%)%%167"
set /a "move4_pokemon%n%=(%random%)%%167"
echo !name_pokemon%n%!,!nknm_pokemon%n%!,!hp_iv_pokemon%n%!,!atk_iv_pokemon%n%!,!def_iv_pokemon%n%!,!spd_pokemon%n%!,!spc_pokemon%n%!,!lvl_pokemon%n%!,!dex_pokemon%n%!,!move1_pokemon%n%!,!move2_pokemon%n%!,!move3_pokemon%n%!,!move4_pokemon%n%!>>data\tempFiles\temp_player_pokemonStats.txt

set /a n+=1
goto :a