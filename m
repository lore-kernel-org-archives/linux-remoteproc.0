Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: add Venus video core firmware
 loader driver
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-4-git-send-email-stanimir.varbanov@linaro.org>
 <20161114191641.GH5177@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <51fef06b-8cf1-ae37-a6bd-6a1a30c34898@linaro.org>
Date: Thu, 17 Nov 2016 11:08:48 +0200
MIME-Version: 1.0
In-Reply-To: <20161114191641.GH5177@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 11/14/2016 09:16 PM, Stephen Boyd wrote:
> On 11/07, Stanimir Varbanov wrote:
>> +#include <linux/module.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/qcom_scm.h>
>> +#include <linux/remoteproc.h>
>> +
>> +#include "qcom_mdt_loader.h"
>> +#include "remoteproc_internal.h"
>> +
>> +#define VENUS_CRASH_REASON_SMEM		425
> 
> This is unused. Is there going to be some common smem API to get
> the crash reason?

This is leftover and never used, so I will delete it. About smem maybe
Bjorn have some idea?

>> +
>> +static const struct of_device_id venus_of_match[] = {
>> +	{ .compatible = "qcom,venus-pil" },
>> +	{ },
>> +};
> 
> Add a MODULE_DEVICE_TABLE?
> 

OK.

-- 
regards,
Stan
