Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2018 10:46:47 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: qcom: Add remote-pid binding for
 GLINK SMEM
In-Reply-To: <CAD=FV=WJPEzXahN3HRdNPTfcPs+OPCiQ_3f1zQh1-poekPgGRg@mail.gmail.com>
References: <20181217100724.4593-1-sibis@codeaurora.org>
 <CAD=FV=WJPEzXahN3HRdNPTfcPs+OPCiQ_3f1zQh1-poekPgGRg@mail.gmail.com>
Message-ID: <ae7c275abb7fb2604f2643c04d1dc0ab@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Doug,
Thanks for the review :)

On 2018-12-18 05:29, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 17, 2018 at 2:07 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Add missing qcom,remote-pid dt binding required for GLINK SMEM
>> which specifies the remote endpoint of the GLINK edge.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
>>  1 file changed, 5 insertions(+)
> 
> Fixes: 2b41d6c8e696 ("dt-bindings: soc: qcom: Extend GLINK to cover 
> SMEM")
> 
> 
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt 
>> b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> index 0b8cc533ca83..59ae603ba520 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> @@ -21,6 +21,11 @@ edge.
>>         Definition: should specify the IRQ used by the remote 
>> processor to
>>                     signal this processor about communication related 
>> events
>> 
>> +- qcom,remote-pid:
>> +       Usage: required for glink-smem
>> +       Value type: <u32>
>> +       Definition: specifies the identfier of the remote endpoint of 
>> this edge
> 
> s/identfier/identifier/
> 

missed this, will correct it in v3.

> 
> Other than the typo this seems right to me.  Feel free to add my
> Reviewed-by tag when that's fixed.
> 
> 
> -Doug

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
