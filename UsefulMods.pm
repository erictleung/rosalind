package UsefulMods;

# UsefulMods.pm - small subroutines I always run into for 
#     Rosalind

require Exporter;

our @ISA           = qw( Exporter );

# Have subroutine automatically imported into the program that uses the
# custom module
our @EXPORT        = qw();

# Allows the program that uses the cutom module to specify the subroutines
# being called to import
our @EXPORT_OK     = qw(

);

# Group related subroutines within the module into tagged categories
our %EXPORT_TAGS   = ();

#------------------------------------------------------------------
#------------------------------------------------------------------



1;
