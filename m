Return-Path: <0101016e88b06344-e725e6a9-b09e-4db2-aeeb-cd2d9b66c3e5-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Nov 2019 12:01:31 +0000
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of
 reset sequence
In-Reply-To: <CAOCk7NpVDNRxkPUTHbsG_WC4MrjU8_JcdgiuyYbb36RPTMrOWQ@mail.gmail.com>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
 <CAOCk7Nou94bxk_48JArrXhQw2KR+3bKanLe+hb2=d7_j6y3VbQ@mail.gmail.com>
 <0101016e844504f1-d8bd27a5-c0bf-4b0b-8301-7bd8a890be80-000000@us-west-2.amazonses.com>
 <CAOCk7NpVDNRxkPUTHbsG_WC4MrjU8_JcdgiuyYbb36RPTMrOWQ@mail.gmail.com>
Message-ID: <0101016e88b06344-e725e6a9-b09e-4db2-aeeb-cd2d9b66c3e5-000000@us-west-2.amazonses.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, DTML <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-11-19 21:13, Jeffrey Hugo wrote:
> On Tue, Nov 19, 2019 at 8:25 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Hey Jeff,
>> 
>> On 11/19/19 3:24 AM, Jeffrey Hugo wrote:
>> > On Mon, Nov 18, 2019 at 2:43 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>> >>
>> >> Fixup the following in the MSS out of reset sequence on MSM8998:
>> >> * skip ACC override on MSM8998.
>> >> * wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
>> >> * remove "mem" clock from the active pool.
>> >
>> > Why any of this is necessary isn't explained.
>> 
>> Honestly the above two fixes didn't seem to have any impact when I
>> tested it on MSM8998 MTP just making sure that we allign with the
>> out of reset sequence found on msm-4.4.
> 
> That should be mentioned in the commit text then.
> 
>> 
>> > Seems like it should be 3 separate patches.
>> > Regarding the mem clock change, wouldn't it be an issue if we don't
>> > vote for that?
>> 
>> we already proxy vote for it though.
> 
> Ah, so we do.  That should be mentioned in the commit text.

okay I'll add more details in the
in the next-respin :)

> 
>> 
>> >
>> >>
>> >> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> >> ---
>> >>   drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
>> >>   1 file changed, 20 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> index 471128a2e7239..2becf6dade936 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> @@ -100,6 +100,11 @@
>> >>   #define QDSP6SS_XO_CBCR                0x0038
>> >>   #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>> >>
>> >> +/* QDSP6v62 parameters */
>> >> +#define QDSP6SS_BHS_EN_REST_ACK                BIT(0)
>> >> +#define BHS_CHECK_MAX_LOOPS            200
>> >> +#define QDSP6SS_BHS_STATUS             0x0C4
>> >> +
>> >>   /* QDSP6v65 parameters */
>> >>   #define QDSP6SS_SLEEP                   0x3C
>> >>   #define QDSP6SS_BOOT_CORE_START         0x400
>> >> @@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>> >>                  int mem_pwr_ctl;
>> >>
>> >>                  /* Override the ACC value if required */
>> >> -               writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> >> -                      qproc->reg_base + QDSP6SS_STRAP_ACC);
>> >> +               if (qproc->version == MSS_MSM8996)
>> >> +                       writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> >> +                              qproc->reg_base + QDSP6SS_STRAP_ACC);
>> >>
>> >>                  /* Assert resets, stop core */
>> >>                  val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> >> @@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>> >>                  val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> >>                  udelay(1);
>> >>
>> >> +               /* wait for BHS_EN_REST_ACK to be set */
>> >> +               if (qproc->version == MSS_MSM8998) {
>> >> +                       ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
>> >> +                                                val, (val & QDSP6SS_BHS_EN_REST_ACK),
>> >> +                                                1, BHS_CHECK_MAX_LOOPS);
>> >> +                       if (ret) {
>> >> +                               dev_err(qproc->dev,
>> >> +                                       "QDSP6SS_BHS_EN_REST_ACK timedout\n");
>> >> +                               return -ETIMEDOUT;
>> >> +                       }
>> >> +               }
>> >> +
>> >>                  /* Put LDO in bypass mode */
>> >>                  val |= QDSP6v56_LDO_BYP;
>> >>                  writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> >> @@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
>> >>          .active_clk_names = (char*[]){
>> >>                          "iface",
>> >>                          "bus",
>> >> -                       "mem",
>> >>                          "gpll0_mss",
>> >>                          "mnoc_axi",
>> >>                          "snoc_axi",
>> >> --
>> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> >> a Linux Foundation Collaborative Project
>> >>
>> >
>> 
>> --
>> Qualcomm Innovation Center, Inc.
>> Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
