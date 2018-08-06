Return-Path: <rnayak@codeaurora.org>
Subject: Re: [PATCH] remoteproc: q6v5: Add support to vote for rpmh power
 domains
References: <20180629102035.2757-1-rnayak@codeaurora.org>
 <CAPDyKFq=7RrUcspzyZGxYrv8bFHC=hkqMTT1SFeb+H_=Yv_Cxg@mail.gmail.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <33aa19da-314d-f349-6750-0216ac9ab891@codeaurora.org>
Date: Mon, 6 Aug 2018 09:08:00 +0530
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq=7RrUcspzyZGxYrv8bFHC=hkqMTT1SFeb+H_=Yv_Cxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



On 8/3/2018 3:40 PM, Ulf Hansson wrote:
> On 29 June 2018 at 12:20, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>> With rpmh ARC resources being modelled as power domains with
>> performance state, add support to proxy vote on these for SDM845.
>> Add support to vote on multiple of them, now that genpd supports
>> associating multiple power domains to a device.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>> This patch is dependent on the rpmh powerdomain driver
>> still under review,
>> https://lkml.org/lkml/2018/6/27/7
> 
> I assume you intend to re-spin this to use the new
> dev_pm_domain_attach_by_name(), once 4.19 rc1 is out, right!?
> 
> Anyway, please keep me in the loop.

Yes, I do plan to respin this one with the new api.

> 
> [...]
> 
>> +       if (num_pds > 1) {
>> +               for (i = 0; i < num_pds; i++) {
>> +                       devs[i] = genpd_dev_pm_attach_by_id(dev, i);
> 
> This API is supposed to be called only by the driver core. Please use
> dev_pm_domain_attach_by_id|name() instead.

thanks, will change.

regards,
Rajendra
> 
> [...]
> 
> Kind regards
> Uffe
> 
