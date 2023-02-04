local db = require('dashboard')
db.custom_header = {
    '',
    '',
    '██████╗░██╗░░░██╗███████╗░██╗░░░░░░░██╗███████╗██╗░░░░░██╗░░░░░',
    '██╔══██╗╚██╗░██╔╝██╔════╝░██║░░██╗░░██║██╔════╝██║░░░░░██║░░░░░',
    '██████╔╝░╚████╔╝░█████╗░░░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░░░░',
    '██╔══██╗░░╚██╔╝░░██╔══╝░░░░████╔═████║░██╔══╝░░██║░░░░░██║░░░░░',
    '██║░░██║░░░██║░░░███████╗░░╚██╔╝░╚██╔╝░███████╗███████╗███████╗',
    '╚═╝░░╚═╝░░░╚═╝░░░╚══════╝░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚══════╝',
    '',
}
db.custom_center = {
      {icon = '  ',
      desc = "Find File                              ",
      shortcut = "SPC ff",
      action ='Telescope find_files'},
      {icon = '  ',
      desc = 'Find Word                              ',
      action =  'Telescope live_grep',
      shortcut = 'SPC lg'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'NvimTreeOpen',
      shortcut = 'SPC e'},
    }

