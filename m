Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 6 Jun 2018 21:24:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
Message-ID: <20180607042443.GK510@tuxbook-pro>
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
 <20180606161733.GE510@tuxbook-pro>
 <20180607041134.GF16230@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607041134.GF16230@vkoul-mobl>
To: Vinod <vkoul@kernel.org>
Cc: Sricharan R <sricharan@codeaurora.org>, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Jun 21:11 PDT 2018, Vinod wrote:

> On 06-06-18, 09:17, Bjorn Andersson wrote:
> > On Tue 05 Jun 05:56 PDT 2018, Sricharan R wrote:
> > 
> > > Hi Vinod,
> > > 
> > > On 6/5/2018 11:49 AM, Vinod wrote:
> > > > On 05-06-18, 11:12, Sricharan R wrote:
> > > > 
> > > >> +config QCOM_Q6V5_WCSS
> > > >> +	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
> > > >> +	depends on OF && ARCH_QCOM
> > > >> +	depends on QCOM_SMEM
> > > >> +	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
> > > >> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> > > > 
> > > > Is there a reason why it depends on RPMSG_QCOM_GLINK_SMEM=n? What would
> > > > happen if distro wants both this and RPMSG_QCOM_GLINK_SMEM
> > > > 
> > 
> > It says that QCOM_Q6V5_WCSS either must have a compatible state (i.e.
> > builtin vs builtin, module vs builtin, but not builtin vs module) or
> > that it's disabled, in which case we will hit the stub functions in
> > qcom_glink.h.
> > 
> > I.e. this prevents QCOM_Q6V5_WCSS to be compiled builtin when
> > RPMSG_QCOM_GLINK_SMEM is module, as this would give us both stubs and
> > the module.
> 
> IIUC, you want to have QCOM_Q6V5_WCSS and RPMSG_QCOM_GLINK_SMEM as
> modules or builtin
> 

RPMSG_QCOM_SMD, RPMSG_QCOM_GLINK_SMEM and QCOM_Q6V5_WCSS are all
tristate.

> So, wouldn't Kconfig syntax something like where we say:
>         M if RPMSG_QCOM_GLINK_SMEM=m
>         bool if RPMSG_QCOM_GLINK_SMEM=y
> 

If we ignore SMD for a while we have the following combinations:

glink/wcss
y     y - valid
y     m - valid
y     n - valid
m     y - link failure (invalid)
m     m - valid
m     n - valid
n     y - valid (platform uses wcss, but not glink)
n     m - valid (-----"-----)
n     n - valid

So to distill this we have the two valid cases:
module/no if RPMSG_QCOM_GLINK_SMEM=m
yes/module/no if RPMSG_QCOM_GLINK_SMEM=y

and the way you express that in Kconfig is the somewhat awkward

  depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n

> Which makes it clear that both these have to be same type?
> 

They don't have to be of the same type, only of a compatible type.

Regards,
Bjorn
