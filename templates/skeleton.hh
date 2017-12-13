/**
 *  @file `!v expand('%:t')`
 *  @author `!v g:my_name` (`!v g:my_email`)
 */
#ifndef `!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_
# define `!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_

/**
 * @brief 
 */
class `!v expand("%:t:r")`
{
  public:
${VISUAL}$0
};

#endif /** !`!v substitute(toupper(expand('%:t')), "\\.", "_", "g")`_ */
