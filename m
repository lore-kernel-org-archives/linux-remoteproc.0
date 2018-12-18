Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2018 12:08:35 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sdm845: Add power-domain for
 Q6V5 MSS node
In-Reply-To: <CAD=FV=WEhobH=fBTonJdABYzOqykgk6XYt9=3eoHap8K6rAQKA@mail.gmail.com>
References: <20181217100724.4593-1-sibis@codeaurora.org>
 <20181217100724.4593-6-sibis@codeaurora.org>
 <CAD=FV=WEhobH=fBTonJdABYzOqykgk6XYt9=3eoHap8K6rAQKA@mail.gmail.com>
Message-ID: <3b86d9853a6448a0a2f2c85deafae1fb@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Doug,
Thanks for the review :)

On 2018-12-18 05:32, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Add power-domains cx, mx, mss and load_state for Q6V5 MSS node.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> This patch depends on the following bindings:
>> https://patchwork.kernel.org/patch/10725801/ - rpmhpd dt bindings
>> https://patchwork.kernel.org/patch/10725793/ - rpmhpd dt node
>> https://patchwork.kernel.org/patch/10678301/ - AOP QMP dt bindings
>> 
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
> 
> As per my comments on patch #5, I think this patch (AKA patch #6)
> should be folded in there.
> 

okay

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 33ff8668828f..56f5f55db9e2 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1401,6 +1401,12 @@
>>                         qcom,halt-regs = <&tcsr_mutex_regs
>>                                                 0x23000 0x25000 
>> 0x24000>;
>> 
>> +                       power-domains = <&aoss_qmp_pd 
>> AOSS_QMP_LS_MODEM>,
>> +                                       <&rpmhpd SDM845_CX>,
>> +                                       <&rpmhpd SDM845_MX>,
>> +                                       <&rpmhpd SDM845_MSS>;
>> +                       power-domain-names = "load_state", "cx", "mx", 
>> "mss";
> 
> I guess you changed this to "load_state" from "aop" before?  Is there
> code that actually uses this?
> 

Bjorn said he will be posting the patch
for handling power-domains for mss..

> 
> -Doug
> 
> -Doug

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
