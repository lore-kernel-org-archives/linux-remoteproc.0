Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C08C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Nov 2022 17:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiKURZ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiKURZz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Nov 2022 12:25:55 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CA1D103
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Nov 2022 09:25:54 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id x66so3335365pfx.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Nov 2022 09:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhUpotIu7HbgdsEvz4b74026YHhcGCBoe7xyC0e99vc=;
        b=x0iApWcOT5I8s056uCMlcwinlVt/B7jwLKCbuS8wqkWYJabyCGgI6YCbKLPE1TSlyl
         oHy25Fk9RIvVGm1wmrxlBqVJGXUyFKi88fb8hlOn6yscVVzjXCUTH2ZMV72kirKTSTOV
         dE+8eWr36u2ykF585nViVriDWSTiwrwJlxs/SSF3TqIs4qVugyUvoHFT8rlf1kk8wes1
         zT6N7LFFsARH7pInn/AP4CBUxJ2ni+9y5o6JMwv+nRy6V7zCSiM3kcEESQ+Vv159vHEq
         xaBOjHgBUmFhbbTHRK7YFqkkwcItwMBjbzaFTnolbS8abrNGQQ9fBk24am/INECK2ybd
         f5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhUpotIu7HbgdsEvz4b74026YHhcGCBoe7xyC0e99vc=;
        b=3ntSg+7RgSri4O9xizfufprMEYXuAdhid37yL1DqPGQBhRrPQmYfC13gY6Ipx8GSyW
         9Lb0PNWhnnfD5AR78gzrgWE9MyuF+r8ckxZuelvQyDcTSCH1zANdKzU7qUoR0uqyvDay
         FWo0soQWIg85cihSHTa9B9b8LC6n6f7/6PtHLuV1DdxgoOlCo64ZF22ZS/UsweefQ1pu
         dM89VkMTLUQMQsmz6ytTxTq1b0btzTFxQtcXy7KKKGMf89iqUt4HenyVN9Aya6Fbkwak
         7Y/Ur05kXwyBarr2wM78Ytxb3W7qX0ichK2tdbx4Qn09+CKJu6TbxauKUuiQdwr2pwlq
         ohqg==
X-Gm-Message-State: ANoB5plOdXMKYmRnb9YAnO6eGQQ4B3aHcnZQozC7fdJusvyNuNCyCfyD
        r417DAeJSPgZDQFvV7H3ewrzCQ==
X-Google-Smtp-Source: AA0mqf5MIc6GAlLJ4FRVrB1aUoZRd8Xnrs98cBu+qqr7/RkDynXwHV58FMRVmDtIyG+amXm9sS8LVQ==
X-Received: by 2002:a63:1247:0:b0:476:ed2a:6216 with SMTP id 7-20020a631247000000b00476ed2a6216mr16978545pgs.556.1669051533433;
        Mon, 21 Nov 2022 09:25:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:8b90:bf06:8462:1d8b])
        by smtp.gmail.com with ESMTPSA id nl8-20020a17090b384800b0020d48bc6661sm10743970pjb.31.2022.11.21.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:25:32 -0800 (PST)
Date:   Mon, 21 Nov 2022 10:25:30 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Yuan Can <yuancan@huawei.com>
Cc:     andersson@kernel.org, s-anna@ti.com, jaswinder.singh@linaro.org,
        t-kristo@ti.com, afd@ti.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: omap_remoteproc: Fix compile errors about
 casting
Message-ID: <20221121172530.GB457869@p14s>
References: <20221118074755.121424-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118074755.121424-1-yuancan@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 18, 2022 at 07:47:55AM +0000, Yuan Can wrote:
> The following errors was given when compiling
> drivers/remoteproc/omap_remoteproc.c:
> 
> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_mbox_callback’:
> drivers/remoteproc/omap_remoteproc.c:497:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   u32 msg = (u32)data;
>             ^
> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_kick’:
> drivers/remoteproc/omap_remoteproc.c:548:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   ret = mbox_send_message(oproc->mbox, (void *)vqid);
>                                        ^
> drivers/remoteproc/omap_remoteproc.c: In function ‘_omap_rproc_suspend’:
> drivers/remoteproc/omap_remoteproc.c:783:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
>                                        ^
> In file included from ./include/linux/device.h:15,
>                  from ./include/linux/node.h:18,
>                  from ./include/linux/cpu.h:17,
>                  from ./include/linux/of_device.h:5,
>                  from drivers/remoteproc/omap_remoteproc.c:22:
> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_of_get_internal_memories’:
> drivers/remoteproc/omap_remoteproc.c:1211:16: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 6 has type ‘size_t’ {aka ‘long unsigned int’} [-Werror=format=]
>    dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

I am not seeing any of this on my side with gcc 9.4.0:

$ arm-linux-gnueabihf-gcc --version
arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

What version do you use?

Thanks,
Mathieu

> Fixes: 8841a66aaa7c ("mailbox/omap: adapt to the new mailbox framework")
> Fixes: 5f31b232c674 ("remoteproc/omap: Add support for runtime auto-suspend/resume")
> Fixes: 4a032199d3f7 ("remoteproc/omap: Add support to parse internal memories from DT")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 430fab0266ed..be43b5d85e2b 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -494,7 +494,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>  						client);
>  	struct device *dev = oproc->rproc->dev.parent;
>  	const char *name = oproc->rproc->name;
> -	u32 msg = (u32)data;
> +	u32 msg = (u32)(unsigned long)data;
>  
>  	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>  
> @@ -545,7 +545,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>  	}
>  
>  	/* send the index of the triggered virtqueue in the mailbox payload */
> -	ret = mbox_send_message(oproc->mbox, (void *)vqid);
> +	ret = mbox_send_message(oproc->mbox, (void *)(unsigned long)vqid);
>  	if (ret < 0)
>  		dev_err(dev, "failed to send mailbox message, status = %d\n",
>  			ret);
> @@ -780,7 +780,7 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
>  
>  	reinit_completion(&oproc->pm_comp);
>  	oproc->suspend_acked = false;
> -	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
> +	ret = mbox_send_message(oproc->mbox, (void *)(unsigned long)suspend_msg);
>  	if (ret < 0) {
>  		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
>  		return ret;
> @@ -1208,7 +1208,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>  		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
>  		oproc->mem[i].size = resource_size(res);
>  
> -		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
>  			data->mems[i].name, &oproc->mem[i].bus_addr,
>  			oproc->mem[i].size, oproc->mem[i].cpu_addr,
>  			oproc->mem[i].dev_addr);
> -- 
> 2.17.1
> 
