Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55A1CCA479
	for <linux-remoteproc@archiver.kernel.org>; Sun, 17 Jul 2022 03:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbiGQDEs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiGQDEr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Jul 2022 23:04:47 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FC814015
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10c8e8d973eso15629239fac.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpo48E8sj1DuK2c49zytJWXoQg4RRXwX3plQ016SBF8=;
        b=L2c0lxLjMSR6pXr9J9CN5mx5OC2RgUZPavMO5F4XMyTvpRrXKi3dTpKE0/VFJ5mjLK
         OlPeIzxqCRGZoY+k5BLWPKfQuLCJRAFt/jk6gRH9dMeTKsAlBO1DNyf6mjf/XKp2F/gL
         qOPmsTNpPX5OA3bJ42ifPEFBgBMoEtI/vmSkRoDi8oDfvIgzDTbVMeelPwloVkKXJ+hp
         yr7O8pw+v7hbJkDxJwmwtECOnw+wHRhqXjzRGrTx6dKS0GeOSHf8hZssQJYpien5n6H5
         8aa03hDMjRZYKKQR5MQiY70TSvUdb5mqMLjxYCOKwBqkypbAERhwnE0wcC/bB7/pYKs4
         QAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpo48E8sj1DuK2c49zytJWXoQg4RRXwX3plQ016SBF8=;
        b=vw91CfsNvs25Tqr72+FB7x03PkkkuGXnXoLVGBuW1OZziZrhOK8mT7iwOoW7v/ECve
         BJ3YRICLk78XxLmWNx3TptTtGTdwPCXsklZW00WdtUm8liOt3Fny6B7WuePh4+nZMOug
         +fFQJNFxE1LNGjcrJBE1dbv11nJnYc4Mv78Pp9jtZLD0W+Oil5R37uktMr9MU2tZkmGf
         LQmWqJaRaTWJeJyvP4AFSl8mPZdm1L5fOQ8iJLohRnwHVd70KRXi7Ew1WW8OMGJdvKS1
         +iRAX1SB+qvAIsdYIpoFvaLEmM4i1YB2fvit+nf8dTpiLk4yFIE0wE7W5Kc/Bz79ZJWP
         W7kg==
X-Gm-Message-State: AJIora+9t3kSdIT5NdVigQOCq0XaUsHi4kRCu3da1gyO1GxRapijCu1T
        mSkhrhvb9Iv9AKf2I33XL2zeQg==
X-Google-Smtp-Source: AGRyM1vi7sSPETLwZXXm4NqV9z9s8VsFaKMm3xfvdQshZauQuoyl2sneX/Yol14OfG8iVaLDvZbpPA==
X-Received: by 2002:a05:6870:b40c:b0:10b:8a3c:b13d with SMTP id x12-20020a056870b40c00b0010b8a3cb13dmr11838436oap.108.1658027082070;
        Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k20-20020a056870571400b0010c275b6376sm4479708oap.38.2022.07.16.20.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:04:41 -0700 (PDT)
Date:   Sat, 16 Jul 2022 22:04:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: add missing hwlock for ipq8064
 dtsi
Message-ID: <YtN8R1eRTccJ+dUn@builder.lan>
References: <20220707102040.1859-1-ansuelsmth@gmail.com>
 <20220707102040.1859-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707102040.1859-2-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 07 Jul 05:20 CDT 2022, Christian Marangi wrote:

> Add missing hwlock for ipq8064 dtsi provided by qcom,sfpb-mutex.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 4b475d98343c..cd1b43e2cab4 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -1224,4 +1224,11 @@ sdcc3: mmc@12180000 {
>  			};
>  		};
>  	};
> +
> +	sfpb_mutex: hwlock@1200600 {

This is an mmio device, so it should live under /soc, so I moved it
there while applying the patch.


But it would be nice if this file followed others and kept all nodes
sorted by address (or name if they don't have an address). Also if
addresses were padded to 8 digits, to make sorting easier.

I would much appreciate if you could find the time to prepare such a
patch.

Thank you,
Bjorn

> +		compatible = "qcom,sfpb-mutex";
> +		reg = <0x01200600 0x100>;
> +
> +		#hwlock-cells = <1>;
> +	};
>  };
> -- 
> 2.36.1
> 
