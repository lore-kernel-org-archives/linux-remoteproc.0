Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH] rpmsg: glink: Initialize the "intent_req_comp" completion
 variable
References: <1509101152-1340-1-git-send-email-aneela@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <643ce1e4-8bb8-b7dd-6570-7a26cb6e42fb@codeaurora.org>
Date: Fri, 27 Oct 2017 17:33:04 -0700
MIME-Version: 1.0
In-Reply-To: <1509101152-1340-1-git-send-email-aneela@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arun Kumar Neelakantam <aneela@codeaurora.org>, ohad@wizery.com, bjorn.andersson@linaro.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 10/27/2017 3:45 AM, Arun Kumar Neelakantam wrote:
> The "intent_req_comp" variable is used without initialization which
> results in NULL pointer derefernce in qcom_glink_request_intent().
> 

Typo on dereference.

Thanks,
Chris
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
