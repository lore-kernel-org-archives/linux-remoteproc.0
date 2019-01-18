Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 18 Jan 2019 12:34:38 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5: don't auto boot remote processor
In-Reply-To: <20180529042047.GE2259@tuxbook-pro>
References: <20180524192141.20323-1-ramon.fried@gmail.com>
 <20180529042047.GE2259@tuxbook-pro>
Message-ID: <e554b7e525554d49d193ff1f8ca51359@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ramon Fried <ramon.fried@gmail.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org, Brian, briannorris@chromium.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-05-29 09:50, Bjorn Andersson wrote:
> On Thu 24 May 12:21 PDT 2018, Ramon Fried wrote:
> 
>> Sometimes that rmtfs userspace module is not brought
>> up fast enough and the modem crashes.
>> disabling automated boot in the driver and triggering
>> the boot from user-space sovles the problem.
>> 
>> Signed-off-by: Ramon Fried <ramon.fried@gmail.com>
> 
> Thanks for your patch Ramon. While this nudges the behavior to make
> things work slightly better I think we need to describe the explicit
> dependency between the mss firmware and the existence of rmtfs.
> 
> As our remoteprocs are essentially always-on I would prefer that they
> start "automatically" and not through use of the sysfs interface.
> 
> But we're at the point where this is a real problem on 410, 820 and 
> 845,
> so we have to come up with some way to tie these pieces together. If
> your patch suits that solution I will happily take it.
> 
> Regards,
> Bjorn

After experimenting with in kernel solutions for
three revisions and observing problems on graceful
shutdown usecase, switching to controlling the
remoteproc mss through rmtfs seems to solve all
the known issues.

https://patchwork.kernel.org/patch/10662395/

we should probably get this merged in, now that
we are planning to start/stop mss through
rmtfs.


Acked-by: Sibi Sankar <sibis@codeaurora.org>

> 
>> ---
>>  drivers/remoteproc/qcom_q6v5_pil.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c 
>> b/drivers/remoteproc/qcom_q6v5_pil.c
>> index cbbafdcaaecb..719ee96445b3 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -1133,6 +1133,8 @@ static int q6v5_probe(struct platform_device 
>> *pdev)
>>  		return -ENOMEM;
>>  	}
>> 
>> +	rproc->auto_boot = false;
>> +
>>  	qproc = (struct q6v5 *)rproc->priv;
>>  	qproc->dev = &pdev->dev;
>>  	qproc->rproc = rproc;
>> --
>> 2.17.0
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
