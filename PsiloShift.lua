local _, S = ...

do
    _G["PSprint"] = function(msg, notitle)
        msg = "|cff00ffff" .. msg
        if notitle ~= true then
            msg = "|cffff0000PsiloShift: " .. msg
        end
        print(msg)
    end

    PSprint("available commands:")
    do
        local name = "shiftStart"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/run if GetSpellCooldown(768)>0 or UnitPower("player",0)<GetSpellPowerCost(768)[1].cost then SetCVar("autoUnshift",0) end');
        PSprint("'/click "..name.."' |cff00ff00- enable autoUnshift if cast ready (start of macro)")
    end
    do
        local name = "shiftEnd"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/run SetCVar("autoUnshift",1)');
        PSprint("'/click "..name.."' |cff00ff00- disable autoUnshift (end of macro)")
    end
    do
        local name = "shiftPot"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/click formStart\n/run if GetItemCooldown(13446)>0 then SetCVar("autoUnshift",0) end');
        PSprint("'/click "..name.."' |cff00ff00- enable autoUnshift if pot cooldown is ready (start of macro), inherits from |cff00ffffshiftStart")
    end
    do
        local name = "shiftHS"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/click formStart\n/run if GetItemCooldown(20520)>0 then SetCVar("autoUnshift",0) end');
        PSprint("'/click "..name.."' |cff00ff00- enable autoUnshift if health stone cooldown is ready (start of macro), inherits from |cff00ffffshiftStart")
    end
    do
        local name = "shiftSap"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/click formStart\n/run if GetItemCooldown(10646)>0 then SetCVar("autoUnshift",0) end');
        PSprint("'/click "..name.."' |cff00ff00- enable autoUnshift if sapper cooldown is ready (start of macro), inherits from |cff00ffffshiftStart")
    end
    do
        local name = "formStart"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/changeactionbar [noform]1;[form:1]2;[form:3]3;[form:4]4;[form:5]5;6;\n/click shiftStart');
        PSprint("'/click "..name.."' |cff00ff00- change actionbar based on current form (caster:1,bear:2,cat:3,travel:4,moonkin:5,flight:6,swift:7) (start of macro), inherits from |cff00ffffshiftStart")
    end
    do
        local name = "barReset"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/changeactionbar 1');
    end
    do
        local name = "formEnd"
        local b = _G[name] or CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate');
        b:SetAttribute('type', 'macro');
        b:SetAttribute('macrotext', '/use [bar:2]!Dire Bear Form;[bar:3]!Cat Form;[bar:4]!Travel Form\n/click barReset\n/click shiftEnd');
        PSprint("'/click "..name.."' |cff00ff00- change back to form based on current bar (end of macro), inherits from |cff00ffffshiftEnd|r, also resets bar")
    end
end
