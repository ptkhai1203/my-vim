
compiler gcc
let b:cpp_std = 'c++17'
let b:cpp_defines = '-DPTK'
let b:cpp_safety_flags = '-Wall -Wshadow -Wconversion -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -ffinite-math-only -D_GLIBCXX_DEBUG'
let b:cpp_normal_flags = '-Wall -Wshadow -Wconversion -fdiagnostics-color=always'
let b:cpp_debug_flags = '-DLOCAL_DEBUG -g'

let s:Preset = {}

func s:Preset.new(opt_mode, with_safety_flags, with_debug_flags) abort
    let l:res = copy(self)
    let l:res.opt_mode = a:opt_mode
    let l:res.with_safety_flags = a:with_safety_flags
    let l:res.with_debug_flags = a:with_debug_flags
    return l:res
endfunc

func s:Preset.ask_user() abort
    let l:opt_mode = confirm('Choose optimize mode: ', "-O&0\n-O&1\n-O&2\n-O&3") - 1
    if l:opt_mode == -1
        return v:null
    endif
    
    let l:with_safety_flags = confirm('Run with safety flags?', "&Yes\n&No")
    if l:with_safety_flags == 0
        return v:null
    endif
    
    let l:with_debug_flags = confirm('Run with debug flags?', "&Yes\n&No")
    if l:with_debug_flags == 0
        return v:null
    endif
    return self.new(l:opt_mode, l:with_safety_flags == 1, l:with_debug_flags == 1)
endfunc

func s:Preset.gen_build_string() abort
    let l:flags = b:cpp_normal_flags
    if self.with_safety_flags
        let l:flags = b:cpp_safety_flags
    endif
    let l:debug_flags = ""
    if self.with_debug_flags
        let l:debug_flags = b:cpp_debug_flags
    endif
    return printf('g++ %s -std=%s -O%s %s %s "%%:p" -o %%<.out',
            \ b:cpp_defines, b:cpp_std, self.opt_mode, l:flags, l:debug_flags) 
endfunc

let s:mode_chosing_strings = "&Release\n&Debug\n&Fast Release\nFast d&ebug\nCustom &1\nCustom &2"
let b:presets = [