function [Voltage_output, phasors] = ieee123_yalmip(loads, Zbus, Cbus)

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
V_lb = 0.80 * Vbase;
V_ub = 1.10 * Vbase;
v_lb = V_lb * V_lb;
v_ub = V_ub * V_ub;

% sequential component parameters
a = -0.5 + 0.5 * i * sqrt(3);
A = 1/sqrt(3) * [1,1,1; 1, a*a, a; 1, a, a*a];
AH = 1/sqrt(3) * [1,1,1; 1, a, a*a; 1, a*a, a];




% voltage square variables
v = sdpvar(350,350, 'hermitian', 'complex');
% complex power variables
S3 = sdpvar(210, 3, 'full', 'complex');
S2 = sdpvar(8, 2, 'full', 'complex');
S1 = sdpvar(57, 1, 'full', 'complex');

% current square variables
l = sdpvar(275,275, 'hermitian', 'complex');


Objective = (trace(real(Z12*l([1], [1]))) + trace(real(Z13*l([2], [2]))) + trace(real(A * Z17*l([3 4 5], [3 4 5]) * AH)) + trace(real(Z34*l([6], [6]))) + trace(real(Z35*l([7], [7]))) + trace(real(Z56*l([8], [8]))) + trace(real(A * Z78*l([ 9 10 11], [ 9 10 11]) * AH)) + trace(real(Z812*l([12], [12]))) + trace(real(Z89*l([13], [13]))) + trace(real(A * Z813*l([14 15 16], [14 15 16]) * AH)) + trace(real(Z9R14*l([17], [17]))) + trace(real(Z1334*l([18], [18]))) + trace(real(A * Z1318*l([19 20 21], [19 20 21]) * AH)) + trace(real(Z1411*l([22], [22]))) + trace(real(Z1410*l([23], [23]))) + trace(real(Z1516*l([24], [24]))) + trace(real(Z1517*l([25], [25]))) + trace(real(Z1819*l([26], [26]))) + trace(real(A * Z1821*l([27 28 29], [27 28 29]) * AH)) + trace(real(Z1920*l([30], [30]))) + trace(real(Z2122*l([31], [31]))) + trace(real(A * Z2123*l([32 33 34], [32 33 34]) * AH)) + trace(real(Z2324*l([35], [35]))) + trace(real(A * Z2325*l([36 37 38], [36 37 38]) * AH)) + trace(real(Z25R26*l([39 40], [39 40]))) + trace(real(A * Z2528*l([41 42 43], [41 42 43]) * AH)) + trace(real(Z2627*l([44 45], [44 45]))) + trace(real(Z2631*l([46], [46]))) + trace(real(Z2733*l([47], [47]))) + trace(real(A * Z2829*l([48 49 50], [48 49 50]) * AH)) + trace(real(A * Z2930*l([51 52 53], [51 52 53]) * AH)) + trace(real(A * Z30250*l([54 55 56], [54 55 56]) * AH)) + trace(real(Z3132*l([57], [57]))) + trace(real(Z3415*l([58], [58]))) + trace(real(Z3536*l([59 60], [59 60]))) + trace(real(A * Z3540*l([61 62 63], [61 62 63]) * AH)) + trace(real(Z3637*l([64], [64]))) + trace(real(Z3638*l([65], [65]))) + trace(real(Z3839*l([66], [66]))) + trace(real(Z4041*l([67], [67]))) + trace(real(A * Z4042*l([68 69 70], [68 69 70]) * AH)) + trace(real(Z4243*l([71], [71]))) + trace(real(A * Z4244*l([72 73 74], [72 73 74]) * AH)) + trace(real(Z4445*l([75], [75]))) + trace(real(A * Z4447*l([76 77 78], [76 77 78]) * AH)) + trace(real(Z4546*l([79], [79]))) + trace(real(A * Z4748*l([80 81 82], [80 81 82]) * AH)) + trace(real(A * Z4749*l([83 84 85], [83 84 85]) * AH)) + trace(real(A * Z4950*l([86 87 88], [86 87 88]) * AH)) + trace(real(A * Z5051*l([89 90 91], [89 90 91]) * AH)) + trace(real(A * Z5253*l([92 93 94], [92 93 94]) * AH)) + trace(real(A * Z5354*l([95 96 97], [95 96 97]) * AH)) + trace(real(A * Z5455*l([ 98  99 100], [ 98  99 100]) * AH)) + trace(real(A * Z5457*l([101 102 103], [101 102 103]) * AH)) + trace(real(A * Z5556*l([104 105 106], [104 105 106]) * AH)) + trace(real(Z5758*l([107], [107]))) + trace(real(A * Z5760*l([108 109 110], [108 109 110]) * AH)) + trace(real(Z5859*l([111], [111]))) + trace(real(A * Z6061*l([112 113 114], [112 113 114]) * AH)) + trace(real(A * Z6062*l([115 116 117], [115 116 117]) * AH)) + trace(real(A * Z6263*l([118 119 120], [118 119 120]) * AH)) + trace(real(A * Z6364*l([121 122 123], [121 122 123]) * AH)) + trace(real(A * Z6465*l([124 125 126], [124 125 126]) * AH)) + trace(real(A * Z6566*l([127 128 129], [127 128 129]) * AH)) + trace(real(Z6768*l([130], [130]))) + trace(real(A * Z6772*l([131 132 133], [131 132 133]) * AH)) + trace(real(A * Z6797*l([134 135 136], [134 135 136]) * AH)) + trace(real(Z6869*l([137], [137]))) + trace(real(Z6970*l([138], [138]))) + trace(real(Z7071*l([139], [139]))) + trace(real(Z7273*l([140], [140]))) + trace(real(A * Z7276*l([141 142 143], [141 142 143]) * AH)) + trace(real(Z7374*l([144], [144]))) + trace(real(Z7475*l([145], [145]))) + trace(real(A * Z7677*l([146 147 148], [146 147 148]) * AH)) + trace(real(A * Z7686*l([149 150 151], [149 150 151]) * AH)) + trace(real(A * Z7778*l([152 153 154], [152 153 154]) * AH)) + trace(real(A * Z7879*l([155 156 157], [155 156 157]) * AH)) + trace(real(A * Z7880*l([158 159 160], [158 159 160]) * AH)) + trace(real(A * Z8081*l([161 162 163], [161 162 163]) * AH)) + trace(real(A * Z8182*l([164 165 166], [164 165 166]) * AH)) + trace(real(Z8184*l([167], [167]))) + trace(real(A * Z8283*l([168 169 170], [168 169 170]) * AH)) + trace(real(Z8485*l([171], [171]))) + trace(real(A * Z8687*l([172 173 174], [172 173 174]) * AH)) + trace(real(Z8788*l([175], [175]))) + trace(real(A * Z8789*l([176 177 178], [176 177 178]) * AH)) + trace(real(Z8990*l([179], [179]))) + trace(real(A * Z8991*l([180 181 182], [180 181 182]) * AH)) + trace(real(Z9192*l([183], [183]))) + trace(real(A * Z9193*l([184 185 186], [184 185 186]) * AH)) + trace(real(Z9394*l([187], [187]))) + trace(real(A * Z9395*l([188 189 190], [188 189 190]) * AH)) + trace(real(Z9596*l([191], [191]))) + trace(real(A * Z9798*l([192 193 194], [192 193 194]) * AH)) + trace(real(A * Z9899*l([195 196 197], [195 196 197]) * AH)) + trace(real(A * Z99100*l([198 199 200], [198 199 200]) * AH)) + trace(real(A * Z100450*l([201 202 203], [201 202 203]) * AH)) + trace(real(Z101102*l([204], [204]))) + trace(real(A * Z101105*l([205 206 207], [205 206 207]) * AH)) + trace(real(Z102103*l([208], [208]))) + trace(real(Z103104*l([209], [209]))) + trace(real(Z105106*l([210], [210]))) + trace(real(A * Z105108*l([211 212 213], [211 212 213]) * AH)) + trace(real(Z106107*l([214], [214]))) + trace(real(Z108109*l([215], [215]))) + trace(real(A * Z108300*l([216 217 218], [216 217 218]) * AH)) + trace(real(Z109110*l([219], [219]))) + trace(real(Z110111*l([220], [220]))) + trace(real(Z110112*l([221], [221]))) + trace(real(Z112113*l([222], [222]))) + trace(real(Z113114*l([223], [223]))) + trace(real(A * Z13535*l([224 225 226], [224 225 226]) * AH)) + trace(real(A * Z1491*l([227 228 229], [227 228 229]) * AH)) + trace(real(A * Z15252*l([230 231 232], [230 231 232]) * AH)) + trace(real(A * Z160R67*l([233 234 235], [233 234 235]) * AH)) + trace(real(A * Z197101*l([236 237 238], [236 237 238]) * AH)) + trace(real(A * Z51151*l([239 240 241], [239 240 241]) * AH)) + trace(real(A * Z150150R*l([242 243 244], [242 243 244]) * AH)) + trace(real(Z99R*l([245], [245]))) + trace(real(Z2525R*l([246 247], [246 247]))) + trace(real(A * Z160160R*l([248 249 250], [248 249 250]) * AH)) + trace(real(A * Z61S610*l([251 252 253], [251 252 253]) * AH)) + trace(real(A * Z150R149*l([254 255 256], [254 255 256]) * AH)) + trace(real(A * Z13152*l([257 258 259], [257 258 259]) * AH)) + trace(real(A * Z18135*l([260 261 262], [260 261 262]) * AH)) + trace(real(A * Z60160*l([263 264 265], [263 264 265]) * AH)) + trace(real(A * Z97197*l([266 267 268], [266 267 268]) * AH)) + trace(real(A * Z6161S*l([269 270 271], [269 270 271]) * AH)) + trace(real(A * Z151300_OPEN*l([272 273 274], [272 273 274]) * AH)) + trace(real(Z5494_OPEN*l([275], [275]))) + 0);


Cons = [];


