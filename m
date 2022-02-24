Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE8AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Feb 2022 19:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbiBXUAM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Feb 2022 15:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiBXUAM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Feb 2022 15:00:12 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BC62763FA
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Feb 2022 11:59:41 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id z7so4617882oid.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Feb 2022 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HBUQkf1c18D3IhqFKKwGMruvkg+pP4vMasYemb3Ge/g=;
        b=cPb4xYwq2xRZS+pSueX4DQu6ZCDCLqP2zEW/h7owqO6uHVQvOrk1zoIh8Q1RdX66Qh
         UhdMCHKoc+l6RL0gUHi2lJybdQa0+l+lOLGjDnsAT5lHaP+4HBKT1rlAzaGhHG4Z2ghY
         TxnimbdvqiPMQABvzhR7jfiurKiOHqdg6HGzGpzfzTXyjPd1x1INf91bmhVlq8uCMp3K
         LIxxahS79FRl4FMaUlNBEsgXQgq9fRfD4RhET4p6G1xG0tPxUxsRY4bgxnOoNE7aNzuC
         18damqu6g9V8qVAkTVXzRO8LJfvD77VHUTqgCFd2mDt0R7UtU9F6YDh4t7uDieeiWIH6
         3pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HBUQkf1c18D3IhqFKKwGMruvkg+pP4vMasYemb3Ge/g=;
        b=pD2BdnLFIG0CcERolYmIdIV92t1rhIJZRb35STAeYvHx/zpDJaJ/iRT4d9QLE+HF1U
         zw1UUKt+657uWIj9LEyGMI8NU0u5KLeyl4Ii+NkbpUN6LZVAScp/d7cENJ9nVM9oEJzH
         APYhbPfXmiqSJ+eoa1VLahG/gzTQOPSvaU89aCZ41QJs1m9uTCjIZxZqHC/Isj1m3huF
         LI1hikj2glioRW3cL9Ge1Ou4We8OgoQU6IVcaTIVUGKsOfZG37L4c+5BpQDmc+5DF95m
         xggrBRN5pscY+rk3vbPV9mUngEc0iMIVr9vZRk0hwWMxflmc41XTbh4IC+RBuYrnDAXk
         5ISg==
X-Gm-Message-State: AOAM532Acw9IpXIZk4ygh/nk6z3huG9V2MQkR8QF5i2358Feg7hpcLXW
        VdjXd7Cuxbi1Xk6WWcokxsLCng==
X-Google-Smtp-Source: ABdhPJygt08vCBVo/UgfpVMiox5duayX+DsGCbmNeAge1yQH/WLLoKbK6XrUt+uABY6Q/U/7ApF/Uw==
X-Received: by 2002:a05:6808:56b:b0:2d4:5f04:f2fa with SMTP id j11-20020a056808056b00b002d45f04f2famr8135225oig.96.1645732781147;
        Thu, 24 Feb 2022 11:59:41 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bf39-20020a056808192700b002d51f615f1csm235794oib.34.2022.02.24.11.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 11:59:40 -0800 (PST)
Date:   Thu, 24 Feb 2022 13:59:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     robh+dt@kernel.org, ohad@wizery.com, agross@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org, mka@chromium.org,
        krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
Message-ID: <YhfjqsrHhbU36OqH@builder.lan>
References: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
 <1644813252-12897-4-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644813252-12897-4-git-send-email-quic_sibis@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun 13 Feb 22:34 CST 2022, Sibi Sankar wrote:

> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
> 

Looked at this again, and it makes me wonder why do we need to vote on
the path LLCC -> EBI1 and why do we call that path "imem"?

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 9f4a9c263c35..1969f4cf59fe 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -89,6 +89,8 @@
>  	compatible = "qcom,sc7280-mss-pil";
>  	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
>  	memory-region = <&mba_mem>, <&mpss_mem>;
> +	interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
> +	interconnect-names = "imem";
>  };
>  
>  /* Increase the size from 2.5MB to 8MB */
> -- 
> 2.7.4
> 
