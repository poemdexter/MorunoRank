local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_LOGIN")

Frame:SetScript("OnEvent", function(...)

function getCurrentRank(CurrentRP)

CRank = 0;

    if(CurrentRP < 65000) then CRank = 14; end;
    if(CurrentRP < 60000) then CRank = 13; end;
    if(CurrentRP < 55000) then CRank = 12; end;
    if(CurrentRP < 50000) then CRank = 11; end;
    if(CurrentRP < 45000) then CRank = 10; end;
    if(CurrentRP < 40000) then CRank = 9; end;
    if(CurrentRP < 35000) then CRank = 8; end;
    if(CurrentRP < 30000) then CRank = 7; end;
    if(CurrentRP < 25000) then CRank = 6; end;
    if(CurrentRP < 20000) then CRank = 5; end;
    if(CurrentRP < 15000) then CRank = 4; end;
    if(CurrentRP < 10000) then CRank = 3; end;
    if(CurrentRP < 5000) then CRank = 2; end;
    if(CurrentRP < 2000) then CRank = 1; end;
    if(CurrentRP < 500) then CRank = 0; end;

    return CRank;

end;

function getCurrentHP(CurrentRP)

CRank = 0;
    if(CurrentRP == 14) then CRank = 60000; end;
    if(CurrentRP == 13) then CRank = 55000; end;
    if(CurrentRP == 12) then CRank = 50000; end;
    if(CurrentRP == 11) then CRank = 45000; end;
    if(CurrentRP == 10) then CRank = 40000; end;
    if(CurrentRP == 9) then CRank = 35000; end;
    if(CurrentRP == 8) then CRank = 30000; end;
    if(CurrentRP == 7) then CRank = 25000; end;
    if(CurrentRP == 6) then CRank = 20000; end;
    if(CurrentRP == 5) then CRank = 15000; end;
    if(CurrentRP == 4) then CRank = 10000; end;
    if(CurrentRP == 3) then CRank = 5000; end;
    if(CurrentRP == 2) then CRank = 2000; end;
    if(CurrentRP == 1) then CRank = 500; end;

    return CRank;

end;

function MorunoRank()

    PercentPVPRank=math.floor(GetPVPRankProgress(target)*100);
    UPVPRank=UnitPVPRank("player");
    hk, CPLast = GetPVPThisWeekStats();
    CurrentRP=(UPVPRank-6)*5000+5000*PercentPVPRank/100;
    NeededRPToNextRank=(UPVPRank-5)*5000-CurrentRP*0.8;

    CurrentRank = getCurrentRank(CurrentRP);

    RA = CurrentRP;

    step1 = 100
    step2 = 500
    step3 = 1500
    step4 = 2500
    step5 = 4500
    step6 = 10200
    step7 = 25500
    step8 = 53500
    step9 = 95000
    step10 = 150000
    step11 = 220000
    step12 = 300000
    step13 = 400000
    step14 = 570000

    if(CPLast<step1) then CPup=0;CPlo=0;RPup=0;RPlo=0;end;
    if(CPLast<step2 and CPLast>step1) then CPup=step2;CPlo=step1;RPup=1000;RPlo=400;end;
    if(CPLast<step3 and CPLast>step2) then CPup=step3;CPlo=step2;RPup=2000;RPlo=1000;end;
    if(CPLast<step4 and CPLast>step3) then CPup=step4;CPlo=step3;RPup=3000;RPlo=2000;end;
    if(CPLast<step5 and CPLast>step4) then CPup=step5;CPlo=step4;RPup=4000;RPlo=3000;end;
    if(CPLast<step6 and CPLast>step5) then CPup=step6;CPlo=step5;RPup=5000;RPlo=4000;end;
    if(CPLast<step7 and CPLast>step6) then CPup=step7;CPlo=step6;RPup=6000;RPlo=5000;end;
    if(CPLast<step8 and CPLast>step7) then CPup=step8;CPlo=step7;RPup=7000;RPlo=6000;end;
    if(CPLast<step9 and CPLast>step8) then CPup=step9;CPlo=step8;RPup=8000;RPlo=7000;end;
    if(CPLast<step10 and CPLast>step9) then CPup=step10;CPlo=step9;RPup=9000;RPlo=8000;end;
    if(CPLast<step11 and CPLast>step10) then CPup=step11;CPlo=step10;RPup=10000;RPlo=9000;end;
    if(CPLast<step12 and CPLast>step11) then CPup=step12;CPlo=step11;RPup=11000;RPlo=10000;end;
    if(CPLast<step13 and CPLast>step12) then CPup=step13;CPlo=step12;RPup=12000;RPlo=11000;end;
    if(CPLast<step14 and CPLast>step13) then CPup=step14;CPlo=step13;RPup=13000;RPlo=12000;end;

    RB =(CPLast - CPlo) / (CPup - CPlo) * (RPup - RPlo) + RPlo;
    RC = 0.2 * RA;

    EEarns = math.floor(RA + RB - RC);
    EarnedRank = getCurrentRank(EEarns);
    PercentNextPVPRank=math.floor(((EEarns-getCurrentHP(EarnedRank))*100)/(getCurrentHP(UPVPRank+1)-getCurrentHP(UPVPRank)));

    if(PercentNextPVPRank<0) then PercentNextPVPRank=PercentNextPVPRank*-1;end;

    SendChatMessage("Current RP: "..CurrentRP.." at "..PercentPVPRank.."% (Rank "..CurrentRank..") RP To Next Rank: "..NeededRPToNextRank.." This Week RP Gained:"..math.floor(RB).." @ Total RP Calculation: "..EEarns.." at "..PercentNextPVPRank.."%(Rank "..EarnedRank..")","emote");

end

end)
