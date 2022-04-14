Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Apr 2022 17:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiDNRW0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Apr 2022 13:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233839AbiDNRWZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Apr 2022 13:22:25 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094283AA5C
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Apr 2022 10:20:00 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h15-20020a17090a054f00b001cb7cd2b11dso6275489pjf.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Apr 2022 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KZKxiqiOGP8xT+pzPpG96RNqzRBaJRtyWz+j5RMVT+Y=;
        b=lymh6lTWr2Sj/q2KNN/sZh1+2+JNVgm9GNF/J1h9xIbILtCqkJ4X5rV0k08Hh+twHd
         QJmdssHM6pnT12/Lf6tURVpzaBio2EQQV4HtSur0oY4rKUk+qb422YW+5FBBwPoq7Rd7
         ULezyMYJqhGfudAlhzgoMNN96M9DCtkPjl7zDz3aoxWt6x824Jo8bKJ41ZF7f5sbvLHN
         qBKBxsJEz1dcltFx0xi7w+2k47IhBftfhOolhGf6NLlXWXSmBcVbjhu9olAs0/mKobli
         0dMnfWjwZZkF1JoziNLJieWWcwp9FmEbU0+Plpl0zP7OoaMkXuU/oeL5RB8kSy63ajEH
         QEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZKxiqiOGP8xT+pzPpG96RNqzRBaJRtyWz+j5RMVT+Y=;
        b=iHqpGdDO/KwYMQiZXRwmPCaslEdwcQB/80zqcA6pa1jmMZmEISaFZcWVXYIVdExw4x
         Y6jM8Qz7JQalqU+ZbEIfAkzBERZPR3tz1Fz4V8R/2dBmiwTX7NCl70KNP02mNQkNXRmG
         ajOayLbZTjy5PtTVVKIAbG6hQjzaCYPzq8LwDq+9chuRkw5F5mibCHRw24c0MzPIAjc0
         DHqGfHuCquaNet2fkrU6/iDkV8uPVu1bTiU1lKEBvpBAm3vmdkCyZM2QoRg6NUKV9DOZ
         vpMzSfTxRyjAmcegoeHVEdzrbCt3qlJVOC57+76qnQV8v9Y5iZQv1HNyxgaf86XS9+xR
         arRA==
X-Gm-Message-State: AOAM5326LDkyCPvvphvyZqIlKdRCwi1We1TO7bbmLsDiqdP1n96A78UO
        YNjolVKl7Mgis7aoCIlb6z3s5Q==
X-Google-Smtp-Source: ABdhPJwi8+ti1WpkD0ucDZjeGnXAnfZ7+/ecI6kI3PJTHAqbr5Kk6Xg8Mx1f9xcHje80M+6NCA/tsQ==
X-Received: by 2002:a17:90b:384c:b0:1cb:1b44:2939 with SMTP id nl12-20020a17090b384c00b001cb1b442939mr5468344pjb.46.1649956799574;
        Thu, 14 Apr 2022 10:19:59 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l10-20020a056a00140a00b004c55d0dcbd1sm466362pfu.120.2022.04.14.10.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 10:19:52 -0700 (PDT)
Date:   Thu, 14 Apr 2022 11:19:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v2 0/2] remoteproc: core: fix issue for multi-instance
Message-ID: <20220414171947.GB698343@p14s>
References: <1648434012-16655-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648434012-16655-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 28, 2022 at 10:20:10AM +0800, Shengjiu Wang wrote:
> Use the rproc->power reference count to handle the multi-instance
> case, move the state checking for 'stop' and 'detach' under
> mutex protection, and remove state checking for 'start'.
> 
> Shengjiu Wang (2):
>   remoteproc: core: Remove state checking before calling rproc_boot()
>   remoteproc: core: Move state checking to remoteproc_core
> 
> changes in v2:
> - drop 'remoteproc: core: check rproc->power value before decreasing it'
> - refine 'remoteproc: core: Remove state checking before changing state'
>   split it to two new patches.
> 
>  drivers/remoteproc/remoteproc_cdev.c  | 11 -----------
>  drivers/remoteproc/remoteproc_core.c  | 11 +++++++++++
>  drivers/remoteproc/remoteproc_sysfs.c | 11 -----------
>  3 files changed, 11 insertions(+), 22 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> -- 
> 2.17.1
> 
