Return-Path: <SRS0=drqN=DB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9B8C4346E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 05:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54BE223741
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 05:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgIXFpT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Sep 2020 01:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIXFpS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Sep 2020 01:45:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB783C0613CE
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2020 22:45:18 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kLK49-00052U-RW; Thu, 24 Sep 2020 07:45:13 +0200
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: update stm32mp151 for
 remote proc synchronisation support
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-4-arnaud.pouliquen@st.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
Date:   Thu, 24 Sep 2020 07:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200827072101.26588-4-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Arnaud,

On 8/27/20 9:21 AM, Arnaud Pouliquen wrote:
> Two backup registers are used to store the Cortex-M4 state and the resource
> table address.
> Declare the tamp node and add associated properties in m4_rproc node
> to allow Linux to attach to a firmware loaded by the first boot stages.
> 
> Associated driver implementation is available in commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..842ecffae73a 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1541,6 +1541,11 @@
>  			status = "disabled";
>  		};
>  
> +		tamp: tamp@5c00a000 {
> +			compatible = "st,stm32-tamp", "syscon";
> +			reg = <0x5c00a000 0x400>;
> +		};
> +

Just saw this now. I have a pending patch adding this node as well:
https://lore.kernel.org/patchwork/patch/1306971/

For my use case, I need a "simple-mfd" compatible to allow child
nodes to be probed.

Could you CC me when you send out your v2, so I can rebase?
(Or if you don't mind, just add the "simple-mfd" into the compatible
list yourself :-)

Cheers
Ahmad

>  		/*
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
> @@ -1717,6 +1722,8 @@
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>  			status = "disabled";
>  		};
>  	};
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
