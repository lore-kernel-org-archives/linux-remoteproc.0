Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C27C47089
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F1C4610C7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhE1DI7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236229AbhE1DI6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:08:58 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB855C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:07:23 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id x15so2886425oic.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=89Ift1OU78vKtiGlNnIxDJCwM07AOIScHSivLdjVYhE=;
        b=rn4NEkcrpv1c/o1jdjygsc3kzakWgXejAkh0y1fGD1jSkvspt5vZv+KUbcnjnTjZ9H
         zlS2ox/g2O+oQBf53t1niN+/XlEmpiWCHOd1X7vK9OkmlfPtMhLkjqFLKs45elo1z642
         7fVvKztv7sbNjq2c2zKKeyVqhajiW+OgNiPCs3qY+uB9z8EcL2GaKwbyOhLu56QXB5Sz
         5lXxL7enT8hcp7UhIHuhCkZkcRx/Q20aN87kEO29Wr9Jy4soHZdoEICnZ894JwPuH/d5
         aEmEVx8mAHksbR2iLe8CUQrNDPuOpnaSiwhmO3ApTAeqqC4taueSEQLJ4xifBgwWw9zx
         GJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89Ift1OU78vKtiGlNnIxDJCwM07AOIScHSivLdjVYhE=;
        b=d0NnXcKmi95qsUYGATzyEEFQFil+MUHAC7RjBQWJLOXVS+f49LYVrDjQkKmjug9B4h
         bInNdP7gPSjlgMkEt9vfC6zmbm842bPSzReq5Obh+kr1Jv8CplbsDQoWdGM0IbkkE305
         c4e/zBPzkQua2jbDJfOHbgJHCBE+md3CluEJmJsYXJhOnX+pWyuA7z3H+3ugHDHsX5r0
         7uX/KQGYsFEIkumTk8GLQp/blp+x4WD0kZQ64BuJ3BX4iY7Ikzu0nO9Q7dWcXKUz+xpc
         edwddIBpNO5ijpSK2Ami5KEs426w08dcE+1Rz2AmbVJQBjDWb3zG2mNZHjGcLMVqmFtm
         9r5A==
X-Gm-Message-State: AOAM533TRMa+/q4kJuSLSutFB3plOS1cAaP5oj374isFc2nFPBivFyIL
        yYOMrqVv+rZl+E7E/zLE/2EaCQ==
X-Google-Smtp-Source: ABdhPJy3bKWc2VMwI2rT0Nf0xgty4fAnT+udrJLeLwBkNxnBNKtnjPN2Q3vPH3brtW8w7DJZ6oZPHQ==
X-Received: by 2002:aca:1916:: with SMTP id l22mr4606188oii.48.1622171243112;
        Thu, 27 May 2021 20:07:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i17sm825381oou.37.2021.05.27.20.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:07:22 -0700 (PDT)
Date:   Thu, 27 May 2021 22:07:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: Fix various kernel-doc warnings
Message-ID: <YLBeaE8IWlmDjHaY@builder.lan>
References: <20210519180304.23563-1-s-anna@ti.com>
 <20210519180304.23563-3-s-anna@ti.com>
 <20210525180006.GD1113058@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525180006.GD1113058@xps15>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 25 May 13:00 CDT 2021, Mathieu Poirier wrote:
> On Wed, May 19, 2021 at 01:03:04PM -0500, Suman Anna wrote:
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
[..]
> > @@ -362,7 +366,7 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
> >   * This function finds the location of the loaded resource table. Don't
> >   * call this function if the table wasn't loaded yet - it's a bug if you do.
> >   *
> > - * Returns the pointer to the resource table if it is found or NULL otherwise.
> > + * Return: pointer to the resource table if it is found or NULL otherwise.
> 
> Here the '.' has been kept while it was remove for all of the above.  I don't
> know that the right guidelines are for this. 
> 

Reviewing https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
I don't see that this is defined. So I'm fine with whatever looks good.

That said, the section about "Return values" shows that the "Return:
..." line should be short and concise and if needed followed by a
newline and then a longer paragraph.


I'll fix the capitalization of "the" below and apply this as is and we
can go back an reformat these multiline Return entries later...

> >   * If the table wasn't loaded yet the result is unspecified.
> >   */
[..]
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
[..]
> > + * 2. immediately following this structure is the virtio config space for
> > + *    this vdev (which is specific to the vdev; for more info, read the virtio
> > + *    spec). the size of the config space is specified by @config_len.
> 
> s/the/The
> 
[..]
> >  struct rproc {
> > @@ -613,10 +617,10 @@ struct rproc_vring {
> >   * struct rproc_vdev - remoteproc state for a supported virtio device
> >   * @refcount: reference counter for the vdev and vring allocations
> >   * @subdev: handle for registering the vdev as a rproc subdevice
> > + * @dev: device struct used for reference count semantics
> >   * @id: virtio device id (as in virtio_ids.h)
> >   * @node: list node
> >   * @rproc: the rproc handle
> > - * @vdev: the virio device
> >   * @vring: the vrings for this vdev
> >   * @rsc_offset: offset of the vdev's resource entry
> >   * @index: vdev position versus other vdev declared in resource table
> 
> With or without the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 

Thanks Mathieu, and thanks Suman.

Regards,
Bjorn
