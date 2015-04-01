% Author:
% Date: 3/24/2015

%Common Criminal Charges




offence(assault).
offence(drugs).
offence(theft).
offence(abuse).
offence(computer_crime).
offence(domestic_violence).
offence(indecent_exposure).
offence(kidnapping).
offence(manslaughter).
offence(prostitution).
offence(fraud).
offence(harassment).
offence(homicide).
offence(indecent_exposure).
offence(identity_theft).
offence(kidnapping).
offence(manslaughter_involuntary).
offence(manslaughter_voluntary).
offence(prostitution).
offence(public_intoxication).
offence(rape).
offence(robbery).
offence(sexual_assault).
offence(shoplifting).
 offence(none).
 
%gender (male, female)
gender(male).
gender(female).
gender(none).

%eye color (amber, black, blue, brown, gray, green, hazel, violet)
eye_colour(amber).
eye_colour(black).
eye_colour(blue).
eye_colour(brown).
eye_colour(gray).
eye_colour(hazel).
eye_colour(violet).
eye_colour(none).
 
%skin color  (dark, light)
skin_colour(dark).
skin_colour(light).
skin_colour(none).
%height   (ft and inches)
%height(F,Inches).
%weight (pounds)
%special features( tattoo/scars)
special_features(scars).

%hair color  (black, brown, red, blonde, )
hair_colour(black).
hair_colour(brown).
hair_colour(red).
hair_colour(blonde).
hair_colour(none).

%hair style(afro, afro textured, etc...)
hair_style(afro).
hair_style(beehiv).
hair_style(big_hair).
hair_style(comb_over).
hair_style(cornrow).
hair_style(dreadlocks).
hair_style(long_hair).
hair_style(mohawk).
hair_style(pony_tail).
hair_style(none).

%populate suspects/known offenders
%human(name, gender, offence,eye colour, hair colour, special features, hair style, skin colur, height, weight)

