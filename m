Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A73AC54FCC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 05:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A29A206F6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 05:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7vaHHtU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgDTFV1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 01:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgDTFV1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 01:21:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09C1C061A0F
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:21:25 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d17so4513126pgo.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T7ZlRQYjsRe6mHtLpYYJwkxOYZeO5hK5F0hqEcUsNCc=;
        b=g7vaHHtUVDqb5tqsxXssZqtVmcSUPX96xaP/OtoYqkuFQJOkmRuqP1IcxMifMvpMhz
         F1eVkyFGq2sftEGjXTx+2MjT8c9n69ifZ7WBHuwrznDE1LcZ20mNIi8dY7mB2Q37qDLf
         F5SokxBbQ1OF+P6vhP9Hms4//rVZoeKuB4kx1I0x2EXBCjr89LUkjKB+0C7xmpNMAn3P
         JgxoJlDsxHs8um5RBefQrYGw/skoMrzzr9Y6oikjzRxSU4a6SHGj60IlA7HMpk8ebitQ
         hyn8Xkc1RKIE12YphbwNUe5xDXBQ7zuaulVRRtjl6mUADH5e4Oh9pJ2WQzIDs42h0FKj
         o8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T7ZlRQYjsRe6mHtLpYYJwkxOYZeO5hK5F0hqEcUsNCc=;
        b=I3YUUJm2EGzxLlWppStaJkrcnJSFF6Gx+A64E3eVjOZsH601uTMkdvbaSJ+bMhC1yK
         UiHdeFZa8mWQqPypX5JxsY9IE0TrRD1iEgsNN+W6e0zadxvyTzx+itEBpGBboJgkIl1N
         miSaC+B3jOuBK80rVPD6WHeivPNJAI9vkEYLryNwpRWRkAa76DJwI27TcHuj0GsK/kre
         62tLAtod9qAHg+rkhhSG7MBakrSRLVcXv+i5KNU32eLf9zUVFnBT8exhE+wPM4c8x8p3
         +Iknm+Bx+lsk8HP6zH8VlKD25oN/aqV2dqFAX/nAR8DWTlYgRmdzTr6E0oNuObBUfroj
         narQ==
X-Gm-Message-State: AGi0PubKrAqiwpGdyKr15QyQRtJrSbiAB5ogspw5c/ayMVuvZ338Nl2D
        Zq8QjTg/glkydepV7bBD8mKSag==
X-Google-Smtp-Source: APiQypKJ85itZZbu2VlNkNAKuVimTOoYwZ/peC6RFa05nxUbOI31MtFmFUsQcQuQdMi48cd8ef1L+Q==
X-Received: by 2002:a62:3287:: with SMTP id y129mr13122409pfy.167.1587360085116;
        Sun, 19 Apr 2020 22:21:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s10sm12586974pjp.13.2020.04.19.22.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:21:24 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:21:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Alex Elder <elder@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] remoteproc: Use kstrdup_const() rather than
 kstrup()
Message-ID: <20200420052147.GF1516868@builder.lan>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-5-mathieu.poirier@linaro.org>
 <14b12ca8-823b-8115-bafa-281180e92c70@linaro.org>
 <3f0a602a-64ff-8092-3cca-b63bab8a79f0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f0a602a-64ff-8092-3cca-b63bab8a79f0@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420052147.MF3hJibf9UdiFPEi1ZL5OK34w7eWFndD1mwXqdiYvP4@z>

On Fri 17 Apr 06:44 PDT 2020, Suman Anna wrote:

> On 4/15/20 4:25 PM, Alex Elder wrote:
> > On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> > > For cases where @firmware is declared "const char *", use function
> > > kstrdup_const() to avoid needlessly creating another copy on the
> > > heap.
> > > 
> > > Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > Looks good.
> > 
> > Reviewed-by: Alex Elder <elder@linaro.org>
> > 
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 4 ++--
> > >   include/linux/remoteproc.h           | 2 +-
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 9899467fa1cf..ebaff496ef81 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1982,7 +1982,7 @@ static const struct device_type rproc_type = {
> > >   static int rproc_alloc_firmware(struct rproc *rproc,
> > >   				const char *name, const char *firmware)
> > >   {
> > > -	char *p;
> > > +	const char *p;
> > >   	if (!firmware)
> > >   		/*
> > > @@ -1991,7 +1991,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> > >   		 */
> > >   		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> 
> So, to be consistent for both paths, should we be using kvasprintf_const()
> here and kfree_const() in release.

Given that the second argument is a "proper" format string
kvasprintf_const() is really just kasprintf() - but with the requirement
that we set up a va_list. So I prefer that we stick with this.

> The kfree_const() is needed to account
> for the kstrdup_const below for sure.
> 

You are correct Suman, this patch needs to also change the kfree() to a
kfree_const() or bad things will happen after a visit to
rproc_type_release().

Regards,
Bjorn

> regards
> Suman
> 
> > >   	else
> > > -		p = kstrdup(firmware, GFP_KERNEL);
> > > +		p = kstrdup_const(firmware, GFP_KERNEL);
> > >   	if (!p)
> > >   		return -ENOMEM;
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 9c07d7958c53..38607107b7cb 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -489,7 +489,7 @@ struct rproc {
> > >   	struct list_head node;
> > >   	struct iommu_domain *domain;
> > >   	const char *name;
> > > -	char *firmware;
> > > +	const char *firmware;
> > >   	void *priv;
> > >   	struct rproc_ops *ops;
> > >   	struct device dev;
> > > 
> > 
> 
