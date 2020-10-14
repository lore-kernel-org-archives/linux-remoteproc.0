Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4DFC43457
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 16:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 809112222A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 16:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpXfutAz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389046AbgJNQvZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 12:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388677AbgJNQvZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 12:51:25 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28059C061755
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2020 09:51:25 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f5so10520pgb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2020 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0oKd/1+Q49pwBEic+j1QGYF+5cG+STAkikN4kllIFis=;
        b=WpXfutAzKSb8AwlyKEbbrghfkcSB7k9AL+h07lEQEaZh1JMnxbsOzfEdql8BJsw0AK
         zAY4oNLRQ46zuvgRYLjmZaA7DY2JdcJWwAuSgMq/VGmX2baResgV4wYE40yUGQhepKBL
         gHIG87e6uDjv5VK46UVTRf8gwbs36NnMz3LDJuiL2NcN06VktehgQQRD73/rYb2/2Bp9
         T3qhJKZr1bE5ms4+5reFbCR+JUrkCvxZp/l2+Tgng8uS0eqBG8wGl/L4evH4UH5CfpP0
         quIjd6v8H9E2pzXFV+72SC+wtwBguzysisyXSZF1AehfVB8BhZgt+ZeY2eZu8eZF82t4
         oebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0oKd/1+Q49pwBEic+j1QGYF+5cG+STAkikN4kllIFis=;
        b=C5fNAbEOKs2+NZDSI1wyO6Kmy25v41Ho9cA7tlncIhGJH3E+kdBhHT7C9ZvLnnqInb
         fSsCR+l1KUQifVkz3oQj97Ct7padujstY5MkX5EpNAzx+7zMwjhHepabU18QJ65eK7fN
         l7A30gWf3W1bNoYjA56NqUmUrxdv6upfqU/nwsf7nyOkoXV3YzgfHNHO0rIIsIEsMLA0
         VEEXZZfcT5eIfMrL0hfioSpGu803IQVfBaXBb1SX1xFosvLEbEBmiwB0GHvrMpxA8lSl
         3MNXWFNTvE/K7acYKpGaLdXSs0W2ejf/nYQ3wqIB8KCeBmEJiSRXtri6WWNw/TKbjL50
         tGZg==
X-Gm-Message-State: AOAM533OdK/2nFWLmnNN6pBcVPpwYPj7UKfnZk8UMFwLSr880+jKkRnW
        szw3w2enoNhJ7WNbd0WwPpdjWQ==
X-Google-Smtp-Source: ABdhPJyF+kMGcVCJWKBQTvA0HeUTDn2r3CiRgsDWATdxaTcjHEJZMUafV6IesWwPvzCk/d3d5GUc8A==
X-Received: by 2002:a62:6507:0:b029:155:3b11:b458 with SMTP id z7-20020a6265070000b02901553b11b458mr216999pfb.45.1602694284480;
        Wed, 14 Oct 2020 09:51:24 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j1sm94318pfj.202.2020.10.14.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 09:51:23 -0700 (PDT)
Date:   Wed, 14 Oct 2020 10:51:21 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2 4/4] ARM: dts: stm32: update stm32mp151 for remote
 proc synchronization support
Message-ID: <20201014165121.GA1406857@xps15>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
 <20201014125441.2457-5-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-5-arnaud.pouliquen@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Oct 14, 2020 at 02:54:41PM +0200, Arnaud Pouliquen wrote:
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
>  		/*
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
> @@ -1717,6 +1722,8 @@
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			status = "disabled";
>  		};
>  	};
> -- 
> 2.17.1
> 
