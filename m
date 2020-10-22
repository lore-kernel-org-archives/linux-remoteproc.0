Return-Path: <SRS0=sj05=D5=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF45EC388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 21:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6572424630
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 21:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbITCrNK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372562AbgJVVzq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Oct 2020 17:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S372543AbgJVVzp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Oct 2020 17:55:45 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4600C0613CE
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 14:55:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t4so1672618plq.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bSdK3k1TBbRvuC/WhxV3YJ28gX0IxP9ViGk2wq1xS2Q=;
        b=AbITCrNKTuknwF6qrZRzkc5DHZUMX5UOeoGS7JSCmxWMjVjjaFuA2EkrusTrpW6Cki
         w36yMHpzn0BqMRBSO2vtIUvJ9xNHj4u4+bw5CeuAXv4PtpdCHTnnW4tF9Du/kHvEljhC
         ERdCYtO7Kr4Xm3FDXcCsvmNc2YPpL+xJtUTfD6CVTZoBl+KL7qCeeI/yeTEuRP+gzgJM
         eAQpPmIN95lREuppjw0SV3XlI+nsLil5vcDZAFdiXKfrPWb99VsSlXC9OPQGLytg2PIK
         A9i+3fM4m14mH2wUeHRgcj6NvNN58JEAnTUfCgKRYKlvvqqF2akKaGQhy4IP+lpNmnuk
         lX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bSdK3k1TBbRvuC/WhxV3YJ28gX0IxP9ViGk2wq1xS2Q=;
        b=RrZaTbvhQCIWVKQ9QNJUjoiTSzThkBtymZqwGxhfCEcQY7G6XWwKTNxZ/K6NAsAazq
         LOCps1EIW336/edAyDrz/SILeMGP47fQHBwLLrAB/bRmFFNoyQYVvbMWlfI3B7DZbiNh
         pl9NH/hMUAkB+kIncbWN1axI8sGT4Ij7JnGnp+atvsiXAj1SaWXPxo0+d1cUtLQUhsrn
         UChvbfzSCX703j4Wor6Z1CmM1q8t41QMg8cwa/Gu/V7X4+sfIkaYozJEJLFDmjC7JsLR
         kk7lYMs8DK+2U+XfpMiagOzwoK0JkaMj0XN1qM2iMkWvMAZ00Lj8gap9V5rt2SQtfBQq
         QGGw==
X-Gm-Message-State: AOAM530SB5RzoMQdvHZpXhueZGvpsGG/YyLdUqQSHGVO5Uzz2TzPXZQQ
        juvUoCUaRSyAEAVoKZWyIJ97VQ==
X-Google-Smtp-Source: ABdhPJze/0ucwSlNo6Sj0+n/Xq7z65wxa9rP9ler9euuaWpxzyVGkOkTCgwTXXn12EkWiN6Jp4euxA==
X-Received: by 2002:a17:902:5989:b029:d5:f682:ceac with SMTP id p9-20020a1709025989b02900d5f682ceacmr4133559pli.64.1603403745000;
        Thu, 22 Oct 2020 14:55:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t15sm3005436pjy.33.2020.10.22.14.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 14:55:44 -0700 (PDT)
Date:   Thu, 22 Oct 2020 15:55:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/13] remoteproc: Introduce function rproc_detach()
Message-ID: <20201022215542.GB729430@xps15>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-8-mathieu.poirier@linaro.org>
 <DB6PR0402MB2760F33EF3C3BF69D737899688020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2760F33EF3C3BF69D737899688020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 15, 2020 at 01:52:16AM +0000, Peng Fan wrote:
> > Subject: [PATCH 07/13] remoteproc: Introduce function rproc_detach()
> > 
> > Introduce function rproc_detach() to enable the remoteproc core to release
> > the resources associated with a remote processor without stopping its
> > operation.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 65
> > +++++++++++++++++++++++++++-
> >  include/linux/remoteproc.h           |  1 +
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> > b/drivers/remoteproc/remoteproc_core.c
> > index 7a1fc7e0620f..f3943a1e2754 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1644,7 +1644,7 @@ static int rproc_stop(struct rproc *rproc, bool
> > crashed)
> >  /*
> >   * __rproc_detach(): Does the opposite of rproc_attach()
> >   */
> > -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> > +static int __rproc_detach(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> > @@ -1887,6 +1887,69 @@ void rproc_shutdown(struct rproc *rproc)  }
> > EXPORT_SYMBOL(rproc_shutdown);
> > 
> > +/**
> > + * rproc_detach() - Detach the remote processor from the
> > + * remoteproc core
> > + *
> > + * @rproc: the remote processor
> > + *
> > + * Detach a remote processor (previously attached to with rproc_actuate()).
> > + *
> > + * In case @rproc is still being used by an additional user(s), then
> > + * this function will just decrement the power refcount and exit,
> > + * without disconnecting the device.
> > + *
> > + * Function rproc_detach() calls __rproc_detach() in order to let a
> > +remote
> > + * processor know that services provided by the application processor
> > +are
> > + * no longer available.  From there it should be possible to remove the
> > + * platform driver and even power cycle the application processor (if
> > +the HW
> > + * supports it) without needing to switch off the remote processor.
> > + */
> > +int rproc_detach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	ret = mutex_lock_interruptible(&rproc->lock);
> > +	if (ret) {
> > +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> > +		return ret;
> > +	}
> > +
> > +	if (rproc->state != RPROC_RUNNING && rproc->state !=
> > RPROC_ATTACHED) {
> > +		ret = -EPERM;
> > +		goto out;
> > +	}
> > +
> > +	/* if the remote proc is still needed, bail out */
> > +	if (!atomic_dec_and_test(&rproc->power)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	ret = __rproc_detach(rproc);
> > +	if (ret) {
> > +		atomic_inc(&rproc->power);
> > +		goto out;
> > +	}
> > +
> > +	/* clean up all acquired resources */
> > +	rproc_resource_cleanup(rproc);
> > +
> > +	rproc_disable_iommu(rproc);
> > +
> > +	/*
> > +	 * Set the remote processor's table pointer to NULL.  Since mapping
> > +	 * of the resource table to a virtual address is done in the platform
> > +	 * driver, unmapping should also be done there.
> > +	 */
> > +	rproc->table_ptr = NULL;
> > +out:
> > +	mutex_unlock(&rproc->lock);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(rproc_detach);
> > +
> >  /**
> >   * rproc_get_by_phandle() - find a remote processor by phandle
> >   * @phandle: phandle to the rproc
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h index
> > 1a57e165da2c..6250491ee851 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev,
> > u32 of_resm_idx, size_t len,
> > 
> >  int rproc_boot(struct rproc *rproc);
> >  void rproc_shutdown(struct rproc *rproc);
> > +int rproc_detach(struct rproc *rproc);
> >  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> > int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t
> > size);  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> > --
> 
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> Not relevant to your patch, just see unregister_virtio_device not set device
> status when reading code, should that add device status setting in
> unregister_virtio_device?

I must admit that I don't understand the question - would you mind rephrasing or
expanding?

Thanks,
Mathieu

> 
> 
