/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *IEEE_P_0774719531;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_1242562249_init();
    ieee_p_3620187407_init();
    work_a_2224366606_3212880686_init();
    ieee_p_0774719531_init();
    work_a_1991350011_0317204477_init();
    work_a_3830602496_0412081955_init();
    work_a_4204489651_0000452272_init();
    work_a_0085571934_4238526753_init();
    work_a_0832606739_2687312913_init();
    work_a_4215309833_3212880686_init();
    work_a_1696626097_1969771589_init();
    work_a_2322776912_3212880686_init();
    work_a_3112133841_4191529660_init();
    work_a_2750190074_3020935179_init();
    work_a_3757138266_3212880686_init();
    work_a_2458396546_1446275585_init();
    work_a_3155619965_3212880686_init();
    work_a_1309295487_3212880686_init();
    work_a_1461684583_1446275585_init();
    work_a_4151165356_3212880686_init();
    work_a_0020357321_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_2991416129_3212880686_init();
    work_a_1037769429_3212880686_init();
    work_a_2178422333_3212880686_init();
    work_a_1430113433_3212880686_init();
    work_a_2780199841_2372691052_init();


    xsi_register_tops("work_a_2780199841_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");

    return xsi_run_simulation(argc, argv);

}
