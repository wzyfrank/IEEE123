function [Voltage_output, phasors] = ieee123_iter(loads, Zbus, Cbus)

% voltage regulator: 150R
tapA150R = 1.0 + 0.00625 * 0;
tapB150R = 1.0 + 0.00625 * 0;
tapC150R = 1.0 + 0.00625 * 0;
alpha150R = [tapA150R; tapB150R; tapC150R];
alphaM150R = alpha150R * alpha150R';

% voltage regulator: 9R
tapA9R = 1.0 + 0.00625 * 0;
alpha9R = tapA9R;
alphaM9R = alpha9R * alpha9R';

% voltage regulator: 25R
tapA25R = 1.0 + 0.00625 * 0;
tapC25R = 1.0 + 0.00625 * 0;
alpha25R = [tapA25R; tapC25R];
alphaM25R = alpha25R * alpha25R';

% voltage regulator: 160R
tapA160R = 1.0 + 0.00625 * 0;
tapB160R = 1.0 + 0.00625 * 0;
tapC160R = 1.0 + 0.00625 * 0;
alpha160R = [tapA160R; tapB160R; tapC160R];
alphaM160R = alpha160R * alpha160R';

Z12 = Zbus([11],[13]);
Z13 = Zbus([12],[14]);
Z17 = Zbus([10, 11, 12],[15, 16, 17]);
Z34 = Zbus([14],[18]);
Z35 = Zbus([14],[19]);
Z56 = Zbus([19],[20]);
Z78 = Zbus([15, 16, 17],[21, 22, 23]);
Z812 = Zbus([22],[24]);
Z89 = Zbus([21],[25]);
Z813 = Zbus([21, 22, 23],[26, 27, 28]);
Z9R14 = Zbus([29],[30]);
Z1334 = Zbus([28],[31]);
Z1318 = Zbus([26, 27, 28],[32, 33, 34]);
Z1411 = Zbus([30],[35]);
Z1410 = Zbus([30],[36]);
Z1516 = Zbus([37],[38]);
Z1517 = Zbus([37],[39]);
Z1819 = Zbus([32],[40]);
Z1821 = Zbus([32, 33, 34],[41, 42, 43]);
Z1920 = Zbus([40],[44]);
Z2122 = Zbus([42],[45]);
Z2123 = Zbus([41, 42, 43],[46, 47, 48]);
Z2324 = Zbus([48],[49]);
Z2325 = Zbus([46, 47, 48],[50, 51, 52]);
Z25R26 = Zbus([53, 54],[55, 56]);
Z2528 = Zbus([50, 51, 52],[57, 58, 59]);
Z2627 = Zbus([55, 56],[60, 61]);
Z2631 = Zbus([56],[62]);
Z2733 = Zbus([60],[63]);
Z2829 = Zbus([57, 58, 59],[64, 65, 66]);
Z2930 = Zbus([64, 65, 66],[67, 68, 69]);
Z30250 = Zbus([67, 68, 69],[70, 71, 72]);
Z3132 = Zbus([62],[73]);
Z3415 = Zbus([31],[37]);
Z3536 = Zbus([74, 75],[76, 77]);
Z3540 = Zbus([74, 75, 78],[79, 80, 81]);
Z3637 = Zbus([76],[82]);
Z3638 = Zbus([77],[83]);
Z3839 = Zbus([83],[84]);
Z4041 = Zbus([81],[85]);
Z4042 = Zbus([79, 80, 81],[86, 87, 88]);
Z4243 = Zbus([87],[89]);
Z4244 = Zbus([86, 87, 88],[90, 91, 92]);
Z4445 = Zbus([90],[93]);
Z4447 = Zbus([90, 91, 92],[94, 95, 96]);
Z4546 = Zbus([93],[97]);
Z4748 = Zbus([94, 95, 96],[98, 99, 100]);
Z4749 = Zbus([94, 95, 96],[101, 102, 103]);
Z4950 = Zbus([101, 102, 103],[104, 105, 106]);
Z5051 = Zbus([104, 105, 106],[107, 108, 109]);
Z5253 = Zbus([113, 114, 115],[116, 117, 118]);
Z5354 = Zbus([116, 117, 118],[119, 120, 121]);
Z5455 = Zbus([119, 120, 121],[122, 123, 124]);
Z5457 = Zbus([119, 120, 121],[125, 126, 127]);
Z5556 = Zbus([122, 123, 124],[128, 129, 130]);
Z5758 = Zbus([126],[131]);
Z5760 = Zbus([125, 126, 127],[132, 133, 134]);
Z5859 = Zbus([131],[135]);
Z6061 = Zbus([132, 133, 134],[136, 137, 138]);
Z6062 = Zbus([132, 133, 134],[139, 140, 141]);
Z6263 = Zbus([139, 140, 141],[142, 143, 144]);
Z6364 = Zbus([142, 143, 144],[145, 146, 147]);
Z6465 = Zbus([145, 146, 147],[148, 149, 150]);
Z6566 = Zbus([148, 149, 150],[151, 152, 153]);
Z6768 = Zbus([154],[155]);
Z6772 = Zbus([154, 156, 157],[158, 159, 160]);
Z6797 = Zbus([154, 156, 157],[161, 162, 163]);
Z6869 = Zbus([155],[164]);
Z6970 = Zbus([164],[165]);
Z7071 = Zbus([165],[166]);
Z7273 = Zbus([160],[167]);
Z7276 = Zbus([158, 159, 160],[168, 169, 170]);
Z7374 = Zbus([167],[171]);
Z7475 = Zbus([171],[172]);
Z7677 = Zbus([168, 169, 170],[173, 174, 175]);
Z7686 = Zbus([168, 169, 170],[176, 177, 178]);
Z7778 = Zbus([173, 174, 175],[179, 180, 181]);
Z7879 = Zbus([179, 180, 181],[182, 183, 184]);
Z7880 = Zbus([179, 180, 181],[185, 186, 187]);
Z8081 = Zbus([185, 186, 187],[188, 189, 190]);
Z8182 = Zbus([188, 189, 190],[191, 192, 193]);
Z8184 = Zbus([190],[194]);
Z8283 = Zbus([191, 192, 193],[195, 196, 197]);
Z8485 = Zbus([194],[198]);
Z8687 = Zbus([176, 177, 178],[199, 200, 201]);
Z8788 = Zbus([199],[202]);
Z8789 = Zbus([199, 200, 201],[203, 204, 205]);
Z8990 = Zbus([204],[206]);
Z8991 = Zbus([203, 204, 205],[207, 208, 209]);
Z9192 = Zbus([209],[210]);
Z9193 = Zbus([207, 208, 209],[211, 212, 213]);
Z9394 = Zbus([211],[214]);
Z9395 = Zbus([211, 212, 213],[215, 216, 217]);
Z9596 = Zbus([216],[218]);
Z9798 = Zbus([161, 162, 163],[219, 220, 221]);
Z9899 = Zbus([219, 220, 221],[222, 223, 224]);
Z99100 = Zbus([222, 223, 224],[225, 226, 227]);
Z100450 = Zbus([225, 226, 227],[228, 229, 230]);
Z101102 = Zbus([236],[237]);
Z101105 = Zbus([234, 235, 236],[238, 239, 240]);
Z102103 = Zbus([237],[241]);
Z103104 = Zbus([241],[242]);
Z105106 = Zbus([239],[243]);
Z105108 = Zbus([238, 239, 240],[244, 245, 246]);
Z106107 = Zbus([243],[247]);
Z108109 = Zbus([244],[248]);
Z108300 = Zbus([244, 245, 246],[249, 250, 251]);
Z109110 = Zbus([248],[252]);
Z110111 = Zbus([252],[253]);
Z110112 = Zbus([252],[254]);
Z112113 = Zbus([254],[255]);
Z113114 = Zbus([255],[256]);
Z13535 = Zbus([257, 258, 259],[74, 75, 78]);
Z1491 = Zbus([7, 8, 9],[10, 11, 12]);
Z15252 = Zbus([260, 261, 262],[113, 114, 115]);
Z160R67 = Zbus([263, 264, 265],[154, 156, 157]);
Z197101 = Zbus([231, 232, 233],[234, 235, 236]);
Z51151 = Zbus([107, 108, 109],[110, 111, 112]);
Z150150R = Zbus([1, 2, 3],[4, 5, 6]);
Z99R = Zbus([25],[29]);
Z2525R = Zbus([50, 52],[53, 54]);
Z160160R = Zbus([266, 267, 268],[263, 264, 265]);
Z61S610 = Zbus([269, 270, 271],[276, 277, 278]);
Z150R149 = Zbus([4, 5, 6],[7, 8, 9]);
Z13152 = Zbus([26, 27, 28],[260, 261, 262]);
Z18135 = Zbus([32, 33, 34],[257, 258, 259]);
Z60160 = Zbus([132, 133, 134],[266, 267, 268]);
Z97197 = Zbus([161, 162, 163],[231, 232, 233]);
Z6161S = Zbus([136, 137, 138],[269, 270, 271]);
Z151300_OPEN = Zbus([110, 111, 112],[272, 273, 274]);
Z5494_OPEN = Zbus([119],[275]);


% three phase voltage at slack bus
Vbase = 4160 / sqrt(3);
v0=1.00 * Vbase * [0,sqrt(3),0]';
% voltage upper and lower bounds
V_lb = 0.90 * Vbase;
V_ub = 1.055 * Vbase;
v_lb = V_lb * V_lb;
v_ub = V_ub * V_ub;

% sequential component parameters
a = -0.5 + 0.5 * i * sqrt(3);
A = 1/sqrt(3) * [1,1,1; 1, a*a, a; 1, a, a*a];
AH = 1/sqrt(3) * [1,1,1; 1, a, a*a; 1, a*a, a];



cvx_begin sdp quiet
% the solver: 
cvx_solver Mosek;

% voltage square variables
variable v2(1,1) hermitian
variable v1_abc(3,3) hermitian
variable v3(1,1) hermitian
variable v7(3,3) hermitian
variable v4(1,1) hermitian
variable v5(1,1) hermitian
variable v6(1,1) hermitian
variable v8(3,3) hermitian
variable v12(1,1) hermitian
variable v8_abc(3,3) hermitian
variable v9(1,1) hermitian
variable v13(3,3) hermitian
variable v14(1,1) hermitian
variable v34(1,1) hermitian
variable v13_abc(3,3) hermitian
variable v18(3,3) hermitian
variable v11(1,1) hermitian
variable v10(1,1) hermitian
variable v16(1,1) hermitian
variable v17(1,1) hermitian
variable v19(1,1) hermitian
variable v18_abc(3,3) hermitian
variable v21(3,3) hermitian
variable v20(1,1) hermitian
variable v22(1,1) hermitian
variable v21_abc(3,3) hermitian
variable v23(3,3) hermitian
variable v24(1,1) hermitian
variable v23_abc(3,3) hermitian
variable v25(3,3) hermitian
variable v26(2,2) hermitian
variable v28(3,3) hermitian
variable v27(2,2) hermitian
variable v31(1,1) hermitian
variable v33(1,1) hermitian
variable v29(3,3) hermitian
variable v30(3,3) hermitian
variable v250(3,3) hermitian
variable v32(1,1) hermitian
variable v15(1,1) hermitian
variable v36(2,2) hermitian
variable v35_abc(3,3) hermitian
variable v40(3,3) hermitian
variable v37(1,1) hermitian
variable v38(1,1) hermitian
variable v39(1,1) hermitian
variable v41(1,1) hermitian
variable v40_abc(3,3) hermitian
variable v42(3,3) hermitian
variable v43(1,1) hermitian
variable v42_abc(3,3) hermitian
variable v44(3,3) hermitian
variable v45(1,1) hermitian
variable v44_abc(3,3) hermitian
variable v47(3,3) hermitian
variable v46(1,1) hermitian
variable v48(3,3) hermitian
variable v49(3,3) hermitian
variable v50(3,3) hermitian
variable v51(3,3) hermitian
variable v53(3,3) hermitian
variable v54(3,3) hermitian
variable v55(3,3) hermitian
variable v57(3,3) hermitian
variable v56(3,3) hermitian
variable v58(1,1) hermitian
variable v57_abc(3,3) hermitian
variable v60(3,3) hermitian
variable v59(1,1) hermitian
variable v61(3,3) hermitian
variable v62(3,3) hermitian
variable v63(3,3) hermitian
variable v64(3,3) hermitian
variable v65(3,3) hermitian
variable v66(3,3) hermitian
variable v68(1,1) hermitian
variable v67_abc(3,3) hermitian
variable v72(3,3) hermitian
variable v97(3,3) hermitian
variable v69(1,1) hermitian
variable v70(1,1) hermitian
variable v71(1,1) hermitian
variable v73(1,1) hermitian
variable v72_abc(3,3) hermitian
variable v76(3,3) hermitian
variable v74(1,1) hermitian
variable v75(1,1) hermitian
variable v77(3,3) hermitian
variable v86(3,3) hermitian
variable v78(3,3) hermitian
variable v79(3,3) hermitian
variable v80(3,3) hermitian
variable v81(3,3) hermitian
variable v82(3,3) hermitian
variable v84(1,1) hermitian
variable v81_abc(3,3) hermitian
variable v83(3,3) hermitian
variable v85(1,1) hermitian
variable v87(3,3) hermitian
variable v88(1,1) hermitian
variable v87_abc(3,3) hermitian
variable v89(3,3) hermitian
variable v90(1,1) hermitian
variable v89_abc(3,3) hermitian
variable v91(3,3) hermitian
variable v92(1,1) hermitian
variable v91_abc(3,3) hermitian
variable v93(3,3) hermitian
variable v94(1,1) hermitian
variable v93_abc(3,3) hermitian
variable v95(3,3) hermitian
variable v96(1,1) hermitian
variable v95_abc(3,3) hermitian
variable v98(3,3) hermitian
variable v99(3,3) hermitian
variable v100(3,3) hermitian
variable v450(3,3) hermitian
variable v102(1,1) hermitian
variable v101_abc(3,3) hermitian
variable v105(3,3) hermitian
variable v103(1,1) hermitian
variable v104(1,1) hermitian
variable v106(1,1) hermitian
variable v105_abc(3,3) hermitian
variable v108(3,3) hermitian
variable v107(1,1) hermitian
variable v109(1,1) hermitian
variable v108_abc(3,3) hermitian
variable v300(3,3) hermitian
variable v110(1,1) hermitian
variable v111(1,1) hermitian
variable v112(1,1) hermitian
variable v113(1,1) hermitian
variable v114(1,1) hermitian
variable v35(3,3) hermitian
variable v1(3,3) hermitian
variable v52(3,3) hermitian
variable v67(3,3) hermitian
variable v101(3,3) hermitian
variable v151(3,3) hermitian
variable v150R(3,3) hermitian
variable v9R(1,1) hermitian
variable v25R(2,2) hermitian
variable v25_abc(3,3) hermitian
variable v160R(3,3) hermitian
variable v610(3,3) hermitian
variable v149(3,3) hermitian
variable v152(3,3) hermitian
variable v135(3,3) hermitian
variable v160(3,3) hermitian
variable v197(3,3) hermitian
variable v61S(3,3) hermitian
variable v300_OPEN(3,3) hermitian
variable v94_OPEN(1,1) hermitian
variable v54_abc(3,3) hermitian
variable v150(3,3) hermitian

