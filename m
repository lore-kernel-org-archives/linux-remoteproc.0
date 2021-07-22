Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE0AC6377D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Jul 2021 17:34:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C18261285
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Jul 2021 17:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhGVQxs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Jul 2021 12:53:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34140 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhGVQxq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Jul 2021 12:53:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626975261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cJDgVCs2rvIlKUPXYolN/oe1dY90L5GjxrP/lVY81IQ=;
 b=ENu++hepYWHLuPlXjVglOG4QtQLRTbsEmtB3+LX8GR720XGnYJF3ZPcGNWK4/QKBN8463GVs
 lyAVyP/WjxaElMbReCH04+h5s2tXnp9tXtPsKS8nadMuYGgZHn+6zqeRb7Ht5A9o4AxSHOU7
 4fLwRC+Y+AdpN7owLWHs1B+v1mk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60f9ac0b96a66e66b2f1b17e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 17:34:03
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDE6DC43217; Thu, 22 Jul 2021 17:34:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2129FC4338A;
        Thu, 22 Jul 2021 17:34:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Jul 2021 23:04:01 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
In-Reply-To: <CAE-0n51UbfpM94aOkdnSH9ZAvz-+V1X-hsOSMbkHJQDkYyD22w@mail.gmail.com>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
 <1626775980-28637-11-git-send-email-sibis@codeaurora.org>
 <CAE-0n53bRGouiycpcukPYB_+Gyz_Dr=rCAnb2MH64=+Q899aOA@mail.gmail.com>
 <a021012616af266905099e0563d0fff5@codeaurora.org>
 <CAE-0n51UbfpM94aOkdnSH9ZAvz-+V1X-hsOSMbkHJQDkYyD22w@mail.gmail.com>
Message-ID: <2be424e6cc16e004ba64c5574cf607b9@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-07-22 04:23, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-07-21 10:16:14)
>> On 2021-07-21 11:17, Stephen Boyd wrote:
>> > Quoting Sibi Sankar (2021-07-20 03:13:00)
>> >
>> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> index 56ea172f641f..6d3687744440 100644
>> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> @@ -586,7 +586,8 @@
>> >>
>> >>                 remoteproc_mpss: remoteproc@4080000 {
>> >>                         compatible = "qcom,sc7280-mpss-pas";
>> >> -                       reg = <0 0x04080000 0 0x10000>;
>> >> +                       reg = <0 0x04080000 0 0x10000>, <0 0x04180000
>> >> 0 0x48>;
>> >> +                       reg-names = "qdsp6", "rmb";
>> >>
>> >>                         interrupts-extended = <&intc GIC_SPI 264
>> >> IRQ_TYPE_EDGE_RISING>,
>> >>                                               <&modem_smp2p_in 0
>> >> IRQ_TYPE_EDGE_RISING>,
>> >> @@ -597,8 +598,11 @@
>> >>                         interrupt-names = "wdog", "fatal", "ready",
>> >> "handover",
>> >>                                           "stop-ack", "shutdown-ack";
>> >>
>> >> -                       clocks = <&rpmhcc RPMH_CXO_CLK>;
>> >> -                       clock-names = "xo";
>> >> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>> >> +                                <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
>> >> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
>> >> +                                <&rpmhcc RPMH_CXO_CLK>;
>> >> +                       clock-names = "iface", "offline", "snoc_axi",
>> >> "xo";
>> >>
>> >>                         power-domains = <&rpmhpd SC7280_CX>,
>> >>                                         <&rpmhpd SC7280_MSS>;
>> >> @@ -611,6 +615,15 @@
>> >>                         qcom,smem-states = <&modem_smp2p_out 0>;
>> >>                         qcom,smem-state-names = "stop";
>> >>
>> >> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
>> >> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
>> >> +                       reset-names = "mss_restart", "pdc_reset";
>> >> +
>> >> +                       qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000
>> >> 0x28000 0x33000>;
>> >> +                       qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
>> >> +                                        &tcsr_mutex 0x26004 0x26008>;
>> >> +                       qcom,qaccept-regs = <&tcsr_mutex 0x23030
>> >> 0x23040 0x23020>;
>> >> +
>> >>                         status = "disabled";
>> >>
>> >>                         glink-edge {
>> >
>> > Any reason to not combine this stuff with the previous patch?
>> 
>> I split it into two separate
>> patches just to show that sc7280
>> supports two ways of bringing
>> modem out of reset and method
>> used is determined by the platform.
>> 
> 
> Ok. But if there are two methods do they work with the same node in
> sc7280.dtsi? Because I was expecting to see the node introduced in the
> SoC dtsi file in the final form instead of the half form and then be
> amended in this patch.

Board files enables the mss node
and overloads the compatible depending
on the platform it is expected to
run on. So pretty much the same
node with just changing the compatible
and few additional properties support
both methods. Patch 9 is complete in
itself i.e. it is compliant with
the pas yaml, while patch 10 adds
the bits required to make alternate
method work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
