Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB898C7EE23
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 03:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEEDB1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 23:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjEEDBF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 23:01:05 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B641160F
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 20:01:04 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f4000ec71dso8523705e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 20:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683255662; x=1685847662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzNCxTuU4UI9Z2MafEfk7i/ZIpqLuUSmTvXopitS840=;
        b=KSvHmvGg2uoevAXtQP2aaYNHCcQmP+0GIeryrRjVTutjLPPNeRIUN28tVJp/hjWUww
         M7J5WFb2oCI5CEb+wxqBUjZGsEqCDqAEnQiJ1exYG7M2MLFVLHujX36H5JmJpsntCLCd
         pcNFchewYdVn0Jq47YQ8MwyJ20azNSq1DXGLCuMGaD04ng1QN3eHB7pnfmHWauRTLfX+
         WUzRAW39FdjlTgD8fS+cRP23dFblpeLqi5b52mzhqlbTrfM9wccHRQK332gWibjzGt0a
         nAGTQ7zb7mojxu/UYi9b2k0t4M2YzltdDKDBV9/d55N0KWKRkfyhfEhkSXKaGNWPT5w8
         N9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255662; x=1685847662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzNCxTuU4UI9Z2MafEfk7i/ZIpqLuUSmTvXopitS840=;
        b=g8+0kbkcU2lst0KgAl9cLY5qCnRHmxFbBIcBjR2IZ0IL5WWgDBpjuPE1tqgrr+gR0q
         0dxP7LCgqBapClBM3aLHHad0BTwd73Jtuy+4oTcudkWaebVSDiI4S6qrcQXh0wY0RfBS
         d91m/eA9kvnEe266pYuxzbaWilU5e0UmdeouMb5vmSYBMiSn4m3TnAdVHJQWuYlckJae
         koiNSeivCx8ICFxOOHZnFozvda9Sb2fX2lk6DoUo3qCoC27D+ILBPswzAE8nRDiUZdvn
         EjfK1P/jjqMpp9GTLMe1fiT88j840lILu92JftJcvaokbt1vW/05GH3wvwsvVsSh6GXg
         w5Zw==
X-Gm-Message-State: AC+VfDymvBvgWf87L1OjsQTbIu9PFQhPRk1/OQzDK4bqwOISFp9prtxU
        Dxv6B2zYQ0EpeaOJWy1mwCesfA==
X-Google-Smtp-Source: ACHHUZ5ZHreboBz6Fs1pFNqsYTWjMam/DCGzONkyhlp+N5XbXu8+A+KJ+7NBuZydaQPMlfWUFPm4FQ==
X-Received: by 2002:a7b:cb93:0:b0:3f1:76d0:8bb0 with SMTP id m19-20020a7bcb93000000b003f176d08bb0mr990623wmi.36.1683255662743;
        Thu, 04 May 2023 20:01:02 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d6e0e000000b0030631dcbea6sm825912wrz.77.2023.05.04.20.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:01:02 -0700 (PDT)
Message-ID: <611fe27e-c2dd-5265-01de-4998943c0278@linaro.org>
Date:   Fri, 5 May 2023 04:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/18] remoteproc: qcom_q6v5_pas: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-12-u.kleine-koenig@pengutronix.de>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230504194453.1150368-12-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 04/05/2023 20:44, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index e34d82b18a67..ca0155f41dac 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -754,7 +754,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int adsp_remove(struct platform_device *pdev)
> +static void adsp_remove(struct platform_device *pdev)
>  {
>  	struct qcom_adsp *adsp = platform_get_drvdata(pdev);
>  
> @@ -769,8 +769,6 @@ static int adsp_remove(struct platform_device *pdev)
>  	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>  	device_init_wakeup(adsp->dev, false);
>  	rproc_free(adsp->rproc);
> -
> -	return 0;
>  }
>  
>  static const struct adsp_data adsp_resource_init = {
> @@ -1232,7 +1230,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
>  
>  static struct platform_driver adsp_driver = {
>  	.probe = adsp_probe,
> -	.remove = adsp_remove,
> +	.remove_new = adsp_remove,
>  	.driver = {
>  		.name = "qcom_q6v5_pas",
>  		.of_match_table = adsp_of_match,

-- 
Kind Regards,
Caleb (they/them)
