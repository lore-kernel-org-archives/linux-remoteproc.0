Return-Path: <linux-arm-msm-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 21 Apr 2020 22:33:30 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
In-Reply-To: <20200420055005.GI1516868@builder.lan>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-6-sibis@codeaurora.org>
 <20200420055005.GI1516868@builder.lan>
Message-ID: <e47383f6e4467610fc4623dc1f77dcd6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: agross@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

Thanks for reviewing the series!
Addressed all the review comments
in v3.

On 2020-04-20 11:20, Bjorn Andersson wrote:
> On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:
> 
>> Add TCSR node and update MSS node to support MSA based Modem boot on
>> SC7180 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> Depends on the following bindings:
>> iommus: https://patchwork.kernel.org/patch/11443101/
>> spare-regs: https://patchwork.kernel.org/patch/11491425/
>> 
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 
>> +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi    |  5 +++
>>  2 files changed, 47 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index e613d70cc0198..6f472872be1a3 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -319,6 +319,48 @@ &qupv3_id_1 {
>>  	status = "okay";
>>  };
>> 
>> +&remoteproc_mpss {
>> +	compatible = "qcom,sc7180-mss-pil";
>> +	reg = <0 0x04080000 0 0x410>, <0 0x04180000 0 0x48>;
> 
> I think we should overspecify the properties in the platform dtsi,
> whenever possible - it shouldn't be a problem that the pas driver
> doesn't use all the properties provided by the binding.
> 
> As such I think you should move the reg, clocks, resets, halt regs and
> power-domains to the platform.
> 
>> +	reg-names = "qdsp6", "rmb";
>> +
>> +	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>> +		 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
>> +		 <&gcc GCC_MSS_NAV_AXI_CLK>,
>> +		 <&gcc GCC_MSS_SNOC_AXI_CLK>,
>> +		 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK>;
>> +	clock-names = "iface", "bus", "nav", "snoc_axi",
>> +		      "mnoc_axi", "xo";
>> +
>> +	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x2>;
>> +
>> +	resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
>> +		 <&pdc_reset PDC_MODEM_SYNC_RESET>;
>> +	reset-names = "mss_restart", "pdc_reset";
>> +
>> +	qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
>> +	qcom,spare-regs = <&tcsr_regs 0xb3e4>;
>> +
>> +	power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
>> +			<&rpmhpd SC7180_CX>,
>> +			<&rpmhpd SC7180_MX>,
>> +			<&rpmhpd SC7180_MSS>;
>> +	power-domain-names = "load_state", "cx", "mx", "mss";
>> +
>> +	/delete-property/memory-region;
>> +
>> +	status = "okay";
>> +
>> +	mba {
>> +		memory-region = <&mba_mem>;
> 
> When I wrote this I was under the impression that memory-region wasn't
> allowed to take an array of regions, perhaps we can make the mss 
> binding
> and driver support a multi-cell memory-region in the of_node directly
> and drop these sub children.
> 
> Then it would be a cleaner update of the pas' memory-region.
> 
> But I'm fine with us putting this part on the todo list for the time
> being...

I've switched to using memory-region
in v3. I'll plan to convert the doc
to yaml after the remaining bindings
changes land.

> 
> Regards,
> Bjorn
> 
>> +	};
>> +
>> +	mpss {
>> +		memory-region = <&mpss_mem>;
>> +	};
>> +};
>> +
>>  &uart3 {
>>  	status = "okay";
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index e319762a0bffc..c49801ddb9d70 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -981,6 +981,11 @@ tcsr_mutex_regs: syscon@1f40000 {
>>  			reg = <0 0x01f40000 0 0x40000>;
>>  		};
>> 
>> +		tcsr_regs: syscon@1fc0000 {
>> +			compatible = "syscon";
>> +			reg = <0 0x01fc0000 0 0x40000>;
>> +		};
>> +
>>  		tlmm: pinctrl@3500000 {
>>  			compatible = "qcom,sc7180-pinctrl";
>>  			reg = <0 0x03500000 0 0x300000>,
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
