/**
 *  @file `!v expand('%:t')`
 *  @author `!v g:my_name` (`!v g:my_email`)
 *  @brief A Documented file.
 *   
 *   Details.
 */
#ifndef `!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_
# define `!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_

$0

#endif /** !`!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_ */
