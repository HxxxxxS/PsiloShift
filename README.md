# PsiloShift (BCC) - By Psilocybin-Mograine(H)
## Helper addon to optimize character count in your shapeshift macros

Takes the safe shift macro made by Fyroth and Zia on the Druid Discord and minifies the required text so you can fit more consumes into your macros.

Can mix and match with sapper cooldown, healthstone cooldown, also supports my multi form shapeshift macro (the one with the actionbars), so you can powershift from any form back to the same form.

## Macro examples:

### Powershift only
```lua
/stopattack
/click formStart
# Put conumables here if you want
/click formEnd
/startattack
```
### Healthstone + Nightmare Seed
```lua
#showtooltip
/click shiftHS
/click formStart
/use [mod:ctrl]Nightmare Seed;Master Healthstone
/click formEnd
```
### Health pots
```lua
#showtooltip
/click shiftPot
/click formStart
/use [mod:shift]Major Healing Potion;Super Healing Potion
/click formEnd
```
### Ironskin/Stoneshield pots
```lua
#showtooltip
/click shiftPot
/click formStart
/use [mod:shift]Ironshield Potion;Greater Stoneshield Potion
/click formEnd
```
### Sapper
```lua
/click shiftSap
/click formStart
/use [mod:shift]Super Sapper Charge;Goblin Sapper Charge
/cast [noform:1]!Dire Bear Form
/click formEnd
```

## Actionbar form order
The formStart function will set your actionbar to a number from 1-6 using the following logic:

`/changeactionbar [noform] 1; [form:1] 2; [form:3] 3; [form:4] 4; [form:5] 5 ; 6;`

# Questions? 
Find Psilocybin-Mograine in the userlist on the Druid Discord.
