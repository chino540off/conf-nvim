_m = nvim

$(_m)-dirs =	\
  backup	\
  temp

$(_m)-dir-backup	= $(CURDIR)/nvim/backup
$(_m)-dir-temp		= $(CURDIR)/nvim/temp

$(_m)-links = 	\
  .

$(_m)-link-.	= ~/.config/nvim
