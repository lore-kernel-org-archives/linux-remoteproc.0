Return-Path: <rohitkr@codeaurora.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: Add ADSP reserve-memory
 nodes
References: <1545313174-13481-1-git-send-email-rohitkr@codeaurora.org>
 <1545313174-13481-2-git-send-email-rohitkr@codeaurora.org>
 <20190103234249.GH31596@builder>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <6b81869e-1d8b-510e-760a-9476ac08528f@codeaurora.org>
Date: Mon, 7 Jan 2019 13:17:58 +0530
MIME-Version: 1.0
In-Reply-To: <20190103234249.GH31596@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: dianders@chromium.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Bjorn for review.

On 1/4/2019 5:12 AM, Bjorn Andersson wrote:
> On Thu 20 Dec 05:39 PST 2018, Rohit kumar wrote:
>
>> Add memory nodes required for remoteproc q6v5_adsp pil.
>>
> This range doesn't match the documented memory map. I would prefer to
> see a "Specify all PIL regions as defined in V10" or similar.

Yes,  Sibi will post it along with other PIL regions with update address 
in next spin.


>
> Regards,
> Bjorn
>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 23a253b..c0a012f 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -88,6 +88,11 @@
>>   			reg = <0 0x86200000 0 0x2d00000>;
>>   			no-map;
>>   		};
>> +
>> +		pil_adsp_mem: memory@8b100000 {
>> +			reg = <0 0x8b100000 0 0x1a00000>;
>> +			no-map;
>> +		};
>>   	};
>>   
>>   	cpus {
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
Regards,
Rohit
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.
