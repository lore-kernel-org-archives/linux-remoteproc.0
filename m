Return-Path: <sboyd@codeaurora.org>
Date: Mon, 14 Nov 2016 11:16:41 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: add Venus video core firmware
 loader driver
Message-ID: <20161114191641.GH5177@codeaurora.org>
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-4-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478539853-23218-4-git-send-email-stanimir.varbanov@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 11/07, Stanimir Varbanov wrote:
> +#include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/qcom_scm.h>
> +#include <linux/remoteproc.h>
> +
> +#include "qcom_mdt_loader.h"
> +#include "remoteproc_internal.h"
> +
> +#define VENUS_CRASH_REASON_SMEM		425

This is unused. Is there going to be some common smem API to get
the crash reason?
> +
> +static const struct of_device_id venus_of_match[] = {
> +	{ .compatible = "qcom,venus-pil" },
> +	{ },
> +};

Add a MODULE_DEVICE_TABLE?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
