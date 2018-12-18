Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2018 12:20:41 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Fixup regulator
 dependencies
In-Reply-To: <CAD=FV=XNZ5CzKXHogKEGTHgPVg_nbXxVEJR0e9F9usEY3YKEiQ@mail.gmail.com>
References: <20181217100724.4593-1-sibis@codeaurora.org>
 <20181217100724.4593-3-sibis@codeaurora.org>
 <CAD=FV=XNZ5CzKXHogKEGTHgPVg_nbXxVEJR0e9F9usEY3YKEiQ@mail.gmail.com>
Message-ID: <13e6d8d6bb46dfc31b5bca927b71223f@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Doug,
Thanks for the review :)

On 2018-12-18 05:30, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Fixup regulator supply dependencies for Q6V5 MSS on MSM996 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 780adc043b37..98894e6ad456 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -76,7 +76,9 @@ on the Qualcomm Hexagon core.
>>         Usage: required
>>         Value type: <phandle>
>>         Definition: reference to the regulators to be held on behalf 
>> of the
>> -                   booting of the Hexagon core
>> +                   booting of the Hexagon core on MSM8916 SoCs
>> +                   reference to the pll-supply regulator to be held 
>> on behalf
>> +                   of the booting of the Hexagon core on MSM8996 SoCs
> 
> The prose gets in the way and doesn't add anything.  I also don't
> understand what you're saying for msm8996.  You're saying that
> "pll-supply" is required there but none of the others?  That doesn't
> seem to be true in the code I have in front of me, but maybe I'm
> missing some patch.  For me, I'd write:
> 

AFAIK, only the exceptions are captured. But your
suggestion seems more simple/complete. Perhaps I'll
replace SoCs instead of compatibles? Anyway
I'll wait for Bjorn/Rob's preference.

> For the compatible strings below the following supplies are required:
>   "qcom,q6v5-pil"
>   "qcom,msm8916-mss-pil",
>   "qcom,msm8974-mss-pil"
> - cx-supply:
> - mss-supply:
> - mx-supply:
> - pll-supply:
> Usage: required
> Value type: <phandle>
> Definition: reference to the regulators to be held on behalf of the
>     booting of the Hexagon core
> 
> 
> ...and if msm8996 actually needs "pll-supply", you could add in...
> 
> For the compatible strings below the following supplies are required:
>   "qcom,msm8996-mss-pil"
> - pll-supply:
> Usage: required
> Value type: <phandle>
> Definition: reference to the regulators to be held on behalf of the
>     booting of the Hexagon core

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
