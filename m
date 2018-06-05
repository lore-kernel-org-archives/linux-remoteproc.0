Return-Path: <vinod.koul@linaro.org>
Return-Path: <vinod.koul@linaro.org>
Date: Tue, 5 Jun 2018 22:10:31 +0530
From: Vinod Koul <vinod.koul@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
Message-ID: <20180605164031.GZ16230@vkoul-mobl>
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 05-06-18, 18:26, Sricharan R wrote:
> Hi Vinod,
> 
> On 6/5/2018 11:49 AM, Vinod wrote:
> > On 05-06-18, 11:12, Sricharan R wrote:
> > 
> >> +config QCOM_Q6V5_WCSS
> >> +	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
> >> +	depends on OF && ARCH_QCOM
> >> +	depends on QCOM_SMEM
> >> +	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
> >> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> > 
> > Is there a reason why it depends on RPMSG_QCOM_GLINK_SMEM=n? What would
> > happen if distro wants both this and RPMSG_QCOM_GLINK_SMEM
> > 
>   RPMSG_QCOM_GLINK_SMEM=n should be for the COMPILE_TEST. Probably that

why would that be a limitation? I am more worried about
RPMSG_QCOM_GLINK_SMEM=n being the condition here. In new drivers we
should not typically have dependency on some symbol being not there

>   means that it should be corrected here and for ADSP, Q6V5_PIL as well.
>   Bjorn, is that correct ?, should it be, below ?
>  
>   depends on (RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)) || (RPMSG_QCOM_GLINK_SMEM || (COMPILE_TEST && RPMSG_QCOM_GLINK_SMEM=n))

that doesnt really sound good :(

-- 
~Vinod
