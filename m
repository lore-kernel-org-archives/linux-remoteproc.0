Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E11CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83B78610FF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhHEQkB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhHEQkA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 12:40:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812B6C061765
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 09:39:46 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cl16-20020a17090af690b02901782c35c4ccso7129265pjb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7pYOTxFSGlVG5k+ImUegey8RcLkXqCgr668GTeSPHPU=;
        b=Jn/G+UgdcAUA+RNcG+K+xN77o0Vtf7I5+b0PYTCQH54VcojkqRE4m2RX+sNs99Pne5
         DfXYrGLSBjVCQisktLZDkBv418FebTKvxeQhDlFeKL1AKOvkQsalQUuaE3CEa8oGp97C
         kVTnUcEuz7zDLH6PLyAMa9qIpVVbkLL3hy4W9BH3YZeXrRrGZYuKOrhUpIdFpnLy1E31
         KgSrnshbi56salKQxybv1HQYFRkH5rhYntU4Pd1vTfV7jjpeUI60knO/2JinbQd4IbND
         TVXJuGDbOQRXEEyTRKQMlvk85UTNY/xFPzZYtu7kOwLqr7Gz5HwjheTpEOb2+0rcauh4
         jA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7pYOTxFSGlVG5k+ImUegey8RcLkXqCgr668GTeSPHPU=;
        b=PY2ljln8lu/RKgfDhOKxejdLSdn884uzJncGr5/lWJnJN+EGiOEHnPUHP/MqJqT8ld
         cYfj7ZpcD2n7fsywz1Kso37obA4dhBInxK0a5SMkmiY6mxK3enKesKyUXOuA6XDR91fR
         VC81SYFnSKkN7EYMYo5OFFU1t5UJUH7Th2j2LFeYIHHhigyt7MSQNZ9ZD5WQlBumOxlC
         CM9V3Xqu2W9R7we/Ud4bKqV9VJzA6qsqxJYmj4O8iHKp3oMErcdBNHLpVyOQ3W1mSbva
         fTW2aI3fmRX/QQVilfPkEwE8QBICZ3W+a5gSmRd5Y6912qaJ9v/LaT8f98iQe2oBijcy
         jtFw==
X-Gm-Message-State: AOAM531Rx4fC0TOR8mdqpbTPww2oi49p+IagXlYOBknOxYmhi+jNmV/e
        iuquEQjsd3FnmJ0uxwpty+sYKQ==
X-Google-Smtp-Source: ABdhPJxCd4yhk5SyGoctI04Un47NU06NnSRlptmb1cq/6/73OZdxHd02cj7EuShbM5+lMgE//H5Crw==
X-Received: by 2002:a17:90b:21c9:: with SMTP id ll9mr16442150pjb.161.1628181585971;
        Thu, 05 Aug 2021 09:39:45 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x14sm7259129pfa.127.2021.08.05.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:39:45 -0700 (PDT)
Date:   Thu, 5 Aug 2021 10:39:43 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, dongas86@gmail.com,
        peng.fan@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: add remoteproc m4 support
Message-ID: <20210805163943.GE3205691@p14s>
References: <20210805091218.1626290-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805091218.1626290-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Same for this set - I need Peng to add his RB _and_ TB tags to it before I
consider for review.  Also, please start adding cover letters to your patchsets.

Thanks,
Mathieu

On Thu, Aug 05, 2021 at 05:12:17PM +0800, Dong Aisheng wrote:
> Add cm4 remoteproc which supports rpmsg naming service.
> It needs vdevbuffer and a pair of vrings and 16MB reserved memory.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8mq-evk-rpmsg.dts   | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4b4785d86324..687ad9d68a85 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-kontron-pitx-imx8m.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts
> new file mode 100644
> index 000000000000..4a8911087e5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2019-2021 NXP
> + */
> +
> +#include "imx8mq-evk.dts"
> +
> +/ {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		vdev0vring0: vdev0vring0@b8000000 {
> +			reg = <0 0xb8000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@b8008000 {
> +			reg = <0 0xb8008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@b80ff000 {
> +			reg = <0 0xb80ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@b8400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0xb8400000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		remoteproc@80000000 {
> +			reg = <0 0x80000000 0 0x1000000>;
> +			no-map;
> +		};
> +	};
> +
> +	imx8mq-cm4 {
> +		compatible = "fsl,imx8mq-cm4";
> +		clocks = <&clk IMX8MQ_CLK_M4_DIV>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu 0 1
> +			  &mu 1 1
> +			  &mu 3 1>;
> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&rsc_table>;
> +		syscon = <&src>;
> +	};
> +};
> +
> +/*
> + * Below devices are allocated on remoteproc
> + */
> +
> +&i2c2 {
> +	status = "disabled";
> +};
> +
> +&pwm4 {
> +	status = "disabled";
> +};
> +
> +&tmu {
> +	status = "disabled";
> +};
> +
> +&uart2 {
> +	status = "disabled";
> +};
> -- 
> 2.25.1
> 
