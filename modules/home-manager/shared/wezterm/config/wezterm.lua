local Config = require('config');

--require('events.left-status').setup()
require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })

return Config:init()
  :append(require('config.appearance'))
  :append(require('config.fonts')).options
