Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6916AC6FD19
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Mar 2023 19:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjCMTiv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Mar 2023 15:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjCMTit (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Mar 2023 15:38:49 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADC57F015
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 12:38:48 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x11so14157469pln.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678736327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVO7PEi2yUALQReAQnVtBqU4m2MDeMLRMQcMWB2PiI0=;
        b=W5VAFVxT5KsRqtiz+5GE7fVAr/3byifsHIfF9hGkKl3m+4e/iWNinGUjiJQQcBURGm
         BtpuoYi09J19BbcCwIARjSdPz2HTN1qUjuTiRpNlVt4j+jLtGIqF4ZNmzHXUoDw4Mw9o
         Qjwf6fysHrAypYip+fUNdluusbd7ljMX7V+2sUtt+0IZ8A5Q34KdTzzXzf9fjkDxOzB6
         ssgcKvdkq5QiNdsuh0sHIrguPigPq412RiDUBZdC+iJ/qpxCWgvQ2lfTTmnk2u3C5c0i
         VJgvHUqXb0e3iKMU3aP4QVI5Jj2xZOWk/OzillHCFcQdFIXlD9h/SJo2uTGskA1/abnL
         KPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678736327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVO7PEi2yUALQReAQnVtBqU4m2MDeMLRMQcMWB2PiI0=;
        b=iX8ByRc8maFCHEEZEvd9V0eemq1bTcnHMFjp34yYTJjXJT+2HrBbRvud6O8QCKdgWO
         cAyowIRSnfrg4bGJFTdoeZZ8ZbELnb+EGfYyQRi1k2UHX/OL7qG0R+m49azSao4Amxf7
         YYQNrTQWVTzKmm9tbj8eHZSNONNycpqdzjqVGWPr0hjnZZozLPqPwc7sV8pjRpq5ogtN
         U7skce0UV1VUMs+eVkYV+XunsNaUoQbGrN7JbTONwCPgvhb2G8y0Zr7R3BpmGIfr7Bqk
         ZvxPnsX1DPJVyYCball+/jtr7rNU79VE3FYzyF3OwbPng8qpBtWe5tUslLcQlfB22LJR
         RMWg==
X-Gm-Message-State: AO0yUKVB5dFEI9awQKBUdnUftSK7LXrEdGT5TgoRigpeTunCDc9m5uZo
        zeO5bTPhragWcAo91DRixJXGPA==
X-Google-Smtp-Source: AK7set9qmdjM6JLXUsmVRUYr4chTrnyzUEowNxp6Tf8dv829z/ENOfvRbqn26nHGslbpU+eDnL2l9Q==
X-Received: by 2002:a05:6a20:734c:b0:bf:40b:2db with SMTP id v12-20020a056a20734c00b000bf040b02dbmr43679619pzc.22.1678736327521;
        Mon, 13 Mar 2023 12:38:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2c47:cef8:f9d7:c7e1])
        by smtp.gmail.com with ESMTPSA id i11-20020aa78d8b000000b005ded4825201sm100214pfr.112.2023.03.13.12.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 12:38:47 -0700 (PDT)
Date:   Mon, 13 Mar 2023 13:38:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     michal.simek@amd.com, andersson@kernel.org,
        jaswinder.singh@linaro.org, ben.levinsky@amd.com,
        shubhrajyoti.datta@amd.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mailbox: zynqmp: fix counts of child nodes
Message-ID: <20230313193844.GA2071975@p14s>
References: <20230311012407.1292118-1-tanmay.shah@amd.com>
 <20230311012407.1292118-2-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311012407.1292118-2-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 10, 2023 at 05:24:04PM -0800, Tanmay Shah wrote:
> If child mailbox node status is disabled it causes
> crash in interrupt handler. Fix this by assigning
> only available child node during driver probe.
> 
> Fixes: 4981b82ba2ff ("mailbox: ZynqMP IPI mailbox controller")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v5:
>   - mailbox node count should not be 0 for driver to probe
> 
>  drivers/mailbox/zynqmp-ipi-mailbox.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index a4c8d23c76e2..ae47fbac38d2 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -634,7 +634,12 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
>  	struct zynqmp_ipi_mbox *mbox;
>  	int num_mboxes, ret = -EINVAL;
>  
> -	num_mboxes = of_get_child_count(np);
> +	num_mboxes = of_get_available_child_count(np);
> +	if (num_mboxes == 0) {
> +		dev_err(dev, "mailbox nodes not available\n");
> +		return -EINVAL;
> +	}
> +

This patchset looks good now.  I'll queue it once I get an ack from Michal.

Thanks,
Mathieu

>  	pdata = devm_kzalloc(dev, struct_size(pdata, ipi_mboxes, num_mboxes),
>  			     GFP_KERNEL);
>  	if (!pdata)
> -- 
> 2.25.1
> 