% complex power variables
variable S12(1,1) complex
variable S13(1,1) complex
variable S17(3,3) complex
variable S34(1,1) complex
variable S35(1,1) complex
variable S56(1,1) complex
variable S78(3,3) complex
variable S812(1,1) complex
variable S89(1,1) complex
variable S813(3,3) complex
variable S9R14(1,1) complex
variable S1334(1,1) complex
variable S1318(3,3) complex
variable S1411(1,1) complex
variable S1410(1,1) complex
variable S1516(1,1) complex
variable S1517(1,1) complex
variable S1819(1,1) complex
variable S1821(3,3) complex
variable S1920(1,1) complex
variable S2122(1,1) complex
variable S2123(3,3) complex
variable S2324(1,1) complex
variable S2325(3,3) complex
variable S25R26(2,2) complex
variable S2528(3,3) complex
variable S2627(2,2) complex
variable S2631(1,1) complex
variable S2733(1,1) complex
variable S2829(3,3) complex
variable S2930(3,3) complex
variable S30250(3,3) complex
variable S3132(1,1) complex
variable S3415(1,1) complex
variable S3536(2,2) complex
variable S3540(3,3) complex
variable S3637(1,1) complex
variable S3638(1,1) complex
variable S3839(1,1) complex
variable S4041(1,1) complex
variable S4042(3,3) complex
variable S4243(1,1) complex
variable S4244(3,3) complex
variable S4445(1,1) complex
variable S4447(3,3) complex
variable S4546(1,1) complex
variable S4748(3,3) complex
variable S4749(3,3) complex
variable S4950(3,3) complex
variable S5051(3,3) complex
variable S5253(3,3) complex
variable S5354(3,3) complex
variable S5455(3,3) complex
variable S5457(3,3) complex
variable S5556(3,3) complex
variable S5758(1,1) complex
variable S5760(3,3) complex
variable S5859(1,1) complex
variable S6061(3,3) complex
variable S6062(3,3) complex
variable S6263(3,3) complex
variable S6364(3,3) complex
variable S6465(3,3) complex
variable S6566(3,3) complex
variable S6768(1,1) complex
variable S6772(3,3) complex
variable S6797(3,3) complex
variable S6869(1,1) complex
variable S6970(1,1) complex
variable S7071(1,1) complex
variable S7273(1,1) complex
variable S7276(3,3) complex
variable S7374(1,1) complex
variable S7475(1,1) complex
variable S7677(3,3) complex
variable S7686(3,3) complex
variable S7778(3,3) complex
variable S7879(3,3) complex
variable S7880(3,3) complex
variable S8081(3,3) complex
variable S8182(3,3) complex
variable S8184(1,1) complex
variable S8283(3,3) complex
variable S8485(1,1) complex
variable S8687(3,3) complex
variable S8788(1,1) complex
variable S8789(3,3) complex
variable S8990(1,1) complex
variable S8991(3,3) complex
variable S9192(1,1) complex
variable S9193(3,3) complex
variable S9394(1,1) complex
variable S9395(3,3) complex
variable S9596(1,1) complex
variable S9798(3,3) complex
variable S9899(3,3) complex
variable S99100(3,3) complex
variable S100450(3,3) complex
variable S101102(1,1) complex
variable S101105(3,3) complex
variable S102103(1,1) complex
variable S103104(1,1) complex
variable S105106(1,1) complex
variable S105108(3,3) complex
variable S106107(1,1) complex
variable S108109(1,1) complex
variable S108300(3,3) complex
variable S109110(1,1) complex
variable S110111(1,1) complex
variable S110112(1,1) complex
variable S112113(1,1) complex
variable S113114(1,1) complex
variable S13535(3,3) complex
variable S1491(3,3) complex
variable S15252(3,3) complex
variable S160R67(3,3) complex
variable S197101(3,3) complex
variable S51151(3,3) complex
variable S150150R(3,3) complex
variable S99R(1,1) complex
variable S2525R(2,2) complex
variable S160160R(3,3) complex
variable S61S610(3,3) complex
variable S150R149(3,3) complex
variable S13152(3,3) complex
variable S18135(3,3) complex
variable S60160(3,3) complex
variable S97197(3,3) complex
variable S6161S(3,3) complex
variable S151300_OPEN(3,3) complex
variable S5494_OPEN(1,1) complex

% current square variables
variable l12(1,1) hermitian
variable l13(1,1) hermitian
variable l17(3,3) hermitian
variable l34(1,1) hermitian
variable l35(1,1) hermitian
variable l56(1,1) hermitian
variable l78(3,3) hermitian
variable l812(1,1) hermitian
variable l89(1,1) hermitian
variable l813(3,3) hermitian
variable l9R14(1,1) hermitian
variable l1334(1,1) hermitian
variable l1318(3,3) hermitian
variable l1411(1,1) hermitian
variable l1410(1,1) hermitian
variable l1516(1,1) hermitian
variable l1517(1,1) hermitian
variable l1819(1,1) hermitian
variable l1821(3,3) hermitian
variable l1920(1,1) hermitian
variable l2122(1,1) hermitian
variable l2123(3,3) hermitian
variable l2324(1,1) hermitian
variable l2325(3,3) hermitian
variable l25R26(2,2) hermitian
variable l2528(3,3) hermitian
variable l2627(2,2) hermitian
variable l2631(1,1) hermitian
variable l2733(1,1) hermitian
variable l2829(3,3) hermitian
variable l2930(3,3) hermitian
variable l30250(3,3) hermitian
variable l3132(1,1) hermitian
variable l3415(1,1) hermitian
variable l3536(2,2) hermitian
variable l3540(3,3) hermitian
variable l3637(1,1) hermitian
variable l3638(1,1) hermitian
variable l3839(1,1) hermitian
variable l4041(1,1) hermitian
variable l4042(3,3) hermitian
variable l4243(1,1) hermitian
variable l4244(3,3) hermitian
variable l4445(1,1) hermitian
variable l4447(3,3) hermitian
variable l4546(1,1) hermitian
variable l4748(3,3) hermitian
variable l4749(3,3) hermitian
variable l4950(3,3) hermitian
variable l5051(3,3) hermitian
variable l5253(3,3) hermitian
variable l5354(3,3) hermitian
variable l5455(3,3) hermitian
variable l5457(3,3) hermitian
variable l5556(3,3) hermitian
variable l5758(1,1) hermitian
variable l5760(3,3) hermitian
variable l5859(1,1) hermitian
variable l6061(3,3) hermitian
variable l6062(3,3) hermitian
variable l6263(3,3) hermitian
variable l6364(3,3) hermitian
variable l6465(3,3) hermitian
variable l6566(3,3) hermitian
variable l6768(1,1) hermitian
variable l6772(3,3) hermitian
variable l6797(3,3) hermitian
variable l6869(1,1) hermitian
variable l6970(1,1) hermitian
variable l7071(1,1) hermitian
variable l7273(1,1) hermitian
variable l7276(3,3) hermitian
variable l7374(1,1) hermitian
variable l7475(1,1) hermitian
variable l7677(3,3) hermitian
variable l7686(3,3) hermitian
variable l7778(3,3) hermitian
variable l7879(3,3) hermitian
variable l7880(3,3) hermitian
variable l8081(3,3) hermitian
variable l8182(3,3) hermitian
variable l8184(1,1) hermitian
variable l8283(3,3) hermitian
variable l8485(1,1) hermitian
variable l8687(3,3) hermitian
variable l8788(1,1) hermitian
variable l8789(3,3) hermitian
variable l8990(1,1) hermitian
variable l8991(3,3) hermitian
variable l9192(1,1) hermitian
variable l9193(3,3) hermitian
variable l9394(1,1) hermitian
variable l9395(3,3) hermitian
variable l9596(1,1) hermitian
variable l9798(3,3) hermitian
variable l9899(3,3) hermitian
variable l99100(3,3) hermitian
variable l100450(3,3) hermitian
variable l101102(1,1) hermitian
variable l101105(3,3) hermitian
variable l102103(1,1) hermitian
variable l103104(1,1) hermitian
variable l105106(1,1) hermitian
variable l105108(3,3) hermitian
variable l106107(1,1) hermitian
variable l108109(1,1) hermitian
variable l108300(3,3) hermitian
variable l109110(1,1) hermitian
variable l110111(1,1) hermitian
variable l110112(1,1) hermitian
variable l112113(1,1) hermitian
variable l113114(1,1) hermitian
variable l13535(3,3) hermitian
variable l1491(3,3) hermitian
variable l15252(3,3) hermitian
variable l160R67(3,3) hermitian
variable l197101(3,3) hermitian
variable l51151(3,3) hermitian
variable l150150R(3,3) hermitian
variable l99R(1,1) hermitian
variable l2525R(2,2) hermitian
variable l160160R(3,3) hermitian
variable l61S610(3,3) hermitian
variable l150R149(3,3) hermitian
variable l13152(3,3) hermitian
variable l18135(3,3) hermitian
variable l60160(3,3) hermitian
variable l97197(3,3) hermitian
variable l6161S(3,3) hermitian
variable l151300_OPEN(3,3) hermitian
variable l5494_OPEN(1,1) hermitian


minimize(trace(real(Z12*l12)) + trace(real(Z13*l13)) + trace(real(A * Z17*l17 * AH)) + trace(real(Z34*l34)) + trace(real(Z35*l35)) + trace(real(Z56*l56)) + trace(real(A * Z78*l78 * AH)) + trace(real(Z812*l812)) + trace(real(Z89*l89)) + trace(real(A * Z813*l813 * AH)) + trace(real(Z9R14*l9R14)) + trace(real(Z1334*l1334)) + trace(real(A * Z1318*l1318 * AH)) + trace(real(Z1411*l1411)) + trace(real(Z1410*l1410)) + trace(real(Z1516*l1516)) + trace(real(Z1517*l1517)) + trace(real(Z1819*l1819)) + trace(real(A * Z1821*l1821 * AH)) + trace(real(Z1920*l1920)) + trace(real(Z2122*l2122)) + trace(real(A * Z2123*l2123 * AH)) + trace(real(Z2324*l2324)) + trace(real(A * Z2325*l2325 * AH)) + trace(real(Z25R26*l25R26)) + trace(real(A * Z2528*l2528 * AH)) + trace(real(Z2627*l2627)) + trace(real(Z2631*l2631)) + trace(real(Z2733*l2733)) + trace(real(A * Z2829*l2829 * AH)) + trace(real(A * Z2930*l2930 * AH)) + trace(real(A * Z30250*l30250 * AH)) + trace(real(Z3132*l3132)) + trace(real(Z3415*l3415)) + trace(real(Z3536*l3536)) + trace(real(A * Z3540*l3540 * AH)) + trace(real(Z3637*l3637)) + trace(real(Z3638*l3638)) + trace(real(Z3839*l3839)) + trace(real(Z4041*l4041)) + trace(real(A * Z4042*l4042 * AH)) + trace(real(Z4243*l4243)) + trace(real(A * Z4244*l4244 * AH)) + trace(real(Z4445*l4445)) + trace(real(A * Z4447*l4447 * AH)) + trace(real(Z4546*l4546)) + trace(real(A * Z4748*l4748 * AH)) + trace(real(A * Z4749*l4749 * AH)) + trace(real(A * Z4950*l4950 * AH)) + trace(real(A * Z5051*l5051 * AH)) + trace(real(A * Z5253*l5253 * AH)) + trace(real(A * Z5354*l5354 * AH)) + trace(real(A * Z5455*l5455 * AH)) + trace(real(A * Z5457*l5457 * AH)) + trace(real(A * Z5556*l5556 * AH)) + trace(real(Z5758*l5758)) + trace(real(A * Z5760*l5760 * AH)) + trace(real(Z5859*l5859)) + trace(real(A * Z6061*l6061 * AH)) + trace(real(A * Z6062*l6062 * AH)) + trace(real(A * Z6263*l6263 * AH)) + trace(real(A * Z6364*l6364 * AH)) + trace(real(A * Z6465*l6465 * AH)) + trace(real(A * Z6566*l6566 * AH)) + trace(real(Z6768*l6768)) + trace(real(A * Z6772*l6772 * AH)) + trace(real(A * Z6797*l6797 * AH)) + trace(real(Z6869*l6869)) + trace(real(Z6970*l6970)) + trace(real(Z7071*l7071)) + trace(real(Z7273*l7273)) + trace(real(A * Z7276*l7276 * AH)) + trace(real(Z7374*l7374)) + trace(real(Z7475*l7475)) + trace(real(A * Z7677*l7677 * AH)) + trace(real(A * Z7686*l7686 * AH)) + trace(real(A * Z7778*l7778 * AH)) + trace(real(A * Z7879*l7879 * AH)) + trace(real(A * Z7880*l7880 * AH)) + trace(real(A * Z8081*l8081 * AH)) + trace(real(A * Z8182*l8182 * AH)) + trace(real(Z8184*l8184)) + trace(real(A * Z8283*l8283 * AH)) + trace(real(Z8485*l8485)) + trace(real(A * Z8687*l8687 * AH)) + trace(real(Z8788*l8788)) + trace(real(A * Z8789*l8789 * AH)) + trace(real(Z8990*l8990)) + trace(real(A * Z8991*l8991 * AH)) + trace(real(Z9192*l9192)) + trace(real(A * Z9193*l9193 * AH)) + trace(real(Z9394*l9394)) + trace(real(A * Z9395*l9395 * AH)) + trace(real(Z9596*l9596)) + trace(real(A * Z9798*l9798 * AH)) + trace(real(A * Z9899*l9899 * AH)) + trace(real(A * Z99100*l99100 * AH)) + trace(real(A * Z100450*l100450 * AH)) + trace(real(Z101102*l101102)) + trace(real(A * Z101105*l101105 * AH)) + trace(real(Z102103*l102103)) + trace(real(Z103104*l103104)) + trace(real(Z105106*l105106)) + trace(real(A * Z105108*l105108 * AH)) + trace(real(Z106107*l106107)) + trace(real(Z108109*l108109)) + trace(real(A * Z108300*l108300 * AH)) + trace(real(Z109110*l109110)) + trace(real(Z110111*l110111)) + trace(real(Z110112*l110112)) + trace(real(Z112113*l112113)) + trace(real(Z113114*l113114)) + trace(real(A * Z13535*l13535 * AH)) + trace(real(A * Z1491*l1491 * AH)) + trace(real(A * Z15252*l15252 * AH)) + trace(real(A * Z160R67*l160R67 * AH)) + trace(real(A * Z197101*l197101 * AH)) + trace(real(A * Z51151*l51151 * AH)) + trace(real(A * Z150150R*l150150R * AH)) + trace(real(Z99R*l99R)) + trace(real(Z2525R*l2525R)) + trace(real(A * Z160160R*l160160R * AH)) + trace(real(A * Z61S610*l61S610 * AH)) + trace(real(A * Z150R149*l150R149 * AH)) + trace(real(A * Z13152*l13152 * AH)) + trace(real(A * Z18135*l18135 * AH)) + trace(real(A * Z60160*l60160 * AH)) + trace(real(A * Z97197*l97197 * AH)) + trace(real(A * Z6161S*l6161S * AH)) + trace(real(A * Z151300_OPEN*l151300_OPEN * AH)) + trace(real(Z5494_OPEN*l5494_OPEN)) + 0)
subject to


