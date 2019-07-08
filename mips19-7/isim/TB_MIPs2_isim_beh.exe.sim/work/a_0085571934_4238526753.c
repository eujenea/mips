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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Juan/Desktop/MIPS 2018/registros.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_0085571934_4238526753_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 992U);
    t4 = xsi_signal_has_event(t3);
    if (t4 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(63, ng0);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 6276U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t3);
    t1 = (t14 == 0);
    if (t1 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 2312U);
    t5 = *((char **)t3);
    t3 = (t0 + 1352U);
    t6 = *((char **)t3);
    t3 = (t0 + 6276U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t3);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t14);
    t17 = (32U * t16);
    t18 = (0 + t17);
    t9 = (t5 + t18);
    t12 = (t0 + 3936);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 32U);
    xsi_driver_first_trans_fast_port(t12);

LAB12:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1512U);
    t5 = *((char **)t3);
    t3 = (t0 + 6292U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t3);
    t1 = (t14 == 0);
    if (t1 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 2312U);
    t5 = *((char **)t3);
    t3 = (t0 + 1512U);
    t6 = *((char **)t3);
    t3 = (t0 + 6292U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t3);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t14);
    t17 = (32U * t16);
    t18 = (0 + t17);
    t9 = (t5 + t18);
    t12 = (t0 + 4000);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 32U);
    xsi_driver_first_trans_fast_port(t12);

LAB15:    t3 = (t0 + 3792);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t5 = (t0 + 1832U);
    t12 = *((char **)t5);
    t5 = (t0 + 1672U);
    t13 = *((char **)t5);
    t5 = (t0 + 6308U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t13, t5);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    t17 = (32U * t16);
    t18 = (0U + t17);
    t19 = (t0 + 3872);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t12, 32U);
    xsi_driver_first_trans_delta(t19, t18, 32U, 0LL);
    goto LAB3;

LAB5:    t5 = (t0 + 1192U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    t1 = t11;
    goto LAB7;

LAB8:    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t2 = t8;
    goto LAB10;

LAB11:    xsi_set_current_line(64, ng0);
    t6 = (t0 + 7485);
    t12 = (t0 + 3936);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB12;

LAB14:    xsi_set_current_line(69, ng0);
    t6 = (t0 + 7517);
    t12 = (t0 + 4000);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB15;

}


extern void work_a_0085571934_4238526753_init()
{
	static char *pe[] = {(void *)work_a_0085571934_4238526753_p_0};
	xsi_register_didat("work_a_0085571934_4238526753", "isim/TB_MIPs2_isim_beh.exe.sim/work/a_0085571934_4238526753.didat");
	xsi_register_executes(pe);
}
