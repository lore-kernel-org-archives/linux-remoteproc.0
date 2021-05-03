Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B01C433B4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 17:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99C78610E9
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 17:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhECRng (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 May 2021 13:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhECRnf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 May 2021 13:43:35 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2CEC061761
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 May 2021 10:42:41 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3811653pjv.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 May 2021 10:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YwS8hQU33H1/ZeBZdRBG9ZJ/sKIODEM23v4su4rhiCc=;
        b=dIevIsu+BecbCDIM9vCBTdsPIaXduatZL5c7A0AoUn5fKQ0NyNS3wvgxnmo+3iz1OB
         bv9uA4L1dDIlulUeRitvUnI+TG+9ndoRh1q3j5wywyfDcEg2EMWAZCsAkUZ0sktXgrMw
         gLDSgKJDMfHs6Y8JvuewH3RIv/4xjjbFKC1o3m7Nf5gEc0Qx5+78Ah6pO26iiV1NN/J6
         OwWCCVIFiE9wze5yMp5o769ro4M3+RI9gb9VTi/vesW1Ao2Dk/Qzd6cVttXI8yV1FpVu
         rd3DqiPKVvl9S3tNnIB4SjimSDxqyksXs8kqfHXp9AcQnXzjzH4KTvAX0gFJyATFhjC0
         yHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwS8hQU33H1/ZeBZdRBG9ZJ/sKIODEM23v4su4rhiCc=;
        b=SMwTjiKR2IjrMv0vaiCxL+xgpJKkcYmrdgGcYPlwbnwRfSWWJLBSJPSrXZy/UFuGkL
         u8K6+bjiaHi6pJCZh18cm3VpJLWw2eOFV+FqIB5FXz8kQPLAqUVf26/cM9GKw2XxouE5
         axi8sd0snvUKG7iqOXL2XA4GdkwbpdviiPqIiJNfO+EBvTyth8yFy0JdMYfhTo3jdJcP
         6mX/J1I35222ls6yWJHsp68eLzCXDPu5V+H0mEibBOGpgT9W40GLzfWFtlcmf3O9g9ZB
         D2T8dX6xHxZW/Bl3MUxv9PPjAydaTs/j54pbWF8tl2eV/9pLevnGNicL4FA8kJJzqjm7
         caSQ==
X-Gm-Message-State: AOAM5329SYoXnvFkJAn+j95Uzhb+1F5YU7fXKZKx3XnJlj8DsyRW9hgL
        74ts7/WDYVflMDOE9DdsHmeMow==
X-Google-Smtp-Source: ABdhPJzTQEVa1Em9j/IFmpfCNW+75vCOby+/gmN3VVIzRlRGpxwsE43eZzakv3nxEXUiOCvj5fYExg==
X-Received: by 2002:a17:90a:9f02:: with SMTP id n2mr16264556pjp.190.1620063761016;
        Mon, 03 May 2021 10:42:41 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u20sm194311pgl.27.2021.05.03.10.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:42:40 -0700 (PDT)
Date:   Mon, 3 May 2021 11:42:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: char: Remove useless includes
Message-ID: <20210503174238.GD1699665@xps15>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 29, 2021 at 10:06:39AM +0200, Arnaud Pouliquen wrote:
> Remove includes that are not requested to build the module.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> applied without issue on Bjorn next branch (dc0e14fa833b)
> ---
>  drivers/rpmsg/rpmsg_char.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..e4e54f515af6 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -10,19 +10,10 @@
>   * was based on TI & Google OMX rpmsg driver.
>   */
>  #include <linux/cdev.h>
> -#include <linux/device.h>

This is where the declaration for struct device is along with other goodies like
get/put_device().

> -#include <linux/fs.h>

That is where struct file is declared.

> -#include <linux/idr.h>

This is where you get ida_simple_get() and ida_simple_remove() from.

>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/poll.h>

This is where struct poll_table and poll_wait() comes from.

>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
> -#include <linux/slab.h>

This gives you kzalloc() and kfree().

> -#include <linux/uaccess.h>

This gives you copy_from_user().

> -#include <uapi/linux/rpmsg.h>

This gives you RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL.

> -
> -#include "rpmsg_internal.h"

That one I agree with.

Thanks,
Mathieu

>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
> -- 
> 2.17.1
> 
