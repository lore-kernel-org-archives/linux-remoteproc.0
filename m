Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A887C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Jan 2021 22:19:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF67B64DEB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Jan 2021 22:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhA2WTL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Jan 2021 17:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbhA2WSD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Jan 2021 17:18:03 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE145C061756
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Jan 2021 14:17:22 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id 8so768701plc.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Jan 2021 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BTULVrI/vxDASF/UyJoisyXUkjtnllNUgx9xtaYIUVo=;
        b=ySDexUx/Hsosx3dg1UW8GAS7157vCLcXZAn7a0VBVzC7zQz5JmtpkwE8VswIMEWYaQ
         VWSMSXswxkReEOVKf95qjaeWWmW+vAK18Lj3xQSyrHa4nEzoTFu81qnxiLdoGVU5+E8E
         AIbTvYo27DP0yjtLjmnbRpYp/UnuM0X+jTpub+yF4geHvQpe0ufIV+3kVatRfY1KycLx
         hD1EDLt/sVCyoxNcSU/FwvySRhASTN+mJoW/nu+BoLgiMx8IxU3RsAhrZBbe4KdX9ac+
         iCmwSYrg8fpzSlmOohfXuNKZnFkNC5uetGGb0/KebgGvNX3ykEIQDgmMljenQ7XJHDm7
         rMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BTULVrI/vxDASF/UyJoisyXUkjtnllNUgx9xtaYIUVo=;
        b=AHK5//XSLj3UKJQSOVApPus9bey1JD52+ErE5WGfj1y/PqTqfhRseo5u6VoRsqcx/5
         8JvNeQ02dXnLMkOjjObK/re7sQTjN+CSe3/BVqNUsALlOpwpLlh5+g8TJal9By/mNHaW
         ZoZqkqLiHdbLLrD2yNPuSRjqAJhVkL5sMXdOjJvFvLb5bbXYIXxfUobZFV+znfJYSRW1
         u1PQR0o9oJpeE2WXs5DzzB0UK8QGduqEmDdW2EvTSMOPibALHJeSMAQZecmrjptyMMlo
         0IlntWU5VHl3AZX5wTxNyrvfp+Pay/5cc+YT533+HrtZ/5c+3ve8HY8o4OGK1Ae9DHLz
         qHcA==
X-Gm-Message-State: AOAM531r7oguBbfp9BokA/Pi2JbIDtY1siTD9xVC6DuBLiyfp3ug+Xqy
        GYtvj1rQ2F+Grg33Eo9rpi1Now==
X-Google-Smtp-Source: ABdhPJzQ/UkcuFzFyZMyTOTk/lAv72+1e6hw8bh6a+BwgObW12jqfjoBlF/mAykIeVsgOHBEVrdZ8w==
X-Received: by 2002:a17:90a:f988:: with SMTP id cq8mr6533303pjb.71.1611958642328;
        Fri, 29 Jan 2021 14:17:22 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q2sm9642114pfg.190.2021.01.29.14.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 14:17:21 -0800 (PST)
Date:   Fri, 29 Jan 2021 15:17:19 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/17] remoteproc: Introduce function __rproc_detach()
Message-ID: <20210129221719.GB1319650@xps15>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-12-mathieu.poirier@linaro.org>
 <5419749d-5e81-8b0c-616f-e0d5e237ac9a@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5419749d-5e81-8b0c-616f-e0d5e237ac9a@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 27, 2021 at 09:46:58AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> > Introduce function __rproc_detach() to perform the same kind of
> > operation as rproc_stop(), but instead of switching off the
> > remote processor using rproc->ops->stop(), it uses
> > rproc->ops->detach().  That way it is possible for the core
> > to release the resources associated with a remote processor while
> > the latter is kept operating.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index fc28053c7f89..e665ed4776c3 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1670,6 +1670,48 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * __rproc_detach(): Does the opposite of rproc_attach()
> > + */
> > +static int __maybe_unused __rproc_detach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	/* No need to continue if a detach() operation has not been provided */
> > +	if (!rproc->ops->detach)
> > +		return -EINVAL;
> 
> I wonder if this ops should be optional.

Function rproc_validate() doesn't check for it so it is optional.  Returning an
error is to indicate to sysfs the operation is not supported if someone tries to
do a "detach" when rproc::ops doesn't provide it.

> 
> > +
> > +	/* Stop any subdevices for the remote processor */
> > +	rproc_stop_subdevices(rproc, false);
> > +
> > +	/*
> > +	 * If the remote processors was started by the core then a cached_table
> > +	 * is present and we must follow the same cleanup sequence as we would
> > +	 * for a shutdown().  As it is in rproc_stop(), use the cached resource
> > +	 * table for the rest of the detach process since ->table_ptr will
> > +	 * become invalid as soon as carveouts are released in
> > +	 * rproc_resource_cleanup().
> > +	 */
> > +	if (rproc->cached_table)
> > +		rproc->table_ptr = rproc->cached_table;
> > +
> > +	/* Tell the remote processor the core isn't available anymore */
> > +	ret = rproc->ops->detach(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> > +		rproc_start_subdevices(rproc);
> 
> Not sure that this would be possible in all cases, without a unprepare and
> prepare. What about having the same behavior as the rproc_stop failure?

I thought rproc_stop()'s failure path was buggy and could be improved but as you
say, there might be other ramifications to take into account.  I agree that it
is more prudent to follow the current behavior from rproc_stop() and leave
enhancements for another patchset.

> 
> Thanks
> Arnaud.
> 
> > +		return ret;
> > +	}
> > +
> > +	rproc_unprepare_subdevices(rproc);
> > +
> > +	rproc->state = RPROC_DETACHED;
> > +
> > +	dev_info(dev, "detached remote processor %s\n", rproc->name);
> > +
> > +	return 0;
> > +}
> >  
> >  /**
> >   * rproc_trigger_recovery() - recover a remoteproc
> > 