% constraints: 
% (1): voltage lower and upper bounds 
v_lb <= diag(v2) <= v_ub;
v_lb <= diag(v3) <= v_ub;
v_lb <= diag(A * v7 * ctranspose(A)) <= v_ub;
v_lb <= diag(v4) <= v_ub;
v_lb <= diag(v5) <= v_ub;
v_lb <= diag(v6) <= v_ub;
v_lb <= diag(A * v8 * ctranspose(A)) <= v_ub;
v_lb <= diag(v12) <= v_ub;
v_lb <= diag(v9) <= v_ub;
v_lb <= diag(A * v13 * ctranspose(A)) <= v_ub;
v_lb <= diag(v14) <= v_ub;
v_lb <= diag(v34) <= v_ub;
v_lb <= diag(A * v18 * ctranspose(A)) <= v_ub;
v_lb <= diag(v11) <= v_ub;
v_lb <= diag(v10) <= v_ub;
v_lb <= diag(v16) <= v_ub;
v_lb <= diag(v17) <= v_ub;
v_lb <= diag(v19) <= v_ub;
v_lb <= diag(A * v21 * ctranspose(A)) <= v_ub;
v_lb <= diag(v20) <= v_ub;
v_lb <= diag(v22) <= v_ub;
v_lb <= diag(A * v23 * ctranspose(A)) <= v_ub;
v_lb <= diag(v24) <= v_ub;
v_lb <= diag(A * v25 * ctranspose(A)) <= v_ub;
v_lb <= diag(v26) <= v_ub;
v_lb <= diag(A * v28 * ctranspose(A)) <= v_ub;
v_lb <= diag(v27) <= v_ub;
v_lb <= diag(v31) <= v_ub;
v_lb <= diag(v33) <= v_ub;
v_lb <= diag(A * v29 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v30 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v250 * ctranspose(A)) <= v_ub;
v_lb <= diag(v32) <= v_ub;
v_lb <= diag(v15) <= v_ub;
v_lb <= diag(v36) <= v_ub;
v_lb <= diag(A * v40 * ctranspose(A)) <= v_ub;
v_lb <= diag(v37) <= v_ub;
v_lb <= diag(v38) <= v_ub;
v_lb <= diag(v39) <= v_ub;
v_lb <= diag(v41) <= v_ub;
v_lb <= diag(A * v42 * ctranspose(A)) <= v_ub;
v_lb <= diag(v43) <= v_ub;
v_lb <= diag(A * v44 * ctranspose(A)) <= v_ub;
v_lb <= diag(v45) <= v_ub;
v_lb <= diag(A * v47 * ctranspose(A)) <= v_ub;
v_lb <= diag(v46) <= v_ub;
v_lb <= diag(A * v48 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v49 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v50 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v51 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v53 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v54 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v55 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v57 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v56 * ctranspose(A)) <= v_ub;
v_lb <= diag(v58) <= v_ub;
v_lb <= diag(A * v60 * ctranspose(A)) <= v_ub;
v_lb <= diag(v59) <= v_ub;
v_lb <= diag(A * v61 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v62 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v63 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v64 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v65 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v66 * ctranspose(A)) <= v_ub;
v_lb <= diag(v68) <= v_ub;
v_lb <= diag(A * v72 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v97 * ctranspose(A)) <= v_ub;
v_lb <= diag(v69) <= v_ub;
v_lb <= diag(v70) <= v_ub;
v_lb <= diag(v71) <= v_ub;
v_lb <= diag(v73) <= v_ub;
v_lb <= diag(A * v76 * ctranspose(A)) <= v_ub;
v_lb <= diag(v74) <= v_ub;
v_lb <= diag(v75) <= v_ub;
v_lb <= diag(A * v77 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v86 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v78 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v79 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v80 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v81 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v82 * ctranspose(A)) <= v_ub;
v_lb <= diag(v84) <= v_ub;
v_lb <= diag(A * v83 * ctranspose(A)) <= v_ub;
v_lb <= diag(v85) <= v_ub;
v_lb <= diag(A * v87 * ctranspose(A)) <= v_ub;
v_lb <= diag(v88) <= v_ub;
v_lb <= diag(A * v89 * ctranspose(A)) <= v_ub;
v_lb <= diag(v90) <= v_ub;
v_lb <= diag(A * v91 * ctranspose(A)) <= v_ub;
v_lb <= diag(v92) <= v_ub;
v_lb <= diag(A * v93 * ctranspose(A)) <= v_ub;
v_lb <= diag(v94) <= v_ub;
v_lb <= diag(A * v95 * ctranspose(A)) <= v_ub;
v_lb <= diag(v96) <= v_ub;
v_lb <= diag(A * v98 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v99 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v100 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v450 * ctranspose(A)) <= v_ub;
v_lb <= diag(v102) <= v_ub;
v_lb <= diag(A * v105 * ctranspose(A)) <= v_ub;
v_lb <= diag(v103) <= v_ub;
v_lb <= diag(v104) <= v_ub;
v_lb <= diag(v106) <= v_ub;
v_lb <= diag(A * v108 * ctranspose(A)) <= v_ub;
v_lb <= diag(v107) <= v_ub;
v_lb <= diag(v109) <= v_ub;
v_lb <= diag(A * v300 * ctranspose(A)) <= v_ub;
v_lb <= diag(v110) <= v_ub;
v_lb <= diag(v111) <= v_ub;
v_lb <= diag(v112) <= v_ub;
v_lb <= diag(v113) <= v_ub;
v_lb <= diag(v114) <= v_ub;
v_lb <= diag(A * v35 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v1 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v52 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v67 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v101 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v151 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v150R * ctranspose(A)) <= v_ub;
v_lb <= diag(v9R) <= v_ub;
v_lb <= diag(v25R) <= v_ub;
v_lb <= diag(A * v160R * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v610 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v149 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v152 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v135 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v160 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v197 * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v61S * ctranspose(A)) <= v_ub;
v_lb <= diag(A * v300_OPEN * ctranspose(A)) <= v_ub;
v_lb <= diag(v94_OPEN) <= v_ub;
v150 == v0 * ctranspose(v0);

% (1): voltage across a line 
v2 == v1_abc([2],[2]) - S12*ctranspose(Z12) - Z12*ctranspose(S12) + Z12*l12*ctranspose(Z12);
[v1_abc([2],[2]), S12; ctranspose(S12), l12] >= 0;
diag(S12-Z12*l12)- loads([13]) + diag(v2 * Cbus([13],[13])) == 0;

v3 == v1_abc([3],[3]) - S13*ctranspose(Z13) - Z13*ctranspose(S13) + Z13*l13*ctranspose(Z13);
[v1_abc([3],[3]), S13; ctranspose(S13), l13] >= 0;
diag(S13-Z13*l13)- loads([14]) + diag(v3 * Cbus([14],[14])) == diag(S34) + diag(S35) + 0;

v7 == v1 - S17*ctranspose(Z17) - Z17*ctranspose(S17) + Z17*l17*ctranspose(Z17);
[v1, S17; ctranspose(S17), l17] >= 0;
diag(A *(S17-Z17*l17) * AH)- loads([15, 16, 17]) + diag(A * v7 * Cbus([15, 16, 17],[15, 16, 17]) * AH) == diag(A * S78 * AH) + 0;

v4 == v3 - S34*ctranspose(Z34) - Z34*ctranspose(S34) + Z34*l34*ctranspose(Z34);
[v3, S34; ctranspose(S34), l34] >= 0;
diag(S34-Z34*l34)- loads([18]) + diag(v4 * Cbus([18],[18])) == 0;

v5 == v3 - S35*ctranspose(Z35) - Z35*ctranspose(S35) + Z35*l35*ctranspose(Z35);
[v3, S35; ctranspose(S35), l35] >= 0;
diag(S35-Z35*l35)- loads([19]) + diag(v5 * Cbus([19],[19])) == diag(S56) + 0;

v6 == v5 - S56*ctranspose(Z56) - Z56*ctranspose(S56) + Z56*l56*ctranspose(Z56);
[v5, S56; ctranspose(S56), l56] >= 0;
diag(S56-Z56*l56)- loads([20]) + diag(v6 * Cbus([20],[20])) == 0;

v8 == v7 - S78*ctranspose(Z78) - Z78*ctranspose(S78) + Z78*l78*ctranspose(Z78);
[v7, S78; ctranspose(S78), l78] >= 0;
diag(A *(S78-Z78*l78) * AH)- loads([21, 22, 23]) + diag(A * v8 * Cbus([21, 22, 23],[21, 22, 23]) * AH) == [0; diag(S812); 0] + [diag(S89); 0; 0] + diag(A * S813 * AH) + 0;

v12 == v8_abc([2],[2]) - S812*ctranspose(Z812) - Z812*ctranspose(S812) + Z812*l812*ctranspose(Z812);
[v8_abc([2],[2]), S812; ctranspose(S812), l812] >= 0;
diag(S812-Z812*l812)- loads([24]) + diag(v12 * Cbus([24],[24])) == 0;

v9 == v8_abc([1],[1]) - S89*ctranspose(Z89) - Z89*ctranspose(S89) + Z89*l89*ctranspose(Z89);
[v8_abc([1],[1]), S89; ctranspose(S89), l89] >= 0;
diag(S89-Z89*l89)- loads([25]) + diag(v9 * Cbus([25],[25])) == diag(S99R) + 0;

v13 == v8 - S813*ctranspose(Z813) - Z813*ctranspose(S813) + Z813*l813*ctranspose(Z813);
[v8, S813; ctranspose(S813), l813] >= 0;
diag(A *(S813-Z813*l813) * AH)- loads([26, 27, 28]) + diag(A * v13 * Cbus([26, 27, 28],[26, 27, 28]) * AH) == [0; 0; diag(S1334)] + diag(A * S1318 * AH) + diag(A * S13152 * AH) + 0;

v14 == v9R - S9R14*ctranspose(Z9R14) - Z9R14*ctranspose(S9R14) + Z9R14*l9R14*ctranspose(Z9R14);
[v9R, S9R14; ctranspose(S9R14), l9R14] >= 0;
diag(S9R14-Z9R14*l9R14)- loads([30]) + diag(v14 * Cbus([30],[30])) == diag(S1411) + diag(S1410) + 0;

v34 == v13_abc([3],[3]) - S1334*ctranspose(Z1334) - Z1334*ctranspose(S1334) + Z1334*l1334*ctranspose(Z1334);
[v13_abc([3],[3]), S1334; ctranspose(S1334), l1334] >= 0;
diag(S1334-Z1334*l1334)- loads([31]) + diag(v34 * Cbus([31],[31])) == diag(S3415) + 0;

v18 == v13 - S1318*ctranspose(Z1318) - Z1318*ctranspose(S1318) + Z1318*l1318*ctranspose(Z1318);
[v13, S1318; ctranspose(S1318), l1318] >= 0;
diag(A *(S1318-Z1318*l1318) * AH)- loads([32, 33, 34]) + diag(A * v18 * Cbus([32, 33, 34],[32, 33, 34]) * AH) == [diag(S1819); 0; 0] + diag(A * S1821 * AH) + diag(A * S18135 * AH) + 0;

v11 == v14 - S1411*ctranspose(Z1411) - Z1411*ctranspose(S1411) + Z1411*l1411*ctranspose(Z1411);
[v14, S1411; ctranspose(S1411), l1411] >= 0;
diag(S1411-Z1411*l1411)- loads([35]) + diag(v11 * Cbus([35],[35])) == 0;

v10 == v14 - S1410*ctranspose(Z1410) - Z1410*ctranspose(S1410) + Z1410*l1410*ctranspose(Z1410);
[v14, S1410; ctranspose(S1410), l1410] >= 0;
diag(S1410-Z1410*l1410)- loads([36]) + diag(v10 * Cbus([36],[36])) == 0;

v16 == v15 - S1516*ctranspose(Z1516) - Z1516*ctranspose(S1516) + Z1516*l1516*ctranspose(Z1516);
[v15, S1516; ctranspose(S1516), l1516] >= 0;
diag(S1516-Z1516*l1516)- loads([38]) + diag(v16 * Cbus([38],[38])) == 0;

v17 == v15 - S1517*ctranspose(Z1517) - Z1517*ctranspose(S1517) + Z1517*l1517*ctranspose(Z1517);
[v15, S1517; ctranspose(S1517), l1517] >= 0;
diag(S1517-Z1517*l1517)- loads([39]) + diag(v17 * Cbus([39],[39])) == 0;

v19 == v18_abc([1],[1]) - S1819*ctranspose(Z1819) - Z1819*ctranspose(S1819) + Z1819*l1819*ctranspose(Z1819);
[v18_abc([1],[1]), S1819; ctranspose(S1819), l1819] >= 0;
diag(S1819-Z1819*l1819)- loads([40]) + diag(v19 * Cbus([40],[40])) == diag(S1920) + 0;

v21 == v18 - S1821*ctranspose(Z1821) - Z1821*ctranspose(S1821) + Z1821*l1821*ctranspose(Z1821);
[v18, S1821; ctranspose(S1821), l1821] >= 0;
diag(A *(S1821-Z1821*l1821) * AH)- loads([41, 42, 43]) + diag(A * v21 * Cbus([41, 42, 43],[41, 42, 43]) * AH) == [0; diag(S2122); 0] + diag(A * S2123 * AH) + 0;

v20 == v19 - S1920*ctranspose(Z1920) - Z1920*ctranspose(S1920) + Z1920*l1920*ctranspose(Z1920);
[v19, S1920; ctranspose(S1920), l1920] >= 0;
diag(S1920-Z1920*l1920)- loads([44]) + diag(v20 * Cbus([44],[44])) == 0;

v22 == v21_abc([2],[2]) - S2122*ctranspose(Z2122) - Z2122*ctranspose(S2122) + Z2122*l2122*ctranspose(Z2122);
[v21_abc([2],[2]), S2122; ctranspose(S2122), l2122] >= 0;
diag(S2122-Z2122*l2122)- loads([45]) + diag(v22 * Cbus([45],[45])) == 0;

v23 == v21 - S2123*ctranspose(Z2123) - Z2123*ctranspose(S2123) + Z2123*l2123*ctranspose(Z2123);
[v21, S2123; ctranspose(S2123), l2123] >= 0;
diag(A *(S2123-Z2123*l2123) * AH)- loads([46, 47, 48]) + diag(A * v23 * Cbus([46, 47, 48],[46, 47, 48]) * AH) == [0; 0; diag(S2324)] + diag(A * S2325 * AH) + 0;

v24 == v23_abc([3],[3]) - S2324*ctranspose(Z2324) - Z2324*ctranspose(S2324) + Z2324*l2324*ctranspose(Z2324);
[v23_abc([3],[3]), S2324; ctranspose(S2324), l2324] >= 0;
diag(S2324-Z2324*l2324)- loads([49]) + diag(v24 * Cbus([49],[49])) == 0;

v25 == v23 - S2325*ctranspose(Z2325) - Z2325*ctranspose(S2325) + Z2325*l2325*ctranspose(Z2325);
[v23, S2325; ctranspose(S2325), l2325] >= 0;
diag(A *(S2325-Z2325*l2325) * AH)- loads([50, 51, 52]) + diag(A * v25 * Cbus([50, 51, 52],[50, 51, 52]) * AH) == diag(A * S2528 * AH) + [S2525R(1,1); 0; S2525R(2,2) ] + 0;

v26 == v25R - S25R26*ctranspose(Z25R26) - Z25R26*ctranspose(S25R26) + Z25R26*l25R26*ctranspose(Z25R26);
[v25R, S25R26; ctranspose(S25R26), l25R26] >= 0;
diag(S25R26-Z25R26*l25R26)- loads([55, 56]) + diag(v26 * Cbus([55, 56],[55, 56])) == diag(S2627) + [0; diag(S2631)] + 0;

v28 == v25 - S2528*ctranspose(Z2528) - Z2528*ctranspose(S2528) + Z2528*l2528*ctranspose(Z2528);
[v25, S2528; ctranspose(S2528), l2528] >= 0;
diag(A *(S2528-Z2528*l2528) * AH)- loads([57, 58, 59]) + diag(A * v28 * Cbus([57, 58, 59],[57, 58, 59]) * AH) == diag(A * S2829 * AH) + 0;

v27 == v26 - S2627*ctranspose(Z2627) - Z2627*ctranspose(S2627) + Z2627*l2627*ctranspose(Z2627);
[v26, S2627; ctranspose(S2627), l2627] >= 0;
diag(S2627-Z2627*l2627)- loads([60, 61]) + diag(v27 * Cbus([60, 61],[60, 61])) == [diag(S2733); 0] + 0;

v31 == v26([2],[2]) - S2631*ctranspose(Z2631) - Z2631*ctranspose(S2631) + Z2631*l2631*ctranspose(Z2631);
[v26([2],[2]), S2631; ctranspose(S2631), l2631] >= 0;
diag(S2631-Z2631*l2631)- loads([62]) + diag(v31 * Cbus([62],[62])) == diag(S3132) + 0;

v33 == v27([1],[1]) - S2733*ctranspose(Z2733) - Z2733*ctranspose(S2733) + Z2733*l2733*ctranspose(Z2733);
[v27([1],[1]), S2733; ctranspose(S2733), l2733] >= 0;
diag(S2733-Z2733*l2733)- loads([63]) + diag(v33 * Cbus([63],[63])) == 0;

v29 == v28 - S2829*ctranspose(Z2829) - Z2829*ctranspose(S2829) + Z2829*l2829*ctranspose(Z2829);
[v28, S2829; ctranspose(S2829), l2829] >= 0;
diag(A *(S2829-Z2829*l2829) * AH)- loads([64, 65, 66]) + diag(A * v29 * Cbus([64, 65, 66],[64, 65, 66]) * AH) == diag(A * S2930 * AH) + 0;

