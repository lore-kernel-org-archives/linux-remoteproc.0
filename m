Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20961426EA8
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893468; cv=none; b=Qkdt3B99gkq0AFmM0d8MmN3HsupKck+o/ioyCbTdkbHYnem1R05uHaFFAD3QxfqWC8ehrNBK3k9mN+kYCXeBljUaZ9dS+uWKuzAxtqRd6onpYGakWHJinwZ5aNuRi/MTzz2Ot19x4ZtJbr0TroCouaU/Iru1Yh1VBk1h1GzcKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893468; c=relaxed/simple;
	bh=kfHR1gmdonWK5BA3Mhntt829OrtJVf91xTnsollQ0dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY6eZF7YDjFD3wdTLQ1E6eOC72LfAD6mbW6SRKVvPq75dEBXIodKNr+/t2f3G5HZ5fKotyeTwtWKgi0PHiKz/zOMG2eCbPzNALuZdoS/7A1ZhVC3uMgwZ0N81B86gg/NSWehqDRF8oJtmk4+wO6sJXqt+mI7JAOE0D7XA9Hfajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnAkXtON; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnAkXtON"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-367c26471f5so7640918a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893466; x=1780498266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=jnAkXtONU2IVAWId3hrksOk8okTiGo78i28Pj9U/w47tKyvsRmvRJVCTNox9lQdF5F
         89CmMg/rj4vqVH7dOVPdEreCFxZWYV8DSFAqUVa5seHOz8a2Ig3tcvuGsVYDCV1ROysf
         mcCJRLFUHBlMH4wqtTuU7XlzqIWno5Z/cnMHjjTghTAj8inm/8GZXQR3FBXuPm6OTI5a
         3AG+PmhlvOzfbAXNOnzCnJxsyKj5gy2A564E9/dps4CqQLleCePnFo9Sdq63lyh10h2C
         9K2QJrtRIdtS+0zWZPNOX9wd7HWYUa8gYs+Gu9DJ00RJGjkI9HcGWflo1JUzYL5usYey
         8NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893466; x=1780498266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=g06fq80NAkbiwrS07JgCVecbiUx/H+J0+blizEndtNFxNArIbhvC2keHZtJBfu/AoA
         zIcjlm59y4ABwGW2JXoeMX8i7jtnSxwpI9wp3H3oIPNfP2keMh73VQXgQFu73VNgLA37
         ET8tVtGzkqWPmlkYap4r+dvXL09LB4ELqPoCc7sIqtKH4fBgaJI/7uyIBnT8MMEPrLSH
         SWgEhM+Nz/OWcwgysDmojFthljIXuzx/wWzkse0G3q8t8PIdvJZ95KhCSrLh+MXQ53eD
         m5JEowCK2G3g/fbXJSTjcOipWtusQFr3tP8WKid77nKqydYUN3U834Frz0zG7NfP+pt7
         qTag==
X-Forwarded-Encrypted: i=1; AFNElJ9BK7p+YitJovvw9uGtg+qriUBlHJPeFHY+2q9SQajMto1cQlXcJaemOp4IQDTlnkrJ61DokGVWdWgXWRREMwS8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwb+aIdN2OKJsDudVPYh+nJktpOTYN2aDG04fE9ItS4HFmEiK3
	SmV4245KnPlK9bNSMXkL3JBH8jVO+BaFup8iansTX0PROu6v8jvObycSrqiXo+gglxo=
X-Gm-Gg: Acq92OEuVu/+GR3pHibJ55DsgnNGNagQ6HvpjNky3CTnUfLTu0y+tWfBOcFFJ+pwurw
	H8QTssLBaxTwb51tDmqtEa08HNl1sEX0gJcvtBpkcwi26LqKlkSoc3npvN3kAX3zF/0F81SBm2d
	XsBkXeCkkajC5EytzA2QNyMJOvY5Qw9LZAyj5zfBNyPUwLQFU41wntqkd+m942XeKPcP0EcXbvH
	omMf9K4qANq9kYzPkmWt4olC62BKLOTCGIpVBIX7BJ/Kn8xHoZbxDVM+qnc16eMtXgSaLweFhh+
	eCs3JsgyZwdCL890QapoW/l5zApb0xtWfyDlVwJ3SJM60z2AMB/UKI67Q49Dr0EgfMukagx4v2o
	sAUv+tPdQFFIkyk8Au8rEWQtPn9LlJuU7rf6JH3UwwAYNTeAPK1VitKHmq41D4hILa5RM+t0+qf
	Nno1M5zcVcaIl3MCaClJ7jFip0KEdQ+c3rfttDWg==
X-Received: by 2002:a17:90b:4e84:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-36a676ee27amr23018294a91.5.1779893466401;
        Wed, 27 May 2026 07:51:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b24d2feeasm1410665a91.1.2026.05.27.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:51:05 -0700 (PDT)
Date: Wed, 27 May 2026 08:51:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/5] remoteproc: add common wc-ioremap carveout
 callbacks
Message-ID: <ahcE1ixlIXJ6wJ7B@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-2-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-2-ben.levinsky@amd.com>

On Thu, May 14, 2026 at 09:21:25AM -0700, Ben Levinsky wrote:
> Several remoteproc drivers open-code the same ioremap_wc() and
> iounmap() callbacks for carveout mappings. Add subsystem-private
> helpers in remoteproc_internal.h so those drivers can share the same
> implementation.
> 
> Keep this change behavior-neutral. The helper now emits a common error
> message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
> follow-on patch so that the behavioral change can be justified
> separately.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0a5e15744b1d..f5b34aabed5b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -12,8 +12,9 @@
>  #ifndef REMOTEPROC_INTERNAL_H
>  #define REMOTEPROC_INTERNAL_H
>  
> -#include <linux/irqreturn.h>
>  #include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/irqreturn.h>

Why was this header moved down here?

>  
>  struct rproc;
>  
> @@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +					     struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	mem->va = (__force void *)va;
> +
> +	return 0;
> +}
> +
> +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
> +					  struct rproc_mem_entry *mem)
> +{
> +	iounmap((__force __iomem void *)mem->va);
> +
> +	return 0;
> +}
> +
>  static inline int rproc_prepare_device(struct rproc *rproc)
>  {
>  	if (rproc->ops->prepare)
> -- 
> 2.34.1
> 
