# PsiloShift (BCC) - By Psilocybin-Mograine(H)
## Helper addon to optimize character count in your shapeshift macros

Takes the safe shift macro made by Fyroth and Zia on the Druid Discord and minifies the required text so you can fit more consumes into your macros.

Can mix and match with sapper cooldown, healthstone cooldown, also supports my multi form shapeshift macro (the one with the actionbars), so you can powershift from any form back to the same form.

## Macro examples:

### Powershift only
#### From any form back into the same form
```lua
/stopattack
/click formStart
# Put consumables here if you want
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
### Goblin Sapper
```lua
/click [mod:shift]shiftSuperSap;shiftSap
/click formStart
/use [mod:shift]Super Sapper Charge;Goblin Sapper Charge
/click formEnd
```

## Actionbar form order
The formStart function will set your actionbar to a number from 1-6 using the following logic:

`/changeactionbar [noform] 1; [form:1] 2; [form:3] 3; [form:4] 4; [form:5] 5 ; 6;`

## Available commands and what they are shortening
* `/click stunCheck` - `/run if C_LossOfControl.GetActiveLossOfControlDataCount() then SetCVar("autoUnshift",0) end`

    Disables autoUnshift if we are stunned. Inherited by shiftStart and formStart.
* `/click shiftStart` - `/run if GetSpellCooldown(768)>0 or UnitPower("player",0)<GetSpellPowerCost(768)[1].cost then SetCVar("autoUnshift",0) end`

    Only checks cooldown and spell cost of shapeshifting, disables autoUnshift if necessary.
* `/click shiftPot` - `/run if GetItemCooldown(13446)>0 then SetCVar("autoUnshift",0) end')`

    Checks if potions are on cooldown. Also inherits the code from `shiftStart`.
* `/click shiftHS` - same thing as above, but for Healthstones instead of pots
* `/click shiftSap` - same thing as above, but for Goblin Sappers instead of pots
* `/click shiftSuperSap` - same thing as above, but for Super Sappers instead of pots
* `/click shiftEnd` - `/run SetCVar("autoUnshift",1)`

    Enables autoUnshift again at end of macro.
* `/click formStart` - `/changeactionbar [noform]1;[form:1]2;[form:3]3;[form:4]4;[form:5]5;6;`

    Changes your actionbar number based on current form. We can then use actionbar number as a variable to get back into the same form later.
* `/click formEnd` - `/use [bar:2]!Dire Bear Form;[bar:3]!Cat Form;[bar:4]!Travel Form`

    Shapeshift based on our current actionbar number.
* `/click barReset` - `/changeactionbar 1`

    Resets our actionbar number back to 1. This is inherited into the `formEnd` command. 

Note that you CAN use macro modifiers on `/click` commands. For an example take a look at the Sapper macro example above.

# Questions? 
Find Psilocybin-Mograine in the userlist on the Druid Discord.
