Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 18 Nov 2016 10:57:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/3] remoteproc: qcom: Embed private data structure
 for hexagon dsp.
Message-ID: <20161118185708.GK28340@tuxbot>
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
 <1478522240-11036-2-git-send-email-akdwived@codeaurora.org>
 <20161108070805.GL25787@tuxbot>
 <c5f03abe-866d-9624-eb69-166c39810b8f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5f03abe-866d-9624-eb69-166c39810b8f@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 16 Nov 06:41 PST 2016, Avaneesh Kumar Dwivedi wrote:

> i have been a little delayed for posting replies to patch comments,
> hopefully onward it should be quick and fast.
> 

I would greatly appreciate if you allow for a discussion before posting
new revisions of the patchset. I will respond to your comments here and
ignore v4 for now.

> 
> On 11/8/2016 12:38 PM, Bjorn Andersson wrote:
> >On Mon 07 Nov 04:37 PST 2016, Avaneesh Kumar Dwivedi wrote:
[..]
> >>+char *active_8x96_clk_str[] = {"iface", "bus", "mem", "gpll0_mss_clk",
> >>+		"snoc_axi_clk", "mnoc_axi_clk"};
> >All these needs to be static, but I would prefer if you just put the
> >values directly into the resource structs below.
> If i have to initialize directly into resource struct, i need to declare
> individual elements as array of fixed size
> but number of resource lets say  number of proxy regulator not being same
> for different q6 chips, made me to
> work with double pointer which can be assigned with address of an array of
> string pointer as per need when new version need to be supported.
> 

Using a termination sentinel to indicate end of lists is quite common in
the kernel, so you can do this:

	.active_clks = (char*[]){
		"iface",
		"bus",
		...,
		NULL
	},

