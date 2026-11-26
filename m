Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714960;
	b=nwIkEULIIsG2dlDRBbBrWy2yRtZNILoxF86oTjhSM7521xbQEWjCvxOAGiCPpViogx9c
	 MWRmqw9uG078wUQXWLvH6E3mOzS6+PViBYGFmU6cbRNF/GvuxuairC2zI5lY3+w5m2FLy
	 feP4/LaqfKVV0AUtE1Avj0OLRT++AkmeSsCeakjJaFJHgEPyCciRTVkoS4dvQVT1Z45MG
	 LN/Rk3+kB7e7n5pHhgz1/LoNjIm3uYtr2txrsadeIrq7w5B1GzfMzcdyWk1yWY4zwkn32
	 llhTl9NUs0bYC3WgUAN6B0MQ75Mh8eQrNFxY3y2guOdlOyknJOjZV5u+x0NtPfbAYcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
	b=W7rb1gESGwkY8CJGGwPBj+konfBkXpI0rG+nMjwoq8duHeATHSHjXtitCdoFj+/TFOQE
	 BplwWGp3ECu7ugG3rg7mU4glvU1E3da0V6Sg1hZapQiDY3TD504QvJnScOfGrzwyWlwyT
	 odcFttsZCEsjmtSdtuIznH/dmFA/nX477bsVcpySaGhsWKPI2Ar+NOkfuhWDDcf1HFA15
	 OfQNNpau757SZ4tcDHP9ARuUwfNhKiTWx3/7pT99CDCXk3nviOgBqnLIitiv69Gg8TPSj
	 uNVp2YpxAzIjwgpuvmoMoapX4R5dIsB5YjuQY976dpBkwtXxDuKhTHc1lP+NCHEaQKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d9wPuUuJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F466606A31C
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 17:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F466606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d9wPuUuJ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e246acc2so51904047b3.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 09:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714958; cv=none;
        d=google.com; s=arc-20260327;
        b=HvI0T/I3ac6JePSRmEV+T2h2yY18ZvMLyr/V2kNc+azT5UwoBhLOGr1WQxWdIkh9IO
         xpGHs7dtFzlmQ6pN+LJSjk53ItOoC5TFNHt+kL+g3W0hX+F3aXCuwhnSRSIg+mFPTruQ
         YWN6udsWuOa0KEnj+UYkTgz9Hyjt1SI7AWznN8RQC8SYc8gUZEWu+4ETBEuzLOtsx8zz
         4+0AhhsfaStSQypzHywoMsB3iSOt1I1/yfATimIV9TEcs3U01PK8g3O3j9tKO2JA7vaI
         Y3I5gGHh50cUnpIbsymxUb2PO5M5N/OHbi7GIzFX3+5cU0PDI8Ua2Cy3GLEZ4dCqgjZg
         GJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        fh=w2gL7fHE+H13q8uFhiHwXynvDtNVVv8J7SJOUPdAgxo=;
        b=OP1iuxw4HmcVJgtk8NUYImylLDJyAVcTkKRabzPA7lKWMviWprC+xyTHnPJeg6kdkx
         iCkUjgucGD4iiFADOIDNtf4gfvNGhNhmyfxDcT3HLRx15S0md4YBjXYPABzjHYGgRfwg
         PA05z45hm9z9R6TAVutD+CWZ8HCNygkyLaltBP8pbwPW7+Tcjof+rIHzjAMr+bDlkl9A
         V+WedBVCPkKbyjK+BcBqlsN03J/fbwuEyQBw7ugVgO47b6imWaQpW/TZ8aTjUDIWU99Q
         1wRcNpuQj+svRBaEFnXCsWQPgFK9RKRgMPW2aV2vPRspcqIgKI2hMCgI8Ppm3n3nuYIT
         z+/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795714958; x=1796319758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        b=d9wPuUuJgFU6QwSFh6DCWfnkKCH5YaZivAml29sN1ZGzTPbxj8oMNhb6sd9esBDfHJ
         c3GgZGns6sswweCVlIJJzibGJADRsHZ6SPpvQKi7Zheik06QwqYQxjU4AO5Ay6FfqlLQ
         l+ZKQ6qZTNu5SdLWmo8A0q10qBaPSjmbuYbw5qte5P8/GqoAq9eRvw84bLedSWx2c9L1
         Sp8L1dR5EcuOiKEx23awKvTkKHSP+XNWdQXaCekVYOZ1ky/f2tbOUc7zSYEIgQdWCqLE
         rM+xichVh/PSfDgaVG25VQFMnEaExgEsRhQbGWh5JgaXcJvp0jalS0BtDRIy3e7SMWAu
         McHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714958; x=1796319758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        b=kkwUGHBK0TxQ25timpXc5k1VRlxlUX12BxXgzwAmxMN/A7EldSgEHVN6kenPYsAMpy
         CNIHp0DrSGnZrbRmdxi4fjFJwU8h/7KwrGcySkP7fCVaWl8tRwEqY6rCGNKRAvRNqGRb
         6uFO+B6fASpF1W/uj/w2T9gOoB0OtKP6rF/Sp2sP+tMRxQjNwiodpl05kqsdU4tDHQQM
         8rL6OfhRq4Ti6xMvlQq0S1kUxoslbueIbf9YlJ8xLTMu+i4OiQDOSYrIPImoZjTLWNRv
         vnjA9DCKpbMyZLRUR4IFZKscm2PUSP9+4du7xb2DxvDMA64Lego1q037qhtF2tuzRw28
         dmOQ==
