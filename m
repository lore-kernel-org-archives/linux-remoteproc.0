Return-Path: <vkoul@kernel.org>
Date: Wed, 6 Jun 2018 12:19:09 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
Message-ID: <20180606064909.GC16230@vkoul-mobl>
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
 <20180605164031.GZ16230@vkoul-mobl>
 <1b376fc2-6a1b-1457-ffff-332954d1bef8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b376fc2-6a1b-1457-ffff-332954d1bef8@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Sricharan,

On 06-06-18, 12:09, Sricharan R wrote:

> >>>> +config QCOM_Q6V5_WCSS
> >>>> +	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
> >>>> +	depends on OF && ARCH_QCOM
> >>>> +	depends on QCOM_SMEM
> >>>> +	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
> >>>> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> >>>
> >>> Is there a reason why it depends on RPMSG_QCOM_GLINK_SMEM=n? What would
> >>> happen if distro wants both this and RPMSG_QCOM_GLINK_SMEM
> >>>
> >>   RPMSG_QCOM_GLINK_SMEM=n should be for the COMPILE_TEST. Probably that
> > 
> > why would that be a limitation? I am more worried about
> > RPMSG_QCOM_GLINK_SMEM=n being the condition here. In new drivers we
> > should not typically have dependency on some symbol being not there
> 
> Without that, if RPMSG_QCOM_GLINK_SMEM=m is compiled as a module, then
> it would break the build.

Okay I do not know the details, but that doesn't sound correct to me.
Breaking build sounds a bit extreme to me. Can you give details on this
part..

> >>   means that it should be corrected here and for ADSP, Q6V5_PIL as well.
> >>   Bjorn, is that correct ?, should it be, below ?
> >>  
> >>   depends on (RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)) || (RPMSG_QCOM_GLINK_SMEM || (COMPILE_TEST && RPMSG_QCOM_GLINK_SMEM=n))
> > 
> > that doesnt really sound good :(
> 
>  Hmm, but i was thinking it should functionally depend on either SMD or GLINK and not both.

If you are depedent upon a symbol provided by a module you should say
depends on. If a machine is not supposed to have both SMD or GLINK then
the driver will not get probed.

-- 
~Vinod
