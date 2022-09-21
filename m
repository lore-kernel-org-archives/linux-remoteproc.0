Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAA3C32771
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 08:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiIUIgs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 04:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbiIUIgn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 04:36:43 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D3C895F7
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 01:36:28 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a14so6068447ljj.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=339+3mHOy+Q3FCaVFGj+b1oUEup7t5BZOT8tg60/J6w=;
        b=OhxZFifxim9zPK0LacO5Qma5OLzssTw7hyLTZf55g8Yl576rZWbzHHGZxYl+BV8A1R
         759NPU+SYX6JiEt8URE1Cwn9ek9ZIcBUPiCfXRXaj2n5IxnEefy1PGyKOjKqnrRJsqDN
         Ki0oLjXgixi3nHfOSJXVIrBEvXbNkpYC55p0/Ixyhaaq9by2hJxCqiPzyxv1vjIomxTt
         If15SNPjqOWCDeULCIVbHBBHk7ZUolgENnr8Rwy82TNhqy7kD6R62droTkYX1hn0a+Kw
         UYQBcqJjdHod3ko8sYs9RuROTnvjt7EKh1nvI2YqInnEYq+u7CWezuYhek0PyCuk8H/I
         mulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=339+3mHOy+Q3FCaVFGj+b1oUEup7t5BZOT8tg60/J6w=;
        b=GUsyoEvQR7fXdTF99DSOUUSCGYsQ4NcKkMIkC2OUSPW9xRKN1X3NXndktd9lBBw/RL
         VXIuuibnQ7d28kbkl8v6J9vU0d6++XPWaCC1gm7BbpXxiPl9IdehnwKyzT8wYYAj7p+p
         xJSUH+VmHlTNsq/1FayHg/gL7WyUuu2h+/hGDO58oclXbNHBaq1sydP4Coy8dw8E3KKU
         1SpJNYkLvmAwoydp7xMwzJgnrm56qXkJx1Ntitp62X3Rm3NbeTjMC/XMlgd42mOBJocl
         wl4Y2fQpFBauF3eci53AswCggk1fA480dEkxJUDMz+ezbckPw53p8Adis/n6nPPIWfiw
         1eew==
X-Gm-Message-State: ACrzQf0cVMJb5mSo4Yq+SY8t/PFkfHCRc1UgnnMQvMlQoncp3xO9rbWy
        BCj3WMefs0B0Wao231XXVRs4jg==
X-Google-Smtp-Source: AMsMyM6b3yZpg7/i4MzSbXpTSPi/TUvJcWk9R7HkTuNplHg3c5LC8MYqw3z6tEzYJvxHGUzbYlMH0Q==
X-Received: by 2002:a05:651c:10a:b0:26c:5d7a:74b2 with SMTP id a10-20020a05651c010a00b0026c5d7a74b2mr2256193ljb.193.1663749388364;
        Wed, 21 Sep 2022 01:36:28 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b00499b726508csm328785lfr.250.2022.09.21.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:36:27 -0700 (PDT)
Date:   Wed, 21 Sep 2022 10:36:26 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     devicetree@vger.kernel.org, andersson@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Message-ID: <20220921083626.i7bqn45lvracp6by@krzk-bin>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-3-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220921043648.2152725-3-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 21 Sep 2022 10:06:46 +0530, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.txt    | 177 ------------
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 267 ++++++++++++++++++
>  2 files changed, 267 insertions(+), 177 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


remoteproc@a21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb
	arch/arm64/boot/dts/qcom/msm8916-mtp.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb
	arch/arm/boot/dts/qcom-apq8016-sbc.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dtb

remoteproc@fb21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dtb
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dtb
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
	arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dtb
	arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dtb

remoteproc@fb21b000: 'power-domain-names' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb

remoteproc@fb21b000: 'power-domains' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