X-Forwarded-Encrypted: i=1; AL+hErGqKKugmIibbjYaNj3NmQAMEo5rfLRbv0soR3PbLkNNP5D5/9Ra0v7JL0KMaKe7iLuMFtp0Of2a6et2MEcm57lM@vger.kernel.org
X-Gm-Message-State: APuU4Z/kTCUMil+gqTWgbxj1k+QGwGRCUqGk/BGSU08b+IxHNNZQIP8i
	eM4JZWQCnkJvUNLNQWWOhNANFfX6pQpCnjQXP5UGjQIv0xffNPZOO5lbg0YWCbxBfYhGdPnvn1p
	veycmdC94QWM33BUgihMO030UE+YhfvaXG7Pt/AiyiQ==
X-Gm-Gg: AZFdTZczqwMQD9p6vNd6pahJTECqPgmVlpnQ5e/6ePXPMZhsT63JjWj3i1Z9fADcak+
	9v9E6C/gCr2vzG5PNNa74sCFLche9m/pP0OOVvZ9ca6JVVh8kpXTMGlbJB5lofY/GbA8a4QLBAA
	Zw94LxlyAnYJKf22ry7au8fT4z0hK6igsb1KYRszeQk3C7WWItqV6xjqV/h2gEhXHwwkKPmPfaQ
	GfQhHWLNlyLKRq6KSA3kKaOYE/kYmj0UWiJgjU9g34JChhR/dNs91qY0+QPUnpOpmTHmpPixAf5
	4RdPPruJD4PWuwrk9+ZV5jOhnDgJ9AVOEVr16TZRM0vXIFAJ5vcMuVYe1LHhlWNmgEe7khX3BEP
	NY8l+JhQ6Rag0FBfcAOsjoKA83TkXP9nMLh6DyKN10DxfZ/0oSEmvLNvLwmPIjHF64UZ0aG4=
X-Received: by 2002:a05:690c:4a02:b0:8b4:c71b:e4f6 with SMTP id
 00721157ae682-8b520318ba1mr80009607b3.3.1795714958293; Thu, 26 Nov 2026
 09:42:38 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-3-95235dd056aa@valla.it>
 <awhhVRBokzbdPJB2@p14s> <awhi3Kg6kdELdT0d@bywater>
