Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BE9C388F9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E585421D40
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygSP/Upj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgKSXGb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 18:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKSXGb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 18:06:31 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B761C0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:06:31 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id s2so3806210plr.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L/S1TPFYem5evgm0bN9vA3lKrMNlzpr/NR15t2ingj0=;
        b=ygSP/UpjPrJhMJ2nmTKLOgA4S6MS1SmvgnT1eunr7WUBCko4KYfMcjgUI+fNE28n0e
         tRGDJlqFIiDkz9GWwddAM5PQ6j1ZDsrm7iX3GaHC3aAH4wsMyDD0iRp0UrpGBcB1P6iN
         KCgpM04YuLDGc2e80Gw5/st8F+Kag+pNr5yePKCzRc9eEwFunQl9ox5gthmbPDNYyNTI
         vDYJnlhQmz6op4eNDFITNxBTXKeE7r2Q+9V26ZoRhjulfZDB5WGMc32PTH3/K0WrmZzv
         706FX7z7fBVurSkriuGGBdEbA/3SgXHkrqFrcttDSN3JIZ0lhK4kh5lYPNQsqw2F2BIJ
         krcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L/S1TPFYem5evgm0bN9vA3lKrMNlzpr/NR15t2ingj0=;
        b=GpCN0BeQJoV9jjQNdsu7Hq6uAqrHO/LHVKhOFXQKC6X6/JHNWHvYMZOTvQbxMaMPAq
         KM2Jw67Aj5grCkmQEA1GPFFeiwQv//YngLhphUvPBBRDib5joCpn2sQkQx0gXFOP19Qv
         i+JZK8uCFzv+xnogSf7zbbL7f3ArdQgtgZxT6vF2nb7i7nLY34rJjT1dXTqW5V4kRav6
         g0ps9atRMsJru8IzKoo5fLyyh9i9I95Ltzoqskdc1QHLm28w/812Dz2gfFlD4JyaM/0i
         g6sF3hyIgM+6q5b9Mjc1nyHchN72p8ewF6Qnm89TMjtKQLushoc6k+Zbf9Am5xUaDVc+
         ON3A==
X-Gm-Message-State: AOAM531bsxKE7aYdFWhRX22RhA58nVgUZqnAkIRmNqpLw1aMuyHNIQrC
        CGbqUo6xpqI2NJWWeWWnV4ZsHrL5/XwTZA==
X-Google-Smtp-Source: ABdhPJw7Vamsv+2UJOKFzAoZAXspxs97SL7k6BGL4YYjeTLJJrWfM4EL6hdNMldl5OAhv2wLawuFwA==
X-Received: by 2002:a17:902:c14b:b029:d6:ab18:108d with SMTP id 11-20020a170902c14bb02900d6ab18108dmr11327667plj.20.1605827190682;
        Thu, 19 Nov 2020 15:06:30 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c19sm1063465pfp.1.2020.11.19.15.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:06:29 -0800 (PST)
Date:   Thu, 19 Nov 2020 16:06:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 06/14] remoteproc: Add new detach() remoteproc
 operation
Message-ID: <20201119230627.GA4137289@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-7-mathieu.poirier@linaro.org>
 <7cd3408d-55e1-00b8-e73d-d46c95c0d9c3@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd3408d-55e1-00b8-e73d-d46c95c0d9c3@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 06, 2020 at 06:31:30PM +0100, Arnaud POULIQUEN wrote:
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> > Add an new detach() operation in order to support scenarios where
> > the remoteproc core is going away but the remote processor is
> > kept operating.  This could be the case when the system is
> > rebooted or when the platform driver is removed.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  include/linux/remoteproc.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 3fe2ae0bd1ca..3faff9bb4fb8 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -361,6 +361,7 @@ enum rsc_handling_status {
> >   * @start:	power on the device and boot it
> >   * @stop:	power off the device
> >   * @attach:	attach to a device that his already powered up
> > + * @detach:	tell the remote processor that the core is going away
> 
> This comment seems to me rather ambiguous...
> "tell the remote processor" could means communication with the remote processor.
> The term "remote processor" is used for this op and "device" for the other ops.
> Proposal:
>  detach from a device by leaving it power-up.

I agree - now that I'm looking at it again it is quite obvious.

> 
> Regards,
> Arnaud
>  
> >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> >   * @da_to_va:	optional platform hook to perform address translations
> >   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> > @@ -382,6 +383,7 @@ struct rproc_ops {
> >  	int (*start)(struct rproc *rproc);
> >  	int (*stop)(struct rproc *rproc);
> >  	int (*attach)(struct rproc *rproc);
> > +	int (*detach)(struct rproc *rproc);
> >  	void (*kick)(struct rproc *rproc, int vqid);
> >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
> >  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
> > 
