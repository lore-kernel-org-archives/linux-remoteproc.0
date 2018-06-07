Return-Path: <vkoul@kernel.org>
Date: Thu, 7 Jun 2018 14:13:48 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
Message-ID: <20180607084348.GG16230@vkoul-mobl>
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
 <20180606161733.GE510@tuxbook-pro>
 <20180607041134.GF16230@vkoul-mobl>
 <20180607042443.GK510@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607042443.GK510@tuxbook-pro>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sricharan R <sricharan@codeaurora.org>, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 06-06-18, 21:24, Bjorn Andersson wrote:
> On Wed 06 Jun 21:11 PDT 2018, Vinod wrote:
> 
> > So, wouldn't Kconfig syntax something like where we say:
> >         M if RPMSG_QCOM_GLINK_SMEM=m
> >         bool if RPMSG_QCOM_GLINK_SMEM=y
> > 
> 
> If we ignore SMD for a while we have the following combinations:
> 
> glink/wcss
> y     y - valid
> y     m - valid
> y     n - valid
> m     y - link failure (invalid)
> m     m - valid
> m     n - valid
> n     y - valid (platform uses wcss, but not glink)
> n     m - valid (-----"-----)
> n     n - valid
> 
> So to distill this we have the two valid cases:
> module/no if RPMSG_QCOM_GLINK_SMEM=m
> yes/module/no if RPMSG_QCOM_GLINK_SMEM=y
> 
> and the way you express that in Kconfig is the somewhat awkward
> 
>   depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n

Understood now :) Yes it is awkward..

Btw we seem to have issue with link fail here when glink is m and wcss
is y. Why don't we see link fail for glink being n? Yes I understand that
platform uses wcss but am curious how that works out :)

Thanks
-- 
~Vinod
