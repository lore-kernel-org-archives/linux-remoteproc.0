Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DEFC11F66
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC95261477
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhF3UGV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Jun 2021 16:06:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34653 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233806AbhF3UGU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Jun 2021 16:06:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625083431; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rOmYD1RlmJCxXT33HLKcHc4dRlfQwP9N+T82ftSb38E=;
 b=s5GLjWG8WNHrlTk1AhMq6BO5FIoH7kIMKUEdQmwRbkfl/ReS7bb32yOz5tFcWhzQkn1g1LtM
 I7PtqwYv45q5kp6h/K4m9oA1G+73ld9lUuoWzHhFW8JaqdmuXl9mvv8qRh0dn2NhTnSmANte
 G6qD38mVuONvOB/iKd2S/64Ljpw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60dcce142a2a9a97619bb0e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 20:03:32
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DED86C43145; Wed, 30 Jun 2021 20:03:32 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4232C4338A;
        Wed, 30 Jun 2021 20:03:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:33:31 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
In-Reply-To: <YNoXbOIbN/P42ubO@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-9-git-send-email-sibis@codeaurora.org>
 <YNoXbOIbN/P42ubO@google.com>
Message-ID: <256365bbd9cf526a4cc4c1a48b4bd215@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-06-29 00:09, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 01:17:37AM +0530, Sibi Sankar wrote:
>> This patch adds Q6V5 MSS PAS remoteproc node for SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 40 
>> ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 3fb6a6ef39f8..56ea172f641f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -584,6 +584,46 @@
>>  			#power-domain-cells = <1>;
>>  		};
>> 
>> +		remoteproc_mpss: remoteproc@4080000 {
>> +			compatible = "qcom,sc7280-mpss-pas";
>> +			reg = <0 0x04080000 0 0x10000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> 
> looks like this patch/series depends on "Enable miscellaneous hardware
> blocks to boot WPSS"
> (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=475089)
> which is not mentioned.

^^ is already in lnext so didn't mention it.

> 
>> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
>> +					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "wdog", "fatal", "ready", "handover",
>> +					  "stop-ack", "shutdown-ack";
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "xo";
>> +
>> +			power-domains = <&rpmhpd SC7280_CX>,
>> +					<&rpmhpd SC7280_MSS>;
>> +			power-domain-names = "cx", "mss";
>> +
>> +			memory-region = <&mpss_mem>;
>> +
>> +			qcom,qmp = <&aoss_qmp>;
>> +
>> +			qcom,smem-states = <&modem_smp2p_out 0>;
>> +			qcom,smem-state-names = "stop";
>> +
>> +			status = "disabled";
>> +
>> +			glink-edge {
>> +				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
>> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							     IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc IPCC_CLIENT_MPSS
>> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +				label = "modem";
>> +				qcom,remote-pid = <1>;
>> +			};
>> +		};
>> +
>>  		stm@6002000 {
>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>  			reg = <0 0x06002000 0 0x1000>,
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
