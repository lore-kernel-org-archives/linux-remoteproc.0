Return-Path: <SRS0=In/V=A3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58C0C433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Jul 2020 02:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADCA82076C
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Jul 2020 02:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDC9WRFS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgGPC7o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Jul 2020 22:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgGPC7n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Jul 2020 22:59:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29E1C061755
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 19:59:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g67so4112114pgc.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 19:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LuoIleQ9Ji/xAYuJDXT6Z6dO3ZLl5ioORiaja/lMqvU=;
        b=yDC9WRFS8c2b76sobDkpCegCdn3qmN6PPKK4I3OvnoOO/1z9MLPmZRkplla4Eg/ukz
         1yjsgCBhx+fRw0LuToGQnO47Bl+60XCpT96Y0dXbMit9EC6ZdCMqRa6JraA+u7TbAW17
         euvBlP7GfXe6acQFG64G5x6qEgGoJBqWFEiHSaCnX/VsxbRMG4tS8yt8TyP+Xu+XFWc8
         s8IvNYvyMn1Ggs7e9HxoGYCErU0nRsm5i2C2E8eXWFut8qs1G363dUt0dmSIwNP+F2WZ
         pvtlrtM37l/jWHo+7dFbDMGm8W4A4TFN8bSz8LBagKLRQNt3tcBsj0Q/osGEd8IH85lN
         GHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LuoIleQ9Ji/xAYuJDXT6Z6dO3ZLl5ioORiaja/lMqvU=;
        b=aQdChW7zcd91hEU+kYmaGFTrucRzRgB34LtaeSTwNldbfWu/EwCHiBvpsxHLMhei+x
         e0msR76YnNWfXXw+Ak6e7aHx9Y5HNo5TGS+/KxYTL0XxMnnLfCFXICk37sEWW5pJ4geH
         S+SDQH5V+bVY/xlBdX6wORq7B1V9jfBfXGWJmKHCyNMJoLAuYHRHG5JwhoqLMud2fWa9
         0WELk/Ue1HgfAjcSu4rSza5zzq33ZhF+BDyNfE/Jna9FZDcbppceX+H5QGEQUypVmDQq
         MTeSdfRBy0RbwhEd0GGew4JSMJg+h/i1tJz4U6Fpu+CTCedNruO09JgWkX4Ukxn/th0I
         uLlA==
X-Gm-Message-State: AOAM532mnTZQRD8rOp4BWS0qP4+8wF1qdnlmcyTkUgO8QaPYVeC3q5Y3
        cy0QG29LqCPhEH0lNRDfAsaC
X-Google-Smtp-Source: ABdhPJzWhG+hWqD5f/hYQ2NvZiC3lvnRQfSCnWdqN4YpElhXZ2qpZ/W6KhstotDJpZvgzwohyXYNxw==
X-Received: by 2002:a62:8688:: with SMTP id x130mr1902048pfd.280.1594868383282;
        Wed, 15 Jul 2020 19:59:43 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d89:fed1:9157:c271:c363:4849])
        by smtp.gmail.com with ESMTPSA id h3sm3217799pjz.23.2020.07.15.19.59.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 19:59:42 -0700 (PDT)
Date:   Thu, 16 Jul 2020 08:29:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
Message-ID: <20200716025932.GA3271@Mani-XPS-13-9360>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075956.171058-5-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 22, 2020 at 12:59:56AM -0700, Bjorn Andersson wrote:
> Now that we don't need the intermediate syscon to represent the TCSR
> mutexes, update the dts to describe the TCSR mutex directly under /soc.
> 
> The change also fixes the sort order of the nodes.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> Changs since v1:
> - Adjusted sort order of the nodes
> 
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7050adba7995..67a1b6f3301b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -144,12 +144,6 @@ scm: scm {
>  		};
>  	};
>  
> -	tcsr_mutex: hwlock {
> -		compatible = "qcom,tcsr-mutex";
> -		syscon = <&tcsr_mutex_regs 0 0x1000>;
> -		#hwlock-cells = <1>;
> -	};
> -
>  	memory@80000000 {
>  		device_type = "memory";
>  		/* We expect the bootloader to fill in the size */
> @@ -376,6 +370,12 @@ ufs_mem_phy_lanes: lanes@1d87400 {
>  			};
>  		};
>  
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
>  		intc: interrupt-controller@17a00000 {
>  			compatible = "arm,gic-v3";
>  			#interrupt-cells = <3>;
> @@ -486,11 +486,6 @@ rpmhpd_opp_turbo_l1: opp10 {
>  			};
>  		};
>  
> -		tcsr_mutex_regs: syscon@1f40000 {
> -			compatible = "syscon";
> -			reg = <0x0 0x01f40000 0x0 0x40000>;
> -		};
> -
>  		timer@17c20000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> -- 
> 2.26.2
> 
