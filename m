Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C74EE49AE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Aug 2023 19:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjHVTZT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Aug 2023 15:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjHVTZS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Aug 2023 15:25:18 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042A7E4B
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Aug 2023 12:25:16 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bc83a96067so29068485ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Aug 2023 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692732315; x=1693337115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1G5m8Qjmh6jxuKz8UMaMjH/jWYmISiVf2CP4Ro+UAY=;
        b=nlIifxq5oK59/+pYadZdfblkJhLw6Wf3kugMEjW/uM48NiTw+MEQquBAdNN3yINmbD
         G+WWwh/Pzr1+cjfFDD2NjH7RmIVfDUTU2A0OctPa2W9L0sWWs2W0v+o+z+RG8vT7YKju
         zjJT87CjUaXWXDuraadxViGz5sZ8tWTSkGJTpKx12WajS8z6AKVq/RwMCk2X2Z8carxZ
         u/shkw0jB0Aax9jmMviiz6zCh5lhoETGbQFc6yuCE4hghGIxtVPwcb4gNTOYkgoiivBd
         njXujFVP42SKzRLbjGteCe2RONqCvLfW2pTkhcHprrWmcQOBAMZqA/PT0XBUZsgesyry
         +38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732315; x=1693337115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1G5m8Qjmh6jxuKz8UMaMjH/jWYmISiVf2CP4Ro+UAY=;
        b=V3BL45B+sWEXhunmwa8Jcd3dMDxgiTkW+YO6wnglaM6ObPisU2h03g8YeRw3C7U/4A
         /Q32CdY8A5mFI101v30nDnYde1RIPczY/RKlrewt8PZULpWII7KHT4OD0zK0ig2fIi+T
         C8C7Ft6C629HqAOBWcXNMs/OzzJCzM8IlAVZXUItZ5VAVZZM1UeeI2r7g/hueVRH4d0a
         mBXryAfbHx71oCLQsebLkc+PasR42Hw9VooYG1ZZIvUgGtNqqn2+pCJY3ovuhmItKCE+
         hjNJ/fE3Pqxmbcsty6nHp57dJ9cqJJS8K2j5s3Mb0YfTxCa4rxYjyPYJBG9m46Lzw2XF
         YH8g==
X-Gm-Message-State: AOJu0Yw03RmQkIWw7xARM+4CDg/Bi8JKHgqrrfs93evW714Id7uc66uw
        qG9vG7PGH63jYb+/dkc1aQI1Ag==
X-Google-Smtp-Source: AGHT+IEaJfj8jetHWv6UJxqJomeGDsdD4fGQV/B1z8Y4BwNnSPKNCwY61lFIuQahs/kESgkkORG+gA==
X-Received: by 2002:a17:903:120d:b0:1bb:c971:ef92 with SMTP id l13-20020a170903120d00b001bbc971ef92mr8792158plh.59.1692732315450;
        Tue, 22 Aug 2023 12:25:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4e2f:8663:6f0a:bb69])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001b2069072ccsm9377559plh.18.2023.08.22.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:25:14 -0700 (PDT)
Date:   Tue, 22 Aug 2023 13:25:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Nishanth Menon <nm@ti.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Robert Nelson <robertcnelson@gmail.com>,
        Kevin Cahalan <kevinacahalan@gmail.com>
Subject: Re: [PATCH] remoteproc: core: Honor device tree /alias entries when
 assigning IDs
Message-ID: <ZOULmFR51C+9kEhZ@p14s>
References: <20230807140247.956255-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807140247.956255-1-nm@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Nishanth,

On Mon, Aug 07, 2023 at 09:02:47AM -0500, Nishanth Menon wrote:
> On many platforms, such as Beaglebone-AI64 with many remote
> processors, firmware configurations provided by the distributions can
> vary substantially depending on the distribution build's functionality
> and the specific remote cores enabled in that variant. Ensuring
> consistent udev rules mapping remoteproc nodes to constant remote
> proc device indices across distributions (yocto, ubuntu, debian and
> it's variants, ...) on a board basis can be challenging due to the
> various functions of these distributions. Varied device node paths
> create challenges for applications that operate on remote processors,
> especially in minimal embedded systems(initrd like) that may not
> have udev-like capabilities and rely on a more straightforward bare
> filesystem. This challenge is similar to that faced by I2C, RTC or the
> GPIO subsystems.
>

I'm puzzled by this patch.  I can see how using an alias can help in boards with
various HW configuration.  That said, and as written above, FW files for remote
processors can vary based on the build's functionality.  As such "remoteproc3"
will reference the same HW device on all distributions but the functionality
enacted by the FW may be different.  As such I don't see how an alias can help
here.  Can you provide a concrete example that highlights the benefits?

Thanks,
Mathieu

> Assign remoteproc device IDs based on device tree /aliases entries if
> present, falling back to the existing numbering scheme if there is no
> /aliases entry (which includes when the system isn't booted using DT)
> or a numbering conflict. If the alias node is not present, the driver
> behaves as before.
> 
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Reported-by: Kevin Cahalan <kevinacahalan@gmail.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Test log: Beaglebone-AI64
> https://gist.github.com/nmenon/365cf80d6c0685dd9be7c2cb18d7c937 (along
> with a test change to force the sequence of initialization)
> 
> The report occurred on Beagle discord channel - so I am not
> sure how to share the logs of the report.
> 
>  drivers/remoteproc/remoteproc_core.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 695cce218e8c..a12f3d37b8de 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -19,6 +19,7 @@
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/device.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/slab.h>
> @@ -2417,6 +2418,25 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	return 0;
>  }
>  
> +static int rproc_device_get_id(struct device *dev)
> +{
> +	int of_id = -1, id = -1;
> +
> +	if (dev->of_node)
> +		of_id = of_alias_get_id(dev->of_node, "remoteproc");
> +
> +	if (of_id >= 0) {
> +		id = ida_simple_get(&rproc_dev_index, of_id, of_id + 1, GFP_KERNEL);
> +		if (id < 0)
> +			dev_warn(dev, "/aliases ID %d not available\n", of_id);
> +	}
> +
> +	if (id < 0)
> +		id = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> +
> +	return id;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2476,7 +2496,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		goto put_device;
>  
>  	/* Assign a unique device index and name */
> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> +	rproc->index = rproc_device_get_id(dev);
>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>  		goto put_device;
> -- 
> 2.40.0
> 
