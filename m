Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: Introduce sysmon
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-5-bjorn.andersson@linaro.org>
 <0ab5497e-94b4-6450-d680-14f002188714@codeaurora.org>
 <20171117055832.GR28761@minitux>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <ae4944d2-1198-eb5e-5fb6-8b60b5c35f19@codeaurora.org>
Date: Fri, 17 Nov 2017 17:27:21 -0800
MIME-Version: 1.0
In-Reply-To: <20171117055832.GR28761@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, runminw@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/16/2017 9:58 PM, Bjorn Andersson wrote:
> On Thu 16 Nov 12:05 PST 2017, Chris Lew wrote:
>>> +	req.event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
>>
>> Are there plans to add the other SSR events to sysmon notifiers? I think the
>> SSCTL service expects to receive events about remote procs starting as well.
>>
> 
> We could easily add support here to send out the AFTER_BOOTUP
> notification, beyond that we would need to extend the subdev notifiers
> as well.
> 
> But the downstream code paths does confuse me, can you confirm that
> these messages are actually sent to the remote ssctl services?
> 
> Regards,
> Bjorn
> 

Yea the other three events are definitely sent to the remote. The remote 
side posts the events for other modules to query. I'm not sure if all of 
the events are used by other other modules though.

Thanks,
Chris
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
