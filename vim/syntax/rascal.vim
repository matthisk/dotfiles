" Vim syntax file
" Language: Rascal MPL
" Maintainer: Matthisk Heimensen
" Latest Revision: 2 April 2015

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword rascalType loc bool str int num map set list tuple void start
syn keyword rascalDecl data anno
syn keyword rascalSyntaxDefinition syntax lexical keyword
syn keyword rascalBoolean true false
syn keyword rascalModifier default test private public
syn keyword rascalModule import module extend
syn keyword rascalStatement visit solve assert 
syn keyword rascalConditional if else switch
syn keyword rascalException try catch finally throw
syn keyword rascalRepeat for do while
syn keyword rascalControlFlow return insert append
syn keyword rascalBranch break continue
syn keyword rascalLabel case 
syn keyword rascalOperator it in
syn keyword rascalAlias alias

" Annotation
syn match   rascalAnnotation	"@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"

" Location
syn match   rascalLocation "|[^|]*|"

" Functions
" syn match   rascalFunction start="[\d\a]*(.*){" end="};"

syn region rascalBlock start="{" end="}" fold transparent keepend
syn match rascalBraces "[{}]"

" Comments
syn keyword rascalCommentToDo      contained TODO FIXME XXX TBD 
syn region  rascalCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=rascalSpecial,rascalCommentStar,rascalSpecialChar,@Spell
syn region  rascalComment2String   contained start=+"+	end=+$\|"+  contains=rascalSpecial,rascalSpecialChar,@Spell
syn match   rascalCommentCharacter contained "'\\[^']\{1,6\}'" contains=rascalSpecialChar
syn match   rascalCommentCharacter contained "'\\''" contains=rascalSpecialChar
syn match   rascalCommentCharacter contained "'[^\\]'"
syn cluster rascalCommentSpecial  add=rascalCommentString,rascalCommentCharacter,rascalNumber
syn cluster rascalCommentSpecial2 add=rascalComment2String,rascalCommentCharacter,rascalNumber

syn region  rascalComment		   start="/\*"  end="\*/" contains=@rascalCommentSpecial,@Spell
syn match   rascalCommentStar	 contained "^\s*\*[^/]"me=e-1
syn match   rascalCommentStar	 contained "^\s*\*$"
syn match   rascalLineComment	 "//.*" contains=@rascalCommentToDo,rascalCommentSpecial2,@Spell

" match the special comment /**/
syn match   rascalComment		 "/\*\*/"

" Strings and constants
syn match   rascalSpecialError	 contained "\\."
syn match   rascalSpecialCharError contained "[^']"
syn match   rascalSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  rascalString		 matchgroup=Quote start=+"+ end=+"+ end=+$+ contains=rascalSpecialChar,rascalSpecialError,@Spell
syn match   rascalNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   rascalNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   rascalNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   rascalNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" unicode characters
syn match   rascalSpecial "\\u\d\{4\}"

let b:current_syntax = "rascal"

" Highlighting
hi def link rascalComment Comment
hi def link rascalLineComment Comment
hi def link rascalBoolean Constant
hi def link rascalConstant Constant
hi def link rascalLocation Constant
hi def link rascalNumber Number
hi def link rascalString String
hi def link rascalType Type
hi def link rascalControlFlow Statement
hi def link rascalRepeat Statement
hi def link rascalStatement Statement
hi def link rascalConditional Conditional
hi def link rascalModule Include
hi def link rascalException Exception
hi def link rascalOperator Operator
hi def link rascalModifier Keyword
hi def link rascalBraces Function
hi def link rascalSyntaxDefinition Type
hi def link rascalDecl Type
hi def link rascalCommentToDo Todo
hi def link rascalAnnotation Type