v30 == v29 - S2930*ctranspose(Z2930) - Z2930*ctranspose(S2930) + Z2930*l2930*ctranspose(Z2930);
[v29, S2930; ctranspose(S2930), l2930] >= 0;
diag(A *(S2930-Z2930*l2930) * AH)- loads([67, 68, 69]) + diag(A * v30 * Cbus([67, 68, 69],[67, 68, 69]) * AH) == diag(A * S30250 * AH) + 0;

v250 == v30 - S30250*ctranspose(Z30250) - Z30250*ctranspose(S30250) + Z30250*l30250*ctranspose(Z30250);
[v30, S30250; ctranspose(S30250), l30250] >= 0;
diag(A *(S30250-Z30250*l30250) * AH)- loads([70, 71, 72]) + diag(A * v250 * Cbus([70, 71, 72],[70, 71, 72]) * AH) == 0;

v32 == v31 - S3132*ctranspose(Z3132) - Z3132*ctranspose(S3132) + Z3132*l3132*ctranspose(Z3132);
[v31, S3132; ctranspose(S3132), l3132] >= 0;
diag(S3132-Z3132*l3132)- loads([73]) + diag(v32 * Cbus([73],[73])) == 0;

v15 == v34 - S3415*ctranspose(Z3415) - Z3415*ctranspose(S3415) + Z3415*l3415*ctranspose(Z3415);
[v34, S3415; ctranspose(S3415), l3415] >= 0;
diag(S3415-Z3415*l3415)- loads([37]) + diag(v15 * Cbus([37],[37])) == diag(S1516) + diag(S1517) + 0;

v36 == v35_abc([1, 2],[1, 2]) - S3536*ctranspose(Z3536) - Z3536*ctranspose(S3536) + Z3536*l3536*ctranspose(Z3536);
[v35_abc([1, 2],[1, 2]), S3536; ctranspose(S3536), l3536] >= 0;
diag(S3536-Z3536*l3536)- loads([76, 77]) + diag(v36 * Cbus([76, 77],[76, 77])) == [diag(S3637); 0] + [0; diag(S3638)] + 0;

v40 == v35 - S3540*ctranspose(Z3540) - Z3540*ctranspose(S3540) + Z3540*l3540*ctranspose(Z3540);
[v35, S3540; ctranspose(S3540), l3540] >= 0;
diag(A *(S3540-Z3540*l3540) * AH)- loads([79, 80, 81]) + diag(A * v40 * Cbus([79, 80, 81],[79, 80, 81]) * AH) == [0; 0; diag(S4041)] + diag(A * S4042 * AH) + 0;

v37 == v36([1],[1]) - S3637*ctranspose(Z3637) - Z3637*ctranspose(S3637) + Z3637*l3637*ctranspose(Z3637);
[v36([1],[1]), S3637; ctranspose(S3637), l3637] >= 0;
diag(S3637-Z3637*l3637)- loads([82]) + diag(v37 * Cbus([82],[82])) == 0;

v38 == v36([2],[2]) - S3638*ctranspose(Z3638) - Z3638*ctranspose(S3638) + Z3638*l3638*ctranspose(Z3638);
[v36([2],[2]), S3638; ctranspose(S3638), l3638] >= 0;
diag(S3638-Z3638*l3638)- loads([83]) + diag(v38 * Cbus([83],[83])) == diag(S3839) + 0;

v39 == v38 - S3839*ctranspose(Z3839) - Z3839*ctranspose(S3839) + Z3839*l3839*ctranspose(Z3839);
[v38, S3839; ctranspose(S3839), l3839] >= 0;
diag(S3839-Z3839*l3839)- loads([84]) + diag(v39 * Cbus([84],[84])) == 0;

v41 == v40_abc([3],[3]) - S4041*ctranspose(Z4041) - Z4041*ctranspose(S4041) + Z4041*l4041*ctranspose(Z4041);
[v40_abc([3],[3]), S4041; ctranspose(S4041), l4041] >= 0;
diag(S4041-Z4041*l4041)- loads([85]) + diag(v41 * Cbus([85],[85])) == 0;

v42 == v40 - S4042*ctranspose(Z4042) - Z4042*ctranspose(S4042) + Z4042*l4042*ctranspose(Z4042);
[v40, S4042; ctranspose(S4042), l4042] >= 0;
diag(A *(S4042-Z4042*l4042) * AH)- loads([86, 87, 88]) + diag(A * v42 * Cbus([86, 87, 88],[86, 87, 88]) * AH) == [0; diag(S4243); 0] + diag(A * S4244 * AH) + 0;

v43 == v42_abc([2],[2]) - S4243*ctranspose(Z4243) - Z4243*ctranspose(S4243) + Z4243*l4243*ctranspose(Z4243);
[v42_abc([2],[2]), S4243; ctranspose(S4243), l4243] >= 0;
diag(S4243-Z4243*l4243)- loads([89]) + diag(v43 * Cbus([89],[89])) == 0;

v44 == v42 - S4244*ctranspose(Z4244) - Z4244*ctranspose(S4244) + Z4244*l4244*ctranspose(Z4244);
[v42, S4244; ctranspose(S4244), l4244] >= 0;
diag(A *(S4244-Z4244*l4244) * AH)- loads([90, 91, 92]) + diag(A * v44 * Cbus([90, 91, 92],[90, 91, 92]) * AH) == [diag(S4445); 0; 0] + diag(A * S4447 * AH) + 0;

v45 == v44_abc([1],[1]) - S4445*ctranspose(Z4445) - Z4445*ctranspose(S4445) + Z4445*l4445*ctranspose(Z4445);
[v44_abc([1],[1]), S4445; ctranspose(S4445), l4445] >= 0;
diag(S4445-Z4445*l4445)- loads([93]) + diag(v45 * Cbus([93],[93])) == diag(S4546) + 0;

v47 == v44 - S4447*ctranspose(Z4447) - Z4447*ctranspose(S4447) + Z4447*l4447*ctranspose(Z4447);
[v44, S4447; ctranspose(S4447), l4447] >= 0;
diag(A *(S4447-Z4447*l4447) * AH)- loads([94, 95, 96]) + diag(A * v47 * Cbus([94, 95, 96],[94, 95, 96]) * AH) == diag(A * S4748 * AH) + diag(A * S4749 * AH) + 0;

v46 == v45 - S4546*ctranspose(Z4546) - Z4546*ctranspose(S4546) + Z4546*l4546*ctranspose(Z4546);
[v45, S4546; ctranspose(S4546), l4546] >= 0;
diag(S4546-Z4546*l4546)- loads([97]) + diag(v46 * Cbus([97],[97])) == 0;

v48 == v47 - S4748*ctranspose(Z4748) - Z4748*ctranspose(S4748) + Z4748*l4748*ctranspose(Z4748);
[v47, S4748; ctranspose(S4748), l4748] >= 0;
diag(A *(S4748-Z4748*l4748) * AH)- loads([98, 99, 100]) + diag(A * v48 * Cbus([98, 99, 100],[98, 99, 100]) * AH) == 0;

v49 == v47 - S4749*ctranspose(Z4749) - Z4749*ctranspose(S4749) + Z4749*l4749*ctranspose(Z4749);
[v47, S4749; ctranspose(S4749), l4749] >= 0;
diag(A *(S4749-Z4749*l4749) * AH)- loads([101, 102, 103]) + diag(A * v49 * Cbus([101, 102, 103],[101, 102, 103]) * AH) == diag(A * S4950 * AH) + 0;

v50 == v49 - S4950*ctranspose(Z4950) - Z4950*ctranspose(S4950) + Z4950*l4950*ctranspose(Z4950);
[v49, S4950; ctranspose(S4950), l4950] >= 0;
diag(A *(S4950-Z4950*l4950) * AH)- loads([104, 105, 106]) + diag(A * v50 * Cbus([104, 105, 106],[104, 105, 106]) * AH) == diag(A * S5051 * AH) + 0;

v51 == v50 - S5051*ctranspose(Z5051) - Z5051*ctranspose(S5051) + Z5051*l5051*ctranspose(Z5051);
[v50, S5051; ctranspose(S5051), l5051] >= 0;
diag(A *(S5051-Z5051*l5051) * AH)- loads([107, 108, 109]) + diag(A * v51 * Cbus([107, 108, 109],[107, 108, 109]) * AH) == diag(A * S51151 * AH) + 0;

v53 == v52 - S5253*ctranspose(Z5253) - Z5253*ctranspose(S5253) + Z5253*l5253*ctranspose(Z5253);
[v52, S5253; ctranspose(S5253), l5253] >= 0;
diag(A *(S5253-Z5253*l5253) * AH)- loads([116, 117, 118]) + diag(A * v53 * Cbus([116, 117, 118],[116, 117, 118]) * AH) == diag(A * S5354 * AH) + 0;

v54 == v53 - S5354*ctranspose(Z5354) - Z5354*ctranspose(S5354) + Z5354*l5354*ctranspose(Z5354);
[v53, S5354; ctranspose(S5354), l5354] >= 0;
diag(A *(S5354-Z5354*l5354) * AH)- loads([119, 120, 121]) + diag(A * v54 * Cbus([119, 120, 121],[119, 120, 121]) * AH) == diag(A * S5455 * AH) + diag(A * S5457 * AH) + [diag(S5494_OPEN); 0; 0] + 0;

v55 == v54 - S5455*ctranspose(Z5455) - Z5455*ctranspose(S5455) + Z5455*l5455*ctranspose(Z5455);
[v54, S5455; ctranspose(S5455), l5455] >= 0;
diag(A *(S5455-Z5455*l5455) * AH)- loads([122, 123, 124]) + diag(A * v55 * Cbus([122, 123, 124],[122, 123, 124]) * AH) == diag(A * S5556 * AH) + 0;

v57 == v54 - S5457*ctranspose(Z5457) - Z5457*ctranspose(S5457) + Z5457*l5457*ctranspose(Z5457);
[v54, S5457; ctranspose(S5457), l5457] >= 0;
diag(A *(S5457-Z5457*l5457) * AH)- loads([125, 126, 127]) + diag(A * v57 * Cbus([125, 126, 127],[125, 126, 127]) * AH) == [0; diag(S5758); 0] + diag(A * S5760 * AH) + 0;

v56 == v55 - S5556*ctranspose(Z5556) - Z5556*ctranspose(S5556) + Z5556*l5556*ctranspose(Z5556);
[v55, S5556; ctranspose(S5556), l5556] >= 0;
diag(A *(S5556-Z5556*l5556) * AH)- loads([128, 129, 130]) + diag(A * v56 * Cbus([128, 129, 130],[128, 129, 130]) * AH) == 0;

v58 == v57_abc([2],[2]) - S5758*ctranspose(Z5758) - Z5758*ctranspose(S5758) + Z5758*l5758*ctranspose(Z5758);
[v57_abc([2],[2]), S5758; ctranspose(S5758), l5758] >= 0;
diag(S5758-Z5758*l5758)- loads([131]) + diag(v58 * Cbus([131],[131])) == diag(S5859) + 0;

v60 == v57 - S5760*ctranspose(Z5760) - Z5760*ctranspose(S5760) + Z5760*l5760*ctranspose(Z5760);
[v57, S5760; ctranspose(S5760), l5760] >= 0;
diag(A *(S5760-Z5760*l5760) * AH)- loads([132, 133, 134]) + diag(A * v60 * Cbus([132, 133, 134],[132, 133, 134]) * AH) == diag(A * S6061 * AH) + diag(A * S6062 * AH) + diag(A * S60160 * AH) + 0;

v59 == v58 - S5859*ctranspose(Z5859) - Z5859*ctranspose(S5859) + Z5859*l5859*ctranspose(Z5859);
[v58, S5859; ctranspose(S5859), l5859] >= 0;
diag(S5859-Z5859*l5859)- loads([135]) + diag(v59 * Cbus([135],[135])) == 0;

v61 == v60 - S6061*ctranspose(Z6061) - Z6061*ctranspose(S6061) + Z6061*l6061*ctranspose(Z6061);
[v60, S6061; ctranspose(S6061), l6061] >= 0;
diag(A *(S6061-Z6061*l6061) * AH)- loads([136, 137, 138]) + diag(A * v61 * Cbus([136, 137, 138],[136, 137, 138]) * AH) == diag(A * S6161S * AH) + 0;

v62 == v60 - S6062*ctranspose(Z6062) - Z6062*ctranspose(S6062) + Z6062*l6062*ctranspose(Z6062);
[v60, S6062; ctranspose(S6062), l6062] >= 0;
diag(A *(S6062-Z6062*l6062) * AH)- loads([139, 140, 141]) + diag(A * v62 * Cbus([139, 140, 141],[139, 140, 141]) * AH) == diag(A * S6263 * AH) + 0;

v63 == v62 - S6263*ctranspose(Z6263) - Z6263*ctranspose(S6263) + Z6263*l6263*ctranspose(Z6263);
[v62, S6263; ctranspose(S6263), l6263] >= 0;
diag(A *(S6263-Z6263*l6263) * AH)- loads([142, 143, 144]) + diag(A * v63 * Cbus([142, 143, 144],[142, 143, 144]) * AH) == diag(A * S6364 * AH) + 0;

v64 == v63 - S6364*ctranspose(Z6364) - Z6364*ctranspose(S6364) + Z6364*l6364*ctranspose(Z6364);
[v63, S6364; ctranspose(S6364), l6364] >= 0;
diag(A *(S6364-Z6364*l6364) * AH)- loads([145, 146, 147]) + diag(A * v64 * Cbus([145, 146, 147],[145, 146, 147]) * AH) == diag(A * S6465 * AH) + 0;

v65 == v64 - S6465*ctranspose(Z6465) - Z6465*ctranspose(S6465) + Z6465*l6465*ctranspose(Z6465);
[v64, S6465; ctranspose(S6465), l6465] >= 0;
diag(A *(S6465-Z6465*l6465) * AH)- loads([148, 149, 150]) + diag(A * v65 * Cbus([148, 149, 150],[148, 149, 150]) * AH) == diag(A * S6566 * AH) + 0;

v66 == v65 - S6566*ctranspose(Z6566) - Z6566*ctranspose(S6566) + Z6566*l6566*ctranspose(Z6566);
[v65, S6566; ctranspose(S6566), l6566] >= 0;
diag(A *(S6566-Z6566*l6566) * AH)- loads([151, 152, 153]) + diag(A * v66 * Cbus([151, 152, 153],[151, 152, 153]) * AH) == 0;

v68 == v67_abc([1],[1]) - S6768*ctranspose(Z6768) - Z6768*ctranspose(S6768) + Z6768*l6768*ctranspose(Z6768);
[v67_abc([1],[1]), S6768; ctranspose(S6768), l6768] >= 0;
diag(S6768-Z6768*l6768)- loads([155]) + diag(v68 * Cbus([155],[155])) == diag(S6869) + 0;

v72 == v67 - S6772*ctranspose(Z6772) - Z6772*ctranspose(S6772) + Z6772*l6772*ctranspose(Z6772);
[v67, S6772; ctranspose(S6772), l6772] >= 0;
diag(A *(S6772-Z6772*l6772) * AH)- loads([158, 159, 160]) + diag(A * v72 * Cbus([158, 159, 160],[158, 159, 160]) * AH) == [0; 0; diag(S7273)] + diag(A * S7276 * AH) + 0;

v97 == v67 - S6797*ctranspose(Z6797) - Z6797*ctranspose(S6797) + Z6797*l6797*ctranspose(Z6797);
[v67, S6797; ctranspose(S6797), l6797] >= 0;
diag(A *(S6797-Z6797*l6797) * AH)- loads([161, 162, 163]) + diag(A * v97 * Cbus([161, 162, 163],[161, 162, 163]) * AH) == diag(A * S9798 * AH) + diag(A * S97197 * AH) + 0;

v69 == v68 - S6869*ctranspose(Z6869) - Z6869*ctranspose(S6869) + Z6869*l6869*ctranspose(Z6869);
[v68, S6869; ctranspose(S6869), l6869] >= 0;
diag(S6869-Z6869*l6869)- loads([164]) + diag(v69 * Cbus([164],[164])) == diag(S6970) + 0;