In-Reply-To: <awhi3Kg6kdELdT0d@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 26 Nov 2026 11:42:27 -0600
X-Gm-Features: Aa3M54oqASU5s2O0JyDBOVttrzuqbNsOoDRdWxI1aIJEkgnWkTadU5uajOSV97Y
Message-ID: <CANLsYkyoT7dVj5OGJvqzLQ7X9U-z5vbaPdsnDDY6+PuW=WCkBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] remoteproc: virtio: Drop rvdevs list and
 associated functions
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 10:59, Francesco Valla <francesco@valla.it> wrote:
>
> On Thu, Nov 26, 2026 at 10:41:57AM -0600, Mathieu Poirier wrote:
> > On Sat, Nov 14, 2026 at 09:06:35AM +0100, Francesco Valla wrote:
> > > The rvdevs linked list is kept at rproc side to track the rproc_vdev
> > > devices registered at runtime and de-register them during cleanup, but
> > > the same information can be obtained from the driver core using
> > > parent-child relationships coupled with driver name.
> > >
> > > Drop the list and all associated functions and de-register the virtio
> > > children of a remoteproc using device_for_each_child(), with the
> > > following benefits:
> > >
> > >  - increased separation between the core and virtio parts of remoteproc;
> > >  - reduction in code and occupied memory;
> > >  - the platform devices whose probe fail are now de-registered correctly
> > >    during remoteproc cleanup.
> > >
> > > A dedicated macro is used to register rproc-virtio platform devices to
> > > avoid duplication (in code, not in memory) of the same string.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++++++++----------------
> > >  drivers/remoteproc/remoteproc_internal.h |  4 ++--
> > >  drivers/remoteproc/remoteproc_virtio.c   |  5 +----
> > >  include/linux/remoteproc.h               |  6 +-----
> > >  4 files changed, 21 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index d5fa9d23bd5c..296b955f415f 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -431,17 +431,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
> > >     }
> > >  }
> > >
> > > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> > > -{
> > > -   if (rvdev && rproc)
> > > -           list_add_tail(&rvdev->node, &rproc->rvdevs);
> > > -}
> > > -
> > > -void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > > -{
> > > -   if (rvdev)
> > > -           list_del(&rvdev->node);
> > > -}
> > >  /**
> > >   * rproc_handle_vdev() - handle a vdev fw resource
> > >   * @rproc: the remote processor
> > > @@ -513,7 +502,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >      * as device id, then we get duplication in sysfs, so need to use
> > >      * PLATFORM_DEVID_AUTO to auto select device id.
> > >      */
> > > -   pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > +   pdev = platform_device_register_data(dev, RPROC_VIRTIO_DRV_NAME,
> > > +                                        PLATFORM_DEVID_AUTO, &rvdev_data,
> > >                                          sizeof(rvdev_data));
> > >     if (IS_ERR(pdev)) {
> > >             dev_err(dev, "failed to create rproc-virtio device\n");
> > > @@ -1212,6 +1202,19 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> > >     return 0;
> > >  }
> > >
> > > +static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
> > > +{
> > > +   struct platform_device *pdev;
> > > +
> > > +   if (!dev_is_platform(dev))
> > > +           return 0;
> >
> > What other child of a remoteproc do you expect isn't a platform driver?
> >
>
> Some Qualcomm drivers *do* register children of a remoteproc that are not
> platform devices; see for example qcom_add_smd_subdev() [1] in
> drivers/remoteproc/qcom_common.c that defines smd->dev = &rproc->dev and
> then uses that dev as parent of the new subdev's bare device in
> qcom_smd_register_edge() [2].
>

Ok, I pretty much expected something like that.  Please add a comment
saying that you're skipping over devices not registered via
proc_handle_vdev().

Otherwise I'm good with the other patches in this set.

Thanks,
Mathieu


> > > +
> > > +   pdev = to_platform_device(dev);
> > > +   if (!strcmp(pdev->name, RPROC_VIRTIO_DRV_NAME))
> > > +           platform_device_unregister(pdev);
> > > +
> > > +   return 0;
> > > +}
> > >
> > >  /**
> > >   * rproc_resource_cleanup() - clean up and free all acquired resources
> > > @@ -1224,7 +1227,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
> > >  {
> > >     struct rproc_mem_entry *entry, *tmp;
> > >     struct rproc_debug_trace *trace, *ttmp;
> > > -   struct rproc_vdev *rvdev, *rvtmp;
> > >     struct device *dev = &rproc->dev;
> > >
> > >     /* clean up debugfs trace entries */
> > > @@ -1258,9 +1260,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
> > >             kfree(entry);
> > >     }
> > >
> > > -   /* clean up remote vdev entries */
> > > -   list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> > > -           platform_device_unregister(rvdev->pdev);
> > > +   /* unregister platform devices */
> > > +   device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
> > >
> > >     rproc_coredump_cleanup(rproc);
> > >  }
> > > @@ -2521,7 +2522,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >     INIT_LIST_HEAD(&rproc->carveouts);
> > >     INIT_LIST_HEAD(&rproc->mappings);
> > >     INIT_LIST_HEAD(&rproc->traces);
> > > -   INIT_LIST_HEAD(&rproc->rvdevs);
> > >     INIT_LIST_HEAD(&rproc->subdevs);
> > >     INIT_LIST_HEAD(&rproc->dump_segments);
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > > index 3a742ef6ef60..d587a3301811 100644
> > > --- a/drivers/remoteproc/remoteproc_internal.h
> > > +++ b/drivers/remoteproc/remoteproc_internal.h
> > > @@ -18,6 +18,8 @@
> > >  #include <linux/io.h>
> > >  #endif
> > >
> > > +#define RPROC_VIRTIO_DRV_NAME      "rproc-virtio"
> > > +
> > >  struct rproc;
> > >
> > >  struct rproc_debug_trace {
> > > @@ -122,8 +124,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> > >                                                    const struct firmware *fw);
> > >  struct rproc_mem_entry *
> > >  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> > > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
> > > -void rproc_remove_rvdev(struct rproc_vdev *rvdev);
> > >
> > >  #ifdef CONFIG_HAS_IOMEM
> > >  static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 6cfdab831185..403519e78ee3 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -549,8 +549,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> > >                     goto unwind_vring_allocations;
> > >     }
> > >
> > > -   rproc_add_rvdev(rproc, rvdev);
> > > -
> > >     rvdev->subdev.start = rproc_vdev_do_start;
> > >     rvdev->subdev.stop = rproc_vdev_do_stop;
> > >
> > > @@ -588,7 +586,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> > >     }
> > >
> > >     rproc_remove_subdev(rproc, &rvdev->subdev);
> > > -   rproc_remove_rvdev(rvdev);
> > >
> > >     put_device(&rproc->dev);
> > >  }
> > > @@ -598,7 +595,7 @@ static struct platform_driver rproc_virtio_driver = {
> > >     .probe          = rproc_virtio_probe,
> > >     .remove         = rproc_virtio_remove,
> > >     .driver         = {
> > > -           .name   = "rproc-virtio",
> > > +           .name   = RPROC_VIRTIO_DRV_NAME,
> > >     },
> > >  };
> > >  builtin_platform_driver(rproc_virtio_driver);
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6..77ea0e1067e0 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -228,8 +228,7 @@ enum rproc_features {
> > >   * @carveouts: list of physically contiguous memory allocations
> > >   * @mappings: list of iommu mappings we initiated, needed on shutdown
> > >   * @bootaddr: address of first instruction to boot rproc with (optional)
> > > - * @rvdevs: list of remote virtio devices
> > > - * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
> > > + * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
> > >   * @subdevs: list of subdevices, to following the running state
> > >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> > >   * @index: index of this rproc device
> > > @@ -275,7 +274,6 @@ struct rproc {
> > >     struct list_head carveouts;
> > >     struct list_head mappings;
> > >     u64 bootaddr;
> > > -   struct list_head rvdevs;
> > >     struct srcu_struct vq_srcu;
> > >     struct list_head subdevs;
> > >     struct idr notifyids;
> > > @@ -351,7 +349,6 @@ struct rproc_vring {
> > >   * @subdev: handle for registering the vdev as a rproc subdevice
> > >   * @pdev: remoteproc virtio platform device
> > >   * @id: virtio device id (as in virtio_ids.h)
> > > - * @node: list node
> > >   * @rproc: the rproc handle
> > >   * @vring: the vrings for this vdev
> > >   * @rsc_offset: offset of the vdev's resource entry
> > > @@ -362,7 +359,6 @@ struct rproc_vdev {
> > >     struct platform_device *pdev;
> > >
> > >     unsigned int id;
> > > -   struct list_head node;
> > >     struct rproc *rproc;
> > >     struct rproc_vring vring[RVDEV_NUM_VRINGS];
> > >     u32 rsc_offset;
> > >
> > > --
> > > 2.56.0
> > >
> >
>
> Regards,
> Francesco
>
>
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/qcom_common.c#L351
> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/rpmsg/qcom_smd.c#L1495
>
