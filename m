Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Nov 2019 15:03:50 +0000
From: gokulsri@codeaurora.org
Subject: Re: [PATCH V2 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074
 SoC
In-Reply-To: <20190917161557.164C320665@mail.kernel.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-13-git-send-email-gokulsri@codeaurora.org>
 <20190917161557.164C320665@mail.kernel.org>
Message-ID: <0101016ead63d338-79f23ad8-8186-4f6e-bda4-b078441d55f2-000000@us-west-2.amazonses.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-09-17 21:45, Stephen Boyd wrote:
> Quoting Gokul Sriram Palanisamy (2019-09-13 04:56:11)
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index 6a61a63..0ea026e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -431,6 +485,78 @@
>>                                       "axi_m_sticky";
>>                         status = "disabled";
>>                 };
>> +
>> +               apcs: syscon@b111000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x0b111000 0x1000>;
>> +               };
>> +
>> +               tcsr_q6: syscon@1945000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x01945000 0xe000>;
>> +               };
>> +
>> +               tcsr_mutex_regs: syscon@193d000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x01905000 0x8000>;
>> +               };
>> +
>> +               apcs_glb: mailbox@b111000 {
> 
> This is the same as the syscon above. What's going on?
> 
>> +                       compatible = "qcom,ipq8074-apcs-apps-global";
>> +                       reg = <0x0b111000 0x1000>;
>> +
>> +                       #mbox-cells = <1>;
>> +               };
  Sorry for the delayed response. Will have this addressed and post a v3.

  Regards,
  Gokul
