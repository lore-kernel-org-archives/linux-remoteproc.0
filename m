Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RFC 2/3] dt-binding: remoteproc: Introduce DT binding for
 Qualcomm slpi subsystem.
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-3-git-send-email-akdwived@codeaurora.org>
 <20170112183916.GI10531@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <aa3c751b-4ee0-c9af-fc11-f677a763481e@codeaurora.org>
Date: Mon, 16 Jan 2017 11:31:15 +0530
MIME-Version: 1.0
In-Reply-To: <20170112183916.GI10531@minitux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/13/2017 12:09 AM, Bjorn Andersson wrote:
> On Thu 12 Jan 05:53 PST 2017, Avaneesh Kumar Dwivedi wrote:
>
>> This document defines the binding for a component that loads firmware
>> and control the life cycle of the Qualcomm slpi core.
> Rather than duplicating the adsp binding I think we should just amend
> the adsp binding - and probably rename the file.
Yes, missed to amend the mention of adsp core, some places.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt b/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt
> [..]
>> += EXAMPLE
> [..]
>> +		clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
>> +				<&rpmcc MSM8996_RPM_SMD_AGGR2_NOC_CLK>;
>> +		clock-names = "xo",
>> +					"aggre2";
>> +
> I still haven't managed to acquire the block diagram for this chip and
> we have ongoing msm_bus discussions, but I believe we want something
> representing a bus to control this clock.
Do you mean any "NOC clock" need to be separately turned on by a bus 
driver not by the device driver itself?
>
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
