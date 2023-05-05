Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC5DC77B7F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 17:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEEROO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 May 2023 13:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjEERON (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 May 2023 13:14:13 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA33D1490B
        for <linux-remoteproc@vger.kernel.org>; Fri,  5 May 2023 10:13:58 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f199696149so14537015e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 May 2023 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683306837; x=1685898837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMfl0C8EMOIowWqbI/Rqq/+20qm/1u6RPCMDDJIfSHE=;
        b=U4q6GwkvxBZ02dcyk99ozrFVmaFKd9pXRVdIq/QMfjQfSM0DuYV11qSq3LjQ/eh2hn
         SWoMjUcqXlUtdBEDydU5uR/ThsuXpidINhAN5u5FVfNXQe4U+xXWPT/5GacMC0hOAhUm
         N+9fx7EdGhIgSMeJ/fXhj+tbWfL3jApEH0buSB+7BSDggwjJaF5BC+yOyuqonEktV/BB
         gcj/LQdGZ2QC+glfRh38xbPaj3m6h/eW+L4zktEq3vtrVTipyuZ4jiwGq6ROfK3afeb8
         WFDpXjQvo3HeGWHRzWy/jV1w79bCWpBHYHcwBnGEfOj9izvG0ZDkXscyUbGf7Hrhah5v
         044A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683306837; x=1685898837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMfl0C8EMOIowWqbI/Rqq/+20qm/1u6RPCMDDJIfSHE=;
        b=BQlI3ZimCgAS9aZUlCKaZfDy1BxtJfiAQ23bqc7076wGZIezV66mXtXBkR21TmoNHC
         24ihtZ9PYgi/bvzuaN7kTcsJZHQYwRaXevqOhAOO+jHBppKDd6hPSUMdb0SoRSsyj4bU
         G0ELzQ+NXFx9+XiZ1TDyYRbwqybR3UOc6PfEhdbULRHMw7VBxqGZPQGZzxj3JI0AwmZ5
         THBwex/xhtOn+Q/Fj//M2qtDa58fZMBuTPis0A6VSjHb273/6sOL/AN/KatTc7cfMj3a
         sFilfDk76fxYfJiZ1WQOIzTY3X51DJwfSKlvzLdySgsTr3gTDjzMDTv2zlpAKTnWyU5t
         7NDw==
X-Gm-Message-State: AC+VfDwUj2ZC0NsPHRYq3407gSws4sVu4H4rRcFhMgXnWH/MJpmoXXlH
        BmcVlJX+7LVgKKXxSizQAiAcLpA1Hv4=
X-Google-Smtp-Source: ACHHUZ6hqgTsps9ibKVkPPhU/c2tsc26KuGSdINz19lQutH4+j4O3f6l2AMBZzNuHLaVkM6/FpGKVA==
X-Received: by 2002:a5d:4745:0:b0:306:3ad3:94f2 with SMTP id o5-20020a5d4745000000b003063ad394f2mr1805903wrs.42.1683306837105;
        Fri, 05 May 2023 10:13:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z13-20020adfd0cd000000b0030631a599a0sm2947687wrh.24.2023.05.05.10.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:13:56 -0700 (PDT)
Message-ID: <65f4c370-e9fa-c715-19a4-54347c077e53@gmail.com>
Date:   Fri, 5 May 2023 19:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/18] remoteproc: mtk_scp: Convert to platform remove
 callback returning void
Content-Language: en-US, ca-ES, es-ES
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 04/05/2023 21:44, Uwe Kleine-König wrote:
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e1d93e63d7df..dcc94ee2458d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -913,7 +913,7 @@ static int scp_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int scp_remove(struct platform_device *pdev)
> +static void scp_remove(struct platform_device *pdev)
>   {
>   	struct mtk_scp *scp = platform_get_drvdata(pdev);
>   	int i;
> @@ -925,8 +925,6 @@ static int scp_remove(struct platform_device *pdev)
>   	for (i = 0; i < SCP_IPI_MAX; i++)
>   		mutex_destroy(&scp->ipi_desc[i].lock);
>   	mutex_destroy(&scp->send_lock);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_scp_of_data mt8183_of_data = {
> @@ -1003,7 +1001,7 @@ MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>   
>   static struct platform_driver mtk_scp_driver = {
>   	.probe = scp_probe,
> -	.remove = scp_remove,
> +	.remove_new = scp_remove,
>   	.driver = {
>   		.name = "mtk-scp",
>   		.of_match_table = mtk_scp_of_match,