v70 == v69 - S6970*ctranspose(Z6970) - Z6970*ctranspose(S6970) + Z6970*l6970*ctranspose(Z6970);
[v69, S6970; ctranspose(S6970), l6970] >= 0;
diag(S6970-Z6970*l6970)- loads([165]) + diag(v70 * Cbus([165],[165])) == diag(S7071) + 0;

v71 == v70 - S7071*ctranspose(Z7071) - Z7071*ctranspose(S7071) + Z7071*l7071*ctranspose(Z7071);
[v70, S7071; ctranspose(S7071), l7071] >= 0;
diag(S7071-Z7071*l7071)- loads([166]) + diag(v71 * Cbus([166],[166])) == 0;

v73 == v72_abc([3],[3]) - S7273*ctranspose(Z7273) - Z7273*ctranspose(S7273) + Z7273*l7273*ctranspose(Z7273);
[v72_abc([3],[3]), S7273; ctranspose(S7273), l7273] >= 0;
diag(S7273-Z7273*l7273)- loads([167]) + diag(v73 * Cbus([167],[167])) == diag(S7374) + 0;

v76 == v72 - S7276*ctranspose(Z7276) - Z7276*ctranspose(S7276) + Z7276*l7276*ctranspose(Z7276);
[v72, S7276; ctranspose(S7276), l7276] >= 0;
diag(A *(S7276-Z7276*l7276) * AH)- loads([168, 169, 170]) + diag(A * v76 * Cbus([168, 169, 170],[168, 169, 170]) * AH) == diag(A * S7677 * AH) + diag(A * S7686 * AH) + 0;

v74 == v73 - S7374*ctranspose(Z7374) - Z7374*ctranspose(S7374) + Z7374*l7374*ctranspose(Z7374);
[v73, S7374; ctranspose(S7374), l7374] >= 0;
diag(S7374-Z7374*l7374)- loads([171]) + diag(v74 * Cbus([171],[171])) == diag(S7475) + 0;

v75 == v74 - S7475*ctranspose(Z7475) - Z7475*ctranspose(S7475) + Z7475*l7475*ctranspose(Z7475);
[v74, S7475; ctranspose(S7475), l7475] >= 0;
diag(S7475-Z7475*l7475)- loads([172]) + diag(v75 * Cbus([172],[172])) == 0;

v77 == v76 - S7677*ctranspose(Z7677) - Z7677*ctranspose(S7677) + Z7677*l7677*ctranspose(Z7677);
[v76, S7677; ctranspose(S7677), l7677] >= 0;
diag(A *(S7677-Z7677*l7677) * AH)- loads([173, 174, 175]) + diag(A * v77 * Cbus([173, 174, 175],[173, 174, 175]) * AH) == diag(A * S7778 * AH) + 0;

v86 == v76 - S7686*ctranspose(Z7686) - Z7686*ctranspose(S7686) + Z7686*l7686*ctranspose(Z7686);
[v76, S7686; ctranspose(S7686), l7686] >= 0;
diag(A *(S7686-Z7686*l7686) * AH)- loads([176, 177, 178]) + diag(A * v86 * Cbus([176, 177, 178],[176, 177, 178]) * AH) == diag(A * S8687 * AH) + 0;

v78 == v77 - S7778*ctranspose(Z7778) - Z7778*ctranspose(S7778) + Z7778*l7778*ctranspose(Z7778);
[v77, S7778; ctranspose(S7778), l7778] >= 0;
diag(A *(S7778-Z7778*l7778) * AH)- loads([179, 180, 181]) + diag(A * v78 * Cbus([179, 180, 181],[179, 180, 181]) * AH) == diag(A * S7879 * AH) + diag(A * S7880 * AH) + 0;

v79 == v78 - S7879*ctranspose(Z7879) - Z7879*ctranspose(S7879) + Z7879*l7879*ctranspose(Z7879);
[v78, S7879; ctranspose(S7879), l7879] >= 0;
diag(A *(S7879-Z7879*l7879) * AH)- loads([182, 183, 184]) + diag(A * v79 * Cbus([182, 183, 184],[182, 183, 184]) * AH) == 0;

v80 == v78 - S7880*ctranspose(Z7880) - Z7880*ctranspose(S7880) + Z7880*l7880*ctranspose(Z7880);
[v78, S7880; ctranspose(S7880), l7880] >= 0;
diag(A *(S7880-Z7880*l7880) * AH)- loads([185, 186, 187]) + diag(A * v80 * Cbus([185, 186, 187],[185, 186, 187]) * AH) == diag(A * S8081 * AH) + 0;

v81 == v80 - S8081*ctranspose(Z8081) - Z8081*ctranspose(S8081) + Z8081*l8081*ctranspose(Z8081);
[v80, S8081; ctranspose(S8081), l8081] >= 0;
diag(A *(S8081-Z8081*l8081) * AH)- loads([188, 189, 190]) + diag(A * v81 * Cbus([188, 189, 190],[188, 189, 190]) * AH) == diag(A * S8182 * AH) + [0; 0; diag(S8184)] + 0;

v82 == v81 - S8182*ctranspose(Z8182) - Z8182*ctranspose(S8182) + Z8182*l8182*ctranspose(Z8182);
[v81, S8182; ctranspose(S8182), l8182] >= 0;
diag(A *(S8182-Z8182*l8182) * AH)- loads([191, 192, 193]) + diag(A * v82 * Cbus([191, 192, 193],[191, 192, 193]) * AH) == diag(A * S8283 * AH) + 0;

v84 == v81_abc([3],[3]) - S8184*ctranspose(Z8184) - Z8184*ctranspose(S8184) + Z8184*l8184*ctranspose(Z8184);
[v81_abc([3],[3]), S8184; ctranspose(S8184), l8184] >= 0;
diag(S8184-Z8184*l8184)- loads([194]) + diag(v84 * Cbus([194],[194])) == diag(S8485) + 0;

v83 == v82 - S8283*ctranspose(Z8283) - Z8283*ctranspose(S8283) + Z8283*l8283*ctranspose(Z8283);
[v82, S8283; ctranspose(S8283), l8283] >= 0;
diag(A *(S8283-Z8283*l8283) * AH)- loads([195, 196, 197]) + diag(A * v83 * Cbus([195, 196, 197],[195, 196, 197]) * AH) == 0;

v85 == v84 - S8485*ctranspose(Z8485) - Z8485*ctranspose(S8485) + Z8485*l8485*ctranspose(Z8485);
[v84, S8485; ctranspose(S8485), l8485] >= 0;
diag(S8485-Z8485*l8485)- loads([198]) + diag(v85 * Cbus([198],[198])) == 0;

v87 == v86 - S8687*ctranspose(Z8687) - Z8687*ctranspose(S8687) + Z8687*l8687*ctranspose(Z8687);
[v86, S8687; ctranspose(S8687), l8687] >= 0;
diag(A *(S8687-Z8687*l8687) * AH)- loads([199, 200, 201]) + diag(A * v87 * Cbus([199, 200, 201],[199, 200, 201]) * AH) == [diag(S8788); 0; 0] + diag(A * S8789 * AH) + 0;

v88 == v87_abc([1],[1]) - S8788*ctranspose(Z8788) - Z8788*ctranspose(S8788) + Z8788*l8788*ctranspose(Z8788);
[v87_abc([1],[1]), S8788; ctranspose(S8788), l8788] >= 0;
diag(S8788-Z8788*l8788)- loads([202]) + diag(v88 * Cbus([202],[202])) == 0;

v89 == v87 - S8789*ctranspose(Z8789) - Z8789*ctranspose(S8789) + Z8789*l8789*ctranspose(Z8789);
[v87, S8789; ctranspose(S8789), l8789] >= 0;
diag(A *(S8789-Z8789*l8789) * AH)- loads([203, 204, 205]) + diag(A * v89 * Cbus([203, 204, 205],[203, 204, 205]) * AH) == [0; diag(S8990); 0] + diag(A * S8991 * AH) + 0;

v90 == v89_abc([2],[2]) - S8990*ctranspose(Z8990) - Z8990*ctranspose(S8990) + Z8990*l8990*ctranspose(Z8990);
[v89_abc([2],[2]), S8990; ctranspose(S8990), l8990] >= 0;
diag(S8990-Z8990*l8990)- loads([206]) + diag(v90 * Cbus([206],[206])) == 0;

v91 == v89 - S8991*ctranspose(Z8991) - Z8991*ctranspose(S8991) + Z8991*l8991*ctranspose(Z8991);
[v89, S8991; ctranspose(S8991), l8991] >= 0;
diag(A *(S8991-Z8991*l8991) * AH)- loads([207, 208, 209]) + diag(A * v91 * Cbus([207, 208, 209],[207, 208, 209]) * AH) == [0; 0; diag(S9192)] + diag(A * S9193 * AH) + 0;

v92 == v91_abc([3],[3]) - S9192*ctranspose(Z9192) - Z9192*ctranspose(S9192) + Z9192*l9192*ctranspose(Z9192);
[v91_abc([3],[3]), S9192; ctranspose(S9192), l9192] >= 0;
diag(S9192-Z9192*l9192)- loads([210]) + diag(v92 * Cbus([210],[210])) == 0;

v93 == v91 - S9193*ctranspose(Z9193) - Z9193*ctranspose(S9193) + Z9193*l9193*ctranspose(Z9193);
[v91, S9193; ctranspose(S9193), l9193] >= 0;
diag(A *(S9193-Z9193*l9193) * AH)- loads([211, 212, 213]) + diag(A * v93 * Cbus([211, 212, 213],[211, 212, 213]) * AH) == [diag(S9394); 0; 0] + diag(A * S9395 * AH) + 0;

v94 == v93_abc([1],[1]) - S9394*ctranspose(Z9394) - Z9394*ctranspose(S9394) + Z9394*l9394*ctranspose(Z9394);
[v93_abc([1],[1]), S9394; ctranspose(S9394), l9394] >= 0;
diag(S9394-Z9394*l9394)- loads([214]) + diag(v94 * Cbus([214],[214])) == 0;

v95 == v93 - S9395*ctranspose(Z9395) - Z9395*ctranspose(S9395) + Z9395*l9395*ctranspose(Z9395);
[v93, S9395; ctranspose(S9395), l9395] >= 0;
diag(A *(S9395-Z9395*l9395) * AH)- loads([215, 216, 217]) + diag(A * v95 * Cbus([215, 216, 217],[215, 216, 217]) * AH) == [0; diag(S9596); 0] + 0;

v96 == v95_abc([2],[2]) - S9596*ctranspose(Z9596) - Z9596*ctranspose(S9596) + Z9596*l9596*ctranspose(Z9596);
[v95_abc([2],[2]), S9596; ctranspose(S9596), l9596] >= 0;
diag(S9596-Z9596*l9596)- loads([218]) + diag(v96 * Cbus([218],[218])) == 0;

v98 == v97 - S9798*ctranspose(Z9798) - Z9798*ctranspose(S9798) + Z9798*l9798*ctranspose(Z9798);
[v97, S9798; ctranspose(S9798), l9798] >= 0;
diag(A *(S9798-Z9798*l9798) * AH)- loads([219, 220, 221]) + diag(A * v98 * Cbus([219, 220, 221],[219, 220, 221]) * AH) == diag(A * S9899 * AH) + 0;

v99 == v98 - S9899*ctranspose(Z9899) - Z9899*ctranspose(S9899) + Z9899*l9899*ctranspose(Z9899);
[v98, S9899; ctranspose(S9899), l9899] >= 0;
diag(A *(S9899-Z9899*l9899) * AH)- loads([222, 223, 224]) + diag(A * v99 * Cbus([222, 223, 224],[222, 223, 224]) * AH) == diag(A * S99100 * AH) + 0;

v100 == v99 - S99100*ctranspose(Z99100) - Z99100*ctranspose(S99100) + Z99100*l99100*ctranspose(Z99100);
[v99, S99100; ctranspose(S99100), l99100] >= 0;
diag(A *(S99100-Z99100*l99100) * AH)- loads([225, 226, 227]) + diag(A * v100 * Cbus([225, 226, 227],[225, 226, 227]) * AH) == diag(A * S100450 * AH) + 0;

v450 == v100 - S100450*ctranspose(Z100450) - Z100450*ctranspose(S100450) + Z100450*l100450*ctranspose(Z100450);
[v100, S100450; ctranspose(S100450), l100450] >= 0;
diag(A *(S100450-Z100450*l100450) * AH)- loads([228, 229, 230]) + diag(A * v450 * Cbus([228, 229, 230],[228, 229, 230]) * AH) == 0;

v102 == v101_abc([3],[3]) - S101102*ctranspose(Z101102) - Z101102*ctranspose(S101102) + Z101102*l101102*ctranspose(Z101102);
[v101_abc([3],[3]), S101102; ctranspose(S101102), l101102] >= 0;
diag(S101102-Z101102*l101102)- loads([237]) + diag(v102 * Cbus([237],[237])) == diag(S102103) + 0;

v105 == v101 - S101105*ctranspose(Z101105) - Z101105*ctranspose(S101105) + Z101105*l101105*ctranspose(Z101105);
[v101, S101105; ctranspose(S101105), l101105] >= 0;
diag(A *(S101105-Z101105*l101105) * AH)- loads([238, 239, 240]) + diag(A * v105 * Cbus([238, 239, 240],[238, 239, 240]) * AH) == [0; diag(S105106); 0] + diag(A * S105108 * AH) + 0;

v103 == v102 - S102103*ctranspose(Z102103) - Z102103*ctranspose(S102103) + Z102103*l102103*ctranspose(Z102103);
[v102, S102103; ctranspose(S102103), l102103] >= 0;
diag(S102103-Z102103*l102103)- loads([241]) + diag(v103 * Cbus([241],[241])) == diag(S103104) + 0;

v104 == v103 - S103104*ctranspose(Z103104) - Z103104*ctranspose(S103104) + Z103104*l103104*ctranspose(Z103104);
[v103, S103104; ctranspose(S103104), l103104] >= 0;
diag(S103104-Z103104*l103104)- loads([242]) + diag(v104 * Cbus([242],[242])) == 0;

v106 == v105_abc([2],[2]) - S105106*ctranspose(Z105106) - Z105106*ctranspose(S105106) + Z105106*l105106*ctranspose(Z105106);
[v105_abc([2],[2]), S105106; ctranspose(S105106), l105106] >= 0;
diag(S105106-Z105106*l105106)- loads([243]) + diag(v106 * Cbus([243],[243])) == diag(S106107) + 0;

v108 == v105 - S105108*ctranspose(Z105108) - Z105108*ctranspose(S105108) + Z105108*l105108*ctranspose(Z105108);
[v105, S105108; ctranspose(S105108), l105108] >= 0;
diag(A *(S105108-Z105108*l105108) * AH)- loads([244, 245, 246]) + diag(A * v108 * Cbus([244, 245, 246],[244, 245, 246]) * AH) == [diag(S108109); 0; 0] + diag(A * S108300 * AH) + 0;

v107 == v106 - S106107*ctranspose(Z106107) - Z106107*ctranspose(S106107) + Z106107*l106107*ctranspose(Z106107);
[v106, S106107; ctranspose(S106107), l106107] >= 0;
diag(S106107-Z106107*l106107)- loads([247]) + diag(v107 * Cbus([247],[247])) == 0;

v109 == v108_abc([1],[1]) - S108109*ctranspose(Z108109) - Z108109*ctranspose(S108109) + Z108109*l108109*ctranspose(Z108109);
[v108_abc([1],[1]), S108109; ctranspose(S108109), l108109] >= 0;
diag(S108109-Z108109*l108109)- loads([248]) + diag(v109 * Cbus([248],[248])) == diag(S109110) + 0;

v300 == v108 - S108300*ctranspose(Z108300) - Z108300*ctranspose(S108300) + Z108300*l108300*ctranspose(Z108300);
[v108, S108300; ctranspose(S108300), l108300] >= 0;
diag(A *(S108300-Z108300*l108300) * AH)- loads([249, 250, 251]) + diag(A * v300 * Cbus([249, 250, 251],[249, 250, 251]) * AH) == 0;

