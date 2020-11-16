Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E714FC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 17:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC0AF207BC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 17:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OKJmvFdz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732195AbgKPRGb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 12:06:31 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39392 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731047AbgKPRGb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:06:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AGH6IWP003454;
        Mon, 16 Nov 2020 11:06:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605546378;
        bh=V5uxOcMPtQIIJNPY6axSB4BeST2hs8WLIqAT9d6Iyx8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OKJmvFdzBugs0SPHyWd1zGMBIdGZeOeRHdJNGdApZYuOXNY0829q6qT3iydvd62Gp
         Wf/oK7QfMhuS5r5W0cXHfKW5QHepgmbnDF82tjpMfcOiezFP0xL0dRmMn7jTFV7nRs
         JgG4DAjjyy2fw6srsIgQYbY0fCJWQh0Ky5H7C+xc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AGH6IRj106992
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 11:06:18 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 16
 Nov 2020 11:06:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 16 Nov 2020 11:06:17 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AGH6Hjg115096;
        Mon, 16 Nov 2020 11:06:17 -0600
Subject: Re: [PATCH] remoteproc: k3-dsp: Fix return value check in
 devm_ioremap_uc()
To:     Wang Li <wangli74@huawei.com>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>
References: <20201113070840.386033-1-wangli74@huawei.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ecdc84e0-12a1-47d6-aba2-1d10d3165bbb@ti.com>
Date:   Mon, 16 Nov 2020 11:06:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113070840.386033-1-wangli74@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Wang,

On 11/13/20 1:08 AM, Wang Li wrote:
> In case of error, the function devm_ioremap_wc() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 6edbe024ba17 ("remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>

Hmm, a patch was already posted for this previously, looks like it got missed
somehow.

https://patchwork.kernel.org/project/linux-remoteproc/patch/20200905122503.17352-1-yuehaibing@huawei.com/

Bjorn,
Can you pick up the previous patch that was already acked by me and Mathieu?
Appreciate it if you can include it in your fixes branch for 5.10 itself.

regards
Suman

> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 9011e477290c..863c0214e0a8 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -445,10 +445,10 @@ static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
>  
>  		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>  							 resource_size(res));
> -		if (IS_ERR(kproc->mem[i].cpu_addr)) {
> +		if (!kproc->mem[i].cpu_addr) {
>  			dev_err(dev, "failed to map %s memory\n",
>  				data->mems[i].name);
> -			return PTR_ERR(kproc->mem[i].cpu_addr);
> +			return -ENOMEM;
>  		}
>  		kproc->mem[i].bus_addr = res->start;
>  		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
> 

