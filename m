Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Oct 2018 22:51:35 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-pil: add SCM probe dependency
In-Reply-To: <20181009170232.GA86621@ban.mtv.corp.google.com>
References: <20181009020805.143982-1-briannorris@chromium.org>
 <20181009062125.GA2518@tuxbook-pro>
 <20181009170232.GA86621@ban.mtv.corp.google.com>
Message-ID: <68bfe0ebe76c7a071f3c2c53a88a6508@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 2018-10-09 22:32, Brian Norris wrote:
> On Mon, Oct 08, 2018 at 11:21:25PM -0700, Bjorn Andersson wrote:
>> On Mon 08 Oct 19:08 PDT 2018, Brian Norris wrote:
>> 
>> > Similar to qcom_q6v5_pas and qcom_wcnss drivers, probe will fail if SCM
>> > is not up.
>> >
>> 
>> Thanks Brian, this dependency was introduced with the memory ownership
>> support.
> 
> That's a good point. I'm actually not that familiar with this 
> particular
> driver--I was just trying to resolve an OOPS I saw while bringing this
> driver up--but that does look correct.
> 
>> I applied it with an updated conditional to make it explicit that it
>> related to need_mem_protection, updated the commit message to describe
>> actual relationship to the memory protection mechanism and added a
>> Fixes: tag.
> 
> Your version looks good, thanks.
> 
>> Don't we also need to add the ability to disable need_mem_protection
>> when we're running ATF?
> 
> I'm not sure exactly, but FWIW I'm running some form of ATF on SDM845
> and I'm running with 'needs_memory_protection' (hence, this patch).
> 

AFAIK ATF will eventually support the hyp assign calls even though they
are just stubs as of now.

> Regards,
> Brian

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
