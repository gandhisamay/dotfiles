require('nvim-rooter').setup {
  rooter_patterns = { '.git', '.hg', '.svn', '.config' },
  trigger_patterns = { '*' },
  manual = false,
}