suspect(nestor,schnabel, male, extortion,eye_colour(blue), hair_colour(brown), special_features('flowers tattoo shoulder'), hair_style(wave), skin_colour(dark), height([5.9])).
% suspect( (freeman), lname(haverty), gender(male), offense(harassment), eye_colour(brown), hair_colour(black), special_features('dragon tattoo chest'), hair_style(mohawk), skin_colour(light), height([5.11])).
% suspect( (darcie), lname(merino), gender(female), offense(forgery), eye_colour(blue),  hair_colour(brown), special_features(none), hair_style(comb-over), skin_colour(dark), height([5.6])).
% suspect( (oralia), lname(keplin), gender(female), offense(child-abuse), eye_colour(hazel),hair_colour(black), special_features(none), hair_style(dreadlocks), skin_colour(light), height([5.4])).
% suspect( (erline), lname(vierra), gender(female), offense(prostitution), eye_colour(hazel), hair_colur(blonde), special_features(none), hair_style(long-hair), skin_colour(dark), height([5.3])).
% suspect( (mistie), lanme(rayborn), gender(female), offense(child-abuse), eye_colour(gray), hair_colour(brown), special_features('tatoo on neck'), hair_style(long-hair), skin_colour(dark), height([5.8])).
% suspect( (roslyn),lname(rickman), gender(female), offense(shoplifting), eye_colour(blue), hair_colour(brown), special_features('mole on cheak'), hair_style(cornrow), skin_colour(light), height([5.9])).
% suspect( (kijo),  lname(paris), gender(male), offense(domestic-violence), eye_colour(blue), hair_colour(brown), special_features(['heart tattoo shoulder', 'scar left hand']), hair_style(wave), skin_colour(dark), height([5.9])).
% suspect( (antwan), lname(killion), gender(male), offense(identity-theft), eye_colour(grey), hair_colour(black), special_features(none), hair_style(corn-row), skin_colour(dark), height([5.11])).
% suspect( (callie), lname(grever), gender(male), offense(rape), eye_colour(black), hair_colour(brown), special_features(none), hair_style(mohawk), skin_colour(dark), height([5.9])).
% suspect( (omar), lname(james), gender(male), offense(kidnapping), eye_colour(blue), hair_colour(brown), special_features(none), hair_style(wave), skin_colour(light), height([5.7])).
% suspect( (john), lname(brown), gender(male), offense(embezzlement), eye_colour(amber), hair_colour(brown), special_features(none), hair_style(ceaser-cut), skin_colour(dark), height([5.9])).
% suspect( (timmy), lname(williams), gender(male), offense(disorderly-conduct), eye_colour(blue), hair_colour(brown), special_features(none), hair_style(wave), skin_colour(light), height([5.9])).
% suspect( (shane), lname(johnson), gender(male), offense(child-abuse), eye_colour(blue), hair_colour(brown), special_features(none), hair_style(corn-row), skin_colour(dark), height([5.5])).
% suspect( (alwyn), lname(lynch), gender(male), offense(drug-possession), eye_colour(hazel), hair_colour(black), special_features(none), hair_style(afro), skin_colour(light), height([5.4])).
% suspect( (jason), lname(pinnock), gender(male), offense(child-abuse), eye_colour(hazel), hair_colour(red), special_features(none), hair_style(wave), skin_colour(dark), height([6.4])).
% suspect( (patrick), lname(king), gender(male), offense(kidnapping), eye_colour(blue), hair_colour(brown),special_features(none), hair_style(corn-row), skin_colour(light), height([5.6])).
% suspect( (leon), lname(jackson), gender(male), offense(drug-possession), eye_colour(brown), hair_colour(grey), special_features(none), hair_style(wave), skin_colour(dark), height([6.3])).
% suspect( (grevon), lname(wright), gender(male), offense(robbery), eye_colour(black), hair_colour(brown), special_feature(none), hair_style(corn-row), skin_colour(light), height([5.8])).
% suspect( (shamar), lname(pitter), gender(male), offense(robbery), eye_colour(brown), hair_colour(brown), special_features('burn mark on forehead'), hair_style(wave), skin_colour(dark), height([6.4])).
% suspect( (sam), lname(campbell), gender(male), offense(computer-crime), eye_colour(grey), hair_colour(brown), special_features(none), hair_style(corn-row), skin_colour(light), height([5.2])).
% suspect( (anthony), lname(bell), gender(male), offense(child-abuse), eye_colour(blue), hair_colour(brown), special_features(none),  hair_style(wave), skin_colour(light), height([6.3])).
% suspect( (callie), lname(grever), gender(male), offense(drug-possession), eye_colour(hazel), hair_colour(brown), special_features(none),  hair_style(corn-row), skin_colour(dark), height([5.7])).
% suspect( (emily), lname(condello), gender(female), offense(child-abuse), eye_colour(blue), hair_colour(brown),special_features(none),  hair_style(big-hair), skin_colour(light), height([5.5])).
% suspect( tana, lname(rominger), gender(female), offense(identity-theft), eye_colour(amber), hair_colour(black), special_features(none),  hair_style(afro), skin_colour(dark), height([5.4])).
% suspect((rozanne), lname(mansour), gender(female), offense(prostitution), eye_colour(grey), hair_colour(black), special_features(none),  hair_style(comb-over), skin_colour(light), height([5.3])).
suspect(veronica, tailor, female,child_abuse, black, black, none, beehiv, dark, 5.2).
suspect(dacorie,smith,male,male,black,sd,sasa,sasa,sas,sas).
suspect(dacorie,smith,female,assault,black,brown,fdsf,beehiv,light,10).
suspect(da,ddsadd,male,assault,amber,black,dasd,afro,dark,2).
suspect(dacorie,smith,male,assault,amber,black,dac,afro,dark,3).
suspect(dac,smith,male,assault,amber,black,dacorie,afro,dark,9).
suspect(madman,man,male,theft,amber,brown,scar,beehiv,light,10).
suspect(dacorie,smith,male,theft,amber,black,scar,afro,dark,5).
suspect(criminal,ssss,male,theft,amber,black,sssss,big_hair,dark,8).
suspect(one,dac,male,assault,amber,black,some,afro,dark,1).
suspect(dacorie,s,male,assault,amber,black,s,afro,dark,1).
suspect(Luke,m,male,computer_crime,amber,black,scar,afro,dark,4).
