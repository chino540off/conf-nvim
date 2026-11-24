_m = nvim

$(_m)-dirs =	\
  notes-perso	\
  notes-work	\
  notes-templ	\
  backup	\
  temp

$(_m)-dir-notes-perso	= ~/notes/personal
$(_m)-dir-notes-work	= ~/notes/work
$(_m)-dir-notes-templ	= ~/notes/templates
$(_m)-dir-backup	= $(CURDIR)/nvim/backup
$(_m)-dir-temp		= $(CURDIR)/nvim/temp

$(_m)-links = 	\
  .

$(_m)-link-.	= ~/.config/nvim
