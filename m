Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-2-git-send-email-clew@codeaurora.org>
 <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
 <20171221013557.GE12655@minitux>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <d6ad476e-b68c-a1ed-9256-5997312a6024@codeaurora.org>
Date: Thu, 21 Dec 2017 11:36:09 -0800
MIME-Version: 1.0
In-Reply-To: <20171221013557.GE12655@minitux>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Chris Lew <clew@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/20/2017 05:35 PM, Bjorn Andersson wrote:
> On Wed 20 Dec 10:30 PST 2017, Rob Herring wrote:
>
>> On Mon, Dec 18, 2017 at 02:02:09PM -0800, Chris Lew wrote:
>>> Add a label property to identify the edge this node represents.
>> Why does a user need to know this?
>>
> We have multiple remoteproc instances, each one having one or more
> associated SMD or GLINK links (this node), exposing logical
> communication channels. Some of these logical channels are exposed to
> user space and we need a way to distinguish them there.
>
> In the current implementation of SMD this value goes straight into an
> sysfs attribute that we can use when writing udev rules and for the DIAG
> implementation to pair up channels related to the same remoteproc. This
> adds the equivalent information for glink-backed channels.
>
>
> I'm therefor in favor of picking this patch.

Please add these details to the commit log. Just writing what the patch
is doing isn't very helpful.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
