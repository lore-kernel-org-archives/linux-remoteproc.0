Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 6 Jun 2018 22:48:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
Message-ID: <20180607054838.GM510@tuxbook-pro>
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
 <20180606161733.GE510@tuxbook-pro>
 <20180607041134.GF16230@vkoul-mobl>
 <20180607042443.GK510@tuxbook-pro>
 <d01d6819-3f95-0b65-1251-aead88fe86cc@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d01d6819-3f95-0b65-1251-aead88fe86cc@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: Vinod <vkoul@kernel.org>, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Jun 22:29 PDT 2018, Sricharan R wrote:

> Hi Bjorn,
> 
> On 6/7/2018 9:54 AM, Bjorn Andersson wrote:
> > On Wed 06 Jun 21:11 PDT 2018, Vinod wrote:
> > 
> >> On 06-06-18, 09:17, Bjorn Andersson wrote:
> >>> On Tue 05 Jun 05:56 PDT 2018, Sricharan R wrote:
> >>>
> >>>> Hi Vinod,
> >>>>
> >>>> On 6/5/2018 11:49 AM, Vinod wrote:
> >>>>> On 05-06-18, 11:12, Sricharan R wrote:
[..]
> > If we ignore SMD for a while we have the following combinations:
> > 
> > glink/wcss
> > y     y - valid
> > y     m - valid
> > y     n - valid
> > m     y - link failure (invalid)
> > m     m - valid
> > m     n - valid
> > n     y - valid (platform uses wcss, but not glink)
> > n     m - valid (-----"-----)
> > n     n - valid
> > 
> > So to distill this we have the two valid cases:
> > module/no if RPMSG_QCOM_GLINK_SMEM=m
> > yes/module/no if RPMSG_QCOM_GLINK_SMEM=y
> > 
> > and the way you express that in Kconfig is the somewhat awkward
> > 
> >   depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> > 
> 
>  ok, Having "depends on RPMSG_QCOM_GLINK_SMEM" takes care of the
>  first 6 cases in the above list.
> 
>  But just was thinking that by allowing the last three combinations,
>  there is a chance that some config that really needs GLINK_SMEM and WCSS,
>  but selects only Q6V5_WCSS and misses to select GLINK_SMEM,
>  would still built and make it non-functional, right ?
> 

It would allow you to compile a kernel with GLINk disabled that in
runtime loads a firmware that depends on GLINK being there.

As it would be convenient to thereby state that "WCSS always depends on
GLINK" we can make the analog to 410 where "MSS always depends on SMD",
which isn't true when the same driver is reused on e.g. 845 - which
uses GLINK.


So my recommendation is that we stick with Kconfig options that
describes the build time dependencies of this particular driver, rather
than its runtime dependencies in a particular platform.

Regards,
Bjorn
