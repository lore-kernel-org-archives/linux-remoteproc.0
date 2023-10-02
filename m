Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E6BE743C3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 15:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbjJBPzY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237798AbjJBPzX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 11:55:23 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126EEAC
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Oct 2023 08:55:20 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-279150bad13so3405951a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Oct 2023 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696262119; x=1696866919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TliF0IcnDDut/Hmb+cIXBD25FLUVIAU119XJHwJn24=;
        b=aSk+truUmK9dCaJzjsvYyPA2p1ASVSTCsDEfVAJHr8cdyzmO56NRyGBVPcjJ8lMcx7
         Tb4x9zhQaz90Zw9OKBXT/WG8PxEKBcglB2xas/b0ICNvb8pcTWx1YI1HI6ctV306ORzi
         LzxAy8XMwSc5M+YCo+zsvW8X9yK0MOaEQVGhquH64LGSwV+bPiLWjYui8s6QqQcb/W6m
         9eFxuUWuoYoMGklDigaIJGI6paQaOrMKRGqcVVzNM0HMsxuqQTHFCJN9van7jwLaJOM3
         zNJEYiluxg4v5/MMQ6F8Ia5lyBnImCutEPgCyjZ9hgk0etCc9SsyWGCoG75ppIx2ZsDv
         skRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262119; x=1696866919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TliF0IcnDDut/Hmb+cIXBD25FLUVIAU119XJHwJn24=;
        b=VoY1wmEv9iwjmQM/ngR9+WAG1CvAornmXi4CNGq0vSUnkvk3FwAcTrhnqkUc0qI2Lt
         7MUwgcHfL6eyS6XwC3lLn0AmxJAPhpcLGt/gB0Qb4V5WESysuQATJlFe65drUxPS1o02
         rvs4ErodlrPv+lGDOBJbVhBeBwqgq9n2j1CEC5Y8mPyADMRuTWIWZr2ZWFCJFaUBgC7J
         rpPAd8Ud+mkiDFPWngIHAA6+2Dr0tqcZgu+RsjAfYQR1p/GS9XYeUCfgpqYXo6fX+NM2
         djBhmG30px92KbIbVICMM+quLyucYhM3UkmIgNOYbmSTMFGQd0k4OIGJQ/bzL3rk6NTS
         7NOA==
X-Gm-Message-State: AOJu0Yw7Vtngd1+W/8qQAC3uTl8MbOdVB3YCWYr3iqQLLj9YDaKSpLcE
        ELrzPMkA/FzNWnvjHoNP1wnm6Q==
X-Google-Smtp-Source: AGHT+IGokh6jvr3Bmxk6tUGV+zrXHR9d1b+yagVVS76bh5D/AqXdhn98ZRv039FQnPEyA/a7vnzfdg==
X-Received: by 2002:a17:90a:e409:b0:268:ca76:64a with SMTP id hv9-20020a17090ae40900b00268ca76064amr5335954pjb.49.1696262119332;
        Mon, 02 Oct 2023 08:55:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fa62:edba:ab23:c762])
        by smtp.gmail.com with ESMTPSA id ch23-20020a17090af41700b002790423f66fsm6465259pjb.26.2023.10.02.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:55:18 -0700 (PDT)
Date:   Mon, 2 Oct 2023 09:55:16 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] dts: zynqmp: add properties for TCM in remoteproc
Message-ID: <ZRrn5Gj1qvKMBNmx@p14s>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-3-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928155900.3987103-3-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> Add properties as per new bindings in zynqmp remoteproc node
> to represent TCM address and size. This patch configures
> RPU in split mode and adds TCM information accordingly.
>

Why is this changed from lockstep to split mode?  What about all the people out
there that are expecting a lockstep mode?

> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index b61fc99cd911..01e12894c88e 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -247,19 +247,35 @@ fpga_full: fpga-full {
>  		ranges;
>  	};
>  
> -	remoteproc {
> +	remoteproc@ffe00000 {
>  		compatible = "xlnx,zynqmp-r5fss";
> -		xlnx,cluster-mode = <1>;
> +		xlnx,cluster-mode = <0>;
>  
> -		r5f-0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> +			 <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> +			 <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> +			 <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> +
> +		r5f@0 {
>  			compatible = "xlnx,zynqmp-r5f";
> -			power-domains = <&zynqmp_firmware PD_RPU_0>;
> +			reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> +			reg-names = "atcm", "btcm";
> +			power-domains = <&zynqmp_firmware PD_RPU_0>,
> +					<&zynqmp_firmware PD_R5_0_ATCM>,
> +					<&zynqmp_firmware PD_R5_0_BTCM>;
>  			memory-region = <&rproc_0_fw_image>;
>  		};
>  
> -		r5f-1 {
> +		r5f@1 {
>  			compatible = "xlnx,zynqmp-r5f";
> -			power-domains = <&zynqmp_firmware PD_RPU_1>;
> +			reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> +			reg-names = "atcm", "btcm";
> +			power-domains = <&zynqmp_firmware PD_RPU_1>,
> +					<&zynqmp_firmware PD_R5_1_ATCM>,
> +					<&zynqmp_firmware PD_R5_1_BTCM>;
>  			memory-region = <&rproc_1_fw_image>;
>  		};
>  	};
> -- 
> 2.25.1
> 
