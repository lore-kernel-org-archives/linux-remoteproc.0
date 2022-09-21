Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAECC6FA8B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 08:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiIUIgB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 04:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbiIUIf7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 04:35:59 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1434C82D3E
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 01:35:57 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c7so6041691ljm.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=fCr8MwFtbbcSDSvMf2AcQISoeqvfzG7FR3I7vOSbQlM=;
        b=wAeXEwMmcxP8dYzsCAJu8G0NMnxMRwO60uRgR9N9iiGOFayIzZwDJM2g380S0Lp+MY
         uBXAz4orsz/bBwjRsRDuasi+pYMQSS45VabIyqiQbhXk4nNPLM7qc0IZ4OEg50do/rwj
         iSTIRdX+w1T3dbcWGdI6ZBKWQQgtV2cSf/pR1oSgR6gXVshQ1Ilk8EVUXiDrOki6lRVF
         cIG1nyrqMUSQyO3FxvhbkEk9eU+EI9baXpBk9bpayMn/Qa0gfFJBUU8PHa4AylhVqYRM
         tOZ/yyJcBE7QVXf+0Z92YP9BSBa1BAbZ3j3IBoykz+p5HW0XYjdAws+ZZFbqWmlx6mCw
         xXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fCr8MwFtbbcSDSvMf2AcQISoeqvfzG7FR3I7vOSbQlM=;
        b=v3Q6Xw/Yw24wnbIj36y+ItYgVpHL6FS3lOeRQ3kycv2yAXELF8lgl9EDJnYeNQLvJ0
         yDBH4uzJZxEygiVO98XI6Sli/Rzxsw7+mF6q0HNutjYgSzAUqyjfLHfKUgm7ZJe6xGGs
         oXCGmb44I5u90c59VcE8lojOSlGdpnj1GXyeD8A1s3FAHbvFq+SMSLc/WokId/6qyPG5
         7KRbm2evl5EVLLHcFds3p+2YDHV+ptRj2ns309UV0+SJph+4/ZFeL7J4wk+/y1h9+wJD
         vdlDzmUhV0gLv7nOc9F00XmULJnZhPuJw8JYxCqbPt5kHvfV7kJ4LWCjLJSfcr2xZV3F
         3atg==
X-Gm-Message-State: ACrzQf1hh1D7PxJHLn5FuClDTy9xkFvKVmx0hCrL64k/XYAWH7Tcd+I/
        alfm40Yrb2SAeyRpk3tm/S1fc0xM0/INjA==
X-Google-Smtp-Source: AMsMyM5cQD2qKn16V2w8tpEVl6X83BD1sDdLGMgpXAhpSINiKNmYTE9cE/g9dYyZGiHAZHwKsIHvww==
X-Received: by 2002:a2e:998b:0:b0:26c:4ef4:e4d7 with SMTP id w11-20020a2e998b000000b0026c4ef4e4d7mr4958579lji.42.1663749356227;
        Wed, 21 Sep 2022 01:35:56 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w11-20020a0565120b0b00b00498fd423cc3sm326358lfu.295.2022.09.21.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:35:55 -0700 (PDT)
Date:   Wed, 21 Sep 2022 10:35:54 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: remoteproc: qcom: wcnss: Add
 compatible for pronto v3
Message-ID: <20220921083554.3zs7xdj6n3pv7zdq@krzk-bin>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-5-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220921043648.2152725-5-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 21 Sep 2022 10:06:48 +0530, Sireesh Kodali wrote:
> The pronto v3 remoteproc is similar to pronto v2. It is found on the
> MSM8953 platform, which is used by SDM450, SDM625, SDM626, APQ8053 and
> other SoCs. Since the configuration is same on all SoCs, a single
> compatible is used.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


remoteproc@fb21b000: 'power-domain-names' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb

remoteproc@fb21b000: 'power-domains' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
