local compe = require 'compe'

local Source = {}

function Source.get_metadata(self)
	return {
		priority = 100,
		dup = 1,
		menu = '[latex]',
	}
end

function Source.determine(self, context)
	local start = context.before_line:find('\\%S*$')
	if start ~= nil then
		return {
			keyword_pattern_offset = start,
			trigger_character_offset = start,
		}
	end
	return {}
end

local symbols

function Source.complete(self, args)
	local input = args.input
	if input == nil or input == "" then
		return
	end

	local items = {}
	for code, symbol in pairs(symbols) do
		if code:sub(1, #input):lower() == input:lower() then
			table.insert(items, {
				word = symbol,
				filter_text = code,
				menu = code,
			})
		end
	end

	args.callback { items = items }
end

-- Just a giant table, nothing to see here
-- Source: http://milde.users.sourceforge.net/LUCR/Math/
symbols = {
	["\\cent"] = "¢",
	["\\pounds"] = "£",
	["\\yen"] = "¥",
	["\\spddot"] = "¨",
	["\\neg"] = "¬",
	["\\lnot"] = "¬",
	["\\circledR"] = "®",
	["\\pm"] = "±",
	["\\Micro"] = "µ",
	["\\cdotp"] = "·",
	["\\times"] = "×",
	["\\eth"] = "ð",
	["\\div"] = "÷",
	["\\imath"] = "𝚤",
	["\\Zbar"] = "Ƶ",
	["\\jmath"] = "𝚥",
	["\\Alpha"] = "Α",
	["\\Beta"] = "Β",
	["\\Gamma"] = "Γ",
	["\\Delta"] = "Δ",
	["\\Epsilon"] = "Ε",
	["\\Zeta"] = "Ζ",
	["\\Eta"] = "Η",
	["\\Theta"] = "Θ",
	["\\Iota"] = "Ι",
	["\\Kappa"] = "Κ",
	["\\Lambda"] = "Λ",
	["\\upMu"] = "Μ",
	["\\upNu"] = "Ν",
	["\\Xi"] = "Ξ",
	["\\upOmicron"] = "Ο",
	["\\Pi"] = "Π",
	["\\Rho"] = "Ρ",
	["\\Sigma"] = "Σ",
	["\\Tau"] = "Τ",
	["\\Upsilon"] = "Υ",
	["\\Phi"] = "Φ",
	["\\Chi"] = "Χ",
	["\\Psi"] = "Ψ",
	["\\Omega"] = "Ω",
	["\\alpha"] = "α",
	["\\beta"] = "β",
	["\\gamma"] = "γ",
	["\\delta"] = "δ",
	["\\upepsilon"] = "ε",
	["\\zeta"] = "ζ",
	["\\eta"] = "η",
	["\\theta"] = "θ",
	["\\iota"] = "ι",
	["\\kappa"] = "κ",
	["\\lambda"] = "λ",
	["\\mu"] = "μ",
	["\\nu"] = "ν",
	["\\xi"] = "ξ",
	["\\upomicron"] = "ο",
	["\\pi"] = "π",
	["\\rho"] = "ρ",
	["\\varsigma"] = "ς",
	["\\sigma"] = "σ",
	["\\tau"] = "τ",
	["\\upsilon"] = "υ",
	["\\varphi"] = "φ",
	["\\chi"] = "χ",
	["\\psi"] = "ψ",
	["\\omega"] = "ω",
	["\\upvarbeta"] = "ϐ",
	["\\vartheta"] = "ϑ",
	["\\phi"] = "ϕ",
	["\\varpi"] = "ϖ",
	["\\upoldKoppa"] = "Ϙ",
	["\\upoldkoppa"] = "ϙ",
	["\\Stigma"] = "Ϛ",
	["\\upstigma"] = "ϛ",
	["\\Digamma"] = "Ϝ",
	["\\digamma"] = "ϝ",
	["\\Koppa"] = "Ϟ",
	["\\upkoppa"] = "ϟ",
	["\\Sampi"] = "Ϡ",
	["\\upsampi"] = "ϡ",
	["\\varkappa"] = "ϰ",
	["\\varrho"] = "ϱ",
	["\\textTheta"] = "ϴ",
	["\\epsilon"] = "ϵ",
	["\\varepsilon"] = "ε",
	["\\backepsilon"] = "϶",
	["\\quad"] = " ",
	["\\horizbar"] = "―",
	["\\|"] = "‖",
	["\\twolowline"] = "‗",
	["\\dagger"] = "†",
	["\\ddagger"] = "‡",
	["\\smblkcircle"] = "•",
	["\\enleadertwodots"] = "‥",
	["\\ldots"] = "…",
	["\\prime"] = "′",
	["\\second"] = "″",
	["\\third"] = "‴",
	["\\backprime"] = "‵",
	["\\backdprime"] = "‶",
	["\\backtrprime"] = "‷",
	["\\caretinsert"] = "‸",
	["\\Exclam"] = "‼",
	["\\cat"] = "⁀",
	["\\hyphenbullet"] = "⁃",
	["\\fracslash"] = "⁄",
	["\\Question"] = "⁇",
	["\\fourth"] = "⁗",
	["\\:"] = " ",
	["\\euro"] = "€",
	["\\Euler"] = "ℇ",
	["\\Planckconst"] = "ℎ",
	["\\hslash"] = "ℏ",
	["\\Im"] = "ℑ",
	["\\ell"] = "ℓ",
	["\\wp"] = "℘",
	["\\Re"] = "ℜ",
	["\\tcohm"] = "Ω",
	["\\mho"] = "℧",
	["\\turnediota"] = "℩",
	["\\Angstroem"] = "Å",
	["\\Finv"] = "Ⅎ",
	["\\aleph"] = "ℵ",
	["\\beth"] = "ℶ",
	["\\gimel"] = "ℷ",
	["\\daleth"] = "ℸ",
	["\\Game"] = "⅁",
	["\\sansLturned"] = "⅂",
	["\\sansLmirrored"] = "⅃",
	["\\Yup"] = "⅄",
	["\\CapitalDifferentialD"] = "ⅅ",
	["\\DifferentialD"] = "ⅆ",
	["\\ExponetialE"] = "ⅇ",
	["\\ComplexI"] = "ⅈ",
	["\\ComplexJ"] = "ⅉ",
	["\\PropertyLine"] = "⅊",
	["\\invamp"] = "⅋",
	["\\leftarrow"] = "←",
	["\\uparrow"] = "↑",
	["\\rightarrow"] = "→",
	["\\to"] = "→",
	["\\downarrow"] = "↓",
	["\\leftrightarrow"] = "↔",
	["\\updownarrow"] = "↕",
	["\\nwarrow"] = "↖",
	["\\nearrow"] = "↗",
	["\\searrow"] = "↘",
	["\\swarrow"] = "↙",
	["\\nleftarrow"] = "↚",
	["\\nrightarrow"] = "↛",
	["\\leftwavearrow"] = "↜",
	["\\rightwavearrow"] = "↝",
	["\\twoheadleftarrow"] = "↞",
	["\\twoheaduparrow"] = "↟",
	["\\twoheadrightarrow"] = "↠",
	["\\twoheaddownarrow"] = "↡",
	["\\leftarrowtail"] = "↢",
	["\\rightarrowtail"] = "↣",
	["\\mapsfrom"] = "↤",
	["\\MapsUp"] = "↥",
	["\\mapsto"] = "↦",
	["\\MapsDown"] = "↧",
	["\\updownarrowbar"] = "↨",
	["\\hookleftarrow"] = "↩",
	["\\hookrightarrow"] = "↪",
	["\\looparrowleft"] = "↫",
	["\\looparrowright"] = "↬",
	["\\leftrightsquigarrow"] = "↭",
	["\\nleftrightarrow"] = "↮",
	["\\lightning"] = "↯",
	["\\Lsh"] = "↰",
	["\\Rsh"] = "↱",
	["\\dlsh"] = "↲",
	["\\drsh"] = "↳",
	["\\linefeed"] = "↴",
	["\\carriagereturn"] = "↵",
	["\\curvearrowleft"] = "↶",
	["\\curvearrowright"] = "↷",
	["\\barovernorthwestarrow"] = "↸",
	["\\barleftarrowrightarrowba"] = "↹",
	["\\circlearrowleft"] = "↺",
	["\\circlearrowright"] = "↻",
	["\\leftharpoonup"] = "↼",
	["\\leftharpoondown"] = "↽",
	["\\upharpoonright"] = "↾",
	["\\upharpoonleft"] = "↿",
	["\\rightharpoonup"] = "⇀",
	["\\rightharpoondown"] = "⇁",
	["\\downharpoonright"] = "⇂",
	["\\downharpoonleft"] = "⇃",
	["\\rightleftarrows"] = "⇄",
	["\\updownarrows"] = "⇅",
	["\\leftrightarrows"] = "⇆",
	["\\leftleftarrows"] = "⇇",
	["\\upuparrows"] = "⇈",
	["\\rightrightarrows"] = "⇉",
	["\\downdownarrows"] = "⇊",
	["\\leftrightharpoons"] = "⇋",
	["\\rightleftharpoons"] = "⇌",
	["\\nLeftarrow"] = "⇍",
	["\\nLeftrightarrow"] = "⇎",
	["\\nRightarrow"] = "⇏",
	["\\Leftarrow"] = "⇐",
	["\\Uparrow"] = "⇑",
	["\\Rightarrow"] = "⇒",
	["\\Downarrow"] = "⇓",
	["\\Leftrightarrow"] = "⇔",
	["\\Updownarrow"] = "⇕",
	["\\Nwarrow"] = "⇖",
	["\\Nearrow"] = "⇗",
	["\\Searrow"] = "⇘",
	["\\Swarrow"] = "⇙",
	["\\Lleftarrow"] = "⇚",
	["\\Rrightarrow"] = "⇛",
	["\\leftsquigarrow"] = "⇜",
	["\\rightsquigarrow"] = "⇝",
	["\\nHuparrow"] = "⇞",
	["\\nHdownarrow"] = "⇟",
	["\\dashleftarrow"] = "⇠",
	["\\updasharrow"] = "⇡",
	["\\dashrightarrow"] = "⇢",
	["\\downdasharrow"] = "⇣",
	["\\LeftArrowBar"] = "⇤",
	["\\RightArrowBar"] = "⇥",
	["\\leftwhitearrow"] = "⇦",
	["\\upwhitearrow"] = "⇧",
	["\\rightwhitearrow"] = "⇨",
	["\\downwhitearrow"] = "⇩",
	["\\whitearrowupfrombar"] = "⇪",
	["\\mathord"] = "⍹",
	["\\circleonrightarrow"] = "⇴",
	["\\downuparrows"] = "⇵",
	["\\rightthreearrows"] = "⇶",
	["\\nvleftarrow"] = "⇷",
	["\\pfun"] = "⇸",
	["\\nvleftrightarrow"] = "⇹",
	["\\nVleftarrow"] = "⇺",
	["\\ffun"] = "⇻",
	["\\nVleftrightarrow"] = "⇼",
	["\\leftarrowtriangle"] = "⇽",
	["\\rightarrowtriangle"] = "⇾",
	["\\leftrightarrowtriangle"] = "⇿",
	["\\forall"] = "∀",
	["\\complement"] = "∁",
	["\\partial"] = "𝜕",
	["\\exists"] = "∃",
	["\\nexists"] = "∄",
	["\\varnothing"] = "∅",
	["\\emptyset"] = "∅",
	["\\increment"] = "∆",
	["\\nabla"] = "∇",
	["\\in"] = "∈",
	["\\notin"] = "∉",
	["\\smallin"] = "∊",
	["\\ni"] = "∋",
	["\\nni"] = "∌",
	["\\smallni"] = "∍",
	["\\QED"] = "∎",
	["\\prod"] = "∏",
	["\\coprod"] = "∐",
	["\\sum"] = "∑",
	["\\mp"] = "∓",
	["\\dotplus"] = "∔",
	["\\slash"] = "∕",
	["\\smallsetminus"] = "∖",
	["\\ast"] = "∗",
	["\\circ"] = "∘",
	["\\bullet"] = "∙",
	["\\sqrt"] = "√",
	["\\propto"] = "∝",
	["\\infty"] = "∞",
	["\\rightangle"] = "∟",
	["\\angle"] = "∠",
	["\\measuredangle"] = "∡",
	["\\sphericalangle"] = "∢",
	["\\mid"] = "∣",
	["\\nmid"] = "∤",
	["\\parallel"] = "∥",
	["\\nparallel"] = "∦",
	["\\wedge"] = "∧",
	["\\vee"] = "∨",
	["\\land"] = "∧",
	["\\lor"] = "∨",
	["\\cap"] = "∩",
	["\\cup"] = "∪",
	["\\int"] = "∫",
	["\\iint"] = "∬",
	["\\iiint"] = "∭",
	["\\oint"] = "∮",
	["\\oiint"] = "∯",
	["\\oiiint"] = "∰",
	["\\intclockwise"] = "∱",
	["\\varointclockwise"] = "∲",
	["\\ointctrclockwise"] = "∳",
	["\\therefore"] = "∴",
	["\\because"] = "∵",
	["\\Proportion"] = "∷",
	["\\dotminus"] = "∸",
	["\\eqcolon"] = "≕",
	["\\dotsminusdots"] = "∺",
	["\\kernelcontraction"] = "∻",
	["\\sim"] = "∼",
	["\\backsim"] = "∽",
	["\\invlazys"] = "∾",
	["\\AC"] = "∿",
	["\\wr"] = "≀",
	["\\nsim"] = "≁",
	["\\eqsim"] = "≂",
	["\\simeq"] = "≃",
	["\\nsimeq"] = "≄",
	["\\cong"] = "≅",
	["\\simneqq"] = "≆",
	["\\ncong"] = "≇",
	["\\approx"] = "≈",
	["\\napprox"] = "≉",
	["\\approxeq"] = "≊",
	["\\approxident"] = "≋",
	["\\backcong"] = "≌",
	["\\asymp"] = "≍",
	["\\Bumpeq"] = "≎",
	["\\bumpeq"] = "≏",
	["\\doteq"] = "≐",
	["\\Doteq"] = "≑",
	["\\fallingdotseq"] = "≒",
	["\\risingdotseq"] = "≓",
	["\\coloneq"] = "≔",
	["\\eqcirc"] = "≖",
	["\\circeq"] = "≗",
	["\\arceq"] = "≘",
	["\\corresponds"] = "≙",
	["\\veeeq"] = "≚",
	["\\stareq"] = "≛",
	["\\triangleq"] = "≜",
	["\\eqdef"] = "≝",
	["\\measeq"] = "≞",
	["\\questeq"] = "≟",
	["\\neq"] = "≠",
	["\\equiv"] = "≡",
	["\\nequiv"] = "≢",
	["\\Equiv"] = "≣",
	["\\leq"] = "≤",
	["\\geq"] = "≥",
	["\\leqq"] = "≦",
	["\\geqq"] = "≧",
	["\\lneqq"] = "≨",
	["\\gneqq"] = "≩",
	["\\ll"] = "≪",
	["\\gg"] = "≫",
	["\\between"] = "≬",
	["\\notasymp"] = "≭",
	["\\nless"] = "≮",
	["\\ngtr"] = "≯",
	["\\nleq"] = "≰",
	["\\ngeq"] = "≱",
	["\\lesssim"] = "≲",
	["\\gtrsim"] = "≳",
	["\\NotLessTilde"] = "≴",
	["\\NotGreaterTilde"] = "≵",
	["\\lessgtr"] = "≶",
	["\\gtrless"] = "≷",
	["\\nlessgtr"] = "≸",
	["\\NotGreaterLess"] = "≹",
	["\\prec"] = "≺",
	["\\succ"] = "≻",
	["\\preccurlyeq"] = "≼",
	["\\succcurlyeq"] = "≽",
	["\\precsim"] = "≾",
	["\\succsim"] = "≿",
	["\\nprec"] = "⊀",
	["\\nsucc"] = "⊁",
	["\\subset"] = "⊂",
	["\\supset"] = "⊃",
	["\\nsubset"] = "⊄",
	["\\nsupset"] = "⊅",
	["\\subseteq"] = "⊆",
	["\\supseteq"] = "⊇",
	["\\nsubseteq"] = "⊈",
	["\\nsupseteq"] = "⊉",
	["\\subsetneq"] = "⊊",
	["\\supsetneq"] = "⊋",
	["\\cupleftarrow"] = "⊌",
	["\\cupdot"] = "⊍",
	["\\uplus"] = "⊎",
	["\\sqsubset"] = "⊏",
	["\\sqsupset"] = "⊐",
	["\\sqsubseteq"] = "⊑",
	["\\sqsupseteq"] = "⊒",
	["\\sqcap"] = "⊓",
	["\\sqcup"] = "⊔",
	["\\oplus"] = "⊕",
	["\\ominus"] = "⊖",
	["\\otimes"] = "⊗",
	["\\oslash"] = "⊘",
	["\\odot"] = "⊙",
	["\\circledcirc"] = "⊚",
	["\\circledast"] = "⊛",
	["\\circledequal"] = "⊜",
	["\\circleddash"] = "⊝",
	["\\boxplus"] = "⊞",
	["\\boxminus"] = "⊟",
	["\\boxtimes"] = "⊠",
	["\\boxdot"] = "⊡",
	["\\vdash"] = "⊢",
	["\\dashv"] = "⊣",
	["\\top"] = "⊤",
	["\\bot"] = "⊥",
	["\\assert"] = "⊦",
	["\\models"] = "⊧",
	["\\vDash"] = "⊨",
	["\\Vdash"] = "⊩",
	["\\Vvdash"] = "⊪",
	["\\VDash"] = "⊫",
	["\\nvdash"] = "⊬",
	["\\nvDash"] = "⊭",
	["\\nVdash"] = "⊮",
	["\\nVDash"] = "⊯",
	["\\prurel"] = "⊰",
	["\\scurel"] = "⊱",
	["\\vartriangleleft"] = "⊲",
	["\\vartriangleright"] = "⊳",
	["\\trianglelefteq"] = "⊴",
	["\\trianglerighteq"] = "⊵",
	["\\multimapdotbothA"] = "⊶",
	["\\multimapdotbothB"] = "⊷",
	["\\multimap"] = "⊸",
	["\\hermitmatrix"] = "⊹",
	["\\intercal"] = "⊺",
	["\\veebar"] = "⊻",
	["\\barwedge"] = "⊼",
	["\\barvee"] = "⊽",
	["\\measuredrightangle"] = "⊾",
	["\\varlrtriangle"] = "⊿",
	["\\bigwedge"] = "⋀",
	["\\bigvee"] = "⋁",
	["\\bigcap"] = "⋂",
	["\\bigcup"] = "⋃",
	["\\diamond"] = "⋄",
	["\\cdot"] = "⋅",
	["\\star"] = "⋆",
	["\\divideontimes"] = "⋇",
	["\\bowtie"] = "⋈",
	["\\ltimes"] = "⋉",
	["\\rtimes"] = "⋊",
	["\\leftthreetimes"] = "⋋",
	["\\rightthreetimes"] = "⋌",
	["\\backsimeq"] = "⋍",
	["\\curlyvee"] = "⋎",
	["\\curlywedge"] = "⋏",
	["\\Subset"] = "⋐",
	["\\Supset"] = "⋑",
	["\\Cap"] = "⋒",
	["\\Cup"] = "⋓",
	["\\pitchfork"] = "⋔",
	["\\hash"] = "⋕",
	["\\lessdot"] = "⋖",
	["\\gtrdot"] = "⋗",
	["\\lll"] = "⋘",
	["\\ggg"] = "⋙",
	["\\lesseqgtr"] = "⋚",
	["\\gtreqless"] = "⋛",
	["\\eqless"] = "⋜",
	["\\eqgtr"] = "⋝",
	["\\curlyeqprec"] = "⋞",
	["\\curlyeqsucc"] = "⋟",
	["\\npreceq"] = "⋠",
	["\\nsucceq"] = "⋡",
	["\\nsqsubseteq"] = "⋢",
	["\\nsqsupseteq"] = "⋣",
	["\\sqsubsetneq"] = "⋤",
	["\\sqsupsetneq"] = "⋥",
	["\\lnsim"] = "⋦",
	["\\gnsim"] = "⋧",
	["\\precnsim"] = "⋨",
	["\\succnsim"] = "⋩",
	["\\ntriangleleft"] = "⋪",
	["\\ntriangleright"] = "⋫",
	["\\ntrianglelefteq"] = "⋬",
	["\\ntrianglerighteq"] = "⋭",
	["\\vdots"] = "⋮",
	["\\cdots"] = "⋯",
	["\\iddots"] = "⋰",
	["\\ddots"] = "⋱",
	["\\disin"] = "⋲",
	["\\varisins"] = "⋳",
	["\\isins"] = "⋴",
	["\\isindot"] = "⋵",
	["\\barin"] = "⋶",
	["\\isinobar"] = "⋷",
	["\\isinvb"] = "⋸",
	["\\isinE"] = "⋹",
	["\\nisd"] = "⋺",
	["\\varnis"] = "⋻",
	["\\nis"] = "⋼",
	["\\varniobar"] = "⋽",
	["\\niobar"] = "⋾",
	["\\bagmember"] = "⋿",
	["\\diameter"] = "⌀",
	["\\house"] = "⌂",
	["\\varbarwedge"] = "⌅",
	["\\vardoublebarwedge"] = "⌆",
	["\\lceil"] = "⌈",
	["\\rceil"] = "⌉",
	["\\lfloor"] = "⌊",
	["\\rfloor"] = "⌋",
	["\\invneg"] = "⌐",
	["\\wasylozenge"] = "⌑",
	["\\profline"] = "⌒",
	["\\profsurf"] = "⌓",
	["\\viewdata"] = "⌗",
	["\\turnednot"] = "⌙",
	["\\ulcorner"] = "⌜",
	["\\urcorner"] = "⌝",
	["\\llcorner"] = "⌞",
	["\\lrcorner"] = "⌟",
	["\\inttop"] = "⌠",
	["\\intbottom"] = "⌡",
	["\\frown"] = "⌢",
	["\\smile"] = "⌣",
	["\\varhexagonlrbonds"] = "⌬",
	["\\conictaper"] = "⌲",
	["\\topbot"] = "⌶",
	["\\APLinv"] = "⌹",
	["\\obar"] = "⌽",
	["\\notslash"] = "⌿",
	["\\notbackslash"] = "⍀",
	["\\APLleftarrowbox"] = "⍇",
	["\\APLrightarrowbox"] = "⍈",
	["\\APLuparrowbox"] = "⍐",
	["\\APLboxupcaret"] = "⍓",
	["\\APLdownarrowbox"] = "⍗",
	["\\APLcomment"] = "⍝",
	["\\APLinput"] = "⍞",
	["\\APLlog"] = "⍟",
	["\\APLboxquestion"] = "⍰",
	["\\rangledownzigzagarrow"] = "⍼",
	["\\hexagon"] = "⎔",
	["\\lparenuend"] = "⎛",
	["\\lparenextender"] = "⎜",
	["\\lparenlend"] = "⎝",
	["\\rparenuend"] = "⎞",
	["\\rparenextender"] = "⎟",
	["\\rparenlend"] = "⎠",
	["\\lbrackuend"] = "⎡",
	["\\lbrackextender"] = "⎢",
	["\\lbracklend"] = "⎣",
	["\\rbrackuend"] = "⎤",
	["\\rbrackextender"] = "⎥",
	["\\rbracklend"] = "⎦",
	["\\lbraceuend"] = "⎧",
	["\\lbracemid"] = "⎨",
	["\\lbracelend"] = "⎩",
	["\\vbraceextender"] = "⎪",
	["\\rbraceuend"] = "⎫",
	["\\rbracemid"] = "⎬",
	["\\rbracelend"] = "⎭",
	["\\intextender"] = "⎮",
	["\\harrowextender"] = "⎯",
	["\\lmoustache"] = "⎰",
	["\\rmoustache"] = "⎱",
	["\\sumtop"] = "⎲",
	["\\sumbottom"] = "⎳",
	["\\overbracket"] = "⎴",
	["\\underbracket"] = "⎵",
	["\\bbrktbrk"] = "⎶",
	["\\sqrtbottom"] = "⎷",
	["\\lvboxline"] = "⎸",
	["\\rvboxline"] = "⎹",
	["\\varcarriagereturn"] = "⏎",
	["\\trapezium"] = "⏢",
	["\\benzenr"] = "⏣",
	["\\strns"] = "⏤",
	["\\fltns"] = "⏥",
	["\\accurrent"] = "⏦",
	["\\elinters"] = "⏧",
	["\\bdtriplevdash"] = "┆",
	["\\blockuphalf"] = "▀",
	["\\blocklowhalf"] = "▄",
	["\\blockfull"] = "█",
	["\\blocklefthalf"] = "▌",
	["\\blockrighthalf"] = "▐",
	["\\blockqtrshaded"] = "░",
	["\\blockhalfshaded"] = "▒",
	["\\blockthreeqtrshaded"] = "▓",
	["\\mdlgblksquare"] = "■",
	["\\mdlgwhtsquare"] = "□",
	["\\squoval"] = "▢",
	["\\blackinwhitesquare"] = "▣",
	["\\squarehfill"] = "▤",
	["\\squarevfill"] = "▥",
	["\\squarehvfill"] = "▦",
	["\\squarenwsefill"] = "▧",
	["\\squareneswfill"] = "▨",
	["\\squarecrossfill"] = "▩",
	["\\smblksquare"] = "▪",
	["\\smwhtsquare"] = "▫",
	["\\hrectangleblack"] = "▬",
	["\\hrectangle"] = "▭",
	["\\vrectangleblack"] = "▮",
	["\\vrectangle"] = "▯",
	["\\parallelogramblack"] = "▰",
	["\\parallelogram"] = "▱",
	["\\bigblacktriangleup"] = "▲",
	["\\bigtriangleup"] = "△",
	["\\blacktriangleup"] = "▴",
	["\\smalltriangleup"] = "▵",
	["\\RHD"] = "▶",
	["\\rhd"] = "▷",
	["\\blacktriangleright"] = "▸",
	["\\smalltriangleright"] = "▹",
	["\\blackpointerright"] = "►",
	["\\whitepointerright"] = "▻",
	["\\bigblacktriangledown"] = "▼",
	["\\bigtriangledown"] = "▽",
	["\\blacktriangledown"] = "▾",
	["\\smalltriangledown"] = "▿",
	["\\LHD"] = "◀",
	["\\lhd"] = "◁",
	["\\blacktriangleleft"] = "◂",
	["\\smalltriangleleft"] = "◃",
	["\\blackpointerleft"] = "◄",
	["\\whitepointerleft"] = "◅",
	["\\Diamondblack"] = "◆",
	["\\Diamond"] = "◇",
	["\\blackinwhitediamond"] = "◈",
	["\\fisheye"] = "◉",
	["\\lozenge"] = "◊",
	["\\Circle"] = "○",
	["\\dottedcircle"] = "◌",
	["\\circlevertfill"] = "◍",
	["\\bullseye"] = "◎",
	["\\CIRCLE"] = "●",
	["\\LEFTcircle"] = "◐",
	["\\RIGHTcircle"] = "◑",
	["\\circlebottomhalfblack"] = "◒",
	["\\circletophalfblack"] = "◓",
	["\\circleurquadblack"] = "◔",
	["\\blackcircleulquadwhite"] = "◕",
	["\\LEFTCIRCLE"] = "◖",
	["\\RIGHTCIRCLE"] = "◗",
	["\\inversebullet"] = "◘",
	["\\inversewhitecircle"] = "◙",
	["\\invwhiteupperhalfcircle"] = "◚",
	["\\invwhitelowerhalfcircle"] = "◛",
	["\\ularc"] = "◜",
	["\\urarc"] = "◝",
	["\\lrarc"] = "◞",
	["\\llarc"] = "◟",
	["\\topsemicircle"] = "◠",
	["\\botsemicircle"] = "◡",
	["\\lrblacktriangle"] = "◢",
	["\\llblacktriangle"] = "◣",
	["\\ulblacktriangle"] = "◤",
	["\\urblacktriangle"] = "◥",
	["\\smwhtcircle"] = "◦",
	["\\squareleftblack"] = "◧",
	["\\squarerightblack"] = "◨",
	["\\squareulblack"] = "◩",
	["\\squarelrblack"] = "◪",
	["\\boxbar"] = "◫",
	["\\trianglecdot"] = "◬",
	["\\triangleleftblack"] = "◭",
	["\\trianglerightblack"] = "◮",
	["\\lgwhtcircle"] = "◯",
	["\\squareulquad"] = "◰",
	["\\squarellquad"] = "◱",
	["\\squarelrquad"] = "◲",
	["\\squareurquad"] = "◳",
	["\\circleulquad"] = "◴",
	["\\circlellquad"] = "◵",
	["\\circlelrquad"] = "◶",
	["\\circleurquad"] = "◷",
	["\\ultriangle"] = "◸",
	["\\urtriangle"] = "◹",
	["\\lltriangle"] = "◺",
	["\\square"] = "⬜",
	["\\blacksquare"] = "⬛",
	["\\mdsmwhtsquare"] = "◽",
	["\\mdsmblksquare"] = "◾",
	["\\lrtriangle"] = "◿",
	["\\bigstar"] = "★",
	["\\bigwhitestar"] = "☆",
	["\\Sun"] = "☉",
	["\\Square"] = "☐",
	["\\CheckedBox"] = "☑",
	["\\XBox"] = "☒",
	["\\steaming"] = "☕",
	["\\pointright"] = "☞",
	["\\skull"] = "☠",
	["\\danger"] = "☡",
	["\\radiation"] = "☢",
	["\\biohazard"] = "☣",
	["\\yinyang"] = "☯",
	["\\frownie"] = "☹",
	["\\smiley"] = "☺",
	["\\blacksmiley"] = "☻",
	["\\sun"] = "☼",
	["\\rightmoon"] = "☽",
	["\\leftmoon"] = "☾",
	["\\mercury"] = "☿",
	["\\female"] = "♀",
	["\\earth"] = "♁",
	["\\male"] = "♂",
	["\\jupiter"] = "♃",
	["\\saturn"] = "♄",
	["\\uranus"] = "♅",
	["\\neptune"] = "♆",
	["\\pluto"] = "♇",
	["\\aries"] = "♈",
	["\\taurus"] = "♉",
	["\\gemini"] = "♊",
	["\\cancer"] = "♋",
	["\\leo"] = "♌",
	["\\virgo"] = "♍",
	["\\libra"] = "♎",
	["\\scorpio"] = "♏",
	["\\sagittarius"] = "♐",
	["\\capricornus"] = "♑",
	["\\aquarius"] = "♒",
	["\\pisces"] = "♓",
	["\\spadesuit"] = "♠",
	["\\heartsuit"] = "♡",
	["\\diamondsuit"] = "♢",
	["\\clubsuit"] = "♣",
	["\\varspadesuit"] = "♤",
	["\\varheartsuit"] = "♥",
	["\\vardiamondsuit"] = "♦",
	["\\varclubsuit"] = "♧",
	["\\quarternote"] = "♩",
	["\\eighthnote"] = "♪",
	["\\twonotes"] = "♫",
	["\\sixteenthnote"] = "♬",
	["\\flat"] = "♭",
	["\\natural"] = "♮",
	["\\sharp"] = "♯",
	["\\recycle"] = "♻",
	["\\acidfree"] = "♾",
	["\\dicei"] = "⚀",
	["\\diceii"] = "⚁",
	["\\diceiii"] = "⚂",
	["\\diceiv"] = "⚃",
	["\\dicev"] = "⚄",
	["\\dicevi"] = "⚅",
	["\\circledrightdot"] = "⚆",
	["\\circledtwodots"] = "⚇",
	["\\blackcircledrightdot"] = "⚈",
	["\\blackcircledtwodots"] = "⚉",
	["\\anchor"] = "⚓",
	["\\swords"] = "⚔",
	["\\warning"] = "⚠",
	["\\Hermaphrodite"] = "⚥",
	["\\medcirc"] = "⚪",
	["\\medbullet"] = "⚫",
	["\\mdsmwhtcircle"] = "⚬",
	["\\neuter"] = "⚲",
	["\\pencil"] = "✎",
	["\\checkmark"] = "✓",
	["\\ballotx"] = "✗",
	["\\maltese"] = "✠",
	["\\circledstar"] = "✪",
	["\\varstar"] = "✶",
	["\\dingasterisk"] = "✽",
	["\\lbrbrak"] = "〔",
	["\\rbrbrak"] = "〕",
	["\\draftingarrow"] = "➛",
	["\\arrowbullet"] = "➢",
	["\\threedangle"] = "⟀",
	["\\whiteinwhitetriangle"] = "⟁",
	["\\perp"] = "⟂",
	["\\subsetcirc"] = "⟃",
	["\\supsetcirc"] = "⟄",
	["\\Lbag"] = "⟅",
	["\\Rbag"] = "⟆",
	["\\veedot"] = "⟇",
	["\\bsolhsub"] = "⟈",
	["\\suphsol"] = "⟉",
	["\\longdivision"] = "⟌",
	["\\Diamonddot"] = "⟐",
	["\\wedgedot"] = "⟑",
	["\\upin"] = "⟒",
	["\\pullback"] = "⟓",
	["\\pushout"] = "⟔",
	["\\leftouterjoin"] = "⟕",
	["\\rightouterjoin"] = "⟖",
	["\\fullouterjoin"] = "⟗",
	["\\bigbot"] = "⟘",
	["\\bigtop"] = "⟙",
	["\\DashVDash"] = "⟚",
	["\\dashVdash"] = "⟛",
	["\\multimapinv"] = "⟜",
	["\\vlongdash"] = "⟝",
	["\\longdashv"] = "⟞",
	["\\cirbot"] = "⟟",
	["\\lozengeminus"] = "⟠",
	["\\concavediamond"] = "⟡",
	["\\concavediamondtickleft"] = "⟢",
	["\\concavediamondtickright"] = "⟣",
	["\\whitesquaretickleft"] = "⟤",
	["\\whitesquaretickright"] = "⟥",
	["\\llbracket"] = "⟦",
	["\\rrbracket"] = "⟧",
	["\\langle"] = "⟨",
	["\\rangle"] = "⟩",
	["\\lang"] = "⟪",
	["\\rang"] = "⟫",
	["\\Lbrbrak"] = "〘",
	["\\Rbrbrak"] = "〙",
	["\\lgroup"] = "⟮",
	["\\rgroup"] = "⟯",
	["\\UUparrow"] = "⟰",
	["\\DDownarrow"] = "⟱",
	["\\acwgapcirclearrow"] = "⟲",
	["\\cwgapcirclearrow"] = "⟳",
	["\\rightarrowonoplus"] = "⟴",
	["\\longleftarrow"] = "⟵",
	["\\longrightarrow"] = "⟶",
	["\\longleftrightarrow"] = "⟷",
	["\\Longleftarrow"] = "⟸",
	["\\Longrightarrow"] = "⟹",
	["\\Longleftrightarrow"] = "⟺",
	["\\longmapsfrom"] = "⟻",
	["\\longmapsto"] = "⟼",
	["\\Longmapsfrom"] = "⟽",
	["\\Longmapsto"] = "⟾",
	["\\longrightsquigarrow"] = "⟿",
	["\\psur"] = "⤀",
	["\\nVtwoheadrightarrow"] = "⤁",
	["\\nvLeftarrow"] = "⤂",
	["\\nvRightarrow"] = "⤃",
	["\\nvLeftrightarrow"] = "⤄",
	["\\twoheadmapsto"] = "⤅",
	["\\Mapsfrom"] = "⤆",
	["\\Mapsto"] = "⤇",
	["\\downarrowbarred"] = "⤈",
	["\\uparrowbarred"] = "⤉",
	["\\Uuparrow"] = "⤊",
	["\\Ddownarrow"] = "⤋",
	["\\leftbkarrow"] = "⤌",
	["\\rightbkarrow"] = "⤍",
	["\\leftdbkarrow"] = "⤎",
	["\\dbkarow"] = "⤏",
	["\\drbkarow"] = "⤐",
	["\\rightdotarrow"] = "⤑",
	["\\UpArrowBar"] = "⤒",
	["\\DownArrowBar"] = "⤓",
	["\\pinj"] = "⤔",
	["\\finj"] = "⤕",
	["\\bij"] = "⤖",
	["\\nvtwoheadrightarrowtail"] = "⤗",
	["\\nVtwoheadrightarrowtail"] = "⤘",
	["\\lefttail"] = "⤙",
	["\\righttail"] = "⤚",
	["\\leftdbltail"] = "⤛",
	["\\rightdbltail"] = "⤜",
	["\\diamondleftarrow"] = "⤝",
	["\\rightarrowdiamond"] = "⤞",
	["\\diamondleftarrowbar"] = "⤟",
	["\\barrightarrowdiamond"] = "⤠",
	["\\nwsearrow"] = "⤡",
	["\\neswarrow"] = "⤢",
	["\\hknwarrow"] = "⤣",
	["\\hknearrow"] = "⤤",
	["\\hksearow"] = "⤥",
	["\\hkswarow"] = "⤦",
	["\\tona"] = "⤧",
	["\\toea"] = "⤨",
	["\\tosa"] = "⤩",
	["\\towa"] = "⤪",
	["\\rdiagovfdiag"] = "⤫",
	["\\fdiagovrdiag"] = "⤬",
	["\\seovnearrow"] = "⤭",
	["\\neovsearrow"] = "⤮",
	["\\fdiagovnearrow"] = "⤯",
	["\\rdiagovsearrow"] = "⤰",
	["\\neovnwarrow"] = "⤱",
	["\\nwovnearrow"] = "⤲",
	["\\leadsto"] = "⤳",
	["\\uprightcurvearrow"] = "⤴",
	["\\downrightcurvedarrow"] = "⤵",
	["\\leftdowncurvedarrow"] = "⤶",
	["\\rightdowncurvedarrow"] = "⤷",
	["\\cwrightarcarrow"] = "⤸",
	["\\acwleftarcarrow"] = "⤹",
	["\\acwoverarcarrow"] = "⤺",
	["\\acwunderarcarrow"] = "⤻",
	["\\curvearrowrightminus"] = "⤼",
	["\\curvearrowleftplus"] = "⤽",
	["\\cwundercurvearrow"] = "⤾",
	["\\ccwundercurvearrow"] = "⤿",
	["\\acwcirclearrow"] = "⥀",
	["\\cwcirclearrow"] = "⥁",
	["\\rightarrowshortleftarrow"] = "⥂",
	["\\leftarrowshortrightarrow"] = "⥃",
	["\\shortrightarrowleftarrow"] = "⥄",
	["\\rightarrowplus"] = "⥅",
	["\\leftarrowplus"] = "⥆",
	["\\rightarrowx"] = "⥇",
	["\\leftrightarrowcircle"] = "⥈",
	["\\twoheaduparrowcircle"] = "⥉",
	["\\leftrightharpoon"] = "⥊",
	["\\rightleftharpoon"] = "⥋",
	["\\updownharpoonrightleft"] = "⥌",
	["\\updownharpoonleftright"] = "⥍",
	["\\leftrightharpoonup"] = "⥎",
	["\\rightupdownharpoon"] = "⥏",
	["\\leftrightharpoondown"] = "⥐",
	["\\leftupdownharpoon"] = "⥑",
	["\\LeftVectorBar"] = "⥒",
	["\\RightVectorBar"] = "⥓",
	["\\RightUpVectorBar"] = "⥔",
	["\\RightDownVectorBar"] = "⥕",
	["\\DownLeftVectorBar"] = "⥖",
	["\\DownRightVectorBar"] = "⥗",
	["\\LeftUpVectorBar"] = "⥘",
	["\\LeftDownVectorBar"] = "⥙",
	["\\LeftTeeVector"] = "⥚",
	["\\RightTeeVector"] = "⥛",
	["\\RightUpTeeVector"] = "⥜",
	["\\RightDownTeeVector"] = "⥝",
	["\\DownLeftTeeVector"] = "⥞",
	["\\DownRightTeeVector"] = "⥟",
	["\\LeftUpTeeVector"] = "⥠",
	["\\LeftDownTeeVector"] = "⥡",
	["\\leftleftharpoons"] = "⥢",
	["\\upupharpoons"] = "⥣",
	["\\rightrightharpoons"] = "⥤",
	["\\downdownharpoons"] = "⥥",
	["\\leftrightharpoonsup"] = "⥦",
	["\\leftrightharpoonsdown"] = "⥧",
	["\\rightleftharpoonsup"] = "⥨",
	["\\rightleftharpoonsdown"] = "⥩",
	["\\leftbarharpoon"] = "⥪",
	["\\barleftharpoon"] = "⥫",
	["\\rightbarharpoon"] = "⥬",
	["\\barrightharpoon"] = "⥭",
	["\\updownharpoons"] = "⥮",
	["\\downupharpoons"] = "⥯",
	["\\rightimply"] = "⥰",
	["\\equalrightarrow"] = "⥱",
	["\\similarrightarrow"] = "⥲",
	["\\leftarrowsimilar"] = "⥳",
	["\\rightarrowsimilar"] = "⥴",
	["\\rightarrowapprox"] = "⥵",
	["\\ltlarr"] = "⥶",
	["\\leftarrowless"] = "⥷",
	["\\gtrarr"] = "⥸",
	["\\subrarr"] = "⥹",
	["\\leftarrowsubset"] = "⥺",
	["\\suplarr"] = "⥻",
	["\\strictfi"] = "⥼",
	["\\strictif"] = "⥽",
	["\\upfishtail"] = "⥾",
	["\\downfishtail"] = "⥿",
	["\\VERT"] = "⦀",
	["\\spot"] = "⦁",
	["\\typecolon"] = "⦂",
	["\\lBrace"] = "⦃",
	["\\rBrace"] = "⦄",
	["\\Lparen"] = "⦅",
	["\\Rparen"] = "⦆",
	["\\limg"] = "⦇",
	["\\rimg"] = "⦈",
	["\\lblot"] = "⦉",
	["\\rblot"] = "⦊",
	["\\lbrackubar"] = "⦋",
	["\\rbrackubar"] = "⦌",
	["\\lbrackultick"] = "⦍",
	["\\rbracklrtick"] = "⦎",
	["\\lbracklltick"] = "⦏",
	["\\rbrackurtick"] = "⦐",
	["\\langledot"] = "⦑",
	["\\rangledot"] = "⦒",
	["\\lparenless"] = "⦓",
	["\\rparengtr"] = "⦔",
	["\\Lparengtr"] = "⦕",
	["\\Rparenless"] = "⦖",
	["\\lblkbrbrak"] = "⦗",
	["\\rblkbrbrak"] = "⦘",
	["\\fourvdots"] = "⦙",
	["\\vzigzag"] = "⦚",
	["\\measuredangleleft"] = "⦛",
	["\\rightanglesqr"] = "⦜",
	["\\rightanglemdot"] = "⦝",
	["\\angles"] = "⦞",
	["\\angdnr"] = "⦟",
	["\\gtlpar"] = "⦠",
	["\\sphericalangleup"] = "⦡",
	["\\turnangle"] = "⦢",
	["\\revangle"] = "⦣",
	["\\angleubar"] = "⦤",
	["\\revangleubar"] = "⦥",
	["\\wideangledown"] = "⦦",
	["\\wideangleup"] = "⦧",
	["\\measanglerutone"] = "⦨",
	["\\measanglelutonw"] = "⦩",
	["\\measanglerdtose"] = "⦪",
	["\\measangleldtosw"] = "⦫",
	["\\measangleurtone"] = "⦬",
	["\\measangleultonw"] = "⦭",
	["\\measangledrtose"] = "⦮",
	["\\measangledltosw"] = "⦯",
	["\\revemptyset"] = "⦰",
	["\\emptysetobar"] = "⦱",
	["\\emptysetocirc"] = "⦲",
	["\\emptysetoarr"] = "⦳",
	["\\emptysetoarrl"] = "⦴",
	["\\circlehbar"] = "⦵",
	["\\circledvert"] = "⦶",
	["\\circledparallel"] = "⦷",
	["\\circledbslash"] = "⦸",
	["\\operp"] = "⦹",
	["\\obot"] = "⦺",
	["\\olcross"] = "⦻",
	["\\odotslashdot"] = "⦼",
	["\\uparrowoncircle"] = "⦽",
	["\\circledwhitebullet"] = "⦾",
	["\\circledbullet"] = "⦿",
	["\\circledless"] = "⧀",
	["\\circledgtr"] = "⧁",
	["\\cirscir"] = "⧂",
	["\\cirE"] = "⧃",
	["\\boxslash"] = "⧄",
	["\\boxbslash"] = "⧅",
	["\\boxast"] = "⧆",
	["\\boxcircle"] = "⧇",
	["\\boxbox"] = "⧈",
	["\\boxonbox"] = "⧉",
	["\\triangleodot"] = "⧊",
	["\\triangleubar"] = "⧋",
	["\\triangles"] = "⧌",
	["\\triangleserifs"] = "⧍",
	["\\rtriltri"] = "⧎",
	["\\LeftTriangleBar"] = "⧏",
	["\\RightTriangleBar"] = "⧐",
	["\\lfbowtie"] = "⧑",
	["\\rfbowtie"] = "⧒",
	["\\fbowtie"] = "⧓",
	["\\lftimes"] = "⧔",
	["\\rftimes"] = "⧕",
	["\\hourglass"] = "⧖",
	["\\blackhourglass"] = "⧗",
	["\\lvzigzag"] = "⧘",
	["\\rvzigzag"] = "⧙",
	["\\Lvzigzag"] = "⧚",
	["\\Rvzigzag"] = "⧛",
	["\\iinfin"] = "⧜",
	["\\tieinfty"] = "⧝",
	["\\nvinfty"] = "⧞",
	["\\multimapboth"] = "⧟",
	["\\laplac"] = "⧠",
	["\\lrtriangleeq"] = "⧡",
	["\\shuffle"] = "⧢",
	["\\eparsl"] = "⧣",
	["\\smeparsl"] = "⧤",
	["\\eqvparsl"] = "⧥",
	["\\gleichstark"] = "⧦",
	["\\thermod"] = "⧧",
	["\\downtriangleleftblack"] = "⧨",
	["\\downtrianglerightblack"] = "⧩",
	["\\blackdiamonddownarrow"] = "⧪",
	["\\blacklozenge"] = "⧫",
	["\\circledownarrow"] = "⧬",
	["\\blackcircledownarrow"] = "⧭",
	["\\errbarsquare"] = "⧮",
	["\\errbarblacksquare"] = "⧯",
	["\\errbardiamond"] = "⧰",
	["\\errbarblackdiamond"] = "⧱",
	["\\errbarcircle"] = "⧲",
	["\\errbarblackcircle"] = "⧳",
	["\\ruledelayed"] = "⧴",
	["\\setminus"] = "⧵",
	["\\dsol"] = "⧶",
	["\\rsolbar"] = "⧷",
	["\\xsol"] = "⧸",
	["\\zhide"] = "⧹",
	["\\doubleplus"] = "⧺",
	["\\tripleplus"] = "⧻",
	["\\lcurvyangle"] = "⧼",
	["\\rcurvyangle"] = "⧽",
	["\\tplus"] = "⧾",
	["\\tminus"] = "⧿",
	["\\bigodot"] = "⨀",
	["\\bigoplus"] = "⨁",
	["\\bigotimes"] = "⨂",
	["\\bigcupdot"] = "⨃",
	["\\biguplus"] = "⨄",
	["\\bigsqcap"] = "⨅",
	["\\bigsqcup"] = "⨆",
	["\\conjquant"] = "⨇",
	["\\disjquant"] = "⨈",
	["\\varprod"] = "⨉",
	["\\modtwosum"] = "⨊",
	["\\sumint"] = "⨋",
	["\\iiiint"] = "⨌",
	["\\intbar"] = "⨍",
	["\\intBar"] = "⨎",
	["\\fint"] = "⨏",
	["\\cirfnint"] = "⨐",
	["\\awint"] = "⨑",
	["\\rppolint"] = "⨒",
	["\\scpolint"] = "⨓",
	["\\npolint"] = "⨔",
	["\\pointint"] = "⨕",
	["\\sqint"] = "⨖",
	["\\intlarhk"] = "⨗",
	["\\intx"] = "⨘",
	["\\intcap"] = "⨙",
	["\\intcup"] = "⨚",
	["\\upint"] = "⨛",
	["\\lowint"] = "⨜",
	["\\Join"] = "⨝",
	["\\bigtriangleleft"] = "⨞",
	["\\zcmp"] = "⨟",
	["\\zpipe"] = "⨠",
	["\\zproject"] = "⨡",
	["\\ringplus"] = "⨢",
	["\\plushat"] = "⨣",
	["\\simplus"] = "⨤",
	["\\plusdot"] = "⨥",
	["\\plussim"] = "⨦",
	["\\plussubtwo"] = "⨧",
	["\\plustrif"] = "⨨",
	["\\commaminus"] = "⨩",
	["\\minusdot"] = "⨪",
	["\\minusfdots"] = "⨫",
	["\\minusrdots"] = "⨬",
	["\\opluslhrim"] = "⨭",
	["\\oplusrhrim"] = "⨮",
	["\\vectimes"] = "⨯",
	["\\dottimes"] = "⨰",
	["\\timesbar"] = "⨱",
	["\\btimes"] = "⨲",
	["\\smashtimes"] = "⨳",
	["\\otimeslhrim"] = "⨴",
	["\\otimesrhrim"] = "⨵",
	["\\otimeshat"] = "⨶",
	["\\Otimes"] = "⨷",
	["\\odiv"] = "⨸",
	["\\triangleplus"] = "⨹",
	["\\triangleminus"] = "⨺",
	["\\triangletimes"] = "⨻",
	["\\intprod"] = "⨼",
	["\\intprodr"] = "⨽",
	["\\fcmp"] = "⨾",
	["\\amalg"] = "⨿",
	["\\capdot"] = "⩀",
	["\\uminus"] = "⩁",
	["\\barcup"] = "⩂",
	["\\barcap"] = "⩃",
	["\\capwedge"] = "⩄",
	["\\cupvee"] = "⩅",
	["\\cupovercap"] = "⩆",
	["\\capovercup"] = "⩇",
	["\\cupbarcap"] = "⩈",
	["\\capbarcup"] = "⩉",
	["\\twocups"] = "⩊",
	["\\twocaps"] = "⩋",
	["\\closedvarcup"] = "⩌",
	["\\closedvarcap"] = "⩍",
	["\\Sqcap"] = "⩎",
	["\\Sqcup"] = "⩏",
	["\\closedvarcupsmashprod"] = "⩐",
	["\\wedgeodot"] = "⩑",
	["\\veeodot"] = "⩒",
	["\\Wedge"] = "⩓",
	["\\Vee"] = "⩔",
	["\\wedgeonwedge"] = "⩕",
	["\\veeonvee"] = "⩖",
	["\\bigslopedvee"] = "⩗",
	["\\bigslopedwedge"] = "⩘",
	["\\veeonwedge"] = "⩙",
	["\\wedgemidvert"] = "⩚",
	["\\veemidvert"] = "⩛",
	["\\midbarwedge"] = "⩜",
	["\\midbarvee"] = "⩝",
	["\\doublebarwedge"] = "⩞",
	["\\wedgebar"] = "⩟",
	["\\wedgedoublebar"] = "⩠",
	["\\varveebar"] = "⩡",
	["\\doublebarvee"] = "⩢",
	["\\veedoublebar"] = "⩣",
	["\\dsub"] = "⩤",
	["\\rsub"] = "⩥",
	["\\eqdot"] = "⩦",
	["\\dotequiv"] = "⩧",
	["\\equivVert"] = "⩨",
	["\\equivVvert"] = "⩩",
	["\\dotsim"] = "⩪",
	["\\simrdots"] = "⩫",
	["\\simminussim"] = "⩬",
	["\\congdot"] = "⩭",
	["\\asteq"] = "⩮",
	["\\hatapprox"] = "⩯",
	["\\approxeqq"] = "⩰",
	["\\eqqplus"] = "⩱",
	["\\pluseqq"] = "⩲",
	["\\eqqsim"] = "⩳",
	["\\Coloneqq"] = "⩴",
	["\\Equal"] = "⩵",
	["\\Same"] = "⩶",
	["\\ddotseq"] = "⩷",
	["\\equivDD"] = "⩸",
	["\\ltcir"] = "⩹",
	["\\gtcir"] = "⩺",
	["\\ltquest"] = "⩻",
	["\\gtquest"] = "⩼",
	["\\leqslant"] = "⩽",
	["\\geqslant"] = "⩾",
	["\\lesdot"] = "⩿",
	["\\gesdot"] = "⪀",
	["\\lesdoto"] = "⪁",
	["\\gesdoto"] = "⪂",
	["\\lesdotor"] = "⪃",
	["\\gesdotol"] = "⪄",
	["\\lessapprox"] = "⪅",
	["\\gtrapprox"] = "⪆",
	["\\lneq"] = "⪇",
	["\\gneq"] = "⪈",
	["\\lnapprox"] = "⪉",
	["\\gnapprox"] = "⪊",
	["\\lesseqqgtr"] = "⪋",
	["\\gtreqqless"] = "⪌",
	["\\lsime"] = "⪍",
	["\\gsime"] = "⪎",
	["\\lsimg"] = "⪏",
	["\\gsiml"] = "⪐",
	["\\lgE"] = "⪑",
	["\\glE"] = "⪒",
	["\\lesges"] = "⪓",
	["\\gesles"] = "⪔",
	["\\eqslantless"] = "⪕",
	["\\eqslantgtr"] = "⪖",
	["\\elsdot"] = "⪗",
	["\\egsdot"] = "⪘",
	["\\eqqless"] = "⪙",
	["\\eqqgtr"] = "⪚",
	["\\eqqslantless"] = "⪛",
	["\\eqqslantgtr"] = "⪜",
	["\\simless"] = "⪝",
	["\\simgtr"] = "⪞",
	["\\simlE"] = "⪟",
	["\\simgE"] = "⪠",
	["\\NestedLessLess"] = "⪡",
	["\\NestedGreaterGreater"] = "⪢",
	["\\partialmeetcontraction"] = "⪣",
	["\\glj"] = "⪤",
	["\\gla"] = "⪥",
	["\\leftslice"] = "⪦",
	["\\rightslice"] = "⪧",
	["\\lescc"] = "⪨",
	["\\gescc"] = "⪩",
	["\\smt"] = "⪪",
	["\\lat"] = "⪫",
	["\\smte"] = "⪬",
	["\\late"] = "⪭",
	["\\bumpeqq"] = "⪮",
	["\\preceq"] = "⪯",
	["\\succeq"] = "⪰",
	["\\precneq"] = "⪱",
	["\\succneq"] = "⪲",
	["\\preceqq"] = "⪳",
	["\\succeqq"] = "⪴",
	["\\precneqq"] = "⪵",
	["\\succneqq"] = "⪶",
	["\\precapprox"] = "⪷",
	["\\succapprox"] = "⪸",
	["\\precnapprox"] = "⪹",
	["\\succnapprox"] = "⪺",
	["\\llcurly"] = "⪻",
	["\\ggcurly"] = "⪼",
	["\\subsetdot"] = "⪽",
	["\\supsetdot"] = "⪾",
	["\\subsetplus"] = "⪿",
	["\\supsetplus"] = "⫀",
	["\\submult"] = "⫁",
	["\\supmult"] = "⫂",
	["\\subedot"] = "⫃",
	["\\supedot"] = "⫄",
	["\\subseteqq"] = "⫅",
	["\\supseteqq"] = "⫆",
	["\\subsim"] = "⫇",
	["\\supsim"] = "⫈",
	["\\subsetapprox"] = "⫉",
	["\\supsetapprox"] = "⫊",
	["\\subsetneqq"] = "⫋",
	["\\supsetneqq"] = "⫌",
	["\\lsqhook"] = "⫍",
	["\\rsqhook"] = "⫎",
	["\\csub"] = "⫏",
	["\\csup"] = "⫐",
	["\\csube"] = "⫑",
	["\\csupe"] = "⫒",
	["\\subsup"] = "⫓",
	["\\supsub"] = "⫔",
	["\\subsub"] = "⫕",
	["\\supsup"] = "⫖",
	["\\suphsub"] = "⫗",
	["\\supdsub"] = "⫘",
	["\\forkv"] = "⫙",
	["\\topfork"] = "⫚",
	["\\mlcp"] = "⫛",
	["\\forks"] = "⫝̸",
	["\\forksnot"] = "⫝",
	["\\shortlefttack"] = "⫞",
	["\\shortdowntack"] = "⫟",
	["\\shortuptack"] = "⫠",
	["\\perps"] = "⫡",
	["\\vDdash"] = "⫢",
	["\\dashV"] = "⫣",
	["\\Dashv"] = "⫤",
	["\\DashV"] = "⫥",
	["\\varVdash"] = "⫦",
	["\\Barv"] = "⫧",
	["\\vBar"] = "⫨",
	["\\vBarv"] = "⫩",
	["\\Top"] = "⫪",
	["\\Bot"] = "⫫",
	["\\Not"] = "⫬",
	["\\bNot"] = "⫭",
	["\\revnmid"] = "⫮",
	["\\cirmid"] = "⫯",
	["\\midcir"] = "⫰",
	["\\topcir"] = "⫱",
	["\\nhpar"] = "⫲",
	["\\parsim"] = "⫳",
	["\\interleave"] = "⫴",
	["\\nhVvert"] = "⫵",
	["\\threedotcolon"] = "⫶",
	["\\lllnest"] = "⫷",
	["\\gggnest"] = "⫸",
	["\\leqqslant"] = "⫹",
	["\\geqqslant"] = "⫺",
	["\\trslash"] = "⫻",
	["\\biginterleave"] = "⫼",
	["\\sslash"] = "⫽",
	["\\talloblong"] = "⫾",
	["\\bigtalloblong"] = "⫿",
	["\\squaretopblack"] = "⬒",
	["\\squarebotblack"] = "⬓",
	["\\squareurblack"] = "⬔",
	["\\squarellblack"] = "⬕",
	["\\diamondleftblack"] = "⬖",
	["\\diamondrightblack"] = "⬗",
	["\\diamondtopblack"] = "⬘",
	["\\diamondbotblack"] = "⬙",
	["\\dottedsquare"] = "⬚",
	["\\vysmblksquare"] = "⬝",
	["\\vysmwhtsquare"] = "⬞",
	["\\pentagonblack"] = "⬟",
	["\\pentagon"] = "⬠",
	["\\varhexagon"] = "⬡",
	["\\varhexagonblack"] = "⬢",
	["\\hexagonblack"] = "⬣",
	["\\lgblkcircle"] = "⬤",
	["\\mdblkdiamond"] = "⬥",
	["\\mdwhtdiamond"] = "⬦",
	["\\mdblklozenge"] = "⬧",
	["\\mdwhtlozenge"] = "⬨",
	["\\smblkdiamond"] = "⬩",
	["\\smblklozenge"] = "⬪",
	["\\smwhtlozenge"] = "⬫",
	["\\blkhorzoval"] = "⬬",
	["\\whthorzoval"] = "⬭",
	["\\blkvertoval"] = "⬮",
	["\\whtvertoval"] = "⬯",
	["\\circleonleftarrow"] = "⬰",
	["\\leftthreearrows"] = "⬱",
	["\\leftarrowonoplus"] = "⬲",
	["\\longleftsquigarrow"] = "⬳",
	["\\nvtwoheadleftarrow"] = "⬴",
	["\\nVtwoheadleftarrow"] = "⬵",
	["\\twoheadmapsfrom"] = "⬶",
	["\\twoheadleftdbkarrow"] = "⬷",
	["\\leftdotarrow"] = "⬸",
	["\\nvleftarrowtail"] = "⬹",
	["\\nVleftarrowtail"] = "⬺",
	["\\twoheadleftarrowtail"] = "⬻",
	["\\nvtwoheadleftarrowtail"] = "⬼",
	["\\nVtwoheadleftarrowtail"] = "⬽",
	["\\leftarrowx"] = "⬾",
	["\\leftcurvedarrow"] = "⬿",
	["\\equalleftarrow"] = "⭀",
	["\\bsimilarleftarrow"] = "⭁",
	["\\leftarrowbackapprox"] = "⭂",
	["\\rightarrowgtr"] = "⭃",
	["\\rightarrowsupset"] = "⭄",
	["\\LLeftarrow"] = "⭅",
	["\\RRightarrow"] = "⭆",
	["\\bsimilarrightarrow"] = "⭇",
	["\\rightarrowbackapprox"] = "⭈",
	["\\similarleftarrow"] = "⭉",
	["\\leftarrowapprox"] = "⭊",
	["\\leftarrowbsimilar"] = "⭋",
	["\\rightarrowbsimilar"] = "⭌",
	["\\medwhitestar"] = "⭐",
	["\\medblackstar"] = "⭑",
	["\\smwhitestar"] = "⭒",
	["\\rightpentagonblack"] = "⭓",
	["\\rightpentagon"] = "⭔",
	["\\postalmark"] = "〒",
	["\\hzigzag"] = "〰",
	["\\mbfscrA"] = "𝓐",
	["\\mbfscrB"] = "𝓑",
	["\\mbfscrC"] = "𝓒",
	["\\mbfscrD"] = "𝓓",
	["\\mbfscrE"] = "𝓔",
	["\\mbfscrF"] = "𝓕",
	["\\mbfscrG"] = "𝓖",
	["\\mbfscrH"] = "𝓗",
	["\\mbfscrI"] = "𝓘",
	["\\mbfscrJ"] = "𝓙",
	["\\mbfscrK"] = "𝓚",
	["\\mbfscrL"] = "𝓛",
	["\\mbfscrM"] = "𝓜",
	["\\mbfscrN"] = "𝓝",
	["\\mbfscrO"] = "𝓞",
	["\\mbfscrP"] = "𝓟",
	["\\mbfscrQ"] = "𝓠",
	["\\mbfscrR"] = "𝓡",
	["\\mbfscrS"] = "𝓢",
	["\\mbfscrT"] = "𝓣",
	["\\mbfscrU"] = "𝓤",
	["\\mbfscrV"] = "𝓥",
	["\\mbfscrW"] = "𝓦",
	["\\mbfscrX"] = "𝓧",
	["\\mbfscrY"] = "𝓨",
	["\\mbfscrZ"] = "𝓩",
	["\\mbfscra"] = "𝓪",
	["\\mbfscrb"] = "𝓫",
	["\\mbfscrc"] = "𝓬",
	["\\mbfscrd"] = "𝓭",
	["\\mbfscre"] = "𝓮",
	["\\mbfscrf"] = "𝓯",
	["\\mbfscrg"] = "𝓰",
	["\\mbfscrh"] = "𝓱",
	["\\mbfscri"] = "𝓲",
	["\\mbfscrj"] = "𝓳",
	["\\mbfscrk"] = "𝓴",
	["\\mbfscrl"] = "𝓵",
	["\\mbfscrm"] = "𝓶",
	["\\mbfscrn"] = "𝓷",
	["\\mbfscro"] = "𝓸",
	["\\mbfscrp"] = "𝓹",
	["\\mbfscrq"] = "𝓺",
	["\\mbfscrr"] = "𝓻",
	["\\mbfscrs"] = "𝓼",
	["\\mbfscrt"] = "𝓽",
	["\\mbfscru"] = "𝓾",
	["\\mbfscrv"] = "𝓿",
	["\\mbfscrw"] = "𝔀",
	["\\mbfscrx"] = "𝔁",
	["\\mbfscry"] = "𝔂",
	["\\mbfscrz"] = "𝔃",
	["\\mbffrakA"] = "𝕬",
	["\\mbffrakB"] = "𝕭",
	["\\mbffrakC"] = "𝕮",
	["\\mbffrakD"] = "𝕯",
	["\\mbffrakE"] = "𝕰",
	["\\mbffrakF"] = "𝕱",
	["\\mbffrakG"] = "𝕲",
	["\\mbffrakH"] = "𝕳",
	["\\mbffrakI"] = "𝕴",
	["\\mbffrakJ"] = "𝕵",
	["\\mbffrakK"] = "𝕶",
	["\\mbffrakL"] = "𝕷",
	["\\mbffrakM"] = "𝕸",
	["\\mbffrakN"] = "𝕹",
	["\\mbffrakO"] = "𝕺",
	["\\mbffrakP"] = "𝕻",
	["\\mbffrakQ"] = "𝕼",
	["\\mbffrakR"] = "𝕽",
	["\\mbffrakS"] = "𝕾",
	["\\mbffrakT"] = "𝕿",
	["\\mbffrakU"] = "𝖀",
	["\\mbffrakV"] = "𝖁",
	["\\mbffrakW"] = "𝖂",
	["\\mbffrakX"] = "𝖃",
	["\\mbffrakY"] = "𝖄",
	["\\mbffrakZ"] = "𝖅",
	["\\mbffraka"] = "𝖆",
	["\\mbffrakb"] = "𝖇",
	["\\mbffrakc"] = "𝖈",
	["\\mbffrakd"] = "𝖉",
	["\\mbffrake"] = "𝖊",
	["\\mbffrakf"] = "𝖋",
	["\\mbffrakg"] = "𝖌",
	["\\mbffrakh"] = "𝖍",
	["\\mbffraki"] = "𝖎",
	["\\mbffrakj"] = "𝖏",
	["\\mbffrakk"] = "𝖐",
	["\\mbffrakl"] = "𝖑",
	["\\mbffrakm"] = "𝖒",
	["\\mbffrakn"] = "𝖓",
	["\\mbffrako"] = "𝖔",
	["\\mbffrakp"] = "𝖕",
	["\\mbffrakq"] = "𝖖",
	["\\mbffrakr"] = "𝖗",
	["\\mbffraks"] = "𝖘",
	["\\mbffrakt"] = "𝖙",
	["\\mbffraku"] = "𝖚",
	["\\mbffrakv"] = "𝖛",
	["\\mbffrakw"] = "𝖜",
	["\\mbffrakx"] = "𝖝",
	["\\mbffraky"] = "𝖞",
	["\\mbffrakz"] = "𝖟",
	["\\mbfAlpha"] = "𝚨",
	["\\mbfBeta"] = "𝚩",
	["\\mbfEpsilon"] = "𝚬",
	["\\mbfZeta"] = "𝚭",
	["\\mbfEta"] = "𝚮",
	["\\mbfIota"] = "𝚰",
	["\\mbfKappa"] = "𝚱",
	["\\mbfMu"] = "𝚳",
	["\\mbfNu"] = "𝚴",
	["\\mbfOmicron"] = "𝚶",
	["\\mbfRho"] = "𝚸",
	["\\mbfvarTheta"] = "𝚹",
	["\\mbfTau"] = "𝚻",
	["\\mbfChi"] = "𝚾",
	["\\mbfnabla"] = "𝛁",
	["\\mbfomicron"] = "𝛐",
	["\\mbfpartial"] = "𝛛",
	["\\mbfvarkappa"] = "𝛞",
	["\\mitAlpha"] = "𝛢",
	["\\mitBeta"] = "𝛣",
	["\\mitEpsilon"] = "𝛦",
	["\\mitZeta"] = "𝛧",
	["\\mitEta"] = "𝛨",
	["\\mitIota"] = "𝛪",
	["\\mitKappa"] = "𝛫",
	["\\mitMu"] = "𝛭",
	["\\mitNu"] = "𝛮",
	["\\mitOmicron"] = "𝛰",
	["\\mitRho"] = "𝛲",
	["\\mitvarTheta"] = "𝛳",
	["\\mitTau"] = "𝛵",
	["\\mitChi"] = "𝛸",
	["\\mitnabla"] = "𝛻",
	["\\mitomicron"] = "𝜊",
	["\\mbfitAlpha"] = "𝜜",
	["\\mbfitBeta"] = "𝜝",
	["\\mbfitEpsilon"] = "𝜠",
	["\\mbfitZeta"] = "𝜡",
	["\\mbfitEta"] = "𝜢",
	["\\mbfitIota"] = "𝜤",
	["\\mbfitKappa"] = "𝜥",
	["\\mbfitMu"] = "𝜧",
	["\\mbfitNu"] = "𝜨",
	["\\mbfitOmicron"] = "𝜪",
	["\\mbfitRho"] = "𝜬",
	["\\mbfitvarTheta"] = "𝜭",
	["\\mbfitTau"] = "𝜯",
	["\\mbfitChi"] = "𝜲",
	["\\mbfitnabla"] = "𝜵",
	["\\mbfitomicron"] = "𝝄",
	["\\mbfitpartial"] = "𝝏",
	["\\mbfitvarkappa"] = "𝝒",
	["\\mbfsansAlpha"] = "𝝖",
	["\\mbfsansBeta"] = "𝝗",
	["\\mbfsansEpsilon"] = "𝝚",
	["\\mbfsansZeta"] = "𝝛",
	["\\mbfsansEta"] = "𝝜",
	["\\mbfsansIota"] = "𝝞",
	["\\mbfsansKappa"] = "𝝟",
	["\\mbfsansMu"] = "𝝡",
	["\\mbfsansNu"] = "𝝢",
	["\\mbfsansOmicron"] = "𝝤",
	["\\mbfsansRho"] = "𝝦",
	["\\mbfsansvarTheta"] = "𝝧",
	["\\mbfsansTau"] = "𝝩",
	["\\mbfsansChi"] = "𝝬",
	["\\mbfsansnabla"] = "𝝯",
	["\\mbfsansomicron"] = "𝝾",
	["\\mbfsanspartial"] = "𝞉",
	["\\mbfsansvarkappa"] = "𝞌",
	["\\mbfitsansAlpha"] = "𝞐",
	["\\mbfitsansBeta"] = "𝞑",
	["\\mbfitsansEpsilon"] = "𝞔",
	["\\mbfitsansZeta"] = "𝞕",
	["\\mbfitsansEta"] = "𝞖",
	["\\mbfitsansIota"] = "𝞘",
	["\\mbfitsansKappa"] = "𝞙",
	["\\mbfitsansMu"] = "𝞛",
	["\\mbfitsansNu"] = "𝞜",
	["\\mbfitsansOmicron"] = "𝞞",
	["\\mbfitsansRho"] = "𝞠",
	["\\mbfitsansvarTheta"] = "𝞡",
	["\\mbfitsansTau"] = "𝞣",
	["\\mbfitsansChi"] = "𝞦",
	["\\mbfitsansnabla"] = "𝞩",
	["\\mbfitsansomicron"] = "𝞸",
	["\\mbfitsanspartial"] = "𝟃",
	["\\mbfitsansvarkappa"] = "𝟆",
	["\\mbfDigamma"] = "𝟊",
	["\\mbfdigamma"] = "𝟋",
}

return Source
