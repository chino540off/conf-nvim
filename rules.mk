_m = nvim

$(_m)-dirs =	\
  backup	\
  temp

$(_m)-dir-backup	= $(CURDIR)/$(_m)/backup
$(_m)-dir-temp		= $(CURDIR)/$(_m)/temp

$(_m)-links = 	\
  .

$(_m)-link-.	= ~/.config/$(_m)
