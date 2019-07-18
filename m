Return-Path: <gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 18 Jul 2019 11:54:15 +0530
From: gokulsri@codeaurora.org
Subject: Re: [PATCH 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
In-Reply-To: <20190717201326.DCEB520880@mail.kernel.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
 <20190717201326.DCEB520880@mail.kernel.org>
Message-ID: <d818af556d18808301e12beeb8427e6e@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-07-18 01:43, Stephen Boyd wrote:
> Quoting Gokul Sriram Palanisamy (2019-07-11 08:41:08)
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index 6a61a63..c24e3f6 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -10,6 +10,22 @@
>>         model = "Qualcomm Technologies, Inc. IPQ8074";
>>         compatible = "qcom,ipq8074";
>> 
>> +       reserved-memory {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               smem_region:smem@4ab00000 {
> 
> Put a space between the colon and the node name. Also, just call it
> memory@4ab00000.

  ok, will fix.
> 
> 		smem_region: memory@4ab00000 {
> 
>> +                       no-map;
>> +                       reg = <0x0 0x4ab00000 0x0 0x00100000>;
>> +               };
>> +
>> +               q6_region: q6@4b000000 {
> 
> memory@

  ok, will fix.
> 
>> +                       no-map;
>> +                       reg = <0x0 0x4b000000 0x0 0x05f00000>;
>> +               };
>> +       };
>> +
>>         firmware {
>>                 scm {
>>                         compatible = "qcom,scm-ipq8074", "qcom,scm";
>> @@ -431,6 +447,115 @@
>>                                       "axi_m_sticky";
>>                         status = "disabled";
>>                 };
>> +               apcs: syscon@b111000 {
> 
> Add a newline between nodes please.

  ok, will fix.
> 
>> +                       compatible = "syscon";
>> +                       reg = <0x0B111000 0x1000>;
>> +               };
>> +
>> +               wcss: smp2p-wcss {
> 
> This node should be outside the soc node because it doesn't have a reg
> property

  ok, will fix.
> 
>> +                       compatible = "qcom,smp2p";
>> +                       qcom,smem = <435>, <428>;
>> +
>> +                       interrupt-parent = <&intc>;
>> +                       interrupts = <0 322 1>;
>> +
>> +                       qcom,ipc = <&apcs 8 9>;
>> +
>> +                       qcom,local-pid = <0>;
>> +                       qcom,remote-pid = <1>;
>> +
>> +                       wcss_smp2p_out: master-kernel {
>> +                               qcom,entry-name = "master-kernel";
>> +                               qcom,smp2p-feature-ssr-ack;
>> +                               #qcom,smem-state-cells = <1>;
>> +                       };
>> +
>> +                       wcss_smp2p_in: slave-kernel {
>> +                               qcom,entry-name = "slave-kernel";
>> +
>> +                               interrupt-controller;
>> +                               #interrupt-cells = <2>;
>> +                       };
>> +               };
>> +
>> +               tcsr_q6_block: syscon@1945000 {
> 
> Do you really need _block in these aliases?

  ok, will fix it to "tcsr_q6"
> 
>> +                       compatible = "syscon";
>> +                       reg = <0x1945000 0xE000>;
>> +               };
>> +
>> +               tcsr_mutex_block: syscon@193d000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x1905000 0x8000>;
>> +               };
>> +
>> +               tcsr_mutex: hwlock@193d000 {
>> +                       compatible = "qcom,tcsr-mutex";
>> +                       syscon = <&tcsr_mutex_block 0 0x80>;
>> +                       #hwlock-cells = <1>;
>> +               };
>> +
>> +               smem: qcom,smem@4AB00000 {
> 
> lowercase please. And just 'smem' I guess.

  ok, will fix.
> 
>> +                       compatible = "qcom,smem";
>> +                       memory-region = <&smem_region>;
>> +                       hwlocks = <&tcsr_mutex 0>;
>> +               };
>> +
>> +               apcs_glb: mailbox@b111000 {
>> +                       compatible = "qcom,ipq8074-apcs-apps-global";
>> +                       reg = <0xb111000 0x1000>;
> 
> These addresses should be padded out to 8 digits for the address part
> (not the size).

  ok, will fix.
> 
>> +
>> +                       #mbox-cells = <1>;
>> +               };
>> +
>> +               q6v5_wcss: q6v5_wcss@CD00000 {
> 
> lowercase.

  ok, will fix.
> 
>> +                       compatible = "qcom,ipq8074-wcss-pil";
>> +                       reg = <0xCD00000 0x4040>,
>> +                             <0x4AB000 0x20>;

Regards,
  Gokul
