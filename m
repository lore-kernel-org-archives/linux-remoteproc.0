Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RFC 3/3] arm64: dts: msm8996: Add SMP2P node for Qualcomm SLPI
 rproc driver.
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-4-git-send-email-akdwived@codeaurora.org>
 <20170112182416.GH10531@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <592f1710-6efb-e712-33ae-04e0fdace575@codeaurora.org>
Date: Mon, 16 Jan 2017 11:33:39 +0530
MIME-Version: 1.0
In-Reply-To: <20170112182416.GH10531@minitux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/12/2017 11:54 PM, Bjorn Andersson wrote:
> On Thu 12 Jan 05:53 PST 2017, Avaneesh Kumar Dwivedi wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 9d1d7ad..2457b20 100644
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
>> +		interrupts = <0 178 1>;
> Please use <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
OK,
>
>> +
>> +		qcom,ipc = <&apcs 4 8>;
> Looking at qcom,smp2p-dsps downstream I get this to <&apcs 16 26>;
I think i missed it, during validation it was working with <&apcs 4 8> 
and so did not realize to verify its validity.
will check and update.
>
>> +
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <3>;
>> +
>> +		slpi_smp2p_in: slave-kernel {
>> +				qcom,entry-name = "slave-kernel";
>> +				interrupt-controller;
>> +				#interrupt-cells = <2>;
>> +			};
> Please correct the indentation of this block.
OK.
>
>> +
>> +		slpi_smp2p_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,state-cells = <1>;
>> +		};
>> +	};
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
