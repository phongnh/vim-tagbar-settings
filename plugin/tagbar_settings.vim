if exists("g:load_tagbar_settings")
    finish
endif

let g:loaded_tagbar_settings = 1

function! s:IsUniversalCtags(ctags_path) abort
    try
        let cmd = printf("%s --version", a:ctags_path)
        return system(cmd) =~# 'Universal Ctags'
    catch
        return 0
    endtry
endfunction

" Set ctags
let g:tagbar_ctags_bin = get(g:, 'tagbar_ctags_bin', executable('ctags-universal') ? 'ctags-universal' : 'ctags')

if get(g:, 'tagbar_universal_ctags', s:IsUniversalCtags(g:tagbar_ctags_bin))
    " Elixir
    let g:tagbar_type_elixir = {
                \ 'ctagstype': 'elixir',
                \ 'kinds': [
                \   'p:protocols',
                \   'm:modules',
                \   'e:exceptions',
                \   'y:types',
                \   'd:delegates',
                \   'f:functions',
                \   'c:callbacks',
                \   'a:macros',
                \   't:tests',
                \   'i:implementations',
                \   'o:operators',
                \   'r:records'
                \ ],
                \ 'sro': '.',
                \ 'kind2scope': {
                \   'p': 'protocol',
                \   'm': 'module'
                \ },
                \ 'scope2kind': {
                \   'protocol': 'p',
                \   'module':   'm'
                \ },
                \ 'sort': 0
                \ }

    " JSON
    let g:tagbar_type_json = {
                \ 'ctagstype': 'json',
                \ 'kinds': [
                \   'o:objects',
                \   'a:arrays',
                \   'n:numbers',
                \   's:strings',
                \   'b:booleans',
                \   'z:nulls'
                \ ],
                \ 'sro': '.',
                \ 'scope2kind': {
                \ 'object':  'o',
                \ 'array':   'a',
                \ 'number':  'n',
                \ 'string':  's',
                \ 'boolean': 'b',
                \ 'null':    'z'
                \ },
                \ 'kind2scope': {
                \   'o': 'object',
                \   'a': 'array',
                \   'n': 'number',
                \   's': 'string',
                \   'b': 'boolean',
                \   'z': 'null'
                \ },
                \ 'sort': 0
                \ }

    " Objective-C
    let g:tagbar_type_objc = {
                \ 'ctagstype': 'ObjectiveC',
                \ 'kinds': [
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
                \ 'sro': ' ',
                \ 'kind2scope': {
                \   'i': 'interface',
                \   'I': 'implementation',
                \   'p': 'Protocol',
                \   's': 'type_structure',
                \   'e': 'enumeration'
                \ },
                \ 'scope2kind': {
                \   'interface':      'i',
                \   'implementation': 'I',
                \   'Protocol':       'p',
                \   'type_structure': 's',
                \   'enumeration':    'e'
                \ }
                \ }

    " Ruby
    let g:tagbar_type_ruby = {
                \ 'kinds': [
                \   'm:modules',
                \   'c:classes',
                \   'd:describes',
                \   'C:contexts',
                \   'f:methods',
                \   'F:singleton methods'
                \ ]
                \ }

    if executable('ripper-tags')
        let g:tagbar_type_ruby = {
                    \ 'kinds': [
                    \   'm:modules',
                    \   'c:classes',
                    \   'C:constants',
                    \   'F:singleton methods',
                    \   'f:methods',
                    \   'a:aliases'
                    \ ],
                    \ 'kind2scope': {
                    \   'c': 'class',
                    \   'm': 'class'
                    \ },
                    \ 'scope2kind': {
                    \   'class': 'c'
                    \ },
                    \ 'ctagsbin': 'ripper-tags',
                    \ 'ctagsargs': ['-f', '-']
                    \ }
    endif

    " Rust
    let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
    let g:tagbar_type_rust = {
                \ 'ctagsbin': exepath(g:tagbar_ctags_bin),
                \ 'ctagstype': 'rust',
                \ 'kinds': [
                \   'n:modules',
                \   's:structures:1',
                \   'i:interfaces',
                \   'c:implementations',
                \   'f:functions:1',
                \   'g:enumerations:1',
                \   't:type aliases:1:0',
                \   'v:constants:1:0',
                \   'M:macros:1',
                \   'm:fields:1:0',
                \   'e:enum variants:1:0',
                \   'P:methods:1',
                \ ],
                \ 'sro': '::',
                \ 'kind2scope': {
                \   'n': 'module',
                \   's': 'struct',
                \   'i': 'interface',
                \   'c': 'implementation',
                \   'f': 'function',
                \   'g': 'enum',
                \   't': 'typedef',
                \   'v': 'variable',
                \   'M': 'macro',
                \   'm': 'field',
                \   'e': 'enumerator',
                \   'P': 'method',
                \ },
                \ }

    " TypeScript
    let g:tagbar_type_typescript = {
                \ 'ctagstype': 'typescript',
                \ 'kinds': [
                \   'n:namespaces',
                \   'c:classes',
                \   'p:properties',
                \   'i:interfaces',
                \   'g:enums',
                \   'e:enumerators',
                \   'm:methods',
                \   'f:functions',
                \   'z:function parameters [off]',
                \   'v:variables',
                \   'l:local variables [off]',
                \   'C:constants',
                \   'G:generators',
                \   'a:aliases',
                \ ]
                \ }
else
    " TypeScript
    if executable('tstags')
        " npm install --global git+https://github.com/Perlence/tstags.git

        let g:tagbar_type_typescript = {
                    \ 'ctagsbin': 'tstags',
                    \ 'ctagsargs': '-f-',
                    \ 'kinds': [
                    \   'e:enums:0:1',
                    \   'f:function:0:1',
                    \   't:typealias:0:1',
                    \   'M:Module:0:1',
                    \   'I:import:0:1',
                    \   'i:interface:0:1',
                    \   'C:class:0:1',
                    \   'm:method:0:1',
                    \   'p:property:0:1',
                    \   'v:variable:0:1',
                    \   'c:const:0:1',
                    \ ],
                    \ 'sort': 0
                    \ }
    endif
endif


" Go
if executable('gotags')
    let g:tagbar_type_go = {
                \ 'ctagstype': 'go',
                \ 'kinds': [
                \   'p:package',
                \   'i:imports:1',
                \   'c:constants',
                \   'v:variables',
                \   't:types',
                \   'n:interfaces',
                \   'w:fields',
                \   'e:embedded',
                \   'm:methods',
                \   'r:constructor',
                \   'f:functions'
                \ ],
                \ 'sro': '.',
                \ 'kind2scope': {
                \   't': 'ctype',
                \   'n': 'ntype'
                \ },
                \ 'scope2kind': {
                \  'ctype': 't',
                \  'ntype': 'n'
                \ },
                \ 'ctagsbin':  'gotags',
                \ 'ctagsargs': '-sort -silent'
                \ }
endif

" CoffeeScript
let g:tagbar_type_coffee = {
            \ 'ctagstype': 'coffee',
            \ 'kinds': [
            \   'c:classes',
            \   'm:methods',
            \   'f:functions',
            \   'v:variables',
            \   'f:fields',
            \ ]
            \ }

" Crystal
let g:tagbar_type_crystal = {
            \ 'ctagstype': 'crystal',
            \ 'kinds': [
            \   'd:defs',
            \   'f:functions',
            \   'c:classes',
            \   'm:modules',
            \   'l:libs',
            \   's:structs'
            \ ]
            \ }