> Though i have made above elements as static in next patch.
> >
> >>+
> >>+static const struct q6_rproc_res msm_8996_res = {
> >>+	.proxy_clks = proxy_8x96_clk_str,
> >>+	.proxy_clk_cnt = 3,
> >It's common practice to use a NULL terminator in the definition list
> >rather than keeping separate count of the number of items.
> >
> >While acquiring the resources you would have to "calculate" the number
> >and store it in the q6v5 struct, but this would make turn this struct
> >into something only used during probe() - which is nice.
> 
> Yes, have modified as per suggestion.
> >
> >>+	.active_clks = active_8x96_clk_str,
> >>+	.active_clk_cnt = 6,
> >>+	.proxy_regs = proxy_8x96_reg_str,
> >>+	.active_regs = NULL,
> >>+	.proxy_reg_action = (int **)proxy_8x96_reg_action,
> >>+	.proxy_reg_load = (int *)proxy_8x96_reg_load,
> >>+	.active_reg_action = NULL,
> >>+	.active_reg_load = NULL,
> >>+	.proxy_reg_voltage = (int *)proxy_8x96_reg_min_voltage,
> >>+	.active_reg_voltage = NULL,
> >>+	.proxy_reg_cnt = 3,
> >>+	.active_reg_cnt = 0,
> >>+	.q6_reset_init = q6v56_init_reset,
> >>+	.q6_version = "v56",
> >q6_version would be better to have as a enum.
> 
> have removed this entry.
> each class of q6 lets say "v56" have again many version of hexagon with
> minor differences wrt each other.

Okay, I'm fine with us sticking to classes, but I would like for them to
make sense - and be listed as an enum instead of a string, to simplify
the code.

> for example msm8996 use "v56" 1.5.0 while MSM8952 uses 1.8.0, reset sequence

In msm-3.18 8996 is listed to be v55.

> and some other operation differ wrt to this version in terms of order of
> register programming. so i have introduced one variable in q6v5 struct per
> q6 chip supported, if this is defined then we can check and carry out
> version specific instruction.
> will this be OK?
> 

Generally in the Linux kernel it's frowned upon to carry the version
information and then do conditional operation on this.

It's preferred to carry explicit flags through the implementation, e.g.
carrying "mba.mbn" vs "mba.b00" rather than switching based on "version"
at the point of use of this data.

But I'm not sure if the other differences has reasonable names, e.g. how
to we denote the differences in reset sequence?

> >
> >>+	.q6_mba_image = "mba.mbn",
> >>+};
> >>+
> >>+char *proxy_8x16_reg_str[] = {"mx", "cx", "pll"};
> >>+char *active_8x16_reg_str[] = {"mss"};
> >>+int  proxy_8x16_reg_action[4][2] = { {0, 1}, {1, 0}, {1, 0} };
> >>+int  active_8x16_reg_action[1][2] = { {1, 1} };
> >>+int  proxy_8x16_reg_load[] = {100000, 0, 100000, 100000};
> >>+int  active_8x16_reg_load[] = {100000};
> >>+int  proxy_8x16_reg_min_voltage[] = {1050000, 0, 0};
> >>+int  active_8x16_reg_min_voltage[] = {1000000};
> >>+char *proxy_8x16_clk_str[] = {"xo"};
> >>+char *active_8x16_clk_str[] = {"iface", "bus", "mem"};
> >>+
> >>+static const struct q6_rproc_res msm_8916_res = {
> >>+	.proxy_clks = proxy_8x16_clk_str,
> >>+	.proxy_clk_cnt = 1,
> >>+	.active_clks = active_8x16_clk_str,
> >>+	.active_clk_cnt = 3,
> >>+	.proxy_regs = proxy_8x16_reg_str,
> >>+	.active_regs = active_8x16_reg_str,
> >>+	.proxy_reg_action = (int **)proxy_8x16_reg_action,
> >>+	.proxy_reg_load = (int *)proxy_8x16_reg_load,
> >>+	.active_reg_action = (int **)active_8x16_reg_action,
> >>+	.active_reg_load = (int *)active_8x16_reg_load,
> >>+	.proxy_reg_voltage = (int *)proxy_8x16_reg_min_voltage,
> >>+	.active_reg_voltage = active_8x16_reg_min_voltage,
> >>+	.proxy_reg_cnt = 3,
> >>+	.active_reg_cnt = 1,
> >>+	.q6_reset_init = q6v5_init_reset,
> >>+	.q6_version = "v5",
> >>+	.q6_mba_image = "mba.b00",
> >q6v55 (msm8916) also uses mba.mbn, while q6v5 (msm8974) uses mba.b00.
> Again this is a case where compatible string can not help, we should have
> single compatible string i.e. "q6v5" for msm8916 and msm8974 since both are
> from same class of q6 chip with different version.
> so if we cant initialize mdt name based on compatible string alone.

msm-3.4, msm-3.10 and msm-3.18 states that they are not the same and as
such I don't think we have a problem.

The more I look at this, the more convinced I am that we got 8916 wrong,
i.e. we specified the wrong class and it just happens to work.

> >
> >>+};
> >>+
> >>+static const struct of_device_id q6_of_match[] = {
> >>+	{ .compatible = "qcom,q6v5-pil", .data = &msm_8916_res},
> >As I was looking in the CAF tree, I believe the correct version for 8916
> >is 5.5 and v5 was used in 8974.
> >
> >But I presume these versions are not strictly tied to certain platforms,
> >so please name the resource structs based on the q6v5 version, rather
> >than platforms.
> Yes, resource are tied to compatible and version of q6.
> have used compatible to initialize major resources but using DT specified
> version string for minor deviations where needed.
> Should this be fine?
> as far as version on 8916 and 8974 are concern they are as below.
> 
> msm8974 q6v5 core version  5.0.0
> msm8916 q6v5 core version  5.1.1

If there are differences within a class then that just forces us to use
the version number. There's very little overhead in carrying one
compatible per platform, if that's what we need.

> >
> >>+	{ .compatible = "qcom,q6v56-pil", .data = &msm_8996_res},
> >>  	{ },
> >>  };

Regards,
Bjorn
