Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F25C43217
	for <linux-remoteproc@archiver.kernel.org>; Mon, 29 Nov 2021 22:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhK2Wz2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbhK2WzD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 29 Nov 2021 17:55:03 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB29C0D8CBB
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Nov 2021 09:58:08 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y8so12812907plg.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Nov 2021 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6It/2ISLAKNQvBJXXzqk/ndWM40f+A12E22VByGFlnU=;
        b=nS106YFkM5gyIjOZPhOPz+p3/cnoYYOu/pEivIUr7GVRtzvr79cA+8LlgyvqQrxQBR
         6/AUIbJ9XiR7PS1xvUppMN+pCMv8R5PxCiqTu9EjBxSRnf8Ok6SAqadwlDYDBvQck5iX
         7wGthJYcGJUje1/BCQTbq0DH8KsgFUMQoypvjV/8LLLwe88GtyYFc+3JUIS5pmn1QbZK
         g450IqHzeGCBU+jnw0m8KUdo42rPPRDWTys4sIc1V+Vh5OoWcmzOj2he72xYyZ4AvZIs
         LNKcKgkgRn/ANJ8xYfs+avMeMkVZY7rAdqZTe0nXyPUDH5XFM3KbT2ypeaOvifjjKWIG
         VaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6It/2ISLAKNQvBJXXzqk/ndWM40f+A12E22VByGFlnU=;
        b=MzNUZE09jjIIy5bOM+NEPI/MjFLc3jVqNfXMF+XRWpNN/BYCWmjShagRqxeEKtJMzT
         epMzghXHLLzt2Z74yEsJwDqq9T6J+kyW/AWApLRzu5n4p6MK92hUdlPzoUgfeIbluW4K
         7NbA23YfmfvJGD7kNRjueHdqH+23TaqYHMOE5TU7lYSxWLo5iOrTOzjqM79gqDp7kedi
         w1jvGjN9h/Y9Venf6hI7W3EJxBMV9zmX5ymQa48R2cD1ilwo355098w9ybAWC4C5Sftg
         l8gSp97tGN7myyxFnBOVhD7zzGqhiskuN7XynAweVSXWXd14Vc9jjUIGdGh9aGHE6cxf
         fiMA==
X-Gm-Message-State: AOAM532Qt117yAWKnbBIeO09lKK8Qg2PDBKbpqc9UMKvC/mpddi4VjtE
        MwvPtL5/9m+JnHRcgRUVyq3QsQ==
X-Google-Smtp-Source: ABdhPJyZ+fcPwBQDF8IlB1PBWVERDgsdIyQ/faAUOYEpDKk7V6N92iyUvf7cg5TEkO19F/fZSn61Pg==
X-Received: by 2002:a17:902:d28a:b0:142:61ce:ae4c with SMTP id t10-20020a170902d28a00b0014261ceae4cmr61362408plc.35.1638208687947;
        Mon, 29 Nov 2021 09:58:07 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n71sm18032644pfd.50.2021.11.29.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 09:58:06 -0800 (PST)
Date:   Mon, 29 Nov 2021 10:58:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@xilinx.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] arm64: dts: xilinx: zynqmp: Add RPU subsystem
 device node
Message-ID: <20211129175803.GB676889@p14s>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
 <20211123062050.1442712-3-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123062050.1442712-3-tanmay.shah@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 22, 2021 at 10:20:46PM -0800, Tanmay Shah wrote:
> RPU subsystem can be configured in cluster-mode or split mode.
> Also each r5 core has separate power domains.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 28dccb891a53..f4fb98ccb1b5 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -654,6 +654,23 @@ qspi: spi@ff0f0000 {
>  			power-domains = <&zynqmp_firmware PD_QSPI>;
>  		};
>  
> +		r5fss: r5fss@ff9a0000 {
> +			compatible = "xlnx,zynqmp-r5fss";
> +			xlnx,cluster-mode = <1>;
> +
> +                        reg = <0x0 0Xff9a0000 0x0 0x228>;

This line is giving me an obvious checkpatch warning.  Please make sure you run
checkpatch.pl before sending out a patchset.

> +
> +			r5f_core0: r5f-0 {
> +				compatible = "xlnx,zynqmp-r5f";
> +				power-domains = <&zynqmp_firmware PD_RPU_0>;
> +			};
> +
> +			r5f_core1: r5f-1 {
> +				compatible = "xlnx,zynqmp-r5f";
> +				power-domains = <&zynqmp_firmware PD_RPU_1>;
> +			};
> +		};
> +
>  		psgtr: phy@fd400000 {
>  			compatible = "xlnx,zynqmp-psgtr-v1.1";
>  			status = "disabled";
> -- 
> 2.25.1
> 
