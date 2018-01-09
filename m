Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH 5/6] rpmsg: Introduce rpmsg_get_rproc_name
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-6-git-send-email-clew@codeaurora.org>
 <20171219175202.GB12655@minitux>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <449b7b39-dc6a-dfcd-c149-03da03e5350d@codeaurora.org>
Date: Tue, 9 Jan 2018 11:08:52 -0800
MIME-Version: 1.0
In-Reply-To: <20171219175202.GB12655@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/19/2017 9:52 AM, Bjorn Andersson wrote:
> On Mon 18 Dec 14:02 PST 2017, Chris Lew wrote:
> 
>> Add support for client's to query the edge name their channel is
>> registered for. This is useful for clients who share the same channel
>> identifier across different remote procs.
>>
> 
> I presume this will result in a strcmp in some client driver?
> 
> When we're registering the rpmsg device, as part of handling of an
> arriving "open request", we do look for an of_node with matching
> qcom,glink-channels and if one is found we point the dev->of_node of the
> new device to this node.
> 
> So I would suggest that you, in your client driver, use this to decide
> which instance you're on; regardless if you're using compatible based
> driver matching.
> 
> Does this work for you?
> 
> Regards,
> Bjorn
> 

Yea I think this works for us, we can drop this patch.

Just to confirm my understanding, clients can use rpdev->dev.of_node to 
get the parent of_node and from there get the label field? Also to 
ensure of_node is set, client's need to add their channel to the dt with 
qcom,glink-channels.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
