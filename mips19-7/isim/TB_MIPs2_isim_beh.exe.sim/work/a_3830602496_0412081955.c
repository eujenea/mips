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
static const char *ng0 = "C:/Users/Juan/Desktop/MIPS 2018/RAM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3830602496_0412081955_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 5536U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t2);
    t3 = (t10 < 16);
    if (t3 == 1)
        goto LAB20;

LAB21:    t1 = (unsigned char)0;

LAB22:    if (t1 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 6202);
    t5 = (t0 + 3456);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t13 = (t12 + 56U);
    t16 = *((char **)t13);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);

LAB18:    t2 = (t0 + 3312);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 1352U);
    t9 = *((char **)t4);
    t4 = (t0 + 5536U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t4);
    t11 = (t10 < 16);
    if (t11 == 1)
        goto LAB11;

LAB12:    t8 = (unsigned char)0;

LAB13:    if (t8 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(31, ng0);
    t16 = (t0 + 1192U);
    t17 = *((char **)t16);
    t18 = *((unsigned char *)t17);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB9;

LAB11:    t12 = (t0 + 1352U);
    t13 = *((char **)t12);
    t12 = (t0 + 5536U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t13, t12);
    t15 = (t14 >= 0);
    t8 = t15;
    goto LAB13;

LAB14:    xsi_set_current_line(32, ng0);
    t16 = (t0 + 1512U);
    t20 = *((char **)t16);
    t21 = (31 - 31);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t16 = (t20 + t23);
    t24 = (t0 + 1352U);
    t25 = *((char **)t24);
    t24 = (t0 + 5536U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t25, t24);
    t27 = (t26 - 15);
    t28 = (t27 * -1);
    t29 = (32U * t28);
    t30 = (0U + t29);
    t31 = (t0 + 3392);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t16, 32U);
    xsi_driver_first_trans_delta(t31, t30, 32U, 0LL);
    goto LAB15;

LAB17:    xsi_set_current_line(41, ng0);
    t12 = (t0 + 1832U);
    t13 = *((char **)t12);
    t12 = (t0 + 1352U);
    t16 = *((char **)t12);
    t12 = (t0 + 5536U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t12);
    t27 = (t26 - 15);
    t21 = (t27 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t26);
    t22 = (32U * t21);
    t23 = (0 + t22);
    t17 = (t13 + t23);
    t20 = (t0 + 3456);
    t24 = (t20 + 56U);
    t25 = *((char **)t24);
    t31 = (t25 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t17, 32U);
    xsi_driver_first_trans_delta(t20, 0U, 32U, 0LL);
    goto LAB18;

LAB20:    t5 = (t0 + 1352U);
    t9 = *((char **)t5);
    t5 = (t0 + 5536U);
    t14 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t5);
    t6 = (t14 >= 0);
    t1 = t6;
    goto LAB22;

}


extern void work_a_3830602496_0412081955_init()
{
	static char *pe[] = {(void *)work_a_3830602496_0412081955_p_0};
	xsi_register_didat("work_a_3830602496_0412081955", "isim/TB_MIPs2_isim_beh.exe.sim/work/a_3830602496_0412081955.didat");
	xsi_register_executes(pe);
}
