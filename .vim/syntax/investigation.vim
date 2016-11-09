" Vim syntax file
" Language: Investigation
" Maintainer: Andrew Bell
" Latest Revision: 2016-10-19

if exists("b:current_syntax")
  finish
endif

syn match invComment "#.*$" contains=invKnown,invQuestion,invAnswered,invRequirement skipwhite

syn match invKnown "\. " contained
syn match invKnownLine "^\..*$" fold contains=invComment

syn match invQuestion "[?] " contained
syn match invQuestionLine "^[?].*$" fold contains=invComment

syn match invAnswered "\/ " contained
syn match invAnsweredLine "^\/.*$" fold contains=invComment

syn match invRequirement "\! " contained
syn match invRequirementLine "^\!.*$" fold contains=invComment

let b:current_syntax = "investigation"

hi def link invComment          Comment
hi def link invKnown            Statement
hi def link invKnownLine        Statement
hi def link invQuestion         Constant
hi def link invQuestionLine     Constant
hi def link invAnswered         Type
hi def link invAnsweredLine     Type
hi def link invRequirement      Special
hi def link invRequirementLine  Special
