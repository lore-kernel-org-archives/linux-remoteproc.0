Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AAAC77B7C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 03:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjEEDAX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 23:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEEDAV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 23:00:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF2C1163A
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 20:00:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2f939bea9ebso1132728f8f.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683255618; x=1685847618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11Rw27X7jmZs9gU+D9cg4iOdVQE58331U0oKUGY7uJg=;
        b=V6ZVsHoHl36Qv7NKzCEDu8EFbQ7wn4SzcKS3KvWhO9sfNSzxvScnPNXpEXv3e0B4ym
         PBAu9k4TUM90ftCC62v/V7qrX97qjW1lpN2/XYWzocfJnsDfLvz10Fuz3oFqAv7xfdSM
         rAShAJQiUzlo364IUrAkxb4f4bU64pGhMZERH2X8DYnl3nYMhdu8L42fDKQCcdnQA5PM
         J69zYkXc4PjxtO5DXtUbEMp/ZmScARw25Q9u78tPqaPJG2KF4Pg9KInlmdq2EOOkX3z9
         Y28N+2z+q8cviAMUGvG9C0YuKOUqxVd/NiPv+vqLzNp057RQfVaNUjBEBVRCnoWSx/I6
         8New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255618; x=1685847618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11Rw27X7jmZs9gU+D9cg4iOdVQE58331U0oKUGY7uJg=;
        b=ACfy0MbU5qHGFABNYKX8dUCvrzhefLB9Y+kcQhH3rhOo0mHvgJ9yGdGO/ZV7+oocXM
         8F3LnDg6cCRmqOJroQiXedz/zC0H88x46wVjZM8EJUCPdJkSLB6CipqktzI7b8opWYxR
         XrS3vy+BDSmkIptqe+eReLMrrJ/H4Kj6IHykWCLE1ZLCqhcldRPIiHTQv5if+WMh50Jh
         lx8fxLalMuyFCf7mq4M4rIhAKt2WZTgg3vXVgTWFvS0offvolpIIleFrAXmRtXZpae8n
         YkKOCg0/cz+Xyz+dwdIUjIBZaotWj5yvXr5NQ9ZtYzXKE/yVjZpv4F5q3Za0dcHuyJdZ
         QxYg==
X-Gm-Message-State: AC+VfDw5quXAPQFM7BGRpumfpirIsIH8VmgGCkMhIwxvmNDHjtOa/Saa
        LrUxR49oi6BQAV6u8cFCVZyKtA==
X-Google-Smtp-Source: ACHHUZ46osh4UaJFIakRBEfrI0cDpLCTBQCrBVca8pgD93Q9x5TSfmOWRdic3whV1pFW6Y3io2V87A==
X-Received: by 2002:adf:ec45:0:b0:306:3f97:4847 with SMTP id w5-20020adfec45000000b003063f974847mr155821wrn.65.1683255618625;
        Thu, 04 May 2023 20:00:18 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id k11-20020adff5cb000000b0030649242b72sm808361wrp.113.2023.05.04.20.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:00:18 -0700 (PDT)
Message-ID: <a7d05c48-7df9-a932-5cc9-a2d56986d38f@linaro.org>
Date:   Fri, 5 May 2023 04:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/18] remoteproc: qcom_q6v5_adsp: Convert to platform
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
 <20230504194453.1150368-10-u.kleine-koenig@pengutronix.de>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230504194453.1150368-10-u.kleine-koenig@pengutronix.de>
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
>  drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index d546ab9dc141..6777a3bd6226 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -763,7 +763,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int adsp_remove(struct platform_device *pdev)
> +static void adsp_remove(struct platform_device *pdev)
>  {
>  	struct qcom_adsp *adsp = platform_get_drvdata(pdev);
>  
> @@ -775,8 +775,6 @@ static int adsp_remove(struct platform_device *pdev)
>  	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
>  	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>  	rproc_free(adsp->rproc);
> -
> -	return 0;
>  }
>  
>  static const struct adsp_pil_data adsp_resource_init = {
> @@ -859,7 +857,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
>  
>  static struct platform_driver adsp_pil_driver = {
>  	.probe = adsp_probe,
> -	.remove = adsp_remove,
> +	.remove_new = adsp_remove,
>  	.driver = {
>  		.name = "qcom_q6v5_adsp",
>  		.of_match_table = adsp_of_match,

-- 
Kind Regards,
Caleb (they/them)