% constraints: 
% (1): voltage lower and upper bounds 
%{
Cons = [Cons, v_lb <= diag(v([4], [4])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([8], [8])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([ 9 10 11], [ 9 10 11]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([12], [12])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([13], [13])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([14], [14])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([15 16 17], [15 16 17]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([18], [18])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([22], [22])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([23 24 25], [23 24 25]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([26], [26])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([27], [27])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([31 32 33], [31 32 33]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([34], [34])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([35], [35])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([36], [36])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([37], [37])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([38], [38])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([42 43 44], [42 43 44]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([45], [45])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([46], [46])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([50 51 52], [50 51 52]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([53], [53])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([57 58 59], [57 58 59]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([60 61], [60 61])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([62 63 64], [62 63 64]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([65 66], [65 66])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([67], [67])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([68], [68])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([69 70 71], [69 70 71]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([72 73 74], [72 73 74]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([75 76 77], [75 76 77]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([78], [78])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([79], [79])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([80 81], [80 81])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([85 86 87], [85 86 87]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([88], [88])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([89], [89])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([90], [90])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([91], [91])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([95 96 97], [95 96 97]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([98], [98])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([102 103 104], [102 103 104]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([105], [105])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([109 110 111], [109 110 111]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([112], [112])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([113 114 115], [113 114 115]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([116 117 118], [116 117 118]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([119 120 121], [119 120 121]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([122 123 124], [122 123 124]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([125 126 127], [125 126 127]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([128 129 130], [128 129 130]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([131 132 133], [131 132 133]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([134 135 136], [134 135 136]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([137 138 139], [137 138 139]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([140], [140])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([144 145 146], [144 145 146]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([147], [147])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([148 149 150], [148 149 150]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([151 152 153], [151 152 153]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([154 155 156], [154 155 156]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([157 158 159], [157 158 159]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([160 161 162], [160 161 162]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([163 164 165], [163 164 165]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([166], [166])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([170 171 172], [170 171 172]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([173 174 175], [173 174 175]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([176], [176])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([177], [177])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([178], [178])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([179], [179])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([183 184 185], [183 184 185]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([186], [186])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([187], [187])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([188 189 190], [188 189 190]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([191 192 193], [191 192 193]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([194 195 196], [194 195 196]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([197 198 199], [197 198 199]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([200 201 202], [200 201 202]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([203 204 205], [203 204 205]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([206 207 208], [206 207 208]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([209], [209])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([213 214 215], [213 214 215]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([216], [216])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([217 218 219], [217 218 219]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([220], [220])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([224 225 226], [224 225 226]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([227], [227])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([231 232 233], [231 232 233]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([234], [234])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([238 239 240], [238 239 240]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([241], [241])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([245 246 247], [245 246 247]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([248], [248])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([252 253 254], [252 253 254]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([255 256 257], [255 256 257]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([258 259 260], [258 259 260]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([261 262 263], [261 262 263]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([264], [264])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([268 269 270], [268 269 270]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([271], [271])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([272], [272])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([273], [273])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([277 278 279], [277 278 279]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([280], [280])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([281], [281])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([285 286 287], [285 286 287]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([288], [288])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([289], [289])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([290], [290])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([291], [291])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([292], [292])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([293 294 295], [293 294 295]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([296 297 298], [296 297 298]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([299 300 301], [299 300 301]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([302 303 304], [302 303 304]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([305 306 307], [305 306 307]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([308 309 310], [308 309 310]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([311 312 313], [311 312 313]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([314], [314])) <= v_ub];
Cons = [Cons, v_lb <= diag(v([315 316], [315 316])) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([320 321 322], [320 321 322]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([323 324 325], [323 324 325]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([326 327 328], [326 327 328]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([329 330 331], [329 330 331]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([332 333 334], [332 333 334]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([335 336 337], [335 336 337]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([338 339 340], [338 339 340]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([341 342 343], [341 342 343]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(A * v([344 345 346], [344 345 346]) * ctranspose(A)) <= v_ub];
Cons = [Cons, v_lb <= diag(v([347], [347])) <= v_ub];
%}
Cons = [Cons, v(1:3, 1:3) == v0 * ctranspose(v0)];

% (1): voltage across a line 
Cons = [Cons, v([4], [4]) == v([6], [6]) - S1([1], 1:1)*ctranspose(Z12) - Z12*ctranspose(S1([1], 1:1)) + Z12*l([1], [1])*ctranspose(Z12)];
Cons = [Cons, [v([6], [6]), S1([1], 1:1); ctranspose(S1([1], 1:1)), l([1], [1])] >= 0];
Cons = [Cons, diag(S1([1], 1:1)-Z12*l([1], [1]))- loads([13]) + diag(v([4], [4]) * Cbus([13],[13])) == 0];

Cons = [Cons, v([8], [8]) == v([7], [7]) - S1([2], 1:1)*ctranspose(Z13) - Z13*ctranspose(S1([2], 1:1)) + Z13*l([2], [2])*ctranspose(Z13)];
Cons = [Cons, [v([7], [7]), S1([2], 1:1); ctranspose(S1([2], 1:1)), l([2], [2])] >= 0];
Cons = [Cons, diag(S1([2], 1:1)-Z13*l([2], [2]))- loads([14]) + diag(v([8], [8]) * Cbus([14],[14])) == diag(S1([3], 1:1)) + diag(S1([4], 1:1)) + 0];

Cons = [Cons, v([ 9 10 11], [ 9 10 11]) == v([296 297 298], [296 297 298]) - S3([1 2 3], 1:3)*ctranspose(Z17) - Z17*ctranspose(S3([1 2 3], 1:3)) + Z17*l([3 4 5], [3 4 5])*ctranspose(Z17)];
Cons = [Cons, [v([296 297 298], [296 297 298]), S3([1 2 3], 1:3); ctranspose(S3([1 2 3], 1:3)), l([3 4 5], [3 4 5])] >= 0];
Cons = [Cons, diag(A *(S3([1 2 3], 1:3)-Z17*l([3 4 5], [3 4 5])) * AH)- loads([15, 16, 17]) + diag(A * v([ 9 10 11], [ 9 10 11]) * Cbus([15, 16, 17],[15, 16, 17]) * AH) == diag(A * S3([4 5 6], 1:3) * AH) + 0];

Cons = [Cons, v([12], [12]) == v([8], [8]) - S1([3], 1:1)*ctranspose(Z34) - Z34*ctranspose(S1([3], 1:1)) + Z34*l([6], [6])*ctranspose(Z34)];
Cons = [Cons, [v([8], [8]), S1([3], 1:1); ctranspose(S1([3], 1:1)), l([6], [6])] >= 0];
Cons = [Cons, diag(S1([3], 1:1)-Z34*l([6], [6]))- loads([18]) + diag(v([12], [12]) * Cbus([18],[18])) == 0];

Cons = [Cons, v([13], [13]) == v([8], [8]) - S1([4], 1:1)*ctranspose(Z35) - Z35*ctranspose(S1([4], 1:1)) + Z35*l([7], [7])*ctranspose(Z35)];
Cons = [Cons, [v([8], [8]), S1([4], 1:1); ctranspose(S1([4], 1:1)), l([7], [7])] >= 0];
Cons = [Cons, diag(S1([4], 1:1)-Z35*l([7], [7]))- loads([19]) + diag(v([13], [13]) * Cbus([19],[19])) == diag(S1([5], 1:1)) + 0];

Cons = [Cons, v([14], [14]) == v([13], [13]) - S1([5], 1:1)*ctranspose(Z56) - Z56*ctranspose(S1([5], 1:1)) + Z56*l([8], [8])*ctranspose(Z56)];
Cons = [Cons, [v([13], [13]), S1([5], 1:1); ctranspose(S1([5], 1:1)), l([8], [8])] >= 0];
Cons = [Cons, diag(S1([5], 1:1)-Z56*l([8], [8]))- loads([20]) + diag(v([14], [14]) * Cbus([20],[20])) == 0];

Cons = [Cons, v([15 16 17], [15 16 17]) == v([ 9 10 11], [ 9 10 11]) - S3([4 5 6], 1:3)*ctranspose(Z78) - Z78*ctranspose(S3([4 5 6], 1:3)) + Z78*l([ 9 10 11], [ 9 10 11])*ctranspose(Z78)];
Cons = [Cons, [v([ 9 10 11], [ 9 10 11]), S3([4 5 6], 1:3); ctranspose(S3([4 5 6], 1:3)), l([ 9 10 11], [ 9 10 11])] >= 0];
Cons = [Cons, diag(A *(S3([4 5 6], 1:3)-Z78*l([ 9 10 11], [ 9 10 11])) * AH)- loads([21, 22, 23]) + diag(A * v([15 16 17], [15 16 17]) * Cbus([21, 22, 23],[21, 22, 23]) * AH) == [0; diag(S1([6], 1:1)); 0] + [diag(S1([7], 1:1)); 0; 0] + diag(A * S3([7 8 9], 1:3) * AH) + 0];

Cons = [Cons, v([18], [18]) == v([20], [20]) - S1([6], 1:1)*ctranspose(Z812) - Z812*ctranspose(S1([6], 1:1)) + Z812*l([12], [12])*ctranspose(Z812)];
Cons = [Cons, [v([20], [20]), S1([6], 1:1); ctranspose(S1([6], 1:1)), l([12], [12])] >= 0];
Cons = [Cons, diag(S1([6], 1:1)-Z812*l([12], [12]))- loads([24]) + diag(v([18], [18]) * Cbus([24],[24])) == 0];

Cons = [Cons, v([22], [22]) == v([19], [19]) - S1([7], 1:1)*ctranspose(Z89) - Z89*ctranspose(S1([7], 1:1)) + Z89*l([13], [13])*ctranspose(Z89)];
Cons = [Cons, [v([19], [19]), S1([7], 1:1); ctranspose(S1([7], 1:1)), l([13], [13])] >= 0];
Cons = [Cons, diag(S1([7], 1:1)-Z89*l([13], [13]))- loads([25]) + diag(v([22], [22]) * Cbus([25],[25])) == diag(S1([56], 1:1)) + 0];

Cons = [Cons, v([23 24 25], [23 24 25]) == v([15 16 17], [15 16 17]) - S3([7 8 9], 1:3)*ctranspose(Z813) - Z813*ctranspose(S3([7 8 9], 1:3)) + Z813*l([14 15 16], [14 15 16])*ctranspose(Z813)];
Cons = [Cons, [v([15 16 17], [15 16 17]), S3([7 8 9], 1:3); ctranspose(S3([7 8 9], 1:3)), l([14 15 16], [14 15 16])] >= 0];
Cons = [Cons, diag(A *(S3([7 8 9], 1:3)-Z813*l([14 15 16], [14 15 16])) * AH)- loads([26, 27, 28]) + diag(A * v([23 24 25], [23 24 25]) * Cbus([26, 27, 28],[26, 27, 28]) * AH) == [0; 0; diag(S1([9], 1:1))] + diag(A * S3([10 11 12], 1:3) * AH) + diag(A * S3([193 194 195], 1:3) * AH) + 0];

Cons = [Cons, v([26], [26]) == v([314], [314]) - S1([8], 1:1)*ctranspose(Z9R14) - Z9R14*ctranspose(S1([8], 1:1)) + Z9R14*l([17], [17])*ctranspose(Z9R14)];
Cons = [Cons, [v([314], [314]), S1([8], 1:1); ctranspose(S1([8], 1:1)), l([17], [17])] >= 0];
Cons = [Cons, diag(S1([8], 1:1)-Z9R14*l([17], [17]))- loads([30]) + diag(v([26], [26]) * Cbus([30],[30])) == diag(S1([10], 1:1)) + diag(S1([11], 1:1)) + 0];

Cons = [Cons, v([27], [27]) == v([30], [30]) - S1([9], 1:1)*ctranspose(Z1334) - Z1334*ctranspose(S1([9], 1:1)) + Z1334*l([18], [18])*ctranspose(Z1334)];
Cons = [Cons, [v([30], [30]), S1([9], 1:1); ctranspose(S1([9], 1:1)), l([18], [18])] >= 0];
Cons = [Cons, diag(S1([9], 1:1)-Z1334*l([18], [18]))- loads([31]) + diag(v([27], [27]) * Cbus([31],[31])) == diag(S1([21], 1:1)) + 0];

Cons = [Cons, v([31 32 33], [31 32 33]) == v([23 24 25], [23 24 25]) - S3([10 11 12], 1:3)*ctranspose(Z1318) - Z1318*ctranspose(S3([10 11 12], 1:3)) + Z1318*l([19 20 21], [19 20 21])*ctranspose(Z1318)];
Cons = [Cons, [v([23 24 25], [23 24 25]), S3([10 11 12], 1:3); ctranspose(S3([10 11 12], 1:3)), l([19 20 21], [19 20 21])] >= 0];
Cons = [Cons, diag(A *(S3([10 11 12], 1:3)-Z1318*l([19 20 21], [19 20 21])) * AH)- loads([32, 33, 34]) + diag(A * v([31 32 33], [31 32 33]) * Cbus([32, 33, 34],[32, 33, 34]) * AH) == [diag(S1([14], 1:1)); 0; 0] + diag(A * S3([13 14 15], 1:3) * AH) + diag(A * S3([196 197 198], 1:3) * AH) + 0];

Cons = [Cons, v([34], [34]) == v([26], [26]) - S1([10], 1:1)*ctranspose(Z1411) - Z1411*ctranspose(S1([10], 1:1)) + Z1411*l([22], [22])*ctranspose(Z1411)];
Cons = [Cons, [v([26], [26]), S1([10], 1:1); ctranspose(S1([10], 1:1)), l([22], [22])] >= 0];
Cons = [Cons, diag(S1([10], 1:1)-Z1411*l([22], [22]))- loads([35]) + diag(v([34], [34]) * Cbus([35],[35])) == 0];

Cons = [Cons, v([35], [35]) == v([26], [26]) - S1([11], 1:1)*ctranspose(Z1410) - Z1410*ctranspose(S1([11], 1:1)) + Z1410*l([23], [23])*ctranspose(Z1410)];
Cons = [Cons, [v([26], [26]), S1([11], 1:1); ctranspose(S1([11], 1:1)), l([23], [23])] >= 0];
Cons = [Cons, diag(S1([11], 1:1)-Z1410*l([23], [23]))- loads([36]) + diag(v([35], [35]) * Cbus([36],[36])) == 0];

Cons = [Cons, v([36], [36]) == v([79], [79]) - S1([12], 1:1)*ctranspose(Z1516) - Z1516*ctranspose(S1([12], 1:1)) + Z1516*l([24], [24])*ctranspose(Z1516)];
Cons = [Cons, [v([79], [79]), S1([12], 1:1); ctranspose(S1([12], 1:1)), l([24], [24])] >= 0];
Cons = [Cons, diag(S1([12], 1:1)-Z1516*l([24], [24]))- loads([38]) + diag(v([36], [36]) * Cbus([38],[38])) == 0];

Cons = [Cons, v([37], [37]) == v([79], [79]) - S1([13], 1:1)*ctranspose(Z1517) - Z1517*ctranspose(S1([13], 1:1)) + Z1517*l([25], [25])*ctranspose(Z1517)];
Cons = [Cons, [v([79], [79]), S1([13], 1:1); ctranspose(S1([13], 1:1)), l([25], [25])] >= 0];
Cons = [Cons, diag(S1([13], 1:1)-Z1517*l([25], [25]))- loads([39]) + diag(v([37], [37]) * Cbus([39],[39])) == 0];

Cons = [Cons, v([38], [38]) == v([39], [39]) - S1([14], 1:1)*ctranspose(Z1819) - Z1819*ctranspose(S1([14], 1:1)) + Z1819*l([26], [26])*ctranspose(Z1819)];
Cons = [Cons, [v([39], [39]), S1([14], 1:1); ctranspose(S1([14], 1:1)), l([26], [26])] >= 0];
Cons = [Cons, diag(S1([14], 1:1)-Z1819*l([26], [26]))- loads([40]) + diag(v([38], [38]) * Cbus([40],[40])) == diag(S1([15], 1:1)) + 0];

Cons = [Cons, v([42 43 44], [42 43 44]) == v([31 32 33], [31 32 33]) - S3([13 14 15], 1:3)*ctranspose(Z1821) - Z1821*ctranspose(S3([13 14 15], 1:3)) + Z1821*l([27 28 29], [27 28 29])*ctranspose(Z1821)];
Cons = [Cons, [v([31 32 33], [31 32 33]), S3([13 14 15], 1:3); ctranspose(S3([13 14 15], 1:3)), l([27 28 29], [27 28 29])] >= 0];
Cons = [Cons, diag(A *(S3([13 14 15], 1:3)-Z1821*l([27 28 29], [27 28 29])) * AH)- loads([41, 42, 43]) + diag(A * v([42 43 44], [42 43 44]) * Cbus([41, 42, 43],[41, 42, 43]) * AH) == [0; diag(S1([16], 1:1)); 0] + diag(A * S3([16 17 18], 1:3) * AH) + 0];

Cons = [Cons, v([45], [45]) == v([38], [38]) - S1([15], 1:1)*ctranspose(Z1920) - Z1920*ctranspose(S1([15], 1:1)) + Z1920*l([30], [30])*ctranspose(Z1920)];
Cons = [Cons, [v([38], [38]), S1([15], 1:1); ctranspose(S1([15], 1:1)), l([30], [30])] >= 0];
Cons = [Cons, diag(S1([15], 1:1)-Z1920*l([30], [30]))- loads([44]) + diag(v([45], [45]) * Cbus([44],[44])) == 0];

Cons = [Cons, v([46], [46]) == v([48], [48]) - S1([16], 1:1)*ctranspose(Z2122) - Z2122*ctranspose(S1([16], 1:1)) + Z2122*l([31], [31])*ctranspose(Z2122)];
Cons = [Cons, [v([48], [48]), S1([16], 1:1); ctranspose(S1([16], 1:1)), l([31], [31])] >= 0];
Cons = [Cons, diag(S1([16], 1:1)-Z2122*l([31], [31]))- loads([45]) + diag(v([46], [46]) * Cbus([45],[45])) == 0];

Cons = [Cons, v([50 51 52], [50 51 52]) == v([42 43 44], [42 43 44]) - S3([16 17 18], 1:3)*ctranspose(Z2123) - Z2123*ctranspose(S3([16 17 18], 1:3)) + Z2123*l([32 33 34], [32 33 34])*ctranspose(Z2123)];
Cons = [Cons, [v([42 43 44], [42 43 44]), S3([16 17 18], 1:3); ctranspose(S3([16 17 18], 1:3)), l([32 33 34], [32 33 34])] >= 0];
Cons = [Cons, diag(A *(S3([16 17 18], 1:3)-Z2123*l([32 33 34], [32 33 34])) * AH)- loads([46, 47, 48]) + diag(A * v([50 51 52], [50 51 52]) * Cbus([46, 47, 48],[46, 47, 48]) * AH) == [0; 0; diag(S1([17], 1:1))] + diag(A * S3([19 20 21], 1:3) * AH) + 0];

Cons = [Cons, v([53], [53]) == v([56], [56]) - S1([17], 1:1)*ctranspose(Z2324) - Z2324*ctranspose(S1([17], 1:1)) + Z2324*l([35], [35])*ctranspose(Z2324)];
Cons = [Cons, [v([56], [56]), S1([17], 1:1); ctranspose(S1([17], 1:1)), l([35], [35])] >= 0];
Cons = [Cons, diag(S1([17], 1:1)-Z2324*l([35], [35]))- loads([49]) + diag(v([53], [53]) * Cbus([49],[49])) == 0];

Cons = [Cons, v([57 58 59], [57 58 59]) == v([50 51 52], [50 51 52]) - S3([19 20 21], 1:3)*ctranspose(Z2325) - Z2325*ctranspose(S3([19 20 21], 1:3)) + Z2325*l([36 37 38], [36 37 38])*ctranspose(Z2325)];
Cons = [Cons, [v([50 51 52], [50 51 52]), S3([19 20 21], 1:3); ctranspose(S3([19 20 21], 1:3)), l([36 37 38], [36 37 38])] >= 0];
Cons = [Cons, diag(A *(S3([19 20 21], 1:3)-Z2325*l([36 37 38], [36 37 38])) * AH)- loads([50, 51, 52]) + diag(A * v([57 58 59], [57 58 59]) * Cbus([50, 51, 52],[50, 51, 52]) * AH) == diag(A * S3([22 23 24], 1:3) * AH) + [S2(7, 1 ); 0; S2(8, 2 )] + 0];

Cons = [Cons, v([60 61], [60 61]) == v([315 316], [315 316]) - S2([1 2], 1:2)*ctranspose(Z25R26) - Z25R26*ctranspose(S2([1 2], 1:2)) + Z25R26*l([39 40], [39 40])*ctranspose(Z25R26)];
Cons = [Cons, [v([315 316], [315 316]), S2([1 2], 1:2); ctranspose(S2([1 2], 1:2)), l([39 40], [39 40])] >= 0];
Cons = [Cons, diag(S2([1 2], 1:2)-Z25R26*l([39 40], [39 40]))- loads([55, 56]) + diag(v([60 61], [60 61]) * Cbus([55, 56],[55, 56])) == diag(S2([3 4], 1:2)) + [0; diag(S1([18], 1:1))] + 0];

Cons = [Cons, v([62 63 64], [62 63 64]) == v([57 58 59], [57 58 59]) - S3([22 23 24], 1:3)*ctranspose(Z2528) - Z2528*ctranspose(S3([22 23 24], 1:3)) + Z2528*l([41 42 43], [41 42 43])*ctranspose(Z2528)];
Cons = [Cons, [v([57 58 59], [57 58 59]), S3([22 23 24], 1:3); ctranspose(S3([22 23 24], 1:3)), l([41 42 43], [41 42 43])] >= 0];
Cons = [Cons, diag(A *(S3([22 23 24], 1:3)-Z2528*l([41 42 43], [41 42 43])) * AH)- loads([57, 58, 59]) + diag(A * v([62 63 64], [62 63 64]) * Cbus([57, 58, 59],[57, 58, 59]) * AH) == diag(A * S3([25 26 27], 1:3) * AH) + 0];

Cons = [Cons, v([65 66], [65 66]) == v([60 61], [60 61]) - S2([3 4], 1:2)*ctranspose(Z2627) - Z2627*ctranspose(S2([3 4], 1:2)) + Z2627*l([44 45], [44 45])*ctranspose(Z2627)];
Cons = [Cons, [v([60 61], [60 61]), S2([3 4], 1:2); ctranspose(S2([3 4], 1:2)), l([44 45], [44 45])] >= 0];
Cons = [Cons, diag(S2([3 4], 1:2)-Z2627*l([44 45], [44 45]))- loads([60, 61]) + diag(v([65 66], [65 66]) * Cbus([60, 61],[60, 61])) == [diag(S1([19], 1:1)); 0] + 0];

Cons = [Cons, v([67], [67]) == v([61], [61]) - S1([18], 1:1)*ctranspose(Z2631) - Z2631*ctranspose(S1([18], 1:1)) + Z2631*l([46], [46])*ctranspose(Z2631)];
Cons = [Cons, [v([61], [61]), S1([18], 1:1); ctranspose(S1([18], 1:1)), l([46], [46])] >= 0];
Cons = [Cons, diag(S1([18], 1:1)-Z2631*l([46], [46]))- loads([62]) + diag(v([67], [67]) * Cbus([62],[62])) == diag(S1([20], 1:1)) + 0];

Cons = [Cons, v([68], [68]) == v([65], [65]) - S1([19], 1:1)*ctranspose(Z2733) - Z2733*ctranspose(S1([19], 1:1)) + Z2733*l([47], [47])*ctranspose(Z2733)];
Cons = [Cons, [v([65], [65]), S1([19], 1:1); ctranspose(S1([19], 1:1)), l([47], [47])] >= 0];
Cons = [Cons, diag(S1([19], 1:1)-Z2733*l([47], [47]))- loads([63]) + diag(v([68], [68]) * Cbus([63],[63])) == 0];

Cons = [Cons, v([69 70 71], [69 70 71]) == v([62 63 64], [62 63 64]) - S3([25 26 27], 1:3)*ctranspose(Z2829) - Z2829*ctranspose(S3([25 26 27], 1:3)) + Z2829*l([48 49 50], [48 49 50])*ctranspose(Z2829)];
Cons = [Cons, [v([62 63 64], [62 63 64]), S3([25 26 27], 1:3); ctranspose(S3([25 26 27], 1:3)), l([48 49 50], [48 49 50])] >= 0];
Cons = [Cons, diag(A *(S3([25 26 27], 1:3)-Z2829*l([48 49 50], [48 49 50])) * AH)- loads([64, 65, 66]) + diag(A * v([69 70 71], [69 70 71]) * Cbus([64, 65, 66],[64, 65, 66]) * AH) == diag(A * S3([28 29 30], 1:3) * AH) + 0];

Cons = [Cons, v([72 73 74], [72 73 74]) == v([69 70 71], [69 70 71]) - S3([28 29 30], 1:3)*ctranspose(Z2930) - Z2930*ctranspose(S3([28 29 30], 1:3)) + Z2930*l([51 52 53], [51 52 53])*ctranspose(Z2930)];
Cons = [Cons, [v([69 70 71], [69 70 71]), S3([28 29 30], 1:3); ctranspose(S3([28 29 30], 1:3)), l([51 52 53], [51 52 53])] >= 0];
Cons = [Cons, diag(A *(S3([28 29 30], 1:3)-Z2930*l([51 52 53], [51 52 53])) * AH)- loads([67, 68, 69]) + diag(A * v([72 73 74], [72 73 74]) * Cbus([67, 68, 69],[67, 68, 69]) * AH) == diag(A * S3([31 32 33], 1:3) * AH) + 0];

Cons = [Cons, v([75 76 77], [75 76 77]) == v([72 73 74], [72 73 74]) - S3([31 32 33], 1:3)*ctranspose(Z30250) - Z30250*ctranspose(S3([31 32 33], 1:3)) + Z30250*l([54 55 56], [54 55 56])*ctranspose(Z30250)];
Cons = [Cons, [v([72 73 74], [72 73 74]), S3([31 32 33], 1:3); ctranspose(S3([31 32 33], 1:3)), l([54 55 56], [54 55 56])] >= 0];
Cons = [Cons, diag(A *(S3([31 32 33], 1:3)-Z30250*l([54 55 56], [54 55 56])) * AH)- loads([70, 71, 72]) + diag(A * v([75 76 77], [75 76 77]) * Cbus([70, 71, 72],[70, 71, 72]) * AH) == 0];

Cons = [Cons, v([78], [78]) == v([67], [67]) - S1([20], 1:1)*ctranspose(Z3132) - Z3132*ctranspose(S1([20], 1:1)) + Z3132*l([57], [57])*ctranspose(Z3132)];
Cons = [Cons, [v([67], [67]), S1([20], 1:1); ctranspose(S1([20], 1:1)), l([57], [57])] >= 0];
Cons = [Cons, diag(S1([20], 1:1)-Z3132*l([57], [57]))- loads([73]) + diag(v([78], [78]) * Cbus([73],[73])) == 0];

Cons = [Cons, v([79], [79]) == v([27], [27]) - S1([21], 1:1)*ctranspose(Z3415) - Z3415*ctranspose(S1([21], 1:1)) + Z3415*l([58], [58])*ctranspose(Z3415)];
Cons = [Cons, [v([27], [27]), S1([21], 1:1); ctranspose(S1([21], 1:1)), l([58], [58])] >= 0];
Cons = [Cons, diag(S1([21], 1:1)-Z3415*l([58], [58]))- loads([37]) + diag(v([79], [79]) * Cbus([37],[37])) == diag(S1([12], 1:1)) + diag(S1([13], 1:1)) + 0];

Cons = [Cons, v([80 81], [80 81]) == v([82 83], [82 83]) - S2([5 6], 1:2)*ctranspose(Z3536) - Z3536*ctranspose(S2([5 6], 1:2)) + Z3536*l([59 60], [59 60])*ctranspose(Z3536)];
Cons = [Cons, [v([82 83], [82 83]), S2([5 6], 1:2); ctranspose(S2([5 6], 1:2)), l([59 60], [59 60])] >= 0];
Cons = [Cons, diag(S2([5 6], 1:2)-Z3536*l([59 60], [59 60]))- loads([76, 77]) + diag(v([80 81], [80 81]) * Cbus([76, 77],[76, 77])) == [diag(S1([22], 1:1)); 0] + [0; diag(S1([23], 1:1))] + 0];

Cons = [Cons, v([85 86 87], [85 86 87]) == v([293 294 295], [293 294 295]) - S3([34 35 36], 1:3)*ctranspose(Z3540) - Z3540*ctranspose(S3([34 35 36], 1:3)) + Z3540*l([61 62 63], [61 62 63])*ctranspose(Z3540)];
Cons = [Cons, [v([293 294 295], [293 294 295]), S3([34 35 36], 1:3); ctranspose(S3([34 35 36], 1:3)), l([61 62 63], [61 62 63])] >= 0];
Cons = [Cons, diag(A *(S3([34 35 36], 1:3)-Z3540*l([61 62 63], [61 62 63])) * AH)- loads([79, 80, 81]) + diag(A * v([85 86 87], [85 86 87]) * Cbus([79, 80, 81],[79, 80, 81]) * AH) == [0; 0; diag(S1([25], 1:1))] + diag(A * S3([37 38 39], 1:3) * AH) + 0];

Cons = [Cons, v([88], [88]) == v([80], [80]) - S1([22], 1:1)*ctranspose(Z3637) - Z3637*ctranspose(S1([22], 1:1)) + Z3637*l([64], [64])*ctranspose(Z3637)];
Cons = [Cons, [v([80], [80]), S1([22], 1:1); ctranspose(S1([22], 1:1)), l([64], [64])] >= 0];
Cons = [Cons, diag(S1([22], 1:1)-Z3637*l([64], [64]))- loads([82]) + diag(v([88], [88]) * Cbus([82],[82])) == 0];

Cons = [Cons, v([89], [89]) == v([81], [81]) - S1([23], 1:1)*ctranspose(Z3638) - Z3638*ctranspose(S1([23], 1:1)) + Z3638*l([65], [65])*ctranspose(Z3638)];
Cons = [Cons, [v([81], [81]), S1([23], 1:1); ctranspose(S1([23], 1:1)), l([65], [65])] >= 0];
Cons = [Cons, diag(S1([23], 1:1)-Z3638*l([65], [65]))- loads([83]) + diag(v([89], [89]) * Cbus([83],[83])) == diag(S1([24], 1:1)) + 0];

Cons = [Cons, v([90], [90]) == v([89], [89]) - S1([24], 1:1)*ctranspose(Z3839) - Z3839*ctranspose(S1([24], 1:1)) + Z3839*l([66], [66])*ctranspose(Z3839)];
Cons = [Cons, [v([89], [89]), S1([24], 1:1); ctranspose(S1([24], 1:1)), l([66], [66])] >= 0];
Cons = [Cons, diag(S1([24], 1:1)-Z3839*l([66], [66]))- loads([84]) + diag(v([90], [90]) * Cbus([84],[84])) == 0];

Cons = [Cons, v([91], [91]) == v([94], [94]) - S1([25], 1:1)*ctranspose(Z4041) - Z4041*ctranspose(S1([25], 1:1)) + Z4041*l([67], [67])*ctranspose(Z4041)];
Cons = [Cons, [v([94], [94]), S1([25], 1:1); ctranspose(S1([25], 1:1)), l([67], [67])] >= 0];
Cons = [Cons, diag(S1([25], 1:1)-Z4041*l([67], [67]))- loads([85]) + diag(v([91], [91]) * Cbus([85],[85])) == 0];

Cons = [Cons, v([95 96 97], [95 96 97]) == v([85 86 87], [85 86 87]) - S3([37 38 39], 1:3)*ctranspose(Z4042) - Z4042*ctranspose(S3([37 38 39], 1:3)) + Z4042*l([68 69 70], [68 69 70])*ctranspose(Z4042)];
Cons = [Cons, [v([85 86 87], [85 86 87]), S3([37 38 39], 1:3); ctranspose(S3([37 38 39], 1:3)), l([68 69 70], [68 69 70])] >= 0];
Cons = [Cons, diag(A *(S3([37 38 39], 1:3)-Z4042*l([68 69 70], [68 69 70])) * AH)- loads([86, 87, 88]) + diag(A * v([95 96 97], [95 96 97]) * Cbus([86, 87, 88],[86, 87, 88]) * AH) == [0; diag(S1([26], 1:1)); 0] + diag(A * S3([40 41 42], 1:3) * AH) + 0];

Cons = [Cons, v([98], [98]) == v([100], [100]) - S1([26], 1:1)*ctranspose(Z4243) - Z4243*ctranspose(S1([26], 1:1)) + Z4243*l([71], [71])*ctranspose(Z4243)];
Cons = [Cons, [v([100], [100]), S1([26], 1:1); ctranspose(S1([26], 1:1)), l([71], [71])] >= 0];
Cons = [Cons, diag(S1([26], 1:1)-Z4243*l([71], [71]))- loads([89]) + diag(v([98], [98]) * Cbus([89],[89])) == 0];

Cons = [Cons, v([102 103 104], [102 103 104]) == v([95 96 97], [95 96 97]) - S3([40 41 42], 1:3)*ctranspose(Z4244) - Z4244*ctranspose(S3([40 41 42], 1:3)) + Z4244*l([72 73 74], [72 73 74])*ctranspose(Z4244)];
Cons = [Cons, [v([95 96 97], [95 96 97]), S3([40 41 42], 1:3); ctranspose(S3([40 41 42], 1:3)), l([72 73 74], [72 73 74])] >= 0];
Cons = [Cons, diag(A *(S3([40 41 42], 1:3)-Z4244*l([72 73 74], [72 73 74])) * AH)- loads([90, 91, 92]) + diag(A * v([102 103 104], [102 103 104]) * Cbus([90, 91, 92],[90, 91, 92]) * AH) == [diag(S1([27], 1:1)); 0; 0] + diag(A * S3([43 44 45], 1:3) * AH) + 0];

Cons = [Cons, v([105], [105]) == v([106], [106]) - S1([27], 1:1)*ctranspose(Z4445) - Z4445*ctranspose(S1([27], 1:1)) + Z4445*l([75], [75])*ctranspose(Z4445)];
Cons = [Cons, [v([106], [106]), S1([27], 1:1); ctranspose(S1([27], 1:1)), l([75], [75])] >= 0];
Cons = [Cons, diag(S1([27], 1:1)-Z4445*l([75], [75]))- loads([93]) + diag(v([105], [105]) * Cbus([93],[93])) == diag(S1([28], 1:1)) + 0];

Cons = [Cons, v([109 110 111], [109 110 111]) == v([102 103 104], [102 103 104]) - S3([43 44 45], 1:3)*ctranspose(Z4447) - Z4447*ctranspose(S3([43 44 45], 1:3)) + Z4447*l([76 77 78], [76 77 78])*ctranspose(Z4447)];
Cons = [Cons, [v([102 103 104], [102 103 104]), S3([43 44 45], 1:3); ctranspose(S3([43 44 45], 1:3)), l([76 77 78], [76 77 78])] >= 0];
Cons = [Cons, diag(A *(S3([43 44 45], 1:3)-Z4447*l([76 77 78], [76 77 78])) * AH)- loads([94, 95, 96]) + diag(A * v([109 110 111], [109 110 111]) * Cbus([94, 95, 96],[94, 95, 96]) * AH) == diag(A * S3([46 47 48], 1:3) * AH) + diag(A * S3([49 50 51], 1:3) * AH) + 0];

Cons = [Cons, v([112], [112]) == v([105], [105]) - S1([28], 1:1)*ctranspose(Z4546) - Z4546*ctranspose(S1([28], 1:1)) + Z4546*l([79], [79])*ctranspose(Z4546)];
Cons = [Cons, [v([105], [105]), S1([28], 1:1); ctranspose(S1([28], 1:1)), l([79], [79])] >= 0];
Cons = [Cons, diag(S1([28], 1:1)-Z4546*l([79], [79]))- loads([97]) + diag(v([112], [112]) * Cbus([97],[97])) == 0];

Cons = [Cons, v([113 114 115], [113 114 115]) == v([109 110 111], [109 110 111]) - S3([46 47 48], 1:3)*ctranspose(Z4748) - Z4748*ctranspose(S3([46 47 48], 1:3)) + Z4748*l([80 81 82], [80 81 82])*ctranspose(Z4748)];
Cons = [Cons, [v([109 110 111], [109 110 111]), S3([46 47 48], 1:3); ctranspose(S3([46 47 48], 1:3)), l([80 81 82], [80 81 82])] >= 0];
Cons = [Cons, diag(A *(S3([46 47 48], 1:3)-Z4748*l([80 81 82], [80 81 82])) * AH)- loads([98, 99, 100]) + diag(A * v([113 114 115], [113 114 115]) * Cbus([98, 99, 100],[98, 99, 100]) * AH) == 0];

Cons = [Cons, v([116 117 118], [116 117 118]) == v([109 110 111], [109 110 111]) - S3([49 50 51], 1:3)*ctranspose(Z4749) - Z4749*ctranspose(S3([49 50 51], 1:3)) + Z4749*l([83 84 85], [83 84 85])*ctranspose(Z4749)];
Cons = [Cons, [v([109 110 111], [109 110 111]), S3([49 50 51], 1:3); ctranspose(S3([49 50 51], 1:3)), l([83 84 85], [83 84 85])] >= 0];
Cons = [Cons, diag(A *(S3([49 50 51], 1:3)-Z4749*l([83 84 85], [83 84 85])) * AH)- loads([101, 102, 103]) + diag(A * v([116 117 118], [116 117 118]) * Cbus([101, 102, 103],[101, 102, 103]) * AH) == diag(A * S3([52 53 54], 1:3) * AH) + 0];

Cons = [Cons, v([119 120 121], [119 120 121]) == v([116 117 118], [116 117 118]) - S3([52 53 54], 1:3)*ctranspose(Z4950) - Z4950*ctranspose(S3([52 53 54], 1:3)) + Z4950*l([86 87 88], [86 87 88])*ctranspose(Z4950)];
Cons = [Cons, [v([116 117 118], [116 117 118]), S3([52 53 54], 1:3); ctranspose(S3([52 53 54], 1:3)), l([86 87 88], [86 87 88])] >= 0];
Cons = [Cons, diag(A *(S3([52 53 54], 1:3)-Z4950*l([86 87 88], [86 87 88])) * AH)- loads([104, 105, 106]) + diag(A * v([119 120 121], [119 120 121]) * Cbus([104, 105, 106],[104, 105, 106]) * AH) == diag(A * S3([55 56 57], 1:3) * AH) + 0];

Cons = [Cons, v([122 123 124], [122 123 124]) == v([119 120 121], [119 120 121]) - S3([55 56 57], 1:3)*ctranspose(Z5051) - Z5051*ctranspose(S3([55 56 57], 1:3)) + Z5051*l([89 90 91], [89 90 91])*ctranspose(Z5051)];
Cons = [Cons, [v([119 120 121], [119 120 121]), S3([55 56 57], 1:3); ctranspose(S3([55 56 57], 1:3)), l([89 90 91], [89 90 91])] >= 0];
Cons = [Cons, diag(A *(S3([55 56 57], 1:3)-Z5051*l([89 90 91], [89 90 91])) * AH)- loads([107, 108, 109]) + diag(A * v([122 123 124], [122 123 124]) * Cbus([107, 108, 109],[107, 108, 109]) * AH) == diag(A * S3([178 179 180], 1:3) * AH) + 0];

Cons = [Cons, v([125 126 127], [125 126 127]) == v([299 300 301], [299 300 301]) - S3([58 59 60], 1:3)*ctranspose(Z5253) - Z5253*ctranspose(S3([58 59 60], 1:3)) + Z5253*l([92 93 94], [92 93 94])*ctranspose(Z5253)];
Cons = [Cons, [v([299 300 301], [299 300 301]), S3([58 59 60], 1:3); ctranspose(S3([58 59 60], 1:3)), l([92 93 94], [92 93 94])] >= 0];
Cons = [Cons, diag(A *(S3([58 59 60], 1:3)-Z5253*l([92 93 94], [92 93 94])) * AH)- loads([116, 117, 118]) + diag(A * v([125 126 127], [125 126 127]) * Cbus([116, 117, 118],[116, 117, 118]) * AH) == diag(A * S3([61 62 63], 1:3) * AH) + 0];

Cons = [Cons, v([128 129 130], [128 129 130]) == v([125 126 127], [125 126 127]) - S3([61 62 63], 1:3)*ctranspose(Z5354) - Z5354*ctranspose(S3([61 62 63], 1:3)) + Z5354*l([95 96 97], [95 96 97])*ctranspose(Z5354)];
Cons = [Cons, [v([125 126 127], [125 126 127]), S3([61 62 63], 1:3); ctranspose(S3([61 62 63], 1:3)), l([95 96 97], [95 96 97])] >= 0];
Cons = [Cons, diag(A *(S3([61 62 63], 1:3)-Z5354*l([95 96 97], [95 96 97])) * AH)- loads([119, 120, 121]) + diag(A * v([128 129 130], [128 129 130]) * Cbus([119, 120, 121],[119, 120, 121]) * AH) == diag(A * S3([64 65 66], 1:3) * AH) + diag(A * S3([67 68 69], 1:3) * AH) + [diag(S1([57], 1:1)); 0; 0] + 0];

Cons = [Cons, v([131 132 133], [131 132 133]) == v([128 129 130], [128 129 130]) - S3([64 65 66], 1:3)*ctranspose(Z5455) - Z5455*ctranspose(S3([64 65 66], 1:3)) + Z5455*l([ 98  99 100], [ 98  99 100])*ctranspose(Z5455)];
Cons = [Cons, [v([128 129 130], [128 129 130]), S3([64 65 66], 1:3); ctranspose(S3([64 65 66], 1:3)), l([ 98  99 100], [ 98  99 100])] >= 0];
Cons = [Cons, diag(A *(S3([64 65 66], 1:3)-Z5455*l([ 98  99 100], [ 98  99 100])) * AH)- loads([122, 123, 124]) + diag(A * v([131 132 133], [131 132 133]) * Cbus([122, 123, 124],[122, 123, 124]) * AH) == diag(A * S3([70 71 72], 1:3) * AH) + 0];

Cons = [Cons, v([134 135 136], [134 135 136]) == v([128 129 130], [128 129 130]) - S3([67 68 69], 1:3)*ctranspose(Z5457) - Z5457*ctranspose(S3([67 68 69], 1:3)) + Z5457*l([101 102 103], [101 102 103])*ctranspose(Z5457)];
Cons = [Cons, [v([128 129 130], [128 129 130]), S3([67 68 69], 1:3); ctranspose(S3([67 68 69], 1:3)), l([101 102 103], [101 102 103])] >= 0];
Cons = [Cons, diag(A *(S3([67 68 69], 1:3)-Z5457*l([101 102 103], [101 102 103])) * AH)- loads([125, 126, 127]) + diag(A * v([134 135 136], [134 135 136]) * Cbus([125, 126, 127],[125, 126, 127]) * AH) == [0; diag(S1([29], 1:1)); 0] + diag(A * S3([73 74 75], 1:3) * AH) + 0];

Cons = [Cons, v([137 138 139], [137 138 139]) == v([131 132 133], [131 132 133]) - S3([70 71 72], 1:3)*ctranspose(Z5556) - Z5556*ctranspose(S3([70 71 72], 1:3)) + Z5556*l([104 105 106], [104 105 106])*ctranspose(Z5556)];
Cons = [Cons, [v([131 132 133], [131 132 133]), S3([70 71 72], 1:3); ctranspose(S3([70 71 72], 1:3)), l([104 105 106], [104 105 106])] >= 0];
Cons = [Cons, diag(A *(S3([70 71 72], 1:3)-Z5556*l([104 105 106], [104 105 106])) * AH)- loads([128, 129, 130]) + diag(A * v([137 138 139], [137 138 139]) * Cbus([128, 129, 130],[128, 129, 130]) * AH) == 0];

Cons = [Cons, v([140], [140]) == v([142], [142]) - S1([29], 1:1)*ctranspose(Z5758) - Z5758*ctranspose(S1([29], 1:1)) + Z5758*l([107], [107])*ctranspose(Z5758)];
Cons = [Cons, [v([142], [142]), S1([29], 1:1); ctranspose(S1([29], 1:1)), l([107], [107])] >= 0];
Cons = [Cons, diag(S1([29], 1:1)-Z5758*l([107], [107]))- loads([131]) + diag(v([140], [140]) * Cbus([131],[131])) == diag(S1([30], 1:1)) + 0];

Cons = [Cons, v([144 145 146], [144 145 146]) == v([134 135 136], [134 135 136]) - S3([73 74 75], 1:3)*ctranspose(Z5760) - Z5760*ctranspose(S3([73 74 75], 1:3)) + Z5760*l([108 109 110], [108 109 110])*ctranspose(Z5760)];
Cons = [Cons, [v([134 135 136], [134 135 136]), S3([73 74 75], 1:3); ctranspose(S3([73 74 75], 1:3)), l([108 109 110], [108 109 110])] >= 0];
Cons = [Cons, diag(A *(S3([73 74 75], 1:3)-Z5760*l([108 109 110], [108 109 110])) * AH)- loads([132, 133, 134]) + diag(A * v([144 145 146], [144 145 146]) * Cbus([132, 133, 134],[132, 133, 134]) * AH) == diag(A * S3([76 77 78], 1:3) * AH) + diag(A * S3([79 80 81], 1:3) * AH) + diag(A * S3([199 200 201], 1:3) * AH) + 0];

Cons = [Cons, v([147], [147]) == v([140], [140]) - S1([30], 1:1)*ctranspose(Z5859) - Z5859*ctranspose(S1([30], 1:1)) + Z5859*l([111], [111])*ctranspose(Z5859)];
Cons = [Cons, [v([140], [140]), S1([30], 1:1); ctranspose(S1([30], 1:1)), l([111], [111])] >= 0];
Cons = [Cons, diag(S1([30], 1:1)-Z5859*l([111], [111]))- loads([135]) + diag(v([147], [147]) * Cbus([135],[135])) == 0];

Cons = [Cons, v([148 149 150], [148 149 150]) == v([144 145 146], [144 145 146]) - S3([76 77 78], 1:3)*ctranspose(Z6061) - Z6061*ctranspose(S3([76 77 78], 1:3)) + Z6061*l([112 113 114], [112 113 114])*ctranspose(Z6061)];
Cons = [Cons, [v([144 145 146], [144 145 146]), S3([76 77 78], 1:3); ctranspose(S3([76 77 78], 1:3)), l([112 113 114], [112 113 114])] >= 0];
Cons = [Cons, diag(A *(S3([76 77 78], 1:3)-Z6061*l([112 113 114], [112 113 114])) * AH)- loads([136, 137, 138]) + diag(A * v([148 149 150], [148 149 150]) * Cbus([136, 137, 138],[136, 137, 138]) * AH) == diag(A * S3([205 206 207], 1:3) * AH) + 0];

Cons = [Cons, v([151 152 153], [151 152 153]) == v([144 145 146], [144 145 146]) - S3([79 80 81], 1:3)*ctranspose(Z6062) - Z6062*ctranspose(S3([79 80 81], 1:3)) + Z6062*l([115 116 117], [115 116 117])*ctranspose(Z6062)];
Cons = [Cons, [v([144 145 146], [144 145 146]), S3([79 80 81], 1:3); ctranspose(S3([79 80 81], 1:3)), l([115 116 117], [115 116 117])] >= 0];
Cons = [Cons, diag(A *(S3([79 80 81], 1:3)-Z6062*l([115 116 117], [115 116 117])) * AH)- loads([139, 140, 141]) + diag(A * v([151 152 153], [151 152 153]) * Cbus([139, 140, 141],[139, 140, 141]) * AH) == diag(A * S3([82 83 84], 1:3) * AH) + 0];

Cons = [Cons, v([154 155 156], [154 155 156]) == v([151 152 153], [151 152 153]) - S3([82 83 84], 1:3)*ctranspose(Z6263) - Z6263*ctranspose(S3([82 83 84], 1:3)) + Z6263*l([118 119 120], [118 119 120])*ctranspose(Z6263)];
Cons = [Cons, [v([151 152 153], [151 152 153]), S3([82 83 84], 1:3); ctranspose(S3([82 83 84], 1:3)), l([118 119 120], [118 119 120])] >= 0];
Cons = [Cons, diag(A *(S3([82 83 84], 1:3)-Z6263*l([118 119 120], [118 119 120])) * AH)- loads([142, 143, 144]) + diag(A * v([154 155 156], [154 155 156]) * Cbus([142, 143, 144],[142, 143, 144]) * AH) == diag(A * S3([85 86 87], 1:3) * AH) + 0];

Cons = [Cons, v([157 158 159], [157 158 159]) == v([154 155 156], [154 155 156]) - S3([85 86 87], 1:3)*ctranspose(Z6364) - Z6364*ctranspose(S3([85 86 87], 1:3)) + Z6364*l([121 122 123], [121 122 123])*ctranspose(Z6364)];
Cons = [Cons, [v([154 155 156], [154 155 156]), S3([85 86 87], 1:3); ctranspose(S3([85 86 87], 1:3)), l([121 122 123], [121 122 123])] >= 0];
Cons = [Cons, diag(A *(S3([85 86 87], 1:3)-Z6364*l([121 122 123], [121 122 123])) * AH)- loads([145, 146, 147]) + diag(A * v([157 158 159], [157 158 159]) * Cbus([145, 146, 147],[145, 146, 147]) * AH) == diag(A * S3([88 89 90], 1:3) * AH) + 0];

Cons = [Cons, v([160 161 162], [160 161 162]) == v([157 158 159], [157 158 159]) - S3([88 89 90], 1:3)*ctranspose(Z6465) - Z6465*ctranspose(S3([88 89 90], 1:3)) + Z6465*l([124 125 126], [124 125 126])*ctranspose(Z6465)];
Cons = [Cons, [v([157 158 159], [157 158 159]), S3([88 89 90], 1:3); ctranspose(S3([88 89 90], 1:3)), l([124 125 126], [124 125 126])] >= 0];
Cons = [Cons, diag(A *(S3([88 89 90], 1:3)-Z6465*l([124 125 126], [124 125 126])) * AH)- loads([148, 149, 150]) + diag(A * v([160 161 162], [160 161 162]) * Cbus([148, 149, 150],[148, 149, 150]) * AH) == diag(A * S3([91 92 93], 1:3) * AH) + 0];

Cons = [Cons, v([163 164 165], [163 164 165]) == v([160 161 162], [160 161 162]) - S3([91 92 93], 1:3)*ctranspose(Z6566) - Z6566*ctranspose(S3([91 92 93], 1:3)) + Z6566*l([127 128 129], [127 128 129])*ctranspose(Z6566)];
Cons = [Cons, [v([160 161 162], [160 161 162]), S3([91 92 93], 1:3); ctranspose(S3([91 92 93], 1:3)), l([127 128 129], [127 128 129])] >= 0];
Cons = [Cons, diag(A *(S3([91 92 93], 1:3)-Z6566*l([127 128 129], [127 128 129])) * AH)- loads([151, 152, 153]) + diag(A * v([163 164 165], [163 164 165]) * Cbus([151, 152, 153],[151, 152, 153]) * AH) == 0];

Cons = [Cons, v([166], [166]) == v([167], [167]) - S1([31], 1:1)*ctranspose(Z6768) - Z6768*ctranspose(S1([31], 1:1)) + Z6768*l([130], [130])*ctranspose(Z6768)];
Cons = [Cons, [v([167], [167]), S1([31], 1:1); ctranspose(S1([31], 1:1)), l([130], [130])] >= 0];
Cons = [Cons, diag(S1([31], 1:1)-Z6768*l([130], [130]))- loads([155]) + diag(v([166], [166]) * Cbus([155],[155])) == diag(S1([32], 1:1)) + 0];

Cons = [Cons, v([170 171 172], [170 171 172]) == v([302 303 304], [302 303 304]) - S3([94 95 96], 1:3)*ctranspose(Z6772) - Z6772*ctranspose(S3([94 95 96], 1:3)) + Z6772*l([131 132 133], [131 132 133])*ctranspose(Z6772)];
Cons = [Cons, [v([302 303 304], [302 303 304]), S3([94 95 96], 1:3); ctranspose(S3([94 95 96], 1:3)), l([131 132 133], [131 132 133])] >= 0];
Cons = [Cons, diag(A *(S3([94 95 96], 1:3)-Z6772*l([131 132 133], [131 132 133])) * AH)- loads([158, 159, 160]) + diag(A * v([170 171 172], [170 171 172]) * Cbus([158, 159, 160],[158, 159, 160]) * AH) == [0; 0; diag(S1([35], 1:1))] + diag(A * S3([100 101 102], 1:3) * AH) + 0];

Cons = [Cons, v([173 174 175], [173 174 175]) == v([302 303 304], [302 303 304]) - S3([97 98 99], 1:3)*ctranspose(Z6797) - Z6797*ctranspose(S3([97 98 99], 1:3)) + Z6797*l([134 135 136], [134 135 136])*ctranspose(Z6797)];
Cons = [Cons, [v([302 303 304], [302 303 304]), S3([97 98 99], 1:3); ctranspose(S3([97 98 99], 1:3)), l([134 135 136], [134 135 136])] >= 0];
Cons = [Cons, diag(A *(S3([97 98 99], 1:3)-Z6797*l([134 135 136], [134 135 136])) * AH)- loads([161, 162, 163]) + diag(A * v([173 174 175], [173 174 175]) * Cbus([161, 162, 163],[161, 162, 163]) * AH) == diag(A * S3([142 143 144], 1:3) * AH) + diag(A * S3([202 203 204], 1:3) * AH) + 0];

Cons = [Cons, v([176], [176]) == v([166], [166]) - S1([32], 1:1)*ctranspose(Z6869) - Z6869*ctranspose(S1([32], 1:1)) + Z6869*l([137], [137])*ctranspose(Z6869)];
Cons = [Cons, [v([166], [166]), S1([32], 1:1); ctranspose(S1([32], 1:1)), l([137], [137])] >= 0];
Cons = [Cons, diag(S1([32], 1:1)-Z6869*l([137], [137]))- loads([164]) + diag(v([176], [176]) * Cbus([164],[164])) == diag(S1([33], 1:1)) + 0];

Cons = [Cons, v([177], [177]) == v([176], [176]) - S1([33], 1:1)*ctranspose(Z6970) - Z6970*ctranspose(S1([33], 1:1)) + Z6970*l([138], [138])*ctranspose(Z6970)];
Cons = [Cons, [v([176], [176]), S1([33], 1:1); ctranspose(S1([33], 1:1)), l([138], [138])] >= 0];
Cons = [Cons, diag(S1([33], 1:1)-Z6970*l([138], [138]))- loads([165]) + diag(v([177], [177]) * Cbus([165],[165])) == diag(S1([34], 1:1)) + 0];

Cons = [Cons, v([178], [178]) == v([177], [177]) - S1([34], 1:1)*ctranspose(Z7071) - Z7071*ctranspose(S1([34], 1:1)) + Z7071*l([139], [139])*ctranspose(Z7071)];
Cons = [Cons, [v([177], [177]), S1([34], 1:1); ctranspose(S1([34], 1:1)), l([139], [139])] >= 0];
Cons = [Cons, diag(S1([34], 1:1)-Z7071*l([139], [139]))- loads([166]) + diag(v([178], [178]) * Cbus([166],[166])) == 0];

Cons = [Cons, v([179], [179]) == v([182], [182]) - S1([35], 1:1)*ctranspose(Z7273) - Z7273*ctranspose(S1([35], 1:1)) + Z7273*l([140], [140])*ctranspose(Z7273)];
Cons = [Cons, [v([182], [182]), S1([35], 1:1); ctranspose(S1([35], 1:1)), l([140], [140])] >= 0];
Cons = [Cons, diag(S1([35], 1:1)-Z7273*l([140], [140]))- loads([167]) + diag(v([179], [179]) * Cbus([167],[167])) == diag(S1([36], 1:1)) + 0];

Cons = [Cons, v([183 184 185], [183 184 185]) == v([170 171 172], [170 171 172]) - S3([100 101 102], 1:3)*ctranspose(Z7276) - Z7276*ctranspose(S3([100 101 102], 1:3)) + Z7276*l([141 142 143], [141 142 143])*ctranspose(Z7276)];
Cons = [Cons, [v([170 171 172], [170 171 172]), S3([100 101 102], 1:3); ctranspose(S3([100 101 102], 1:3)), l([141 142 143], [141 142 143])] >= 0];
Cons = [Cons, diag(A *(S3([100 101 102], 1:3)-Z7276*l([141 142 143], [141 142 143])) * AH)- loads([168, 169, 170]) + diag(A * v([183 184 185], [183 184 185]) * Cbus([168, 169, 170],[168, 169, 170]) * AH) == diag(A * S3([103 104 105], 1:3) * AH) + diag(A * S3([106 107 108], 1:3) * AH) + 0];

Cons = [Cons, v([186], [186]) == v([179], [179]) - S1([36], 1:1)*ctranspose(Z7374) - Z7374*ctranspose(S1([36], 1:1)) + Z7374*l([144], [144])*ctranspose(Z7374)];
Cons = [Cons, [v([179], [179]), S1([36], 1:1); ctranspose(S1([36], 1:1)), l([144], [144])] >= 0];
Cons = [Cons, diag(S1([36], 1:1)-Z7374*l([144], [144]))- loads([171]) + diag(v([186], [186]) * Cbus([171],[171])) == diag(S1([37], 1:1)) + 0];

Cons = [Cons, v([187], [187]) == v([186], [186]) - S1([37], 1:1)*ctranspose(Z7475) - Z7475*ctranspose(S1([37], 1:1)) + Z7475*l([145], [145])*ctranspose(Z7475)];
Cons = [Cons, [v([186], [186]), S1([37], 1:1); ctranspose(S1([37], 1:1)), l([145], [145])] >= 0];
Cons = [Cons, diag(S1([37], 1:1)-Z7475*l([145], [145]))- loads([172]) + diag(v([187], [187]) * Cbus([172],[172])) == 0];

Cons = [Cons, v([188 189 190], [188 189 190]) == v([183 184 185], [183 184 185]) - S3([103 104 105], 1:3)*ctranspose(Z7677) - Z7677*ctranspose(S3([103 104 105], 1:3)) + Z7677*l([146 147 148], [146 147 148])*ctranspose(Z7677)];
Cons = [Cons, [v([183 184 185], [183 184 185]), S3([103 104 105], 1:3); ctranspose(S3([103 104 105], 1:3)), l([146 147 148], [146 147 148])] >= 0];
Cons = [Cons, diag(A *(S3([103 104 105], 1:3)-Z7677*l([146 147 148], [146 147 148])) * AH)- loads([173, 174, 175]) + diag(A * v([188 189 190], [188 189 190]) * Cbus([173, 174, 175],[173, 174, 175]) * AH) == diag(A * S3([109 110 111], 1:3) * AH) + 0];

Cons = [Cons, v([191 192 193], [191 192 193]) == v([183 184 185], [183 184 185]) - S3([106 107 108], 1:3)*ctranspose(Z7686) - Z7686*ctranspose(S3([106 107 108], 1:3)) + Z7686*l([149 150 151], [149 150 151])*ctranspose(Z7686)];
Cons = [Cons, [v([183 184 185], [183 184 185]), S3([106 107 108], 1:3); ctranspose(S3([106 107 108], 1:3)), l([149 150 151], [149 150 151])] >= 0];
Cons = [Cons, diag(A *(S3([106 107 108], 1:3)-Z7686*l([149 150 151], [149 150 151])) * AH)- loads([176, 177, 178]) + diag(A * v([191 192 193], [191 192 193]) * Cbus([176, 177, 178],[176, 177, 178]) * AH) == diag(A * S3([127 128 129], 1:3) * AH) + 0];

Cons = [Cons, v([194 195 196], [194 195 196]) == v([188 189 190], [188 189 190]) - S3([109 110 111], 1:3)*ctranspose(Z7778) - Z7778*ctranspose(S3([109 110 111], 1:3)) + Z7778*l([152 153 154], [152 153 154])*ctranspose(Z7778)];
Cons = [Cons, [v([188 189 190], [188 189 190]), S3([109 110 111], 1:3); ctranspose(S3([109 110 111], 1:3)), l([152 153 154], [152 153 154])] >= 0];
Cons = [Cons, diag(A *(S3([109 110 111], 1:3)-Z7778*l([152 153 154], [152 153 154])) * AH)- loads([179, 180, 181]) + diag(A * v([194 195 196], [194 195 196]) * Cbus([179, 180, 181],[179, 180, 181]) * AH) == diag(A * S3([112 113 114], 1:3) * AH) + diag(A * S3([115 116 117], 1:3) * AH) + 0];

Cons = [Cons, v([197 198 199], [197 198 199]) == v([194 195 196], [194 195 196]) - S3([112 113 114], 1:3)*ctranspose(Z7879) - Z7879*ctranspose(S3([112 113 114], 1:3)) + Z7879*l([155 156 157], [155 156 157])*ctranspose(Z7879)];
Cons = [Cons, [v([194 195 196], [194 195 196]), S3([112 113 114], 1:3); ctranspose(S3([112 113 114], 1:3)), l([155 156 157], [155 156 157])] >= 0];
Cons = [Cons, diag(A *(S3([112 113 114], 1:3)-Z7879*l([155 156 157], [155 156 157])) * AH)- loads([182, 183, 184]) + diag(A * v([197 198 199], [197 198 199]) * Cbus([182, 183, 184],[182, 183, 184]) * AH) == 0];

Cons = [Cons, v([200 201 202], [200 201 202]) == v([194 195 196], [194 195 196]) - S3([115 116 117], 1:3)*ctranspose(Z7880) - Z7880*ctranspose(S3([115 116 117], 1:3)) + Z7880*l([158 159 160], [158 159 160])*ctranspose(Z7880)];
Cons = [Cons, [v([194 195 196], [194 195 196]), S3([115 116 117], 1:3); ctranspose(S3([115 116 117], 1:3)), l([158 159 160], [158 159 160])] >= 0];
Cons = [Cons, diag(A *(S3([115 116 117], 1:3)-Z7880*l([158 159 160], [158 159 160])) * AH)- loads([185, 186, 187]) + diag(A * v([200 201 202], [200 201 202]) * Cbus([185, 186, 187],[185, 186, 187]) * AH) == diag(A * S3([118 119 120], 1:3) * AH) + 0];

Cons = [Cons, v([203 204 205], [203 204 205]) == v([200 201 202], [200 201 202]) - S3([118 119 120], 1:3)*ctranspose(Z8081) - Z8081*ctranspose(S3([118 119 120], 1:3)) + Z8081*l([161 162 163], [161 162 163])*ctranspose(Z8081)];
Cons = [Cons, [v([200 201 202], [200 201 202]), S3([118 119 120], 1:3); ctranspose(S3([118 119 120], 1:3)), l([161 162 163], [161 162 163])] >= 0];
Cons = [Cons, diag(A *(S3([118 119 120], 1:3)-Z8081*l([161 162 163], [161 162 163])) * AH)- loads([188, 189, 190]) + diag(A * v([203 204 205], [203 204 205]) * Cbus([188, 189, 190],[188, 189, 190]) * AH) == diag(A * S3([121 122 123], 1:3) * AH) + [0; 0; diag(S1([38], 1:1))] + 0];

Cons = [Cons, v([206 207 208], [206 207 208]) == v([203 204 205], [203 204 205]) - S3([121 122 123], 1:3)*ctranspose(Z8182) - Z8182*ctranspose(S3([121 122 123], 1:3)) + Z8182*l([164 165 166], [164 165 166])*ctranspose(Z8182)];
Cons = [Cons, [v([203 204 205], [203 204 205]), S3([121 122 123], 1:3); ctranspose(S3([121 122 123], 1:3)), l([164 165 166], [164 165 166])] >= 0];
Cons = [Cons, diag(A *(S3([121 122 123], 1:3)-Z8182*l([164 165 166], [164 165 166])) * AH)- loads([191, 192, 193]) + diag(A * v([206 207 208], [206 207 208]) * Cbus([191, 192, 193],[191, 192, 193]) * AH) == diag(A * S3([124 125 126], 1:3) * AH) + 0];

Cons = [Cons, v([209], [209]) == v([212], [212]) - S1([38], 1:1)*ctranspose(Z8184) - Z8184*ctranspose(S1([38], 1:1)) + Z8184*l([167], [167])*ctranspose(Z8184)];
Cons = [Cons, [v([212], [212]), S1([38], 1:1); ctranspose(S1([38], 1:1)), l([167], [167])] >= 0];
Cons = [Cons, diag(S1([38], 1:1)-Z8184*l([167], [167]))- loads([194]) + diag(v([209], [209]) * Cbus([194],[194])) == diag(S1([39], 1:1)) + 0];

Cons = [Cons, v([213 214 215], [213 214 215]) == v([206 207 208], [206 207 208]) - S3([124 125 126], 1:3)*ctranspose(Z8283) - Z8283*ctranspose(S3([124 125 126], 1:3)) + Z8283*l([168 169 170], [168 169 170])*ctranspose(Z8283)];
Cons = [Cons, [v([206 207 208], [206 207 208]), S3([124 125 126], 1:3); ctranspose(S3([124 125 126], 1:3)), l([168 169 170], [168 169 170])] >= 0];
Cons = [Cons, diag(A *(S3([124 125 126], 1:3)-Z8283*l([168 169 170], [168 169 170])) * AH)- loads([195, 196, 197]) + diag(A * v([213 214 215], [213 214 215]) * Cbus([195, 196, 197],[195, 196, 197]) * AH) == 0];

Cons = [Cons, v([216], [216]) == v([209], [209]) - S1([39], 1:1)*ctranspose(Z8485) - Z8485*ctranspose(S1([39], 1:1)) + Z8485*l([171], [171])*ctranspose(Z8485)];
Cons = [Cons, [v([209], [209]), S1([39], 1:1); ctranspose(S1([39], 1:1)), l([171], [171])] >= 0];
Cons = [Cons, diag(S1([39], 1:1)-Z8485*l([171], [171]))- loads([198]) + diag(v([216], [216]) * Cbus([198],[198])) == 0];

Cons = [Cons, v([217 218 219], [217 218 219]) == v([191 192 193], [191 192 193]) - S3([127 128 129], 1:3)*ctranspose(Z8687) - Z8687*ctranspose(S3([127 128 129], 1:3)) + Z8687*l([172 173 174], [172 173 174])*ctranspose(Z8687)];
Cons = [Cons, [v([191 192 193], [191 192 193]), S3([127 128 129], 1:3); ctranspose(S3([127 128 129], 1:3)), l([172 173 174], [172 173 174])] >= 0];
Cons = [Cons, diag(A *(S3([127 128 129], 1:3)-Z8687*l([172 173 174], [172 173 174])) * AH)- loads([199, 200, 201]) + diag(A * v([217 218 219], [217 218 219]) * Cbus([199, 200, 201],[199, 200, 201]) * AH) == [diag(S1([40], 1:1)); 0; 0] + diag(A * S3([130 131 132], 1:3) * AH) + 0];

Cons = [Cons, v([220], [220]) == v([221], [221]) - S1([40], 1:1)*ctranspose(Z8788) - Z8788*ctranspose(S1([40], 1:1)) + Z8788*l([175], [175])*ctranspose(Z8788)];
Cons = [Cons, [v([221], [221]), S1([40], 1:1); ctranspose(S1([40], 1:1)), l([175], [175])] >= 0];
Cons = [Cons, diag(S1([40], 1:1)-Z8788*l([175], [175]))- loads([202]) + diag(v([220], [220]) * Cbus([202],[202])) == 0];

Cons = [Cons, v([224 225 226], [224 225 226]) == v([217 218 219], [217 218 219]) - S3([130 131 132], 1:3)*ctranspose(Z8789) - Z8789*ctranspose(S3([130 131 132], 1:3)) + Z8789*l([176 177 178], [176 177 178])*ctranspose(Z8789)];
Cons = [Cons, [v([217 218 219], [217 218 219]), S3([130 131 132], 1:3); ctranspose(S3([130 131 132], 1:3)), l([176 177 178], [176 177 178])] >= 0];
Cons = [Cons, diag(A *(S3([130 131 132], 1:3)-Z8789*l([176 177 178], [176 177 178])) * AH)- loads([203, 204, 205]) + diag(A * v([224 225 226], [224 225 226]) * Cbus([203, 204, 205],[203, 204, 205]) * AH) == [0; diag(S1([41], 1:1)); 0] + diag(A * S3([133 134 135], 1:3) * AH) + 0];

Cons = [Cons, v([227], [227]) == v([229], [229]) - S1([41], 1:1)*ctranspose(Z8990) - Z8990*ctranspose(S1([41], 1:1)) + Z8990*l([179], [179])*ctranspose(Z8990)];
Cons = [Cons, [v([229], [229]), S1([41], 1:1); ctranspose(S1([41], 1:1)), l([179], [179])] >= 0];
Cons = [Cons, diag(S1([41], 1:1)-Z8990*l([179], [179]))- loads([206]) + diag(v([227], [227]) * Cbus([206],[206])) == 0];

Cons = [Cons, v([231 232 233], [231 232 233]) == v([224 225 226], [224 225 226]) - S3([133 134 135], 1:3)*ctranspose(Z8991) - Z8991*ctranspose(S3([133 134 135], 1:3)) + Z8991*l([180 181 182], [180 181 182])*ctranspose(Z8991)];
Cons = [Cons, [v([224 225 226], [224 225 226]), S3([133 134 135], 1:3); ctranspose(S3([133 134 135], 1:3)), l([180 181 182], [180 181 182])] >= 0];
Cons = [Cons, diag(A *(S3([133 134 135], 1:3)-Z8991*l([180 181 182], [180 181 182])) * AH)- loads([207, 208, 209]) + diag(A * v([231 232 233], [231 232 233]) * Cbus([207, 208, 209],[207, 208, 209]) * AH) == [0; 0; diag(S1([42], 1:1))] + diag(A * S3([136 137 138], 1:3) * AH) + 0];

Cons = [Cons, v([234], [234]) == v([237], [237]) - S1([42], 1:1)*ctranspose(Z9192) - Z9192*ctranspose(S1([42], 1:1)) + Z9192*l([183], [183])*ctranspose(Z9192)];
Cons = [Cons, [v([237], [237]), S1([42], 1:1); ctranspose(S1([42], 1:1)), l([183], [183])] >= 0];
Cons = [Cons, diag(S1([42], 1:1)-Z9192*l([183], [183]))- loads([210]) + diag(v([234], [234]) * Cbus([210],[210])) == 0];

Cons = [Cons, v([238 239 240], [238 239 240]) == v([231 232 233], [231 232 233]) - S3([136 137 138], 1:3)*ctranspose(Z9193) - Z9193*ctranspose(S3([136 137 138], 1:3)) + Z9193*l([184 185 186], [184 185 186])*ctranspose(Z9193)];
Cons = [Cons, [v([231 232 233], [231 232 233]), S3([136 137 138], 1:3); ctranspose(S3([136 137 138], 1:3)), l([184 185 186], [184 185 186])] >= 0];
Cons = [Cons, diag(A *(S3([136 137 138], 1:3)-Z9193*l([184 185 186], [184 185 186])) * AH)- loads([211, 212, 213]) + diag(A * v([238 239 240], [238 239 240]) * Cbus([211, 212, 213],[211, 212, 213]) * AH) == [diag(S1([43], 1:1)); 0; 0] + diag(A * S3([139 140 141], 1:3) * AH) + 0];

Cons = [Cons, v([241], [241]) == v([242], [242]) - S1([43], 1:1)*ctranspose(Z9394) - Z9394*ctranspose(S1([43], 1:1)) + Z9394*l([187], [187])*ctranspose(Z9394)];
Cons = [Cons, [v([242], [242]), S1([43], 1:1); ctranspose(S1([43], 1:1)), l([187], [187])] >= 0];
Cons = [Cons, diag(S1([43], 1:1)-Z9394*l([187], [187]))- loads([214]) + diag(v([241], [241]) * Cbus([214],[214])) == 0];

Cons = [Cons, v([245 246 247], [245 246 247]) == v([238 239 240], [238 239 240]) - S3([139 140 141], 1:3)*ctranspose(Z9395) - Z9395*ctranspose(S3([139 140 141], 1:3)) + Z9395*l([188 189 190], [188 189 190])*ctranspose(Z9395)];
Cons = [Cons, [v([238 239 240], [238 239 240]), S3([139 140 141], 1:3); ctranspose(S3([139 140 141], 1:3)), l([188 189 190], [188 189 190])] >= 0];
Cons = [Cons, diag(A *(S3([139 140 141], 1:3)-Z9395*l([188 189 190], [188 189 190])) * AH)- loads([215, 216, 217]) + diag(A * v([245 246 247], [245 246 247]) * Cbus([215, 216, 217],[215, 216, 217]) * AH) == [0; diag(S1([44], 1:1)); 0] + 0];

Cons = [Cons, v([248], [248]) == v([250], [250]) - S1([44], 1:1)*ctranspose(Z9596) - Z9596*ctranspose(S1([44], 1:1)) + Z9596*l([191], [191])*ctranspose(Z9596)];
Cons = [Cons, [v([250], [250]), S1([44], 1:1); ctranspose(S1([44], 1:1)), l([191], [191])] >= 0];
Cons = [Cons, diag(S1([44], 1:1)-Z9596*l([191], [191]))- loads([218]) + diag(v([248], [248]) * Cbus([218],[218])) == 0];

Cons = [Cons, v([252 253 254], [252 253 254]) == v([173 174 175], [173 174 175]) - S3([142 143 144], 1:3)*ctranspose(Z9798) - Z9798*ctranspose(S3([142 143 144], 1:3)) + Z9798*l([192 193 194], [192 193 194])*ctranspose(Z9798)];
Cons = [Cons, [v([173 174 175], [173 174 175]), S3([142 143 144], 1:3); ctranspose(S3([142 143 144], 1:3)), l([192 193 194], [192 193 194])] >= 0];
Cons = [Cons, diag(A *(S3([142 143 144], 1:3)-Z9798*l([192 193 194], [192 193 194])) * AH)- loads([219, 220, 221]) + diag(A * v([252 253 254], [252 253 254]) * Cbus([219, 220, 221],[219, 220, 221]) * AH) == diag(A * S3([145 146 147], 1:3) * AH) + 0];

Cons = [Cons, v([255 256 257], [255 256 257]) == v([252 253 254], [252 253 254]) - S3([145 146 147], 1:3)*ctranspose(Z9899) - Z9899*ctranspose(S3([145 146 147], 1:3)) + Z9899*l([195 196 197], [195 196 197])*ctranspose(Z9899)];
Cons = [Cons, [v([252 253 254], [252 253 254]), S3([145 146 147], 1:3); ctranspose(S3([145 146 147], 1:3)), l([195 196 197], [195 196 197])] >= 0];
Cons = [Cons, diag(A *(S3([145 146 147], 1:3)-Z9899*l([195 196 197], [195 196 197])) * AH)- loads([222, 223, 224]) + diag(A * v([255 256 257], [255 256 257]) * Cbus([222, 223, 224],[222, 223, 224]) * AH) == diag(A * S3([148 149 150], 1:3) * AH) + 0];

Cons = [Cons, v([258 259 260], [258 259 260]) == v([255 256 257], [255 256 257]) - S3([148 149 150], 1:3)*ctranspose(Z99100) - Z99100*ctranspose(S3([148 149 150], 1:3)) + Z99100*l([198 199 200], [198 199 200])*ctranspose(Z99100)];
Cons = [Cons, [v([255 256 257], [255 256 257]), S3([148 149 150], 1:3); ctranspose(S3([148 149 150], 1:3)), l([198 199 200], [198 199 200])] >= 0];
Cons = [Cons, diag(A *(S3([148 149 150], 1:3)-Z99100*l([198 199 200], [198 199 200])) * AH)- loads([225, 226, 227]) + diag(A * v([258 259 260], [258 259 260]) * Cbus([225, 226, 227],[225, 226, 227]) * AH) == diag(A * S3([151 152 153], 1:3) * AH) + 0];

Cons = [Cons, v([261 262 263], [261 262 263]) == v([258 259 260], [258 259 260]) - S3([151 152 153], 1:3)*ctranspose(Z100450) - Z100450*ctranspose(S3([151 152 153], 1:3)) + Z100450*l([201 202 203], [201 202 203])*ctranspose(Z100450)];
Cons = [Cons, [v([258 259 260], [258 259 260]), S3([151 152 153], 1:3); ctranspose(S3([151 152 153], 1:3)), l([201 202 203], [201 202 203])] >= 0];
Cons = [Cons, diag(A *(S3([151 152 153], 1:3)-Z100450*l([201 202 203], [201 202 203])) * AH)- loads([228, 229, 230]) + diag(A * v([261 262 263], [261 262 263]) * Cbus([228, 229, 230],[228, 229, 230]) * AH) == 0];

Cons = [Cons, v([264], [264]) == v([267], [267]) - S1([45], 1:1)*ctranspose(Z101102) - Z101102*ctranspose(S1([45], 1:1)) + Z101102*l([204], [204])*ctranspose(Z101102)];
Cons = [Cons, [v([267], [267]), S1([45], 1:1); ctranspose(S1([45], 1:1)), l([204], [204])] >= 0];
Cons = [Cons, diag(S1([45], 1:1)-Z101102*l([204], [204]))- loads([237]) + diag(v([264], [264]) * Cbus([237],[237])) == diag(S1([46], 1:1)) + 0];

Cons = [Cons, v([268 269 270], [268 269 270]) == v([305 306 307], [305 306 307]) - S3([154 155 156], 1:3)*ctranspose(Z101105) - Z101105*ctranspose(S3([154 155 156], 1:3)) + Z101105*l([205 206 207], [205 206 207])*ctranspose(Z101105)];
Cons = [Cons, [v([305 306 307], [305 306 307]), S3([154 155 156], 1:3); ctranspose(S3([154 155 156], 1:3)), l([205 206 207], [205 206 207])] >= 0];
Cons = [Cons, diag(A *(S3([154 155 156], 1:3)-Z101105*l([205 206 207], [205 206 207])) * AH)- loads([238, 239, 240]) + diag(A * v([268 269 270], [268 269 270]) * Cbus([238, 239, 240],[238, 239, 240]) * AH) == [0; diag(S1([48], 1:1)); 0] + diag(A * S3([157 158 159], 1:3) * AH) + 0];

Cons = [Cons, v([271], [271]) == v([264], [264]) - S1([46], 1:1)*ctranspose(Z102103) - Z102103*ctranspose(S1([46], 1:1)) + Z102103*l([208], [208])*ctranspose(Z102103)];
Cons = [Cons, [v([264], [264]), S1([46], 1:1); ctranspose(S1([46], 1:1)), l([208], [208])] >= 0];
Cons = [Cons, diag(S1([46], 1:1)-Z102103*l([208], [208]))- loads([241]) + diag(v([271], [271]) * Cbus([241],[241])) == diag(S1([47], 1:1)) + 0];

Cons = [Cons, v([272], [272]) == v([271], [271]) - S1([47], 1:1)*ctranspose(Z103104) - Z103104*ctranspose(S1([47], 1:1)) + Z103104*l([209], [209])*ctranspose(Z103104)];
Cons = [Cons, [v([271], [271]), S1([47], 1:1); ctranspose(S1([47], 1:1)), l([209], [209])] >= 0];
Cons = [Cons, diag(S1([47], 1:1)-Z103104*l([209], [209]))- loads([242]) + diag(v([272], [272]) * Cbus([242],[242])) == 0];

Cons = [Cons, v([273], [273]) == v([275], [275]) - S1([48], 1:1)*ctranspose(Z105106) - Z105106*ctranspose(S1([48], 1:1)) + Z105106*l([210], [210])*ctranspose(Z105106)];
Cons = [Cons, [v([275], [275]), S1([48], 1:1); ctranspose(S1([48], 1:1)), l([210], [210])] >= 0];
Cons = [Cons, diag(S1([48], 1:1)-Z105106*l([210], [210]))- loads([243]) + diag(v([273], [273]) * Cbus([243],[243])) == diag(S1([49], 1:1)) + 0];

Cons = [Cons, v([277 278 279], [277 278 279]) == v([268 269 270], [268 269 270]) - S3([157 158 159], 1:3)*ctranspose(Z105108) - Z105108*ctranspose(S3([157 158 159], 1:3)) + Z105108*l([211 212 213], [211 212 213])*ctranspose(Z105108)];
Cons = [Cons, [v([268 269 270], [268 269 270]), S3([157 158 159], 1:3); ctranspose(S3([157 158 159], 1:3)), l([211 212 213], [211 212 213])] >= 0];
Cons = [Cons, diag(A *(S3([157 158 159], 1:3)-Z105108*l([211 212 213], [211 212 213])) * AH)- loads([244, 245, 246]) + diag(A * v([277 278 279], [277 278 279]) * Cbus([244, 245, 246],[244, 245, 246]) * AH) == [diag(S1([50], 1:1)); 0; 0] + diag(A * S3([160 161 162], 1:3) * AH) + 0];

Cons = [Cons, v([280], [280]) == v([273], [273]) - S1([49], 1:1)*ctranspose(Z106107) - Z106107*ctranspose(S1([49], 1:1)) + Z106107*l([214], [214])*ctranspose(Z106107)];
Cons = [Cons, [v([273], [273]), S1([49], 1:1); ctranspose(S1([49], 1:1)), l([214], [214])] >= 0];
Cons = [Cons, diag(S1([49], 1:1)-Z106107*l([214], [214]))- loads([247]) + diag(v([280], [280]) * Cbus([247],[247])) == 0];

Cons = [Cons, v([281], [281]) == v([282], [282]) - S1([50], 1:1)*ctranspose(Z108109) - Z108109*ctranspose(S1([50], 1:1)) + Z108109*l([215], [215])*ctranspose(Z108109)];
Cons = [Cons, [v([282], [282]), S1([50], 1:1); ctranspose(S1([50], 1:1)), l([215], [215])] >= 0];
Cons = [Cons, diag(S1([50], 1:1)-Z108109*l([215], [215]))- loads([248]) + diag(v([281], [281]) * Cbus([248],[248])) == diag(S1([51], 1:1)) + 0];

Cons = [Cons, v([285 286 287], [285 286 287]) == v([277 278 279], [277 278 279]) - S3([160 161 162], 1:3)*ctranspose(Z108300) - Z108300*ctranspose(S3([160 161 162], 1:3)) + Z108300*l([216 217 218], [216 217 218])*ctranspose(Z108300)];
Cons = [Cons, [v([277 278 279], [277 278 279]), S3([160 161 162], 1:3); ctranspose(S3([160 161 162], 1:3)), l([216 217 218], [216 217 218])] >= 0];
Cons = [Cons, diag(A *(S3([160 161 162], 1:3)-Z108300*l([216 217 218], [216 217 218])) * AH)- loads([249, 250, 251]) + diag(A * v([285 286 287], [285 286 287]) * Cbus([249, 250, 251],[249, 250, 251]) * AH) == 0];

Cons = [Cons, v([288], [288]) == v([281], [281]) - S1([51], 1:1)*ctranspose(Z109110) - Z109110*ctranspose(S1([51], 1:1)) + Z109110*l([219], [219])*ctranspose(Z109110)];
Cons = [Cons, [v([281], [281]), S1([51], 1:1); ctranspose(S1([51], 1:1)), l([219], [219])] >= 0];
Cons = [Cons, diag(S1([51], 1:1)-Z109110*l([219], [219]))- loads([252]) + diag(v([288], [288]) * Cbus([252],[252])) == diag(S1([52], 1:1)) + diag(S1([53], 1:1)) + 0];

Cons = [Cons, v([289], [289]) == v([288], [288]) - S1([52], 1:1)*ctranspose(Z110111) - Z110111*ctranspose(S1([52], 1:1)) + Z110111*l([220], [220])*ctranspose(Z110111)];
Cons = [Cons, [v([288], [288]), S1([52], 1:1); ctranspose(S1([52], 1:1)), l([220], [220])] >= 0];
Cons = [Cons, diag(S1([52], 1:1)-Z110111*l([220], [220]))- loads([253]) + diag(v([289], [289]) * Cbus([253],[253])) == 0];

Cons = [Cons, v([290], [290]) == v([288], [288]) - S1([53], 1:1)*ctranspose(Z110112) - Z110112*ctranspose(S1([53], 1:1)) + Z110112*l([221], [221])*ctranspose(Z110112)];
Cons = [Cons, [v([288], [288]), S1([53], 1:1); ctranspose(S1([53], 1:1)), l([221], [221])] >= 0];
Cons = [Cons, diag(S1([53], 1:1)-Z110112*l([221], [221]))- loads([254]) + diag(v([290], [290]) * Cbus([254],[254])) == diag(S1([54], 1:1)) + 0];

Cons = [Cons, v([291], [291]) == v([290], [290]) - S1([54], 1:1)*ctranspose(Z112113) - Z112113*ctranspose(S1([54], 1:1)) + Z112113*l([222], [222])*ctranspose(Z112113)];
Cons = [Cons, [v([290], [290]), S1([54], 1:1); ctranspose(S1([54], 1:1)), l([222], [222])] >= 0];
Cons = [Cons, diag(S1([54], 1:1)-Z112113*l([222], [222]))- loads([255]) + diag(v([291], [291]) * Cbus([255],[255])) == diag(S1([55], 1:1)) + 0];

Cons = [Cons, v([292], [292]) == v([291], [291]) - S1([55], 1:1)*ctranspose(Z113114) - Z113114*ctranspose(S1([55], 1:1)) + Z113114*l([223], [223])*ctranspose(Z113114)];
Cons = [Cons, [v([291], [291]), S1([55], 1:1); ctranspose(S1([55], 1:1)), l([223], [223])] >= 0];
Cons = [Cons, diag(S1([55], 1:1)-Z113114*l([223], [223]))- loads([256]) + diag(v([292], [292]) * Cbus([256],[256])) == 0];

Cons = [Cons, v([293 294 295], [293 294 295]) == v([332 333 334], [332 333 334]) - S3([163 164 165], 1:3)*ctranspose(Z13535) - Z13535*ctranspose(S3([163 164 165], 1:3)) + Z13535*l([224 225 226], [224 225 226])*ctranspose(Z13535)];
Cons = [Cons, [v([332 333 334], [332 333 334]), S3([163 164 165], 1:3); ctranspose(S3([163 164 165], 1:3)), l([224 225 226], [224 225 226])] >= 0];
Cons = [Cons, diag(A *(S3([163 164 165], 1:3)-Z13535*l([224 225 226], [224 225 226])) * AH)- loads([74, 75, 78]) + diag(A * v([293 294 295], [293 294 295]) * Cbus([74, 75, 78],[74, 75, 78]) * AH) == [diag(S2([5 6], 1:2)); 0] + diag(A * S3([34 35 36], 1:3) * AH) + 0];

Cons = [Cons, v([296 297 298], [296 297 298]) == v([326 327 328], [326 327 328]) - S3([166 167 168], 1:3)*ctranspose(Z1491) - Z1491*ctranspose(S3([166 167 168], 1:3)) + Z1491*l([227 228 229], [227 228 229])*ctranspose(Z1491)];
Cons = [Cons, [v([326 327 328], [326 327 328]), S3([166 167 168], 1:3); ctranspose(S3([166 167 168], 1:3)), l([227 228 229], [227 228 229])] >= 0];
Cons = [Cons, diag(A *(S3([166 167 168], 1:3)-Z1491*l([227 228 229], [227 228 229])) * AH)- loads([10, 11, 12]) + diag(A * v([296 297 298], [296 297 298]) * Cbus([10, 11, 12],[10, 11, 12]) * AH) == [0; diag(S1([1], 1:1)); 0] + [0; 0; diag(S1([2], 1:1))] + diag(A * S3([1 2 3], 1:3) * AH) + 0];

Cons = [Cons, v([299 300 301], [299 300 301]) == v([329 330 331], [329 330 331]) - S3([169 170 171], 1:3)*ctranspose(Z15252) - Z15252*ctranspose(S3([169 170 171], 1:3)) + Z15252*l([230 231 232], [230 231 232])*ctranspose(Z15252)];
Cons = [Cons, [v([329 330 331], [329 330 331]), S3([169 170 171], 1:3); ctranspose(S3([169 170 171], 1:3)), l([230 231 232], [230 231 232])] >= 0];
Cons = [Cons, diag(A *(S3([169 170 171], 1:3)-Z15252*l([230 231 232], [230 231 232])) * AH)- loads([113, 114, 115]) + diag(A * v([299 300 301], [299 300 301]) * Cbus([113, 114, 115],[113, 114, 115]) * AH) == diag(A * S3([58 59 60], 1:3) * AH) + 0];

Cons = [Cons, v([302 303 304], [302 303 304]) == v([320 321 322], [320 321 322]) - S3([172 173 174], 1:3)*ctranspose(Z160R67) - Z160R67*ctranspose(S3([172 173 174], 1:3)) + Z160R67*l([233 234 235], [233 234 235])*ctranspose(Z160R67)];
Cons = [Cons, [v([320 321 322], [320 321 322]), S3([172 173 174], 1:3); ctranspose(S3([172 173 174], 1:3)), l([233 234 235], [233 234 235])] >= 0];
Cons = [Cons, diag(A *(S3([172 173 174], 1:3)-Z160R67*l([233 234 235], [233 234 235])) * AH)- loads([154, 156, 157]) + diag(A * v([302 303 304], [302 303 304]) * Cbus([154, 156, 157],[154, 156, 157]) * AH) == [diag(S1([31], 1:1)); 0; 0] + diag(A * S3([94 95 96], 1:3) * AH) + diag(A * S3([97 98 99], 1:3) * AH) + 0];

Cons = [Cons, v([305 306 307], [305 306 307]) == v([338 339 340], [338 339 340]) - S3([175 176 177], 1:3)*ctranspose(Z197101) - Z197101*ctranspose(S3([175 176 177], 1:3)) + Z197101*l([236 237 238], [236 237 238])*ctranspose(Z197101)];
Cons = [Cons, [v([338 339 340], [338 339 340]), S3([175 176 177], 1:3); ctranspose(S3([175 176 177], 1:3)), l([236 237 238], [236 237 238])] >= 0];
Cons = [Cons, diag(A *(S3([175 176 177], 1:3)-Z197101*l([236 237 238], [236 237 238])) * AH)- loads([234, 235, 236]) + diag(A * v([305 306 307], [305 306 307]) * Cbus([234, 235, 236],[234, 235, 236]) * AH) == [0; 0; diag(S1([45], 1:1))] + diag(A * S3([154 155 156], 1:3) * AH) + 0];

Cons = [Cons, v([308 309 310], [308 309 310]) == v([122 123 124], [122 123 124]) - S3([178 179 180], 1:3)*ctranspose(Z51151) - Z51151*ctranspose(S3([178 179 180], 1:3)) + Z51151*l([239 240 241], [239 240 241])*ctranspose(Z51151)];
Cons = [Cons, [v([122 123 124], [122 123 124]), S3([178 179 180], 1:3); ctranspose(S3([178 179 180], 1:3)), l([239 240 241], [239 240 241])] >= 0];
Cons = [Cons, diag(A *(S3([178 179 180], 1:3)-Z51151*l([239 240 241], [239 240 241])) * AH)- loads([110, 111, 112]) + diag(A * v([308 309 310], [308 309 310]) * Cbus([110, 111, 112],[110, 111, 112]) * AH) == diag(A * S3([208 209 210], 1:3) * AH) + 0];

Cons = [Cons, A * v([311 312 313], [311 312 313]) * AH == (A * (v([1 2 3], [1 2 3]) - S3([181 182 183], 1:3)*ctranspose(Z150150R) - Z150150R*ctranspose(S3([181 182 183], 1:3)) + Z150150R*l([242 243 244], [242 243 244])*ctranspose(Z150150R)) * AH) .* alphaM150R];
Cons = [Cons, [v([1 2 3], [1 2 3]), S3([181 182 183], 1:3); ctranspose(S3([181 182 183], 1:3)), l([242 243 244], [242 243 244])] >= 0];
Cons = [Cons, diag(A *(S3([181 182 183], 1:3)-Z150150R*l([242 243 244], [242 243 244])) * AH)- loads([4, 5, 6]) + diag(A * v([311 312 313], [311 312 313]) * Cbus([4, 5, 6],[4, 5, 6]) * AH) == diag(A * S3([190 191 192], 1:3) * AH) + 0];

Cons = [Cons, v([314], [314]) == (v([22], [22]) - S1([56], 1:1)*ctranspose(Z99R) - Z99R*ctranspose(S1([56], 1:1)) + Z99R*l([245], [245])*ctranspose(Z99R)) .* alphaM9R];
Cons = [Cons, [v([22], [22]), S1([56], 1:1); ctranspose(S1([56], 1:1)), l([245], [245])] >= 0];
Cons = [Cons, diag(S1([56], 1:1)-Z99R*l([245], [245]))- loads([29]) + diag(v([314], [314]) * Cbus([29],[29])) == diag(S1([8], 1:1)) + 0];

Cons = [Cons, v([315 316], [315 316]) == (v([317 319], [317 319]) - S2([7 8], 1:2)*ctranspose(Z2525R) - Z2525R*ctranspose(S2([7 8], 1:2)) + Z2525R*l([246 247], [246 247])*ctranspose(Z2525R)) .* alphaM25R];
Cons = [Cons, [v([57 59], [57 59]), S2([7 8], 1:2); ctranspose(S2([7 8], 1:2)), l([246 247], [246 247])] >= 0];
Cons = [Cons, diag(S2([7 8], 1:2)-Z2525R*l([246 247], [246 247]))- loads([53, 54]) + diag(v([315 316], [315 316]) * Cbus([53, 54],[53, 54])) == diag(S2([1 2], 1:2)) + 0];

Cons = [Cons, A * v([320 321 322], [320 321 322]) * AH == (A * (v([335 336 337], [335 336 337]) - S3([184 185 186], 1:3)*ctranspose(Z160160R) - Z160160R*ctranspose(S3([184 185 186], 1:3)) + Z160160R*l([248 249 250], [248 249 250])*ctranspose(Z160160R)) * AH) .* alphaM160R];
Cons = [Cons, [v([335 336 337], [335 336 337]), S3([184 185 186], 1:3); ctranspose(S3([184 185 186], 1:3)), l([248 249 250], [248 249 250])] >= 0];
Cons = [Cons, diag(A *(S3([184 185 186], 1:3)-Z160160R*l([248 249 250], [248 249 250])) * AH)- loads([263, 264, 265]) + diag(A * v([320 321 322], [320 321 322]) * Cbus([263, 264, 265],[263, 264, 265]) * AH) == diag(A * S3([172 173 174], 1:3) * AH) + 0];

Cons = [Cons, v([323 324 325], [323 324 325]) == v([341 342 343], [341 342 343]) - S3([187 188 189], 1:3)*ctranspose(Z61S610) - Z61S610*ctranspose(S3([187 188 189], 1:3)) + Z61S610*l([251 252 253], [251 252 253])*ctranspose(Z61S610)];
Cons = [Cons, [v([341 342 343], [341 342 343]), S3([187 188 189], 1:3); ctranspose(S3([187 188 189], 1:3)), l([251 252 253], [251 252 253])] >= 0];
Cons = [Cons, diag(A *(S3([187 188 189], 1:3)-Z61S610*l([251 252 253], [251 252 253])) * AH)- loads([276, 277, 278]) + diag(A * v([323 324 325], [323 324 325]) * Cbus([276, 277, 278],[276, 277, 278]) * AH) == 0];

Cons = [Cons, v([326 327 328], [326 327 328]) == v([311 312 313], [311 312 313]) - S3([190 191 192], 1:3)*ctranspose(Z150R149) - Z150R149*ctranspose(S3([190 191 192], 1:3)) + Z150R149*l([254 255 256], [254 255 256])*ctranspose(Z150R149)];
Cons = [Cons, [v([311 312 313], [311 312 313]), S3([190 191 192], 1:3); ctranspose(S3([190 191 192], 1:3)), l([254 255 256], [254 255 256])] >= 0];
Cons = [Cons, diag(A *(S3([190 191 192], 1:3)-Z150R149*l([254 255 256], [254 255 256])) * AH)- loads([7, 8, 9]) + diag(A * v([326 327 328], [326 327 328]) * Cbus([7, 8, 9],[7, 8, 9]) * AH) == diag(A * S3([166 167 168], 1:3) * AH) + 0];

Cons = [Cons, v([329 330 331], [329 330 331]) == v([23 24 25], [23 24 25]) - S3([193 194 195], 1:3)*ctranspose(Z13152) - Z13152*ctranspose(S3([193 194 195], 1:3)) + Z13152*l([257 258 259], [257 258 259])*ctranspose(Z13152)];
Cons = [Cons, [v([23 24 25], [23 24 25]), S3([193 194 195], 1:3); ctranspose(S3([193 194 195], 1:3)), l([257 258 259], [257 258 259])] >= 0];
Cons = [Cons, diag(A *(S3([193 194 195], 1:3)-Z13152*l([257 258 259], [257 258 259])) * AH)- loads([260, 261, 262]) + diag(A * v([329 330 331], [329 330 331]) * Cbus([260, 261, 262],[260, 261, 262]) * AH) == diag(A * S3([169 170 171], 1:3) * AH) + 0];

Cons = [Cons, v([332 333 334], [332 333 334]) == v([31 32 33], [31 32 33]) - S3([196 197 198], 1:3)*ctranspose(Z18135) - Z18135*ctranspose(S3([196 197 198], 1:3)) + Z18135*l([260 261 262], [260 261 262])*ctranspose(Z18135)];
Cons = [Cons, [v([31 32 33], [31 32 33]), S3([196 197 198], 1:3); ctranspose(S3([196 197 198], 1:3)), l([260 261 262], [260 261 262])] >= 0];
Cons = [Cons, diag(A *(S3([196 197 198], 1:3)-Z18135*l([260 261 262], [260 261 262])) * AH)- loads([257, 258, 259]) + diag(A * v([332 333 334], [332 333 334]) * Cbus([257, 258, 259],[257, 258, 259]) * AH) == diag(A * S3([163 164 165], 1:3) * AH) + 0];

Cons = [Cons, v([335 336 337], [335 336 337]) == v([144 145 146], [144 145 146]) - S3([199 200 201], 1:3)*ctranspose(Z60160) - Z60160*ctranspose(S3([199 200 201], 1:3)) + Z60160*l([263 264 265], [263 264 265])*ctranspose(Z60160)];
Cons = [Cons, [v([144 145 146], [144 145 146]), S3([199 200 201], 1:3); ctranspose(S3([199 200 201], 1:3)), l([263 264 265], [263 264 265])] >= 0];
Cons = [Cons, diag(A *(S3([199 200 201], 1:3)-Z60160*l([263 264 265], [263 264 265])) * AH)- loads([266, 267, 268]) + diag(A * v([335 336 337], [335 336 337]) * Cbus([266, 267, 268],[266, 267, 268]) * AH) == diag(A * S3([184 185 186], 1:3) * AH) + 0];

Cons = [Cons, v([338 339 340], [338 339 340]) == v([173 174 175], [173 174 175]) - S3([202 203 204], 1:3)*ctranspose(Z97197) - Z97197*ctranspose(S3([202 203 204], 1:3)) + Z97197*l([266 267 268], [266 267 268])*ctranspose(Z97197)];
Cons = [Cons, [v([173 174 175], [173 174 175]), S3([202 203 204], 1:3); ctranspose(S3([202 203 204], 1:3)), l([266 267 268], [266 267 268])] >= 0];
Cons = [Cons, diag(A *(S3([202 203 204], 1:3)-Z97197*l([266 267 268], [266 267 268])) * AH)- loads([231, 232, 233]) + diag(A * v([338 339 340], [338 339 340]) * Cbus([231, 232, 233],[231, 232, 233]) * AH) == diag(A * S3([175 176 177], 1:3) * AH) + 0];

Cons = [Cons, v([341 342 343], [341 342 343]) == v([148 149 150], [148 149 150]) - S3([205 206 207], 1:3)*ctranspose(Z6161S) - Z6161S*ctranspose(S3([205 206 207], 1:3)) + Z6161S*l([269 270 271], [269 270 271])*ctranspose(Z6161S)];
Cons = [Cons, [v([148 149 150], [148 149 150]), S3([205 206 207], 1:3); ctranspose(S3([205 206 207], 1:3)), l([269 270 271], [269 270 271])] >= 0];
Cons = [Cons, diag(A *(S3([205 206 207], 1:3)-Z6161S*l([269 270 271], [269 270 271])) * AH)- loads([269, 270, 271]) + diag(A * v([341 342 343], [341 342 343]) * Cbus([269, 270, 271],[269, 270, 271]) * AH) == diag(A * S3([187 188 189], 1:3) * AH) + 0];

Cons = [Cons, v([344 345 346], [344 345 346]) == v([308 309 310], [308 309 310]) - S3([208 209 210], 1:3)*ctranspose(Z151300_OPEN) - Z151300_OPEN*ctranspose(S3([208 209 210], 1:3)) + Z151300_OPEN*l([272 273 274], [272 273 274])*ctranspose(Z151300_OPEN)];
Cons = [Cons, [v([308 309 310], [308 309 310]), S3([208 209 210], 1:3); ctranspose(S3([208 209 210], 1:3)), l([272 273 274], [272 273 274])] >= 0];
Cons = [Cons, diag(A *(S3([208 209 210], 1:3)-Z151300_OPEN*l([272 273 274], [272 273 274])) * AH)- loads([272, 273, 274]) + diag(A * v([344 345 346], [344 345 346]) * Cbus([272, 273, 274],[272, 273, 274]) * AH) == 0];

Cons = [Cons, v([347], [347]) == v([348], [348]) - S1([57], 1:1)*ctranspose(Z5494_OPEN) - Z5494_OPEN*ctranspose(S1([57], 1:1)) + Z5494_OPEN*l([275], [275])*ctranspose(Z5494_OPEN)];
Cons = [Cons, [v([348], [348]), S1([57], 1:1); ctranspose(S1([57], 1:1)), l([275], [275])] >= 0];
Cons = [Cons, diag(S1([57], 1:1)-Z5494_OPEN*l([275], [275]))- loads([275]) + diag(v([347], [347]) * Cbus([275],[275])) == 0];

Cons = [Cons, v([92 93 94], [92 93 94])== A * v([85 86 87], [85 86 87]) * AH];
Cons = [Cons, v([228 229 230], [228 229 230])== A * v([224 225 226], [224 225 226]) * AH];
Cons = [Cons, v([274 275 276], [274 275 276])== A * v([268 269 270], [268 269 270]) * AH];
Cons = [Cons, v([348 349 350], [348 349 350])== A * v([128 129 130], [128 129 130]) * AH];
Cons = [Cons, v([141 142 143], [141 142 143])== A * v([134 135 136], [134 135 136]) * AH];
Cons = [Cons, v([221 222 223], [221 222 223])== A * v([217 218 219], [217 218 219]) * AH];
Cons = [Cons, v([180 181 182], [180 181 182])== A * v([170 171 172], [170 171 172]) * AH];
Cons = [Cons, v([39 40 41], [39 40 41])== A * v([31 32 33], [31 32 33]) * AH];
Cons = [Cons, v([282 283 284], [282 283 284])== A * v([277 278 279], [277 278 279]) * AH];
Cons = [Cons, v([54 55 56], [54 55 56])== A * v([50 51 52], [50 51 52]) * AH];
Cons = [Cons, v([249 250 251], [249 250 251])== A * v([245 246 247], [245 246 247]) * AH];
Cons = [Cons, v([265 266 267], [265 266 267])== A * v([305 306 307], [305 306 307]) * AH];
Cons = [Cons, v([82 83 84], [82 83 84])== A * v([293 294 295], [293 294 295]) * AH];
Cons = [Cons, v([235 236 237], [235 236 237])== A * v([231 232 233], [231 232 233]) * AH];
Cons = [Cons, v([5 6 7], [5 6 7])== A * v([296 297 298], [296 297 298]) * AH];
Cons = [Cons, v([317 318 319], [317 318 319])== A * v([57 58 59], [57 58 59]) * AH];
Cons = [Cons, v([210 211 212], [210 211 212])== A * v([203 204 205], [203 204 205]) * AH];
Cons = [Cons, v([28 29 30], [28 29 30])== A * v([23 24 25], [23 24 25]) * AH];
Cons = [Cons, v([ 99 100 101], [ 99 100 101])== A * v([95 96 97], [95 96 97]) * AH];
Cons = [Cons, v([106 107 108], [106 107 108])== A * v([102 103 104], [102 103 104]) * AH];
Cons = [Cons, v([19 20 21], [19 20 21])== A * v([15 16 17], [15 16 17]) * AH];
Cons = [Cons, v([47 48 49], [47 48 49])== A * v([42 43 44], [42 43 44]) * AH];
Cons = [Cons, v([242 243 244], [242 243 244])== A * v([238 239 240], [238 239 240]) * AH];
Cons = [Cons, v([167 168 169], [167 168 169])== A * v([302 303 304], [302 303 304]) * AH];


options = sdpsettings('verbose',1,'solver','mosek');
sol = optimize(Cons,Objective,options);


v = value(v);
l = value(l);
S3 = value(S3);
S2 = value(S2);
S1 = value(S1);

v150 = v(1:3, 1:3);
S12 = S1([1], 1:1);
v2 = v([4], [4]);
v1_abc = v([5 6 7], [5 6 7]);
S13 = S1([2], 1:1);
v3 = v([8], [8]);
v1_abc = v([5 6 7], [5 6 7]);
S17 = S3([1 2 3], 1:3);
v7 = v([ 9 10 11], [ 9 10 11]);
v1_abc = v([5 6 7], [5 6 7]);
S34 = S1([3], 1:1);
v4 = v([12], [12]);
S35 = S1([4], 1:1);
v5 = v([13], [13]);
S56 = S1([5], 1:1);
v6 = v([14], [14]);
S78 = S3([4 5 6], 1:3);
v8 = v([15 16 17], [15 16 17]);
S812 = S1([6], 1:1);
v12 = v([18], [18]);
v8_abc = v([19 20 21], [19 20 21]);
S89 = S1([7], 1:1);
v9 = v([22], [22]);
v8_abc = v([19 20 21], [19 20 21]);
S813 = S3([7 8 9], 1:3);
v13 = v([23 24 25], [23 24 25]);
v8_abc = v([19 20 21], [19 20 21]);
S9R14 = S1([8], 1:1);
v14 = v([26], [26]);
S1334 = S1([9], 1:1);
v34 = v([27], [27]);
v13_abc = v([28 29 30], [28 29 30]);
S1318 = S3([10 11 12], 1:3);
v18 = v([31 32 33], [31 32 33]);
v13_abc = v([28 29 30], [28 29 30]);
S1411 = S1([10], 1:1);
v11 = v([34], [34]);
S1410 = S1([11], 1:1);
v10 = v([35], [35]);
S1516 = S1([12], 1:1);
v16 = v([36], [36]);
S1517 = S1([13], 1:1);
v17 = v([37], [37]);
S1819 = S1([14], 1:1);
v19 = v([38], [38]);
v18_abc = v([39 40 41], [39 40 41]);
S1821 = S3([13 14 15], 1:3);
v21 = v([42 43 44], [42 43 44]);
v18_abc = v([39 40 41], [39 40 41]);
S1920 = S1([15], 1:1);
v20 = v([45], [45]);
S2122 = S1([16], 1:1);
v22 = v([46], [46]);
v21_abc = v([47 48 49], [47 48 49]);
S2123 = S3([16 17 18], 1:3);
v23 = v([50 51 52], [50 51 52]);
v21_abc = v([47 48 49], [47 48 49]);
S2324 = S1([17], 1:1);
v24 = v([53], [53]);
v23_abc = v([54 55 56], [54 55 56]);
S2325 = S3([19 20 21], 1:3);
v25 = v([57 58 59], [57 58 59]);
v23_abc = v([54 55 56], [54 55 56]);
S25R26 = S2([1 2], 1:2);
v26 = v([60 61], [60 61]);
S2528 = S3([22 23 24], 1:3);
v28 = v([62 63 64], [62 63 64]);
v25_abc = v([317 318 319], [317 318 319]);
S2627 = S2([3 4], 1:2);
v27 = v([65 66], [65 66]);
S2631 = S1([18], 1:1);
v31 = v([67], [67]);
S2733 = S1([19], 1:1);
v33 = v([68], [68]);
S2829 = S3([25 26 27], 1:3);
v29 = v([69 70 71], [69 70 71]);
S2930 = S3([28 29 30], 1:3);
v30 = v([72 73 74], [72 73 74]);
S30250 = S3([31 32 33], 1:3);
v250 = v([75 76 77], [75 76 77]);
S3132 = S1([20], 1:1);
v32 = v([78], [78]);
S3415 = S1([21], 1:1);
v15 = v([79], [79]);
S3536 = S2([5 6], 1:2);
v36 = v([80 81], [80 81]);
v35_abc = v([82 83 84], [82 83 84]);
S3540 = S3([34 35 36], 1:3);
v40 = v([85 86 87], [85 86 87]);
v35_abc = v([82 83 84], [82 83 84]);
S3637 = S1([22], 1:1);
v37 = v([88], [88]);
S3638 = S1([23], 1:1);
v38 = v([89], [89]);
S3839 = S1([24], 1:1);
v39 = v([90], [90]);
S4041 = S1([25], 1:1);
v41 = v([91], [91]);
v40_abc = v([92 93 94], [92 93 94]);
S4042 = S3([37 38 39], 1:3);
v42 = v([95 96 97], [95 96 97]);
v40_abc = v([92 93 94], [92 93 94]);
S4243 = S1([26], 1:1);
v43 = v([98], [98]);
v42_abc = v([ 99 100 101], [ 99 100 101]);
S4244 = S3([40 41 42], 1:3);
v44 = v([102 103 104], [102 103 104]);
v42_abc = v([ 99 100 101], [ 99 100 101]);
S4445 = S1([27], 1:1);
v45 = v([105], [105]);
v44_abc = v([106 107 108], [106 107 108]);
S4447 = S3([43 44 45], 1:3);
v47 = v([109 110 111], [109 110 111]);
v44_abc = v([106 107 108], [106 107 108]);
S4546 = S1([28], 1:1);
v46 = v([112], [112]);
S4748 = S3([46 47 48], 1:3);
v48 = v([113 114 115], [113 114 115]);
S4749 = S3([49 50 51], 1:3);
v49 = v([116 117 118], [116 117 118]);
S4950 = S3([52 53 54], 1:3);
v50 = v([119 120 121], [119 120 121]);
S5051 = S3([55 56 57], 1:3);
v51 = v([122 123 124], [122 123 124]);
S5253 = S3([58 59 60], 1:3);
v53 = v([125 126 127], [125 126 127]);
S5354 = S3([61 62 63], 1:3);
v54 = v([128 129 130], [128 129 130]);
S5455 = S3([64 65 66], 1:3);
v55 = v([131 132 133], [131 132 133]);
v54_abc = v([348 349 350], [348 349 350]);
S5457 = S3([67 68 69], 1:3);
v57 = v([134 135 136], [134 135 136]);
v54_abc = v([348 349 350], [348 349 350]);
S5556 = S3([70 71 72], 1:3);
v56 = v([137 138 139], [137 138 139]);
S5758 = S1([29], 1:1);
v58 = v([140], [140]);
v57_abc = v([141 142 143], [141 142 143]);
S5760 = S3([73 74 75], 1:3);
v60 = v([144 145 146], [144 145 146]);
v57_abc = v([141 142 143], [141 142 143]);
S5859 = S1([30], 1:1);
v59 = v([147], [147]);
S6061 = S3([76 77 78], 1:3);
v61 = v([148 149 150], [148 149 150]);
S6062 = S3([79 80 81], 1:3);
v62 = v([151 152 153], [151 152 153]);
S6263 = S3([82 83 84], 1:3);
v63 = v([154 155 156], [154 155 156]);
S6364 = S3([85 86 87], 1:3);
v64 = v([157 158 159], [157 158 159]);
S6465 = S3([88 89 90], 1:3);
v65 = v([160 161 162], [160 161 162]);
S6566 = S3([91 92 93], 1:3);
v66 = v([163 164 165], [163 164 165]);
S6768 = S1([31], 1:1);
v68 = v([166], [166]);
v67_abc = v([167 168 169], [167 168 169]);
S6772 = S3([94 95 96], 1:3);
v72 = v([170 171 172], [170 171 172]);
v67_abc = v([167 168 169], [167 168 169]);
S6797 = S3([97 98 99], 1:3);
v97 = v([173 174 175], [173 174 175]);
v67_abc = v([167 168 169], [167 168 169]);
S6869 = S1([32], 1:1);
v69 = v([176], [176]);
S6970 = S1([33], 1:1);
v70 = v([177], [177]);
S7071 = S1([34], 1:1);
v71 = v([178], [178]);
S7273 = S1([35], 1:1);
v73 = v([179], [179]);
v72_abc = v([180 181 182], [180 181 182]);
S7276 = S3([100 101 102], 1:3);
v76 = v([183 184 185], [183 184 185]);
v72_abc = v([180 181 182], [180 181 182]);
S7374 = S1([36], 1:1);
v74 = v([186], [186]);
S7475 = S1([37], 1:1);
v75 = v([187], [187]);
S7677 = S3([103 104 105], 1:3);
v77 = v([188 189 190], [188 189 190]);
S7686 = S3([106 107 108], 1:3);
v86 = v([191 192 193], [191 192 193]);
S7778 = S3([109 110 111], 1:3);
v78 = v([194 195 196], [194 195 196]);
S7879 = S3([112 113 114], 1:3);
v79 = v([197 198 199], [197 198 199]);
S7880 = S3([115 116 117], 1:3);
v80 = v([200 201 202], [200 201 202]);
S8081 = S3([118 119 120], 1:3);
v81 = v([203 204 205], [203 204 205]);
S8182 = S3([121 122 123], 1:3);
v82 = v([206 207 208], [206 207 208]);
v81_abc = v([210 211 212], [210 211 212]);
S8184 = S1([38], 1:1);
v84 = v([209], [209]);
v81_abc = v([210 211 212], [210 211 212]);
S8283 = S3([124 125 126], 1:3);
v83 = v([213 214 215], [213 214 215]);
S8485 = S1([39], 1:1);
v85 = v([216], [216]);
S8687 = S3([127 128 129], 1:3);
v87 = v([217 218 219], [217 218 219]);
S8788 = S1([40], 1:1);
v88 = v([220], [220]);
v87_abc = v([221 222 223], [221 222 223]);
S8789 = S3([130 131 132], 1:3);
v89 = v([224 225 226], [224 225 226]);
v87_abc = v([221 222 223], [221 222 223]);
S8990 = S1([41], 1:1);
v90 = v([227], [227]);
v89_abc = v([228 229 230], [228 229 230]);
S8991 = S3([133 134 135], 1:3);
v91 = v([231 232 233], [231 232 233]);
v89_abc = v([228 229 230], [228 229 230]);
S9192 = S1([42], 1:1);
v92 = v([234], [234]);
v91_abc = v([235 236 237], [235 236 237]);
S9193 = S3([136 137 138], 1:3);
v93 = v([238 239 240], [238 239 240]);
v91_abc = v([235 236 237], [235 236 237]);
S9394 = S1([43], 1:1);
v94 = v([241], [241]);
v93_abc = v([242 243 244], [242 243 244]);
S9395 = S3([139 140 141], 1:3);
v95 = v([245 246 247], [245 246 247]);
v93_abc = v([242 243 244], [242 243 244]);
S9596 = S1([44], 1:1);
v96 = v([248], [248]);
v95_abc = v([249 250 251], [249 250 251]);
S9798 = S3([142 143 144], 1:3);
v98 = v([252 253 254], [252 253 254]);
S9899 = S3([145 146 147], 1:3);
v99 = v([255 256 257], [255 256 257]);
S99100 = S3([148 149 150], 1:3);
v100 = v([258 259 260], [258 259 260]);
S100450 = S3([151 152 153], 1:3);
v450 = v([261 262 263], [261 262 263]);
S101102 = S1([45], 1:1);
v102 = v([264], [264]);
v101_abc = v([265 266 267], [265 266 267]);
S101105 = S3([154 155 156], 1:3);
v105 = v([268 269 270], [268 269 270]);
v101_abc = v([265 266 267], [265 266 267]);
S102103 = S1([46], 1:1);
v103 = v([271], [271]);
S103104 = S1([47], 1:1);
v104 = v([272], [272]);
S105106 = S1([48], 1:1);
v106 = v([273], [273]);
v105_abc = v([274 275 276], [274 275 276]);
S105108 = S3([157 158 159], 1:3);
v108 = v([277 278 279], [277 278 279]);
v105_abc = v([274 275 276], [274 275 276]);
S106107 = S1([49], 1:1);
v107 = v([280], [280]);
S108109 = S1([50], 1:1);
v109 = v([281], [281]);
v108_abc = v([282 283 284], [282 283 284]);
S108300 = S3([160 161 162], 1:3);
v300 = v([285 286 287], [285 286 287]);
v108_abc = v([282 283 284], [282 283 284]);
S109110 = S1([51], 1:1);
v110 = v([288], [288]);
S110111 = S1([52], 1:1);
v111 = v([289], [289]);
S110112 = S1([53], 1:1);
v112 = v([290], [290]);
S112113 = S1([54], 1:1);
v113 = v([291], [291]);
S113114 = S1([55], 1:1);
v114 = v([292], [292]);
S13535 = S3([163 164 165], 1:3);
v35 = v([293 294 295], [293 294 295]);
S1491 = S3([166 167 168], 1:3);
v1 = v([296 297 298], [296 297 298]);
S15252 = S3([169 170 171], 1:3);
v52 = v([299 300 301], [299 300 301]);
S160R67 = S3([172 173 174], 1:3);
v67 = v([302 303 304], [302 303 304]);
S197101 = S3([175 176 177], 1:3);
v101 = v([305 306 307], [305 306 307]);
S51151 = S3([178 179 180], 1:3);
v151 = v([308 309 310], [308 309 310]);
S150150R = S3([181 182 183], 1:3);
v150R = v([311 312 313], [311 312 313]);
S99R = S1([56], 1:1);
v9R = v([314], [314]);
S2525R = S2([7 8], 1:2);
v25R = v([315 316], [315 316]);
v25_abc = v([317 318 319], [317 318 319]);
S160160R = S3([184 185 186], 1:3);
v160R = v([320 321 322], [320 321 322]);
S61S610 = S3([187 188 189], 1:3);
v610 = v([323 324 325], [323 324 325]);
S150R149 = S3([190 191 192], 1:3);
v149 = v([326 327 328], [326 327 328]);
S13152 = S3([193 194 195], 1:3);
v152 = v([329 330 331], [329 330 331]);
v13_abc = v([28 29 30], [28 29 30]);
S18135 = S3([196 197 198], 1:3);
v135 = v([332 333 334], [332 333 334]);
v18_abc = v([39 40 41], [39 40 41]);
S60160 = S3([199 200 201], 1:3);
v160 = v([335 336 337], [335 336 337]);
S97197 = S3([202 203 204], 1:3);
v197 = v([338 339 340], [338 339 340]);
S6161S = S3([205 206 207], 1:3);
v61S = v([341 342 343], [341 342 343]);
S151300_OPEN = S3([208 209 210], 1:3);
v300_OPEN = v([344 345 346], [344 345 346]);
S5494_OPEN = S1([57], 1:1);
v94_OPEN = v([347], [347]);
v54_abc = v([348 349 350], [348 349 350]);


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