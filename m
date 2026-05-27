Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE844CF52
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903899; cv=none; b=rZ4VXFlgjNw28Ca4NQjO9tOEB7FDVgR6Ldc3J7LqcTzTx5v6xN4OZZw2WjH3kvImqMG1/4sL4oJXbc3aWsTpxDF/oECrxvYMzdWMt1HQgsByBQgSgPBEYtE+1uRk5Bi5jOsyG2mMSN+i3ExEtCSkW+EUgNR59xuujLsgFgdHVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903899; c=relaxed/simple;
	bh=jBmdo4bcjh9mnyHZBBkbap2F8RO/hTqf9vQEwCpOR8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acnrlD2+xzHTWEGrH7mvGQVIMGwpiHNgmMY+iz8J2RAOfQ4/2IsVj6tIskrbWYW5+OADbo7nmEFLv2pZvpsnHSvh0nJm7omwEaElJNJnDgNpaIJWwSF3cCTu748uvsj5qsRp9VgMavSMfIkuMVkTdySm2BRIqKyOA7885gpAxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrPimqHr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrPimqHr"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c82471904fcso4853345a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779903897; x=1780508697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=TrPimqHrZS4dJoYA0aK6lobj/s3eZeCM3IuRVS61BRZFpQTQ7zgHjYtY8+6wxW0viK
         ntu784AqgXYAU6AU0Em3/kXYKYhsuq+Henii/uBqygq5TMjWDY4a8H/jUmLLurosUxxG
         63MfPuCT9gLaPtsZ//+iksfMFRpXiwZaLomDcfPFZQVWasLlFBn2uSY4q0qUrOuLrBYY
         dHRYyN1lE/4a4kJJvygfkF6UxSIfao4Vbx0GC2DCulHmOmNcYoA7OTd+dKXYAGx3ndYq
         YsDJXXdxz1jNmGNZPSjjLoD0jxiozkkVYQeGY3+gNrlfUSg8rmpzjFeFehbTkcLb3kML
         UrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903897; x=1780508697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=NSfhvQBVWvN/VEqSIkGtyEMDt6MUydFDCtU2kJ76SqKPlac/XP4JCBRd7M9MbPluWF
         H1HKKc1ODvUa7E0eSVWvC5vILtdkR0VN7wABjdpf9iiAYjFtxTzXjr6tohAZXqNAaZfh
         zvhtIdJ/2NwD/A1oLBmHYIiVtKfudLfZkTLDRMXsqGFXvkSrGUn25Fo81VNwtb9ZvvmF
         e15i0ubHWAOzUzaP3uuj5bYqQ9PgTwZ7fm9zKpMzjeg9sE7ZWqMQCh6FIxQ7e3S2HvsU
         2WvRGWKCUQof61Nps5dmEZFrhWuo0wBJlbkGWqcwe0uzNWO7rHu5BIyObztUKOY/00Ti
         wp5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ZflBXqyMgaZCfA0l2ZBkdQnoTg02u7Veo9XTaf94yKO1efISvys6eXZxlHKVSDrixaBmMmR+DtkhvgmfMpDS2@vger.kernel.org
X-Gm-Message-State: AOJu0YxA0BeM9vJHD0kQnyQF34gQOWA9Wub2AEk+/4Pdg9oi4pxLJgjx
	/W4Jzxb1Tju2ZHxp2IZSKQ3UauWdsf/OaD5vXafnP2FXoTIeTN205TsxA3xjPMW8+KA=
X-Gm-Gg: Acq92OFKtluw2KQ8aiQwaV0YaTNRBVMuqLJbM89KLUFzl4buRpIaYgfQ0CtAn4aqI09
	7VtsFGAzTb0Bjj3kGURKu0luSEl5tvkFOdgAryUqwwztNQ7KGvxbW7+3+3ZAI7imCE9Kvc+/WC+
	BviYI4EZOVU4dZyZmoWSTFKoRneP9hFr0IXLz04JlJUOfgP9HmD6fVVBl1rFh5iD4UloXxS3GzA
	tD6Q3H2jlFV7yFKrOYYFUEhWa83Z33xg9k9UOxNXULmyJqR6mEZFaiAqQPytJoX4u04no4ZrWyH
	04GNS6Zb437Gzf3U4Rv/sBlzjXS/HO85FG6kiOXZFKH8F3owF6oMxXMK9/fbTiEGouSQ63ggk+6
	GJ7khwAaS5JaT6cf1YQAZ6ZfnuP9XN7y7ferX1k1LTDJvQWU3/pWsy52BIqy6yMWIcpJCxscewV
	j2NLXUgn6M9qz87xVKZiiJieX3yc8=
X-Received: by 2002:a05:6a21:a06:b0:3a5:8542:61a4 with SMTP id adf61e73a8af0-3b329340e22mr25394375637.25.1779903896893;
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm2814639b3a.45.2026.05.27.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Date: Wed, 27 May 2026 11:44:53 -0600
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
Subject: Re: [PATCH v2 5/5] remoteproc: switch drivers to optional
 resource-table helper
Message-ID: <ahctlW_4AKS6IHYt@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-6-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-6-ben.levinsky@amd.com>

On Thu, May 14, 2026 at 09:21:29AM -0700, Ben Levinsky wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that already treat a missing resource table as non-fatal:
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc.
> 
> Keep thin local parse_fw() wrappers in each driver so the helper only
> centralizes the return-value handling. That lets each platform retain
> control over whether the missing-table case is logged and at what
> severity, while other parsing failures continue to propagate to the
> caller.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
>  drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
>  drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
>  drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
>  5 files changed, 73 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 2d9f14fbef1d..2ff74f7938f6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
>  	return ret;
>  }
>  
> -static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -

Why is this getting moved after imx_dsp_rproc_load()?


>  static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +

I am not overly fond of having to check rproc->table_ptr for the printout.  How
about:

#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)        \
        ({                                                                      \
                int ret = rproc_elf_load_rsc_table(rproc, fw);                  \
                if (ret == -EINVAL) {                                           \
                        dev_func(&rproc->dev, fmt, ##__VA_ARGS__);              \
                        return 0;                                               \
                } else {                                                        \
                        return ret;                                             \
                }                                                               \
        })

in remoteproc_internal.h and something like:

static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
                                  const struct firmware *fw)
{
        rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
                "no resource table found for this firmware\n");
}

in the clients?

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6249815b54d8..58c63f97ebf7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index e3121fadd292..b7a39014b6bb 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_start(struct rproc *rproc)
>  {
>  	struct rcar_rproc *priv = rproc->priv;
> @@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
>  	return err;
>  }
>  
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7ac8265b60ac..a4d42b755c74 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	return (__force struct resource_table *)ddata->rsc_va;
>  }
>  
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops st_rproc_ops = {
>  	.prepare	= stm32_rproc_prepare,
>  	.start		= stm32_rproc_start,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index e5d1903c9636..9b9f07d152e6 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_parse_fw()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @fw: ptr to firmware to be loaded onto r5 core
> - *
> - * get resource table if available
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret == -EINVAL) {
> -		/*
> -		 * resource table only required for IPC.
> -		 * if not present, this is not necessarily an error;
> -		 * for example, loading r5 hello world application
> -		 * so simply inform user and keep going.
> -		 */
> -		dev_info(&rproc->dev, "no resource table found.\n");
> -		ret = 0;
> -	}
> -	return ret;
> -}
> -
>  /**
>   * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "no resource table found.\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> -- 
> 2.34.1
> 
