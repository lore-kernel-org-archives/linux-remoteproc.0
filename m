Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C3AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72FBD61101
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhKCRvj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Nov 2021 13:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhKCRva (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Nov 2021 13:51:30 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431A6C061714
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Nov 2021 10:48:54 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso4591192otv.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Nov 2021 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=omzrXl3AMxoYwQop1Z9e6ITdZ0Oj3fQEEicV3c4v+10=;
        b=tsmVfrgbqSTJ9zRhkS5IbyesET44cUZkYqgOnrx1UrrW0MyhSAQhUwvBe1815cq1Ep
         JJlFeH7l8k4ncGVsPCYjirYmvwYGEJPUPCMBuSv2GCJeUtt1W7sdDlTdhyV3/LR8GW8O
         yHcWiL1hD8KvgEjcVB8Jo5SW89fRYLmyC9TnryEcIbFaSN2PEt16Ny0zCsEFGeWUei0W
         nh8LacddBulkq8XKXidoqATLGna6nlE6T99XorMd17uBWENAGze7FchQ7JZS+nG+vnMN
         cBooxpVattka/C61T48+2cSSjyAXsTIkawteMXaWwDzELmXePfZQvze/BJOwXPIE43e3
         YGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=omzrXl3AMxoYwQop1Z9e6ITdZ0Oj3fQEEicV3c4v+10=;
        b=OBqQfkGkirykJB2rTci2XG0UM3ykHg8ES9wCj0ykMvobl8l8Qh2tq12PfHXKLc7y2m
         WytxOf3jVQ0ZFbi+vx2JJ6UCF17CfBqUsqwzqaNrryAs6xVZmrSLHkDd87T9+sO2h6pr
         BQSH+wkeTCAfk7GghpPWeEiLzI7DYGKoYa50QDLQ1Tvv8eyiKP6VlaheJKR6e+aCUlUN
         q+GZNCHmMydDQ1saxW7Sb2dMp6tLS8HZARIGVxB27kgG+/OQRiq5EgzCOTqQkQ5y6YK9
         KcE/XGiuPjEEou02+oKjmOxCM9ATUA4V923DdBvKA83tqYKpUSk+rsteCiBTuP9kzs3K
         cqwg==
X-Gm-Message-State: AOAM530M7vurKynMp7lvgLxDzzc6MMV8agBhiZlPnPiHjTyt/4MASrs2
        Ul8lXeWn0LAMQBTtwXy9N0YO0w==
X-Google-Smtp-Source: ABdhPJzZEr6/9xn2flaFERVz2VE/i8B+bW+zvaDRZS8WhTDS7/J0VjiOAz5UlcvMFU6mpKrI9N7Wng==
X-Received: by 2002:a05:6830:1d61:: with SMTP id l1mr35561186oti.297.1635961733608;
        Wed, 03 Nov 2021 10:48:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u7sm787785oiu.41.2021.11.03.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 10:48:52 -0700 (PDT)
Date:   Wed, 3 Nov 2021 12:48:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v6 02/10] rpmsg: create the rpmsg class in core instead
 of in rpmsg char
Message-ID: <YYLLf1/R5gJJfo/H@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
 <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
 <YYFpit0SixojReo+@ripper>
 <16853c3d-0b23-4d59-9c33-c7c99da4b9a1@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16853c3d-0b23-4d59-9c33-c7c99da4b9a1@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 02 Nov 12:11 CDT 2021, Arnaud POULIQUEN wrote:
> On 11/2/21 5:38 PM, Bjorn Andersson wrote:
> > On Tue 02 Nov 08:23 PDT 2021, Arnaud POULIQUEN wrote:
> >> On 11/1/21 5:57 PM, Bjorn Andersson wrote:
> >>> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
[..]
> >>>> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>>>  }
> >>>>  EXPORT_SYMBOL(rpmsg_poll);
> >>>>  
> >>>> +/**
> >>>> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
> >>>> + *
> >>>> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
> >>>> + *
> >>>> + * Returns the struct class pointer
> >>>> + */
> >>>> +struct class *rpmsg_get_class(void)
> >>>
> >>> What value does this helper function add? Can't we just expose
> >>> rpmsg_class directly?
> >>
> >> look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
> >> variable is read only for rpmsg services.
> >>
> > 
> > The pointer is read only, but the object isn't. So I think it's cleaner
> > to just share the pointer in the first place.
> > 
> > But that said, looking at this a little bit more, I don't think there's
> > any guarantee that class_create() has been executed before
> > rpmsg_ctrl_probe() is being invoked.
> 
> class_create is called in in the rpmsg_init (rpmsg_core.c). as RPMSG_CTRL and
> RPMSG_CHAR depend on RPMSG config this use case should not occurs, or did I miss
> something?
> 

Specifying "depends on RPMSG" in the Kconfig doesn't directly impact the
load order.

But in expanding my question I realized that rpmsg_ctrl_probe() will
only ever be invoked if rpmsg_ctrldev_init() was able to call
register_rpmsg_drive(), which in turn depends on rpmsg_init() having
initialized rpmsg_bus of the driver_register() will fail.

So we should be good.

Thanks,
Bjorn
