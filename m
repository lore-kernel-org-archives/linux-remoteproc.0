Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC69C77B73
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 03:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjEEDAr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 23:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEEDAq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 23:00:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D89F1163A
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 20:00:45 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so8204465e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 20:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683255643; x=1685847643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATSvcwmxjhChqIjTHfizSh8rJiN9op5Egz+Wsdg5NBE=;
        b=QQWPVPJkU6rlkVtlgTbywxHqsZ+uaaxBwh4VKt5VGxSaqMTqotq5kIy6d6x3Mig1UV
         6LU8xRS4i/dbEtqqfvWomyDGza+YB+wzcMv7MyC8nBHvb3hZwj5Uc/z0UDGWWwQBZTAC
         OiQ1ly+gML5fQ8eHDH4xG8tj3JjacsXH7Y7qNivSpN/gtY0jNEnjw9uu2GR1+FabG/lO
         BA+nhtiyZWgXn/7N4k2Ai9MUP4b4XuUPbHa8jayTovSjEcUFU3186ZwHw0UiYRumLios
         4r8U702bsb1CDIWES8YWRufhYP8+C+EHo14NMcsEaJQU2bLGYSt5KsFOlENim67cTjCy
         StWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255643; x=1685847643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATSvcwmxjhChqIjTHfizSh8rJiN9op5Egz+Wsdg5NBE=;
        b=QM9zKUgLGc2T1YwLCVEapB4Ze+wIblgpeMaRO7GJG43+A7GqMgx/XQMmVN1WE5e0FF
         FHcnnOWNa5WioSaE9yO5qaJWuLVrztoOylefFY1zcORFXzcb0Plc1tHC1+M7vGXK9gWq
         6kI4QVhr36K1pfBD3DmounBfcjB5H6u1SY/7eS7oajx/1r8EmVlncpGDakgfH+tcRx50
         NxNGWMDEe+NwayUpMgaJaNCsdKOzIWmPK6WuZutcHMb6t/ObYDtyi0CjEwbzgaldN+ne
         DhQ2sRlcGOd7NcOG4bufNF1UILW3BRCKOf8xukwfpTkGhAKf/QkKtUzC4dZpPu9/31vX
         Giag==
X-Gm-Message-State: AC+VfDzr16L7EDhVnhQpXJdzIZtyQS3CRel7yf+aPPDHJUF17UPkM2ii
        t8X/J8+jEhwARoBCoxyC16fZJw==
X-Google-Smtp-Source: ACHHUZ7IDxemaM/eAtH7nWhz+oPYnNJRtXFL4cvf8TS3CMjvXdysBxxbsue0zdlzfzqjiBPlsmIcXg==
X-Received: by 2002:a1c:7507:0:b0:3f3:46d9:4046 with SMTP id o7-20020a1c7507000000b003f346d94046mr1028288wmc.32.1683255643508;
        Thu, 04 May 2023 20:00:43 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003f173be2ccfsm6017866wms.2.2023.05.04.20.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:00:43 -0700 (PDT)
Message-ID: <462c4a9d-9069-6baf-5576-bc0aca5c72e2@linaro.org>
Date:   Fri, 5 May 2023 04:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/18] remoteproc: qcom_q6v5_mss: Convert to platform
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
 <20230504194453.1150368-11-u.kleine-koenig@pengutronix.de>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230504194453.1150368-11-u.kleine-koenig@pengutronix.de>
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
>  drivers/remoteproc/qcom_q6v5_mss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 8e15e4f85de1..70bffc9f33f6 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2110,7 +2110,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int q6v5_remove(struct platform_device *pdev)
> +static void q6v5_remove(struct platform_device *pdev)
>  {
>  	struct q6v5 *qproc = platform_get_drvdata(pdev);
>  	struct rproc *rproc = qproc->rproc;
> @@ -2128,8 +2128,6 @@ static int q6v5_remove(struct platform_device *pdev)
>  	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
>  
>  	rproc_free(rproc);
> -
> -	return 0;
>  }
>  
>  static const struct rproc_hexagon_res sc7180_mss = {
> @@ -2482,7 +2480,7 @@ MODULE_DEVICE_TABLE(of, q6v5_of_match);
>  
>  static struct platform_driver q6v5_driver = {
>  	.probe = q6v5_probe,
> -	.remove = q6v5_remove,
> +	.remove_new = q6v5_remove,
>  	.driver = {
>  		.name = "qcom-q6v5-mss",
>  		.of_match_table = q6v5_of_match,

-- 
Kind Regards,
Caleb (they/them)
