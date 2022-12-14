Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348E7C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Dec 2022 14:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238000AbiLNOPs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Dec 2022 09:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238283AbiLNOPq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Dec 2022 09:15:46 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82432BC9
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 06:15:43 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg10so11398772wmb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8I9fpa0h/Xtdec1pPADK+rW1eXfIYJbi/7+lsXWKshc=;
        b=mqwC4AsXWnBdyvmy1Zh7/B6UDRXSFzEkk8TRt28/H59WOEqu5tVF+rNE4UbP00C32b
         0TiJ9W/cldHdN8BcsOMbUle3ZsPX4hiJTUwBu6LcaxdpzdRJafAzi83J/34PSFLKa78g
         r6uW3t5iwOQ6V9sslABeZiazk6CjsiCmTGO81o6/PabJBNRY/dHEKofkpATipsAu1oLa
         qexxRKchqfHX3JXqwo0v1jchfJJH1iGsVG61/avUx3YhaJ/U39td3iR5UuQ/V03mNJ65
         AA6XJcxr5lsV8topUViJ0q/4aiSTdf/LAsdaEPh6WoLLh5cDecA2XUW+e3AwTsYMkUaw
         7bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8I9fpa0h/Xtdec1pPADK+rW1eXfIYJbi/7+lsXWKshc=;
        b=Wa1B5iSjwzeWHEilM5IPuHeQPNWDE+FYZG77NE96O56IF00BZkFD+35r7af96zRRqH
         AkzllzbRxh0nQsc+/IJ0tXPihs/Bl1qh4UjI7UhDPB/kquZ8WGhpCg6w+hhp+WBqtpVK
         ZoCPzaduVuWgZMnkdeXPHM7canHLIO3x4ic8vAKxlJDG9zhYlw+dD18k2aQY4n/kvLYN
         YEbJrbwuFOo7GkG9Rxfa6cWZY8xADgKFWCI2Za6fQcGNM70sZK9CYXx68kHpPmKLvBmr
         RiKPFvPkWjOLTBnJtezQC0Qwcjag6GHgnPBaQ/y/iAZThPza+46z4GzSuH4eJt1fHO8T
         mI6w==
X-Gm-Message-State: ANoB5pnFaMEYzIysaKQZioiEiI1qVn5ATQxRaDhL+ut9qArUqkw6HdwC
        XzxfJdBLuVad6zGjWlW6W5rzag==
X-Google-Smtp-Source: AA0mqf7iPboYYtpCZd2hu9ktE3TAxbzQTs/ESF1byMN4kyHK1MDPTxdhjYjOV9VkE+tJTme/oZsl2g==
X-Received: by 2002:a05:600c:1f14:b0:3c9:2598:d1c5 with SMTP id bd20-20020a05600c1f1400b003c92598d1c5mr19723107wmb.7.1671027342505;
        Wed, 14 Dec 2022 06:15:42 -0800 (PST)
Received: from [192.168.1.25] ([84.76.199.78])
        by smtp.gmail.com with ESMTPSA id d1-20020adffd81000000b0023662d97130sm2985695wrr.20.2022.12.14.06.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 06:15:42 -0800 (PST)
Message-ID: <453ff357-a91b-192b-00a1-502cc273870d@linaro.org>
Date:   Wed, 14 Dec 2022 15:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] hwspinlock: Use device_match_of_node()
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, andersson@kernel.org
Cc:     ohad@wizery.com, baolin.wang@linux.alibaba.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202211251544369078587@zte.com.cn>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <202211251544369078587@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 25/11/22 08:44, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with device_match_of_node().
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/hwspinlock/hwspinlock_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


