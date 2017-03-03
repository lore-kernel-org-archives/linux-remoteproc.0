Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Mar 2017 10:23:02 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: Add msm8996 specific changes in
 mss rproc driver.
Message-ID: <20170303182302.GU25384@codeaurora.org>
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
 <1485773044-31489-4-git-send-email-akdwived@codeaurora.org>
 <20170227224800.GE25384@codeaurora.org>
 <82ef090c-71fb-dd20-f54b-b52931e78d08@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ef090c-71fb-dd20-f54b-b52931e78d08@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/03, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 2/28/2017 4:18 AM, Stephen Boyd wrote:
> >On 01/30, Avaneesh Kumar Dwivedi wrote:
> >>@@ -1213,6 +1299,47 @@ static int q6v5_remove(struct platform_device *pdev)
> >>  	return 0;
> >>  }
> >>+static const struct rproc_hexagon_res msm8996_mss = {
> >>+	.hexagon_mba_image = "mba.mbn",
> >>+	.proxy_supply = (struct qcom_mss_reg_res[]) {
> >>+		{
> >>+			.supply = "vdd_mx",
> >>+			.uV = 6,
> >>+		},
> >>+		{
> >>+			.supply = "vdd_cx",
> >>+			.uV = 7,
> >>+			.uA = 100000,
> >>+		},
> >vdd cx and vdd mx are corners. The plan is to _not_ use the
> >regulator framework for those, so treating them like supplies is
> >incorrect here.
> vdd cx and mx though in downstream are voted for corner but they are
> always ON domain upstream as per regulator team when i discussed
> with them.
> should i drop them altogether?

I would say yes, drop them. The on/off state doesn't matter here.
This code wants to max out the corner for a period of time until
the remote processor has booted far enough to make their own vote
on these RPM resources.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
