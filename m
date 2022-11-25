Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307CBC4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Nov 2022 08:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiKYIS4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Nov 2022 03:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiKYISy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Nov 2022 03:18:54 -0500
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBAD303E5;
        Fri, 25 Nov 2022 00:18:52 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VVeXNnB_1669364328;
Received: from 30.97.48.45(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VVeXNnB_1669364328)
          by smtp.aliyun-inc.com;
          Fri, 25 Nov 2022 16:18:49 +0800
Message-ID: <e22e325e-bf49-c1de-4356-962ece1287fe@linux.alibaba.com>
Date:   Fri, 25 Nov 2022 16:18:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hwspinlock: Use device_match_of_node()
To:     ye.xingchen@zte.com.cn, andersson@kernel.org
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <202211251544369078587@zte.com.cn>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202211251544369078587@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/25/2022 3:44 PM, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with device_match_of_node().
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/hwspinlock/hwspinlock_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index fd5f5c5a5244..22b8f2a70b3b 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -367,7 +367,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
>   			continue;
>   		}
> 
> -		if (hwlock->bank->dev->of_node == args.np) {
> +		if (device_match_of_node(hwlock->bank->dev, args.np)) {
>   			ret = 0;
>   			break;
>   		}