v110 == v109 - S109110*ctranspose(Z109110) - Z109110*ctranspose(S109110) + Z109110*l109110*ctranspose(Z109110);
[v109, S109110; ctranspose(S109110), l109110] >= 0;
diag(S109110-Z109110*l109110)- loads([252]) + diag(v110 * Cbus([252],[252])) == diag(S110111) + diag(S110112) + 0;

v111 == v110 - S110111*ctranspose(Z110111) - Z110111*ctranspose(S110111) + Z110111*l110111*ctranspose(Z110111);
[v110, S110111; ctranspose(S110111), l110111] >= 0;
diag(S110111-Z110111*l110111)- loads([253]) + diag(v111 * Cbus([253],[253])) == 0;

v112 == v110 - S110112*ctranspose(Z110112) - Z110112*ctranspose(S110112) + Z110112*l110112*ctranspose(Z110112);
[v110, S110112; ctranspose(S110112), l110112] >= 0;
diag(S110112-Z110112*l110112)- loads([254]) + diag(v112 * Cbus([254],[254])) == diag(S112113) + 0;

v113 == v112 - S112113*ctranspose(Z112113) - Z112113*ctranspose(S112113) + Z112113*l112113*ctranspose(Z112113);
[v112, S112113; ctranspose(S112113), l112113] >= 0;
diag(S112113-Z112113*l112113)- loads([255]) + diag(v113 * Cbus([255],[255])) == diag(S113114) + 0;

v114 == v113 - S113114*ctranspose(Z113114) - Z113114*ctranspose(S113114) + Z113114*l113114*ctranspose(Z113114);
[v113, S113114; ctranspose(S113114), l113114] >= 0;
diag(S113114-Z113114*l113114)- loads([256]) + diag(v114 * Cbus([256],[256])) == 0;

v35 == v135 - S13535*ctranspose(Z13535) - Z13535*ctranspose(S13535) + Z13535*l13535*ctranspose(Z13535);
[v135, S13535; ctranspose(S13535), l13535] >= 0;
diag(A *(S13535-Z13535*l13535) * AH)- loads([74, 75, 78]) + diag(A * v35 * Cbus([74, 75, 78],[74, 75, 78]) * AH) == [diag(S3536); 0] + diag(A * S3540 * AH) + 0;

v1 == v149 - S1491*ctranspose(Z1491) - Z1491*ctranspose(S1491) + Z1491*l1491*ctranspose(Z1491);
[v149, S1491; ctranspose(S1491), l1491] >= 0;
diag(A *(S1491-Z1491*l1491) * AH)- loads([10, 11, 12]) + diag(A * v1 * Cbus([10, 11, 12],[10, 11, 12]) * AH) == [0; diag(S12); 0] + [0; 0; diag(S13)] + diag(A * S17 * AH) + 0;

v52 == v152 - S15252*ctranspose(Z15252) - Z15252*ctranspose(S15252) + Z15252*l15252*ctranspose(Z15252);
[v152, S15252; ctranspose(S15252), l15252] >= 0;
diag(A *(S15252-Z15252*l15252) * AH)- loads([113, 114, 115]) + diag(A * v52 * Cbus([113, 114, 115],[113, 114, 115]) * AH) == diag(A * S5253 * AH) + 0;

v67 == v160R - S160R67*ctranspose(Z160R67) - Z160R67*ctranspose(S160R67) + Z160R67*l160R67*ctranspose(Z160R67);
[v160R, S160R67; ctranspose(S160R67), l160R67] >= 0;
diag(A *(S160R67-Z160R67*l160R67) * AH)- loads([154, 156, 157]) + diag(A * v67 * Cbus([154, 156, 157],[154, 156, 157]) * AH) == [diag(S6768); 0; 0] + diag(A * S6772 * AH) + diag(A * S6797 * AH) + 0;

v101 == v197 - S197101*ctranspose(Z197101) - Z197101*ctranspose(S197101) + Z197101*l197101*ctranspose(Z197101);
[v197, S197101; ctranspose(S197101), l197101] >= 0;
diag(A *(S197101-Z197101*l197101) * AH)- loads([234, 235, 236]) + diag(A * v101 * Cbus([234, 235, 236],[234, 235, 236]) * AH) == [0; 0; diag(S101102)] + diag(A * S101105 * AH) + 0;

v151 == v51 - S51151*ctranspose(Z51151) - Z51151*ctranspose(S51151) + Z51151*l51151*ctranspose(Z51151);
[v51, S51151; ctranspose(S51151), l51151] >= 0;
diag(A *(S51151-Z51151*l51151) * AH)- loads([110, 111, 112]) + diag(A * v151 * Cbus([110, 111, 112],[110, 111, 112]) * AH) == diag(A * S151300_OPEN * AH) + 0;

A * v150R * AH == (A * (v150([1, 2, 3],[1, 2, 3]) -S150150R*ctranspose(Z150150R) - Z150150R*ctranspose(S150150R) + Z150150R*l150150R*ctranspose(Z150150R)) * AH) .* alphaM150R;
[v150([1, 2, 3],[1, 2, 3]), S150150R; ctranspose(S150150R), l150150R] >= 0;
diag(A *(S150150R-Z150150R*l150150R) * AH)- loads([4, 5, 6]) + diag(A * v150R * Cbus([4, 5, 6],[4, 5, 6]) * AH) == diag(A * S150R149 * AH) + 0;

v9R == (v9([1],[1]) - S99R*ctranspose(Z99R) - Z99R*ctranspose(S99R) + Z99R*l99R*ctranspose(Z99R)) .* alphaM9R;
[v9([1],[1]), S99R; ctranspose(S99R), l99R] >= 0;
diag(S99R-Z99R*l99R)- loads([29]) + diag(v9R * Cbus([29],[29])) == diag(S9R14) + 0;

v25R == (v25_abc([1, 3],[1, 3]) - S2525R*ctranspose(Z2525R) - Z2525R*ctranspose(S2525R) + Z2525R*l2525R*ctranspose(Z2525R)) .* alphaM25R;
[v25([1, 3],[1, 3]), S2525R; ctranspose(S2525R), l2525R] >= 0;
diag(S2525R-Z2525R*l2525R)- loads([53, 54]) + diag(v25R * Cbus([53, 54],[53, 54])) == diag(S25R26) + 0;

A * v160R * AH == (A * (v160([1, 2, 3],[1, 2, 3]) -S160160R*ctranspose(Z160160R) - Z160160R*ctranspose(S160160R) + Z160160R*l160160R*ctranspose(Z160160R)) * AH) .* alphaM160R;
[v160([1, 2, 3],[1, 2, 3]), S160160R; ctranspose(S160160R), l160160R] >= 0;
diag(A *(S160160R-Z160160R*l160160R) * AH)- loads([263, 264, 265]) + diag(A * v160R * Cbus([263, 264, 265],[263, 264, 265]) * AH) == diag(A * S160R67 * AH) + 0;

v610 == v61S - S61S610*ctranspose(Z61S610) - Z61S610*ctranspose(S61S610) + Z61S610*l61S610*ctranspose(Z61S610);
[v61S, S61S610; ctranspose(S61S610), l61S610] >= 0;
diag(A *(S61S610-Z61S610*l61S610) * AH)- loads([276, 277, 278]) + diag(A * v610 * Cbus([276, 277, 278],[276, 277, 278]) * AH) == 0;

v149 == v150R - S150R149*ctranspose(Z150R149) - Z150R149*ctranspose(S150R149) + Z150R149*l150R149*ctranspose(Z150R149);
[v150R, S150R149; ctranspose(S150R149), l150R149] >= 0;
diag(A *(S150R149-Z150R149*l150R149) * AH)- loads([7, 8, 9]) + diag(A * v149 * Cbus([7, 8, 9],[7, 8, 9]) * AH) == diag(A * S1491 * AH) + 0;

v152 == v13 - S13152*ctranspose(Z13152) - Z13152*ctranspose(S13152) + Z13152*l13152*ctranspose(Z13152);
[v13, S13152; ctranspose(S13152), l13152] >= 0;
diag(A *(S13152-Z13152*l13152) * AH)- loads([260, 261, 262]) + diag(A * v152 * Cbus([260, 261, 262],[260, 261, 262]) * AH) == diag(A * S15252 * AH) + 0;

v135 == v18 - S18135*ctranspose(Z18135) - Z18135*ctranspose(S18135) + Z18135*l18135*ctranspose(Z18135);
[v18, S18135; ctranspose(S18135), l18135] >= 0;
diag(A *(S18135-Z18135*l18135) * AH)- loads([257, 258, 259]) + diag(A * v135 * Cbus([257, 258, 259],[257, 258, 259]) * AH) == diag(A * S13535 * AH) + 0;

v160 == v60 - S60160*ctranspose(Z60160) - Z60160*ctranspose(S60160) + Z60160*l60160*ctranspose(Z60160);
[v60, S60160; ctranspose(S60160), l60160] >= 0;
diag(A *(S60160-Z60160*l60160) * AH)- loads([266, 267, 268]) + diag(A * v160 * Cbus([266, 267, 268],[266, 267, 268]) * AH) == diag(A * S160160R * AH) + 0;

v197 == v97 - S97197*ctranspose(Z97197) - Z97197*ctranspose(S97197) + Z97197*l97197*ctranspose(Z97197);
[v97, S97197; ctranspose(S97197), l97197] >= 0;
diag(A *(S97197-Z97197*l97197) * AH)- loads([231, 232, 233]) + diag(A * v197 * Cbus([231, 232, 233],[231, 232, 233]) * AH) == diag(A * S197101 * AH) + 0;

v61S == v61 - S6161S*ctranspose(Z6161S) - Z6161S*ctranspose(S6161S) + Z6161S*l6161S*ctranspose(Z6161S);
[v61, S6161S; ctranspose(S6161S), l6161S] >= 0;
diag(A *(S6161S-Z6161S*l6161S) * AH)- loads([269, 270, 271]) + diag(A * v61S * Cbus([269, 270, 271],[269, 270, 271]) * AH) == diag(A * S61S610 * AH) + 0;

v300_OPEN == v151 - S151300_OPEN*ctranspose(Z151300_OPEN) - Z151300_OPEN*ctranspose(S151300_OPEN) + Z151300_OPEN*l151300_OPEN*ctranspose(Z151300_OPEN);
[v151, S151300_OPEN; ctranspose(S151300_OPEN), l151300_OPEN] >= 0;
diag(A *(S151300_OPEN-Z151300_OPEN*l151300_OPEN) * AH)- loads([272, 273, 274]) + diag(A * v300_OPEN * Cbus([272, 273, 274],[272, 273, 274]) * AH) == 0;

v94_OPEN == v54_abc([1],[1]) - S5494_OPEN*ctranspose(Z5494_OPEN) - Z5494_OPEN*ctranspose(S5494_OPEN) + Z5494_OPEN*l5494_OPEN*ctranspose(Z5494_OPEN);
[v54_abc([1],[1]), S5494_OPEN; ctranspose(S5494_OPEN), l5494_OPEN] >= 0;
diag(S5494_OPEN-Z5494_OPEN*l5494_OPEN)- loads([275]) + diag(v94_OPEN * Cbus([275],[275])) == 0;

v108_abc == A * v108 * AH;
v8_abc == A * v8 * AH;
v13_abc == A * v13 * AH;
v101_abc == A * v101 * AH;
v105_abc == A * v105 * AH;
v91_abc == A * v91 * AH;
v35_abc == A * v35 * AH;
v42_abc == A * v42 * AH;
v87_abc == A * v87 * AH;
v57_abc == A * v57 * AH;
v89_abc == A * v89 * AH;
v81_abc == A * v81 * AH;
v21_abc == A * v21 * AH;
v95_abc == A * v95 * AH;
v40_abc == A * v40 * AH;
v54_abc == A * v54 * AH;
v93_abc == A * v93 * AH;
v44_abc == A * v44 * AH;
v18_abc == A * v18 * AH;
v67_abc == A * v67 * AH;
v1_abc == A * v1 * AH;
v25_abc == A * v25 * AH;
v72_abc == A * v72 * AH;
v23_abc == A * v23 * AH;


cvx_end


