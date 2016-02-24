if !exists("g:loaded_tagbar") || exists("g:load_tagbar_settings")
    finish
endif

let g:loaded_tagbar_settings = 1

" CoffeeScript
let g:tagbar_type_coffee = {
            \ 'ctagstype' : 'coffee',
            \ 'kinds'     : [
            \   'c:classes',
            \   'm:methods',
            \   'f:functions',
            \   'v:variables',
            \   'f:fields',
            \ ]
            \ }

" CSS
let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
            \ 'kinds'     : [
            \    'c:classes',
            \    's:selectors',
            \    'i:identities'
            \ ]
            \ }

" Makefile (targets)
let g:tagbar_type_make = {
            \ 'kinds' : [
            \   'm:macros',
            \   't:targets'
            \ ]
            \ }

" Objective-C
let g:tagbar_type_objc = {
            \ 'ctagstype' : 'ObjectiveC',
            \ 'kinds'     : [
            \   'i:interface',
            \   'I:implementation',
            \   'p:Protocol',
            \   'm:Object_method',
            \   'c:Class_method',
            \   'v:Global_variable',
            \   'F:Object field',
            \   'f:function',
            \   'p:property',
            \   't:type_alias',
            \   's:type_structure',
            \   'e:enumeration',
            \   'M:preprocessor_macro',
            \ ],
            \ 'sro'        : ' ',
            \ 'kind2scope' : {
            \   'i' : 'interface',
            \   'I' : 'implementation',
            \   'p' : 'Protocol',
            \   's' : 'type_structure',
            \   'e' : 'enumeration'
            \ },
            \ 'scope2kind' : {
            \   'interface'      : 'i',
            \   'implementation' : 'I',
            \   'Protocol'       : 'p',
            \   'type_structure' : 's',
            \   'enumeration'    : 'e'
            \ }
            \ }

" Ruby
let g:tagbar_type_ruby = {
            \ 'kinds' : [
            \   'm:modules',
            \   'c:classes',
            \   'd:describes',
            \   'C:contexts',
            \   'f:methods',
            \   'F:singleton methods'
            \ ]
            \ }
