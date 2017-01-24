Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RFC PATCH v2 3/3] arm64: dts: msm8996: Add SLPI SMP2P dt node.
References: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
 <1484928636-27351-4-git-send-email-akdwived@codeaurora.org>
 <20170120181537.GZ10531@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <999abd3a-b4a7-8850-b09c-dc8f29bee2bb@codeaurora.org>
Date: Tue, 24 Jan 2017 17:43:48 +0530
MIME-Version: 1.0
In-Reply-To: <20170120181537.GZ10531@minitux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/20/2017 11:45 PM, Bjorn Andersson wrote:
> On Fri 20 Jan 08:10 PST 2017, Avaneesh Kumar Dwivedi wrote:
>
>> Add smp2p support to communicate with slpi processor.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 9d1d7ad..c60472b 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -541,5 +541,29 @@
>>   			#interrupt-cells = <2>;
>>   		};
>>   	};
>> +
>> +	smp2p-slpi {
>> +		compatible = "qcom,smp2p";
>> +		qcom,smem = <481>, <430>;
>> +
>> +		interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>> +
>> +		qcom,ipc = <&apcs 16 26>;
>> +
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <3>;
>> +
>> +		slpi_smp2p_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		slpi_smp2p_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,state-cells = <1>;
> Sorry for missing this earlier, but this is "#qcom,smem-state-cells" in
> mainline
OK thanks for pointing this, may i know if it doesn't find proper "qcom, 
smem-state-cells" entry for smem-state is their any fallback option or 
smem set/reset will not reflect at all at remoteproc?

>
> Apart of that:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