V150 = A * v0;
I150150R = 1/trace(A * v150([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S150150R * AH)*V150([1, 2, 3]);
V150R = (V150([1, 2, 3]) - A * Z150150R* AH *I150150R).* alpha150R;
I150R149 = 1/trace(A * v150R([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S150R149 * AH)*V150R([1, 2, 3]);
V149 = V150R([1, 2, 3]) - A * Z150R149* AH *I150R149;
I1491 = 1/trace(A * v149([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S1491 * AH)*V149([1, 2, 3]);
V1 = V149([1, 2, 3]) - A * Z1491* AH *I1491;
I12 = 1/trace(v1_abc([2],[2]) ) * ctranspose(S12)*V1([2]);
V2 = V1([2]) - Z12*I12;
I13 = 1/trace(v1_abc([3],[3]) ) * ctranspose(S13)*V1([3]);
V3 = V1([3]) - Z13*I13;
I17 = 1/trace(A * v1([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S17 * AH)*V1([1, 2, 3]);
V7 = V1([1, 2, 3]) - A * Z17* AH *I17;
I34 = 1/trace(v3([1],[1]))*ctranspose(S34)*V3([1]);
V4 = V3([1]) - Z34*I34;
I35 = 1/trace(v3([1],[1]))*ctranspose(S35)*V3([1]);
V5 = V3([1]) - Z35*I35;
I78 = 1/trace(A * v7([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S78 * AH)*V7([1, 2, 3]);
V8 = V7([1, 2, 3]) - A * Z78* AH *I78;
I56 = 1/trace(v5([1],[1]))*ctranspose(S56)*V5([1]);
V6 = V5([1]) - Z56*I56;
I812 = 1/trace(v8_abc([2],[2]) ) * ctranspose(S812)*V8([2]);
V12 = V8([2]) - Z812*I812;
I89 = 1/trace(v8_abc([1],[1]) ) * ctranspose(S89)*V8([1]);
V9 = V8([1]) - Z89*I89;
I813 = 1/trace(A * v8([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S813 * AH)*V8([1, 2, 3]);
V13 = V8([1, 2, 3]) - A * Z813* AH *I813;
I99R = 1/trace(v9([1],[1]))*ctranspose(S99R)*V9([1]);
V9R = (V9([1]) - Z99R*I99R) .* alpha9R;
I1334 = 1/trace(v13_abc([3],[3]) ) * ctranspose(S1334)*V13([3]);
V34 = V13([3]) - Z1334*I1334;
I1318 = 1/trace(A * v13([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S1318 * AH)*V13([1, 2, 3]);
V18 = V13([1, 2, 3]) - A * Z1318* AH *I1318;
I13152 = 1/trace(A * v13([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S13152 * AH)*V13([1, 2, 3]);
V152 = V13([1, 2, 3]) - A * Z13152* AH *I13152;
I9R14 = 1/trace(v9R([1],[1]))*ctranspose(S9R14)*V9R([1]);
V14 = V9R([1]) - Z9R14*I9R14;
I3415 = 1/trace(v34([1],[1]))*ctranspose(S3415)*V34([1]);
V15 = V34([1]) - Z3415*I3415;
I1819 = 1/trace(v18_abc([1],[1]) ) * ctranspose(S1819)*V18([1]);
V19 = V18([1]) - Z1819*I1819;
I1821 = 1/trace(A * v18([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S1821 * AH)*V18([1, 2, 3]);
V21 = V18([1, 2, 3]) - A * Z1821* AH *I1821;
I18135 = 1/trace(A * v18([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S18135 * AH)*V18([1, 2, 3]);
V135 = V18([1, 2, 3]) - A * Z18135* AH *I18135;
I15252 = 1/trace(A * v152([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S15252 * AH)*V152([1, 2, 3]);
V52 = V152([1, 2, 3]) - A * Z15252* AH *I15252;
I1411 = 1/trace(v14([1],[1]))*ctranspose(S1411)*V14([1]);
V11 = V14([1]) - Z1411*I1411;
I1410 = 1/trace(v14([1],[1]))*ctranspose(S1410)*V14([1]);
V10 = V14([1]) - Z1410*I1410;
I1516 = 1/trace(v15([1],[1]))*ctranspose(S1516)*V15([1]);
V16 = V15([1]) - Z1516*I1516;
I1517 = 1/trace(v15([1],[1]))*ctranspose(S1517)*V15([1]);
V17 = V15([1]) - Z1517*I1517;
I1920 = 1/trace(v19([1],[1]))*ctranspose(S1920)*V19([1]);
V20 = V19([1]) - Z1920*I1920;
I2122 = 1/trace(v21_abc([2],[2]) ) * ctranspose(S2122)*V21([2]);
V22 = V21([2]) - Z2122*I2122;
I2123 = 1/trace(A * v21([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S2123 * AH)*V21([1, 2, 3]);
V23 = V21([1, 2, 3]) - A * Z2123* AH *I2123;
I13535 = 1/trace(A * v135([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S13535 * AH)*V135([1, 2, 3]);
V35 = V135([1, 2, 3]) - A * Z13535* AH *I13535;
I5253 = 1/trace(A * v52([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5253 * AH)*V52([1, 2, 3]);
V53 = V52([1, 2, 3]) - A * Z5253* AH *I5253;
I2324 = 1/trace(v23_abc([3],[3]) ) * ctranspose(S2324)*V23([3]);
V24 = V23([3]) - Z2324*I2324;
I2325 = 1/trace(A * v23([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S2325 * AH)*V23([1, 2, 3]);
V25 = V23([1, 2, 3]) - A * Z2325* AH *I2325;
I3536 = 1/trace(v35_abc([1, 2],[1, 2]) ) * ctranspose(S3536)*V35([1, 2]);
V36 = V35([1, 2]) - Z3536*I3536;
I3540 = 1/trace(A * v35([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S3540 * AH)*V35([1, 2, 3]);
V40 = V35([1, 2, 3]) - A * Z3540* AH *I3540;
I5354 = 1/trace(A * v53([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5354 * AH)*V53([1, 2, 3]);
V54 = V53([1, 2, 3]) - A * Z5354* AH *I5354;
I2528 = 1/trace(A * v25([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S2528 * AH)*V25([1, 2, 3]);
V28 = V25([1, 2, 3]) - A * Z2528* AH *I2528;
I2525R = 1/trace(v25_abc([1, 3],[1, 3]) ) * ctranspose(S2525R)*V25([1, 3]);
V25R = (V25([1, 3]) - Z2525R*I2525R) .* alpha25R;
I3637 = 1/trace(v36([1],[1]))*ctranspose(S3637)*V36([1]);
V37 = V36([1]) - Z3637*I3637;
I3638 = 1/trace(v36([2],[2]))*ctranspose(S3638)*V36([2]);
V38 = V36([2]) - Z3638*I3638;
I4041 = 1/trace(v40_abc([3],[3]) ) * ctranspose(S4041)*V40([3]);
V41 = V40([3]) - Z4041*I4041;
I4042 = 1/trace(A * v40([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4042 * AH)*V40([1, 2, 3]);
V42 = V40([1, 2, 3]) - A * Z4042* AH *I4042;
I5455 = 1/trace(A * v54([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5455 * AH)*V54([1, 2, 3]);
V55 = V54([1, 2, 3]) - A * Z5455* AH *I5455;
I5457 = 1/trace(A * v54([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5457 * AH)*V54([1, 2, 3]);
V57 = V54([1, 2, 3]) - A * Z5457* AH *I5457;
I5494_OPEN = 1/trace(v54_abc([1],[1]) ) * ctranspose(S5494_OPEN)*V54([1]);
V94_OPEN = V54([1]) - Z5494_OPEN*I5494_OPEN;
I2829 = 1/trace(A * v28([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S2829 * AH)*V28([1, 2, 3]);
V29 = V28([1, 2, 3]) - A * Z2829* AH *I2829;
I25R26 = 1/trace(v25R([1, 2],[1, 2]))*ctranspose(S25R26)*V25R([1, 2]);
V26 = V25R([1, 2]) - Z25R26*I25R26;
I3839 = 1/trace(v38([1],[1]))*ctranspose(S3839)*V38([1]);
V39 = V38([1]) - Z3839*I3839;
I4243 = 1/trace(v42_abc([2],[2]) ) * ctranspose(S4243)*V42([2]);
V43 = V42([2]) - Z4243*I4243;
I4244 = 1/trace(A * v42([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4244 * AH)*V42([1, 2, 3]);
V44 = V42([1, 2, 3]) - A * Z4244* AH *I4244;
I5556 = 1/trace(A * v55([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5556 * AH)*V55([1, 2, 3]);
V56 = V55([1, 2, 3]) - A * Z5556* AH *I5556;
I5758 = 1/trace(v57_abc([2],[2]) ) * ctranspose(S5758)*V57([2]);
V58 = V57([2]) - Z5758*I5758;
I5760 = 1/trace(A * v57([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5760 * AH)*V57([1, 2, 3]);
V60 = V57([1, 2, 3]) - A * Z5760* AH *I5760;
I2930 = 1/trace(A * v29([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S2930 * AH)*V29([1, 2, 3]);
V30 = V29([1, 2, 3]) - A * Z2930* AH *I2930;
I2627 = 1/trace(v26([1, 2],[1, 2]))*ctranspose(S2627)*V26([1, 2]);
V27 = V26([1, 2]) - Z2627*I2627;
I2631 = 1/trace(v26([2],[2]))*ctranspose(S2631)*V26([2]);
V31 = V26([2]) - Z2631*I2631;
I4445 = 1/trace(v44_abc([1],[1]) ) * ctranspose(S4445)*V44([1]);
V45 = V44([1]) - Z4445*I4445;
I4447 = 1/trace(A * v44([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4447 * AH)*V44([1, 2, 3]);
V47 = V44([1, 2, 3]) - A * Z4447* AH *I4447;
I5859 = 1/trace(v58([1],[1]))*ctranspose(S5859)*V58([1]);
V59 = V58([1]) - Z5859*I5859;
I6061 = 1/trace(A * v60([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6061 * AH)*V60([1, 2, 3]);
V61 = V60([1, 2, 3]) - A * Z6061* AH *I6061;
I6062 = 1/trace(A * v60([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6062 * AH)*V60([1, 2, 3]);
V62 = V60([1, 2, 3]) - A * Z6062* AH *I6062;
I60160 = 1/trace(A * v60([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S60160 * AH)*V60([1, 2, 3]);
V160 = V60([1, 2, 3]) - A * Z60160* AH *I60160;
I30250 = 1/trace(A * v30([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S30250 * AH)*V30([1, 2, 3]);
V250 = V30([1, 2, 3]) - A * Z30250* AH *I30250;
I2733 = 1/trace(v27([1],[1]))*ctranspose(S2733)*V27([1]);
V33 = V27([1]) - Z2733*I2733;
I3132 = 1/trace(v31([1],[1]))*ctranspose(S3132)*V31([1]);
V32 = V31([1]) - Z3132*I3132;
I4546 = 1/trace(v45([1],[1]))*ctranspose(S4546)*V45([1]);
V46 = V45([1]) - Z4546*I4546;
I4748 = 1/trace(A * v47([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4748 * AH)*V47([1, 2, 3]);
V48 = V47([1, 2, 3]) - A * Z4748* AH *I4748;
I4749 = 1/trace(A * v47([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4749 * AH)*V47([1, 2, 3]);
V49 = V47([1, 2, 3]) - A * Z4749* AH *I4749;
I6161S = 1/trace(A * v61([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6161S * AH)*V61([1, 2, 3]);
V61S = V61([1, 2, 3]) - A * Z6161S* AH *I6161S;
I6263 = 1/trace(A * v62([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6263 * AH)*V62([1, 2, 3]);
V63 = V62([1, 2, 3]) - A * Z6263* AH *I6263;
I160160R = 1/trace(A * v160([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S160160R * AH)*V160([1, 2, 3]);
V160R = (V160([1, 2, 3]) - A * Z160160R* AH *I160160R).* alpha160R;
I4950 = 1/trace(A * v49([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S4950 * AH)*V49([1, 2, 3]);
V50 = V49([1, 2, 3]) - A * Z4950* AH *I4950;
I61S610 = 1/trace(A * v61S([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S61S610 * AH)*V61S([1, 2, 3]);
V610 = V61S([1, 2, 3]) - A * Z61S610* AH *I61S610;
I6364 = 1/trace(A * v63([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6364 * AH)*V63([1, 2, 3]);
V64 = V63([1, 2, 3]) - A * Z6364* AH *I6364;
I160R67 = 1/trace(A * v160R([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S160R67 * AH)*V160R([1, 2, 3]);
V67 = V160R([1, 2, 3]) - A * Z160R67* AH *I160R67;
I5051 = 1/trace(A * v50([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S5051 * AH)*V50([1, 2, 3]);
V51 = V50([1, 2, 3]) - A * Z5051* AH *I5051;
I6465 = 1/trace(A * v64([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6465 * AH)*V64([1, 2, 3]);
V65 = V64([1, 2, 3]) - A * Z6465* AH *I6465;
I6768 = 1/trace(v67_abc([1],[1]) ) * ctranspose(S6768)*V67([1]);
V68 = V67([1]) - Z6768*I6768;
I6772 = 1/trace(A * v67([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6772 * AH)*V67([1, 2, 3]);
V72 = V67([1, 2, 3]) - A * Z6772* AH *I6772;
I6797 = 1/trace(A * v67([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6797 * AH)*V67([1, 2, 3]);
V97 = V67([1, 2, 3]) - A * Z6797* AH *I6797;
I51151 = 1/trace(A * v51([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S51151 * AH)*V51([1, 2, 3]);
V151 = V51([1, 2, 3]) - A * Z51151* AH *I51151;
I6566 = 1/trace(A * v65([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S6566 * AH)*V65([1, 2, 3]);
V66 = V65([1, 2, 3]) - A * Z6566* AH *I6566;
I6869 = 1/trace(v68([1],[1]))*ctranspose(S6869)*V68([1]);
V69 = V68([1]) - Z6869*I6869;
I7273 = 1/trace(v72_abc([3],[3]) ) * ctranspose(S7273)*V72([3]);
V73 = V72([3]) - Z7273*I7273;
I7276 = 1/trace(A * v72([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7276 * AH)*V72([1, 2, 3]);
V76 = V72([1, 2, 3]) - A * Z7276* AH *I7276;
I9798 = 1/trace(A * v97([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S9798 * AH)*V97([1, 2, 3]);
V98 = V97([1, 2, 3]) - A * Z9798* AH *I9798;
I97197 = 1/trace(A * v97([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S97197 * AH)*V97([1, 2, 3]);
V197 = V97([1, 2, 3]) - A * Z97197* AH *I97197;
I151300_OPEN = 1/trace(A * v151([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S151300_OPEN * AH)*V151([1, 2, 3]);
V300_OPEN = V151([1, 2, 3]) - A * Z151300_OPEN* AH *I151300_OPEN;
I6970 = 1/trace(v69([1],[1]))*ctranspose(S6970)*V69([1]);
V70 = V69([1]) - Z6970*I6970;
I7374 = 1/trace(v73([1],[1]))*ctranspose(S7374)*V73([1]);
V74 = V73([1]) - Z7374*I7374;
I7677 = 1/trace(A * v76([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7677 * AH)*V76([1, 2, 3]);
V77 = V76([1, 2, 3]) - A * Z7677* AH *I7677;
I7686 = 1/trace(A * v76([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7686 * AH)*V76([1, 2, 3]);
V86 = V76([1, 2, 3]) - A * Z7686* AH *I7686;
I9899 = 1/trace(A * v98([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S9899 * AH)*V98([1, 2, 3]);
V99 = V98([1, 2, 3]) - A * Z9899* AH *I9899;
I197101 = 1/trace(A * v197([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S197101 * AH)*V197([1, 2, 3]);
V101 = V197([1, 2, 3]) - A * Z197101* AH *I197101;
I7071 = 1/trace(v70([1],[1]))*ctranspose(S7071)*V70([1]);
V71 = V70([1]) - Z7071*I7071;
I7475 = 1/trace(v74([1],[1]))*ctranspose(S7475)*V74([1]);
V75 = V74([1]) - Z7475*I7475;
I7778 = 1/trace(A * v77([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7778 * AH)*V77([1, 2, 3]);
V78 = V77([1, 2, 3]) - A * Z7778* AH *I7778;
I8687 = 1/trace(A * v86([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8687 * AH)*V86([1, 2, 3]);
V87 = V86([1, 2, 3]) - A * Z8687* AH *I8687;
I99100 = 1/trace(A * v99([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S99100 * AH)*V99([1, 2, 3]);
V100 = V99([1, 2, 3]) - A * Z99100* AH *I99100;
I101102 = 1/trace(v101_abc([3],[3]) ) * ctranspose(S101102)*V101([3]);
V102 = V101([3]) - Z101102*I101102;
I101105 = 1/trace(A * v101([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S101105 * AH)*V101([1, 2, 3]);
V105 = V101([1, 2, 3]) - A * Z101105* AH *I101105;
I7879 = 1/trace(A * v78([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7879 * AH)*V78([1, 2, 3]);
V79 = V78([1, 2, 3]) - A * Z7879* AH *I7879;
I7880 = 1/trace(A * v78([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S7880 * AH)*V78([1, 2, 3]);
V80 = V78([1, 2, 3]) - A * Z7880* AH *I7880;
I8788 = 1/trace(v87_abc([1],[1]) ) * ctranspose(S8788)*V87([1]);
V88 = V87([1]) - Z8788*I8788;
I8789 = 1/trace(A * v87([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8789 * AH)*V87([1, 2, 3]);
V89 = V87([1, 2, 3]) - A * Z8789* AH *I8789;
I100450 = 1/trace(A * v100([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S100450 * AH)*V100([1, 2, 3]);
V450 = V100([1, 2, 3]) - A * Z100450* AH *I100450;
I102103 = 1/trace(v102([1],[1]))*ctranspose(S102103)*V102([1]);
V103 = V102([1]) - Z102103*I102103;
I105106 = 1/trace(v105_abc([2],[2]) ) * ctranspose(S105106)*V105([2]);
V106 = V105([2]) - Z105106*I105106;
I105108 = 1/trace(A * v105([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S105108 * AH)*V105([1, 2, 3]);
V108 = V105([1, 2, 3]) - A * Z105108* AH *I105108;
I8081 = 1/trace(A * v80([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8081 * AH)*V80([1, 2, 3]);
V81 = V80([1, 2, 3]) - A * Z8081* AH *I8081;
I8990 = 1/trace(v89_abc([2],[2]) ) * ctranspose(S8990)*V89([2]);
V90 = V89([2]) - Z8990*I8990;
I8991 = 1/trace(A * v89([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8991 * AH)*V89([1, 2, 3]);
V91 = V89([1, 2, 3]) - A * Z8991* AH *I8991;
I103104 = 1/trace(v103([1],[1]))*ctranspose(S103104)*V103([1]);
V104 = V103([1]) - Z103104*I103104;
I106107 = 1/trace(v106([1],[1]))*ctranspose(S106107)*V106([1]);
V107 = V106([1]) - Z106107*I106107;
I108109 = 1/trace(v108_abc([1],[1]) ) * ctranspose(S108109)*V108([1]);
V109 = V108([1]) - Z108109*I108109;
I108300 = 1/trace(A * v108([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S108300 * AH)*V108([1, 2, 3]);
V300 = V108([1, 2, 3]) - A * Z108300* AH *I108300;
I8182 = 1/trace(A * v81([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8182 * AH)*V81([1, 2, 3]);
V82 = V81([1, 2, 3]) - A * Z8182* AH *I8182;
I8184 = 1/trace(v81_abc([3],[3]) ) * ctranspose(S8184)*V81([3]);
V84 = V81([3]) - Z8184*I8184;
I9192 = 1/trace(v91_abc([3],[3]) ) * ctranspose(S9192)*V91([3]);
V92 = V91([3]) - Z9192*I9192;
I9193 = 1/trace(A * v91([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S9193 * AH)*V91([1, 2, 3]);
V93 = V91([1, 2, 3]) - A * Z9193* AH *I9193;
I109110 = 1/trace(v109([1],[1]))*ctranspose(S109110)*V109([1]);
V110 = V109([1]) - Z109110*I109110;
I8283 = 1/trace(A * v82([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S8283 * AH)*V82([1, 2, 3]);
V83 = V82([1, 2, 3]) - A * Z8283* AH *I8283;
I8485 = 1/trace(v84([1],[1]))*ctranspose(S8485)*V84([1]);
V85 = V84([1]) - Z8485*I8485;
I9394 = 1/trace(v93_abc([1],[1]) ) * ctranspose(S9394)*V93([1]);
V94 = V93([1]) - Z9394*I9394;
I9395 = 1/trace(A * v93([1, 2, 3],[1, 2, 3]) * AH) * ctranspose(A * S9395 * AH)*V93([1, 2, 3]);
V95 = V93([1, 2, 3]) - A * Z9395* AH *I9395;
I110111 = 1/trace(v110([1],[1]))*ctranspose(S110111)*V110([1]);
V111 = V110([1]) - Z110111*I110111;
I110112 = 1/trace(v110([1],[1]))*ctranspose(S110112)*V110([1]);
V112 = V110([1]) - Z110112*I110112;
I9596 = 1/trace(v95_abc([2],[2]) ) * ctranspose(S9596)*V95([2]);
V96 = V95([2]) - Z9596*I9596;
I112113 = 1/trace(v112([1],[1]))*ctranspose(S112113)*V112([1]);
V113 = V112([1]) - Z112113*I112113;
I113114 = 1/trace(v113([1],[1]))*ctranspose(S113114)*V113([1]);
V114 = V113([1]) - Z113114*I113114;


phasors=[];
phasors=[phasors;recover_voltage(V150, 123)];
phasors=[phasors;recover_voltage(V150R, 123)];
phasors=[phasors;recover_voltage(V149, 123)];
phasors=[phasors;recover_voltage(V1, 123)];
phasors=[phasors;recover_voltage(V2, 2)];
phasors=[phasors;recover_voltage(V3, 3)];
phasors=[phasors;recover_voltage(V7, 123)];
phasors=[phasors;recover_voltage(V4, 3)];
phasors=[phasors;recover_voltage(V5, 3)];
phasors=[phasors;recover_voltage(V8, 123)];
phasors=[phasors;recover_voltage(V6, 3)];
phasors=[phasors;recover_voltage(V12, 2)];
phasors=[phasors;recover_voltage(V9, 1)];
phasors=[phasors;recover_voltage(V13, 123)];
phasors=[phasors;recover_voltage(V9R, 1)];
phasors=[phasors;recover_voltage(V34, 3)];
phasors=[phasors;recover_voltage(V18, 123)];
phasors=[phasors;recover_voltage(V152, 123)];
phasors=[phasors;recover_voltage(V14, 1)];
phasors=[phasors;recover_voltage(V15, 3)];
phasors=[phasors;recover_voltage(V19, 1)];
phasors=[phasors;recover_voltage(V21, 123)];
phasors=[phasors;recover_voltage(V135, 123)];
phasors=[phasors;recover_voltage(V52, 123)];
phasors=[phasors;recover_voltage(V11, 1)];
phasors=[phasors;recover_voltage(V10, 1)];
phasors=[phasors;recover_voltage(V16, 3)];
phasors=[phasors;recover_voltage(V17, 3)];
phasors=[phasors;recover_voltage(V20, 1)];
phasors=[phasors;recover_voltage(V22, 2)];
phasors=[phasors;recover_voltage(V23, 123)];
phasors=[phasors;recover_voltage(V35, 123)];
phasors=[phasors;recover_voltage(V53, 123)];
phasors=[phasors;recover_voltage(V24, 3)];
phasors=[phasors;recover_voltage(V25, 123)];
phasors=[phasors;recover_voltage(V36, 12)];
phasors=[phasors;recover_voltage(V40, 123)];
phasors=[phasors;recover_voltage(V54, 123)];
phasors=[phasors;recover_voltage(V28, 123)];
phasors=[phasors;recover_voltage(V25R, 13)];
phasors=[phasors;recover_voltage(V37, 1)];
phasors=[phasors;recover_voltage(V38, 2)];
phasors=[phasors;recover_voltage(V41, 3)];
phasors=[phasors;recover_voltage(V42, 123)];
phasors=[phasors;recover_voltage(V55, 123)];
phasors=[phasors;recover_voltage(V57, 123)];
phasors=[phasors;recover_voltage(V94_OPEN, 1)];
phasors=[phasors;recover_voltage(V29, 123)];
phasors=[phasors;recover_voltage(V26, 13)];
phasors=[phasors;recover_voltage(V39, 2)];
phasors=[phasors;recover_voltage(V43, 2)];
phasors=[phasors;recover_voltage(V44, 123)];
phasors=[phasors;recover_voltage(V56, 123)];
phasors=[phasors;recover_voltage(V58, 2)];
phasors=[phasors;recover_voltage(V60, 123)];
phasors=[phasors;recover_voltage(V30, 123)];
phasors=[phasors;recover_voltage(V27, 13)];
phasors=[phasors;recover_voltage(V31, 3)];
phasors=[phasors;recover_voltage(V45, 1)];
phasors=[phasors;recover_voltage(V47, 123)];
phasors=[phasors;recover_voltage(V59, 2)];
phasors=[phasors;recover_voltage(V61, 123)];
phasors=[phasors;recover_voltage(V62, 123)];
phasors=[phasors;recover_voltage(V160, 123)];
phasors=[phasors;recover_voltage(V250, 123)];
phasors=[phasors;recover_voltage(V33, 1)];
phasors=[phasors;recover_voltage(V32, 3)];
phasors=[phasors;recover_voltage(V46, 1)];
phasors=[phasors;recover_voltage(V48, 123)];
phasors=[phasors;recover_voltage(V49, 123)];
phasors=[phasors;recover_voltage(V61S, 123)];
phasors=[phasors;recover_voltage(V63, 123)];
phasors=[phasors;recover_voltage(V160R, 123)];
phasors=[phasors;recover_voltage(V50, 123)];
phasors=[phasors;recover_voltage(V610, 123)];
phasors=[phasors;recover_voltage(V64, 123)];
phasors=[phasors;recover_voltage(V67, 123)];
phasors=[phasors;recover_voltage(V51, 123)];
phasors=[phasors;recover_voltage(V65, 123)];
phasors=[phasors;recover_voltage(V68, 1)];
phasors=[phasors;recover_voltage(V72, 123)];
phasors=[phasors;recover_voltage(V97, 123)];
phasors=[phasors;recover_voltage(V151, 123)];
phasors=[phasors;recover_voltage(V66, 123)];
phasors=[phasors;recover_voltage(V69, 1)];
phasors=[phasors;recover_voltage(V73, 3)];
phasors=[phasors;recover_voltage(V76, 123)];
phasors=[phasors;recover_voltage(V98, 123)];
phasors=[phasors;recover_voltage(V197, 123)];
phasors=[phasors;recover_voltage(V300_OPEN, 123)];
phasors=[phasors;recover_voltage(V70, 1)];
phasors=[phasors;recover_voltage(V74, 3)];
phasors=[phasors;recover_voltage(V77, 123)];
phasors=[phasors;recover_voltage(V86, 123)];
phasors=[phasors;recover_voltage(V99, 123)];
phasors=[phasors;recover_voltage(V101, 123)];
phasors=[phasors;recover_voltage(V71, 1)];
phasors=[phasors;recover_voltage(V75, 3)];
phasors=[phasors;recover_voltage(V78, 123)];
phasors=[phasors;recover_voltage(V87, 123)];
phasors=[phasors;recover_voltage(V100, 123)];
phasors=[phasors;recover_voltage(V102, 3)];
phasors=[phasors;recover_voltage(V105, 123)];
phasors=[phasors;recover_voltage(V79, 123)];
phasors=[phasors;recover_voltage(V80, 123)];
phasors=[phasors;recover_voltage(V88, 1)];
phasors=[phasors;recover_voltage(V89, 123)];
phasors=[phasors;recover_voltage(V450, 123)];
phasors=[phasors;recover_voltage(V103, 3)];
phasors=[phasors;recover_voltage(V106, 2)];
phasors=[phasors;recover_voltage(V108, 123)];
phasors=[phasors;recover_voltage(V81, 123)];
phasors=[phasors;recover_voltage(V90, 2)];
phasors=[phasors;recover_voltage(V91, 123)];
phasors=[phasors;recover_voltage(V104, 3)];
phasors=[phasors;recover_voltage(V107, 2)];
phasors=[phasors;recover_voltage(V109, 1)];
phasors=[phasors;recover_voltage(V300, 123)];
phasors=[phasors;recover_voltage(V82, 123)];
phasors=[phasors;recover_voltage(V84, 3)];
phasors=[phasors;recover_voltage(V92, 3)];
phasors=[phasors;recover_voltage(V93, 123)];
phasors=[phasors;recover_voltage(V110, 1)];
phasors=[phasors;recover_voltage(V83, 123)];
phasors=[phasors;recover_voltage(V85, 3)];
phasors=[phasors;recover_voltage(V94, 1)];
phasors=[phasors;recover_voltage(V95, 123)];
phasors=[phasors;recover_voltage(V111, 1)];
phasors=[phasors;recover_voltage(V112, 1)];
phasors=[phasors;recover_voltage(V96, 2)];
phasors=[phasors;recover_voltage(V113, 1)];
phasors=[phasors;recover_voltage(V114, 1)];

% change to per unit
phasors(:, 1) = phasors(:, 1) / Vbase;
phasors(:, 3) = phasors(:, 3) / Vbase;
phasors(:, 5) = phasors(:, 5) / Vbase;




Voltage_output=[];
Voltage_output = [Voltage_output; recover_voltage(V1, 123)];
Voltage_output = [Voltage_output; recover_voltage(V2, 2)];
Voltage_output = [Voltage_output; recover_voltage(V4, 3)];
Voltage_output = [Voltage_output; recover_voltage(V5, 3)];
Voltage_output = [Voltage_output; recover_voltage(V6, 3)];
Voltage_output = [Voltage_output; recover_voltage(V7, 123)];
Voltage_output = [Voltage_output; recover_voltage(V9, 1)];
Voltage_output = [Voltage_output; recover_voltage(V10, 1)];
Voltage_output = [Voltage_output; recover_voltage(V11, 1)];
Voltage_output = [Voltage_output; recover_voltage(V12, 2)];
Voltage_output = [Voltage_output; recover_voltage(V16, 3)];
Voltage_output = [Voltage_output; recover_voltage(V17, 3)];
Voltage_output = [Voltage_output; recover_voltage(V19, 1)];
Voltage_output = [Voltage_output; recover_voltage(V20, 1)];
Voltage_output = [Voltage_output; recover_voltage(V22, 2)];
Voltage_output = [Voltage_output; recover_voltage(V24, 3)];
Voltage_output = [Voltage_output; recover_voltage(V28, 123)];
Voltage_output = [Voltage_output; recover_voltage(V29, 123)];
Voltage_output = [Voltage_output; recover_voltage(V30, 123)];
Voltage_output = [Voltage_output; recover_voltage(V31, 3)];
Voltage_output = [Voltage_output; recover_voltage(V32, 3)];
Voltage_output = [Voltage_output; recover_voltage(V33, 1)];
Voltage_output = [Voltage_output; recover_voltage(V34, 3)];
Voltage_output = [Voltage_output; recover_voltage(V35, 123)];
Voltage_output = [Voltage_output; recover_voltage(V37, 1)];
Voltage_output = [Voltage_output; recover_voltage(V38, 2)];
Voltage_output = [Voltage_output; recover_voltage(V39, 2)];
Voltage_output = [Voltage_output; recover_voltage(V41, 3)];
Voltage_output = [Voltage_output; recover_voltage(V42, 123)];
Voltage_output = [Voltage_output; recover_voltage(V43, 2)];
Voltage_output = [Voltage_output; recover_voltage(V45, 1)];
Voltage_output = [Voltage_output; recover_voltage(V46, 1)];
Voltage_output = [Voltage_output; recover_voltage(V47, 123)];
Voltage_output = [Voltage_output; recover_voltage(V48, 123)];
Voltage_output = [Voltage_output; recover_voltage(V49, 123)];
Voltage_output = [Voltage_output; recover_voltage(V50, 123)];
Voltage_output = [Voltage_output; recover_voltage(V51, 123)];
Voltage_output = [Voltage_output; recover_voltage(V52, 123)];
Voltage_output = [Voltage_output; recover_voltage(V53, 123)];
Voltage_output = [Voltage_output; recover_voltage(V55, 123)];
Voltage_output = [Voltage_output; recover_voltage(V56, 123)];
Voltage_output = [Voltage_output; recover_voltage(V58, 2)];
Voltage_output = [Voltage_output; recover_voltage(V59, 2)];
Voltage_output = [Voltage_output; recover_voltage(V60, 123)];
Voltage_output = [Voltage_output; recover_voltage(V62, 123)];
Voltage_output = [Voltage_output; recover_voltage(V63, 123)];
Voltage_output = [Voltage_output; recover_voltage(V64, 123)];
Voltage_output = [Voltage_output; recover_voltage(V65, 123)];
Voltage_output = [Voltage_output; recover_voltage(V66, 123)];
Voltage_output = [Voltage_output; recover_voltage(V68, 1)];
Voltage_output = [Voltage_output; recover_voltage(V69, 1)];
Voltage_output = [Voltage_output; recover_voltage(V70, 1)];
Voltage_output = [Voltage_output; recover_voltage(V71, 1)];
Voltage_output = [Voltage_output; recover_voltage(V73, 3)];
Voltage_output = [Voltage_output; recover_voltage(V74, 3)];
Voltage_output = [Voltage_output; recover_voltage(V75, 3)];
Voltage_output = [Voltage_output; recover_voltage(V76, 123)];
Voltage_output = [Voltage_output; recover_voltage(V77, 123)];
Voltage_output = [Voltage_output; recover_voltage(V79, 123)];
Voltage_output = [Voltage_output; recover_voltage(V80, 123)];
Voltage_output = [Voltage_output; recover_voltage(V82, 123)];
Voltage_output = [Voltage_output; recover_voltage(V83, 123)];
Voltage_output = [Voltage_output; recover_voltage(V84, 3)];
Voltage_output = [Voltage_output; recover_voltage(V85, 3)];
Voltage_output = [Voltage_output; recover_voltage(V86, 123)];
Voltage_output = [Voltage_output; recover_voltage(V87, 123)];
Voltage_output = [Voltage_output; recover_voltage(V88, 1)];
Voltage_output = [Voltage_output; recover_voltage(V90, 2)];
Voltage_output = [Voltage_output; recover_voltage(V92, 3)];
Voltage_output = [Voltage_output; recover_voltage(V94, 1)];
Voltage_output = [Voltage_output; recover_voltage(V95, 123)];
Voltage_output = [Voltage_output; recover_voltage(V96, 2)];
Voltage_output = [Voltage_output; recover_voltage(V98, 123)];
Voltage_output = [Voltage_output; recover_voltage(V99, 123)];
Voltage_output = [Voltage_output; recover_voltage(V100, 123)];
Voltage_output = [Voltage_output; recover_voltage(V102, 3)];
Voltage_output = [Voltage_output; recover_voltage(V103, 3)];
Voltage_output = [Voltage_output; recover_voltage(V104, 3)];
Voltage_output = [Voltage_output; recover_voltage(V106, 2)];
Voltage_output = [Voltage_output; recover_voltage(V107, 2)];
Voltage_output = [Voltage_output; recover_voltage(V109, 1)];
Voltage_output = [Voltage_output; recover_voltage(V111, 1)];
Voltage_output = [Voltage_output; recover_voltage(V112, 1)];
Voltage_output = [Voltage_output; recover_voltage(V113, 1)];
Voltage_output = [Voltage_output; recover_voltage(V114, 1)];

% change to per unit
Voltage_output(:, 1) = Voltage_output(:, 1) / Vbase;
Voltage_output(:, 3) = Voltage_output(:, 3) / Vbase;
Voltage_output(:, 5) = Voltage_output(:, 5) / Vbase;


disp(diag(A * S150R149 * AH) / 1000)

