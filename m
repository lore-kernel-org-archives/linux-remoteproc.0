Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3538C43334
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jul 2022 02:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbiGGCxx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jul 2022 22:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbiGGCxv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jul 2022 22:53:51 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA9A2D1FE
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jul 2022 19:53:47 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id s204so520515oif.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jul 2022 19:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f4gaIJzDqBtSQKdyRb4t4FRZSvTpNHgxc06VwJFCJAs=;
        b=Vb9qqr0pPGtHzU++ok/knruEFhsnCHW0Qb+VtlleGiMOcXFwk1s5K0QVkmOC7TgX5+
         lTJlFpiGLm9oqhfUYgFHkGAD9DAm8JfHyZ6fdllezSHyxoopNETQ4vlhpx8atXQPqaEW
         arraTAUcOGYzdBB52FQ6ANzdcFxLeNWdA1/WpSV+xAam34kv/iRHkByIs1joKQJ5CsLE
         +AbTk+0wIVZCMFwh0T2+LGpzPxwjMGVafogxno2IL/P/cMbFa6QR33AXZaZYjBI+01Fk
         TTe41DWfUk5tnPZ8fnefR04310nvHPBZqIsHgYCq56BJIoNEADadGFqyn4xHpVC727aD
         Pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4gaIJzDqBtSQKdyRb4t4FRZSvTpNHgxc06VwJFCJAs=;
        b=xTZivO3Ig/lE4wsB5jsFqDM6oJ2lJOH/QCnwGsG3qpr0NIp/k0cP641K8+aaKit8x3
         Epwp+aDvHNbCpqZ0//Q6VWUb7dVjBLgff00F3aESjgqVU0q+oy5X13NY7p1VvhedBIOL
         QSwFTKVZdmY/CkQfEeDFRzEADveXNW+f7k+KIn7GJP8+L29KF7Eg+O2g8/LXWrmMNHi3
         rOHrQUC3Zm4A+OGl5orFPgbtOchCvuxbTMKk1CvzDb8Yu9+KCTE5e30LCF8xZ8Hmx9GI
         2aBWCXYK2qGCqmkWIpm1U6gRClwpqZUrYx2SFzl8y9hfTZT/3JdCQ87kquoYS2WmMsI1
         Ju/w==
X-Gm-Message-State: AJIora/oG7Ftk0KCQ7vIH6T4zlb5ENZ9XgRh3DJ1Em9grIGMu6dY/fYH
        sMJzVsbwnpLx2FduTZlMGTXMtA==
X-Google-Smtp-Source: AGRyM1svAYUXqzvpRaXYAeKIXNDjL2uNhdgk3jFmzNDfwIYkLys7rdcETxbCrhpx2JKvEfFTixdjDg==
X-Received: by 2002:a05:6808:170c:b0:335:1d14:f99d with SMTP id bc12-20020a056808170c00b003351d14f99dmr1039582oib.243.1657162427267;
        Wed, 06 Jul 2022 19:53:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u13-20020a056870f28d00b001048b819e13sm21166966oap.8.2022.07.06.19.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:53:46 -0700 (PDT)
Date:   Wed, 6 Jul 2022 21:53:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwspinlock: qcom: Add support for mmio usage to
 sfpb-mutex
Message-ID: <YsZKuUAc2iHWg9kN@builder.lan>
References: <20220707013017.26654-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707013017.26654-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 06 Jul 20:30 CDT 2022, Christian Marangi wrote:

> Allow sfpb-mutex to use mmio in addition to syscon.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/hwspinlock/qcom_hwspinlock.c | 32 ++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index 364710966665..23c913095bd0 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -19,6 +19,11 @@
>  #define QCOM_MUTEX_APPS_PROC_ID	1
>  #define QCOM_MUTEX_NUM_LOCKS	32
>  
> +struct qcom_hwspinlock_of_data {
> +	u32 offset;
> +	u32 stride;
> +};
> +
>  static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
>  {
>  	struct regmap_field *field = lock->priv;
> @@ -63,9 +68,20 @@ static const struct hwspinlock_ops qcom_hwspinlock_ops = {
>  	.unlock		= qcom_hwspinlock_unlock,
>  };
>  
> +static const struct qcom_hwspinlock_of_data of_sfpb_mutex = {
> +	.offset = 0x4,
> +	.stride = 0x4,
> +};
> +
> +/* All modern platform has offset 0 and stride of 4k */
> +static const struct qcom_hwspinlock_of_data of_tcsr_mutex = {
> +	.offset = 0,
> +	.stride = 0x1000,
> +};
> +
>  static const struct of_device_id qcom_hwspinlock_of_match[] = {
> -	{ .compatible = "qcom,sfpb-mutex" },
> -	{ .compatible = "qcom,tcsr-mutex" },
> +	{ .compatible = "qcom,sfpb-mutex", .data = &of_sfpb_mutex },
> +	{ .compatible = "qcom,tcsr-mutex", .data = &of_tcsr_mutex },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
> @@ -101,7 +117,7 @@ static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
>  	return regmap;
>  }
>  
> -static const struct regmap_config tcsr_mutex_config = {
> +static const struct regmap_config qcom_hwspinlock_mmio_config = {

Any objections against me skipping this rename when applying the patch?
Just to keep the patch to the point?

Regards,
Bjorn

>  	.reg_bits		= 32,
>  	.reg_stride		= 4,
>  	.val_bits		= 32,
> @@ -112,18 +128,20 @@ static const struct regmap_config tcsr_mutex_config = {
>  static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
>  						 u32 *offset, u32 *stride)
>  {
> +	const struct qcom_hwspinlock_of_data *data;
>  	struct device *dev = &pdev->dev;
>  	void __iomem *base;
>  
> -	/* All modern platform has offset 0 and stride of 4k */
> -	*offset = 0;
> -	*stride = 0x1000;
> +	data = of_device_get_match_data(dev);
> +
> +	*offset = data->offset;
> +	*stride = data->stride;
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return ERR_CAST(base);
>  
> -	return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
> +	return devm_regmap_init_mmio(dev, base, &qcom_hwspinlock_mmio_config);
>  }
>  
>  static int qcom_hwspinlock_probe(struct platform_device *pdev)
> -- 
> 2.36.1
> 
