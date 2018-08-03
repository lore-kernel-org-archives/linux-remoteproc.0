Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180629102035.2757-1-rnayak@codeaurora.org>
References: <20180629102035.2757-1-rnayak@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 Aug 2018 12:10:27 +0200
Message-ID: <CAPDyKFq=7RrUcspzyZGxYrv8bFHC=hkqMTT1SFeb+H_=Yv_Cxg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: q6v5: Add support to vote for rpmh power domains
Content-Type: text/plain; charset="UTF-8"
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 29 June 2018 at 12:20, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> With rpmh ARC resources being modelled as power domains with
> performance state, add support to proxy vote on these for SDM845.
> Add support to vote on multiple of them, now that genpd supports
> associating multiple power domains to a device.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> This patch is dependent on the rpmh powerdomain driver
> still under review,
> https://lkml.org/lkml/2018/6/27/7

I assume you intend to re-spin this to use the new
dev_pm_domain_attach_by_name(), once 4.19 rc1 is out, right!?

Anyway, please keep me in the loop.

[...]

> +       if (num_pds > 1) {
> +               for (i = 0; i < num_pds; i++) {
> +                       devs[i] = genpd_dev_pm_attach_by_id(dev, i);

This API is supposed to be called only by the driver core. Please use
dev_pm_domain_attach_by_id|name() instead.

[...]

Kind regards
Uffe
