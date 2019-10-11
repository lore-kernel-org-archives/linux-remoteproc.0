Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42596 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728738AbfJKSn0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Oct 2019 14:43:26 -0400
Subject: Re: [PATCH] rpmsg: glink: Remove channel decouple from rpdev release
References: <20191009013345.17192-1-clew@codeaurora.org>
 <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <4e0b199c-40d7-4222-f333-601134a817a1@codeaurora.org>
Date: Fri, 11 Oct 2019 11:43:23 -0700
MIME-Version: 1.0
In-Reply-To: <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/9/2019 10:04 PM, Stephen Boyd wrote:
> Quoting Chris Lew (2019-10-08 18:33:45)
>> If a channel is being rapidly restarted and the kobj release worker is
>> busy, there is a chance the the rpdev_release function will run after
>> the channel struct itself has been released.
>>
>> There should not be a need to decouple the channel from rpdev in the
>> rpdev release since that should only happen from the channel close
>> commands.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
> 
> Fixes tag? The whole thing sounds broken and probably is still racy in
> the face of SMP given that channel->rpdev is tested for "published" or
> not. Can you describe the race that you're closing more?
> 

Thanks Stephen, will add Fixes tag and try to describe the race better.

I agree that the whole thing sounds broken, the glink channel cleanup 
code has a couple bugs that need to be addressed in a more extensive 
patch. This patch is more to address the immediate issue of a 
use-after-free from one of the races.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
