
"Author: Nguyen Quang Loc(darrkcyan)
"Link: https://github.com/quangloc99/dotfiles/blob/master/vim/.vim/autoload/single_file_runner.vim
func! single_file_runner#do_make() abort
    if exists('b:gen_makeprg')
        let &makeprg = b:gen_makeprg()
    end
    let old_makeprg = &makeprg
    let msg = "echo " . &makeprg
    let &makeprg = "clear; " . msg . ";" . &makeprg
    if exists(":Neomake")
        Neomake!
    else 
        make
    endif
    let &makeprg = old_makeprg
endfunc
func! single_file_runner#get_execute_command() abort
    if !exists("b:run_single_file_command")
        return ""
    endif
    let command = "!clear; " . b:run_single_file_command . " "
    if exists("b:single_file_input")
        let command .= "< " . b:single_file_input . ' '
    endif

    if exists("b:single_file_output")
        let command .= "> " . b:single_file_output . ' '
    endif

    if exists("b:single_file_error")
        let command .= "2> " . b:single_file_error . ' '
    endif
    return command
endfunc
