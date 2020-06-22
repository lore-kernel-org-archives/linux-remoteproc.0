Return-Path: <SRS0=Lo8U=AD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206CCC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0C8E2137B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeyJefPV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731362AbgFVHgG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 03:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731323AbgFVHgG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:36:06 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1DCC061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:36:06 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id i4so3152596ooj.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XxlEUingRSWt5adLQHV/JnD0xNTgO3ve8gUCbHaGiqE=;
        b=eeyJefPVgaNpdVTR4XQu43bIRN61ORvPqtrPi4tgYMAupgBp/4LQds9mm7bFBQ6SXN
         W4whR0XWSPxNByUz/nHyPHkjmWCRZQ2CRn0+PA1rlj8JCdhIh/UKyWbWo9E+mOQXxcA6
         SbaZIx66N69j0SyaumnDlI9z4WXU52YvHFC7MfEFUO0nHVBj7fOVCTSK+H9/7v9DeKZf
         GqVHDY1SmQIRpvPZc2A/HM53qYbWPYAT8g+6lzaxh9hq/DQsjTaIsOdO4TIUmKJvzhCg
         K3sXfujXjL4Ywn0OG/xhBui1QkoaEikO3W1C1z2KQ1WZuW1lLusZAR01b5hPpqwAKwSl
         fYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XxlEUingRSWt5adLQHV/JnD0xNTgO3ve8gUCbHaGiqE=;
        b=RxGIPoOkwtLoQGDH9kAmS0lLPxWnhc6yAv6RNFUSmOBaZQ12EOorKrsz+tmBU3c/4F
         rqPfVdZsad/3Az0kJeKlnNVnPerU2HWpB4LgScbT1GvJY5WiumKvPbD6ACHAKB625T78
         nlkpdaVGVgo1C6ugn9o5KF5hxruQ+e/qM21tPUCme3tkImWpBN24NCOr+QGJc1MHjbdj
         uLw31dXp1k4y3tXlRZnzmiP183PaCa9KBN+lErvp3jpv5qXYN3kMoE12hyt4h+va0COO
         X13KEii/QrP9t+yYID9TzjZnY/nBOPUFOuUVd5C8xMk9pS419pgoANSCSaIh7HX3lqfV
         nXrA==
X-Gm-Message-State: AOAM5332DWtmNF23cNrpvsXmruIi4l3sfSUD/UHFucyh+td569vPb561
        PfI6sdx15SfJNuZCS4RpNs2IWA==
X-Google-Smtp-Source: ABdhPJyU4nXRwHYFXNkIryVpMXVt54TqccL5JrGM7FcqL7yDU4IfPAcLXs/EvV76NBEgnRODlkkLrw==
X-Received: by 2002:a4a:964d:: with SMTP id r13mr7479677ooi.57.1592811365548;
        Mon, 22 Jun 2020 00:36:05 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s188sm3003178oib.50.2020.06.22.00.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:36:04 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:33:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 9/9] remoteproc: Properly handle firmware name when
 attaching
Message-ID: <20200622073319.GK149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-10-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601175139.22097-10-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:

> This patch prevents the firmware image name from being displayed when
> the remoteproc core is attaching to a remote processor. This is needed
> needed since there is no guarantee about the nature of the firmware
> image that is loaded by the external entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

How about renaming the bool "firmware_unknown"?

Apart from that, I think this looks good.

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
>  drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
>  include/linux/remoteproc.h            |  2 ++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0e23284fbd25..a8adc712e7f6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1642,6 +1642,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> +	/*
> +	 * The remote processor has been stopped and is now offline, which means
> +	 * that the next time it is brought back online the remoteproc core will
> +	 * be responsible to load its firmware.  As such it is no longer
> +	 * autonomous.
> +	 */
> +	rproc->autonomous = false;
> +
>  	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>  
>  	return 0;
> @@ -2166,6 +2174,16 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> +	/*
> +	 * Remind ourselves the remote processor has been attached to rather
> +	 * than booted by the remoteproc core.  This is important because the
> +	 * RPROC_DETACHED state will be lost as soon as the remote processor
> +	 * has been attached to.  Used in firmware_show() and reset in
> +	 * rproc_stop().
> +	 */
> +	if (rproc->state == RPROC_DETACHED)
> +		rproc->autonomous = true;
> +
>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 8b462c501465..4ee158431f67 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -14,8 +14,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
>  			  char *buf)
>  {
>  	struct rproc *rproc = to_rproc(dev);
> -
> -	return sprintf(buf, "%s\n", rproc->firmware);
> +	const char *firmware = rproc->firmware;
> +
> +	/*
> +	 * If the remote processor has been started by an external
> +	 * entity we have no idea of what image it is running.  As such
> +	 * simply display a generic string rather then rproc->firmware.
> +	 *
> +	 * Here we rely on the autonomous flag because a remote processor
> +	 * may have been attached to and currently in a running state.
> +	 */
> +	if (rproc->autonomous)
> +		firmware = "unknown";
> +
> +	return sprintf(buf, "%s\n", firmware);
>  }
>  
>  /* Change firmware name via sysfs */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index bf6a310ba870..cf5e31556780 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -491,6 +491,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @autonomous: true if an external entity has booted the remote processor
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   */
> @@ -524,6 +525,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool autonomous;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> -- 
> 2.20.1
> 
