Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D2AC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 23:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56F3C61041
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 23:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhEFXwb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 19:52:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51782 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhEFXwb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 19:52:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146NpVMY062345;
        Thu, 6 May 2021 18:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620345091;
        bh=7GjAjZeKdhiyFEA5IzURuVplWL+AsqcJIeMSa7IF6xo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ENTVekq4NqcdyjZUvbnm5vOFNWRbS5sOKUz4ve82I/0JXF3P3w4C8kwcApelaqQWd
         JKefxeyC3AZtOXy4C5JBSfWJFYFlVfTOLyyy8a9CiLkrGt6yR9eaTxvQbZ3Ha3mAOY
         z529Sm+h6YX6bRf2XatNekO31Cm/WaU40M4TTNNk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146NpVaO116954
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 May 2021 18:51:31 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 18:51:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 18:51:30 -0500
Received: from [10.250.33.171] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146NpUN7096397;
        Thu, 6 May 2021 18:51:30 -0500
Subject: Re: [PATCH] remoteproc: k3-r5: Fix an error message
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b585d9e1-8b52-aa1e-211d-fa79be6a5d55@ti.com>
Date:   Thu, 6 May 2021 18:51:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/6/21 3:46 PM, Christophe JAILLET wrote:
> 'ret' is known to be 0 here.
> Reorder the code so that the expected error code is printed.
> 
> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for catching the issue.

Acked-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 5cf8d030a1f0..4104e4846dbf 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1272,9 +1272,9 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>  
>  	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
>  	if (IS_ERR(core->tsp)) {
> +		ret = PTR_ERR(core->tsp);
>  		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
>  			ret);
> -		ret = PTR_ERR(core->tsp);
>  		goto err;
>  	}
>  
> 

