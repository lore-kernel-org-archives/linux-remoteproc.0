Return-Path: <SRS0=fU6i=7P=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC221C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Jun 2020 19:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86ABE206A2
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Jun 2020 19:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ha/pn0BX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgFBThe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Jun 2020 15:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgFBThd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jun 2020 15:37:33 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474AEC08C5C0
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Jun 2020 12:37:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x207so3758189pfc.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jun 2020 12:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bJnC8pb9inJ4WASV7qVCuCabCRcXZDxttLDFcET0dPc=;
        b=Ha/pn0BXsUvRjOzGNc0GJXisWDaYC6hsmIaIt4veiwt/qOBrFIyP91gWdk0MIjL3SP
         CtXg3HDwFvPW9uc6fKiYNh0Rdg8AapVZng26a36EW9Ul23Yk3vMUneyzBf4ON8PFZLOP
         Yni5OWTIjVYNJ55ki+7sCflmTV3aRAX7Okn1Wwj6zv04gZHLuxFaZKb9QIEPfg/R7izY
         v0gGGqsRfp3lhMfXDevaHCmuH/Nu6XiKLLW8HkKoKKGqyqOWF1ZS6dBjcyZbxRRItrSX
         cGa2QzSeSMMclncAx8VzL5FZzWi4q8206AVEcoTiyu4h0vPuwIA97o387htSfu+b20l4
         6u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bJnC8pb9inJ4WASV7qVCuCabCRcXZDxttLDFcET0dPc=;
        b=ImaDzPNpavrSSx595VXJrpdspRvQn1gZrRtMZkUoO3hWYe1n+o4vlOFSNMAWzArXR7
         vD0UtbBJr3bhwoJIKvCino94UjmGcJYeboGtkRI6a5Iw0/+Fx/ZBu4hcWMA/AdmyUwlR
         UoktZZec6tNQO7js6JHzW266UF7WT1hez+Y89QLuvrS68m6dTGB7EdeAGQeGzFNkinPj
         En7Dv6lObCmwg7cdm3ZIPuwSKwJtxlmGKudnsqePMUVNy+/MPrCBEoK0OETxUfI56nAc
         HBABxwmmquji8Dd/roEYyHWYfo6nfpv0CGIeR+4aNrHd/JkqnfHnnpfYcP+jYiyFCtFM
         qOcA==
X-Gm-Message-State: AOAM533EQC66yhniwqfSkxvXacJ4B75sDnKgZgzZCh5ogkTcGf48+gFk
        r8SCNv14VKyDQOIiHZVMin8b/w==
X-Google-Smtp-Source: ABdhPJy3Abo428EgMH5dNF9Mw8Ft+chYmLJaz1u5kKFL3gpyXhgREJRJ/iH853fmYqj1SDPu5DREaw==
X-Received: by 2002:a63:4f09:: with SMTP id d9mr24769623pgb.10.1591126652763;
        Tue, 02 Jun 2020 12:37:32 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y9sm3105189pjy.56.2020.06.02.12.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:37:32 -0700 (PDT)
Date:   Tue, 2 Jun 2020 13:37:30 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] remoteproc: Introduce rproc_of_parse_firmware()
 helper
Message-ID: <20200602193730.GA29840@xps15>
References: <20200521001006.2725-1-s-anna@ti.com>
 <20200521001006.2725-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521001006.2725-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 20, 2020 at 07:10:03PM -0500, Suman Anna wrote:
> Add a new helper function rproc_of_parse_firmware() to the remoteproc
> core that can be used by various remoteproc drivers to look up the
> the "firmware-name" property from a rproc device node. This property
> is already being used by multiple drivers, so this helper can avoid
> repeating equivalent code in remoteproc drivers.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: New patch
> 
>  drivers/remoteproc/remoteproc_core.c     | 23 +++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |  2 ++
>  2 files changed, 25 insertions(+)
> 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9f04c30c4aaf..c458b218d524 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1034,6 +1034,29 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  }
>  EXPORT_SYMBOL(rproc_of_resm_mem_entry_init);
>  
> +/**
> + * rproc_of_parse_firmware() - parse and return the firmware-name
> + * @dev: pointer on device struct representing a rproc
> + * @index: index to use for the firmware-name retrieval
> + * @fw_name: pointer to a character string, in which the firmware
> + *           name is returned on success and unmodified otherwise.
> + *
> + * This is an OF helper function that parses a device's DT node for
> + * the "firmware-name" property and returns the firmware name pointer
> + * in @fw_name on success.
> + *
> + * Return: 0 on success, or an appropriate failure.
> + */
> +int rproc_of_parse_firmware(struct device *dev, int index, const char **fw_name)
> +{
> +	int ret;
> +
> +	ret = of_property_read_string_index(dev->of_node, "firmware-name",
> +					    index, fw_name);
> +	return ret ? ret : 0;
> +}
> +EXPORT_SYMBOL(rproc_of_parse_firmware);
> +
>  /*
>   * A lookup table for resource handlers. The indices are defined in
>   * enum fw_resource_type.
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 4ba7cb59d3e8..e5341e91d2fc 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -28,6 +28,8 @@ struct rproc_debug_trace {
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>  void rproc_vdev_release(struct kref *ref);
> +int rproc_of_parse_firmware(struct device *dev, int index,
> +			    const char **fw_name);
>  
>  /* from remoteproc_virtio.c */
>  int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
> -- 
> 2.26.0
> 
