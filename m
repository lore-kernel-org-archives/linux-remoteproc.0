Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA05D73B
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 Mar 2024 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711385294; cv=none; b=l4Uo13uMXi0jQhzUTNT/Mkz+L/lfeqPzHdIftZxtV6YZcNVofw2nOX6YChvaIA91D9NS4LwAaLfvk7OSSKdjEzQEL0OuJ3gB/q8LCU9yGX9ZtXWpDr8vCCpPe2eWONhuCtJjXnRRW2qYMrqq7KAM9Dxnn9rrUsn4/eMEkT0cu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711385294; c=relaxed/simple;
	bh=gqR4dMtr09msmwGAqcZR/QoEZd5ixjXQwrvoLI4iHFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lyyo8TPk5wvBsMg4Ym4HiWfyJsLjf/tY58sun7poE4v3um/fWlmeIeWvtueE7s2nuoQhK7nsOtn3lBiJ9Dv/8IudkrPhszFw31EAV1KYAAYAVcMAhzXhQfMBxMOpxkS6e0gFQKRqG19Gah9mjJpD1BiSGDjRf1e32zjSPYlRHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+MTuF2w; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+MTuF2w"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0ae065d24so13027185ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Mar 2024 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711385291; x=1711990091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Li9ePBDN5kdTzO/p/pyUro/E5ONNdjRLMyuXA5qxWs=;
        b=m+MTuF2wuWTUMLr8MbaI/JJ3HisSRlUchc1kXO3Zzb578hW7PoXxz/H3zUr3h72RaB
         8tHw1tYWyjF6KnPMYDXcJnXQ71XPImUgBfRTdXiETREvn0fUt9kvv3v0szDVUfyrSgT2
         DnU4erfH9fkNSWdBCDr2koxH4KLa7Oe8HQIMOcyTgR8NFNVKLuI0g2nNE5nnYzDChal/
         sifxabWE6mSXwFKlLhRw9s1FIXXYbJ3pl6aTuFoatzX59JfsOpOUo22rwF2jRIxbP5XF
         hrxrniQi8jvELUnekvNADP27jPh8uUCjA3OUbwMkmDfQ4zp14octQvpAnwaEEhBliqa+
         6IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385291; x=1711990091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Li9ePBDN5kdTzO/p/pyUro/E5ONNdjRLMyuXA5qxWs=;
        b=TXt8cv11iinEeJthmHI/aSIUywdMOakjngl0pcjmMoUnqQbMR488r89qHahV5r1q7N
         myZ15kzXfM6JeRvdXACl56ZlGVFW/3qKDkev+fHXPwqWnJOUomy/cl6p1tlzYT1WM8Ab
         TWrEqd9IRWuQG6s0bDK/nHynirlXUh/a4bRk/szFFnlLjToe+oDsKVWLnoK5yGyqzlv1
         SuLJx2IvMijSHtMY5C09l2T4E5JyPLYV212COM8b/43QWD87z1Enu1S6HSOmjEwmBoLG
         bWhF8paiHFTVya4TgNJCrxUiDCvTJ8mO4WtlXgQ4kI3sDQzH33wJo0YaAYFKouQ8dTcF
         JZKA==
X-Forwarded-Encrypted: i=1; AJvYcCVZA1Ar/t3R3RzdcnIbaoHQnOibPjyw/J+a6mxDRvLxH+ecsFqZxCKhGm8IEu+0RVZQpuoHnWBdXBtqTjgFhHs0lwGxzA3fhxgC31APee5P7Q==
X-Gm-Message-State: AOJu0YyXP/SHkLgRr84YBy4Cbmn6n7CrFy2RWc+ceMAZuucILHVZpaXe
	VVDWBdHY/3KoZGTk6rJF0AHOZGoY5RK6cPiQKU/aNLrV0sPVxOgLI8XbQ/EBw7A=
X-Google-Smtp-Source: AGHT+IFBoBsSglPKHUxyixrU3Fl2cREElqaGHFDUAzOeeEFm+j/qwqzea0cL8fVxvarsqHFodVnMMw==
X-Received: by 2002:a17:903:192:b0:1e0:bddf:7ed0 with SMTP id z18-20020a170903019200b001e0bddf7ed0mr3942884plg.27.1711385290761;
        Mon, 25 Mar 2024 09:48:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4a22:28de:eba3:89d1])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902b70900b001ddbd9ac28bsm4893178pls.142.2024.03.25.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:48:10 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:48:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] remoteproc: stm32: Create sub-functions to
 request shutdown and release
Message-ID: <ZgGqx0Lg9FH217Wc@p14s>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308144708.62362-4-arnaud.pouliquen@foss.st.com>

On Fri, Mar 08, 2024 at 03:47:07PM +0100, Arnaud Pouliquen wrote:
> To prepare for the support of TEE remoteproc, create sub-functions
> that can be used in both cases, with and without TEE support.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 84 +++++++++++++++++++-------------
>  1 file changed, 51 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 88623df7d0c3..8cd838df4e92 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -209,6 +209,54 @@ static int stm32_rproc_mbox_idx(struct rproc *rproc, const unsigned char *name)
>  	return -EINVAL;
>  }
>  
> +static void stm32_rproc_request_shutdown(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int err, dummy_data, idx;
> +
> +	/* Request shutdown of the remote processor */
> +	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
> +		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> +		if (idx >= 0 && ddata->mb[idx].chan) {
> +			/* A dummy data is sent to allow to block on transmit. */
> +			err = mbox_send_message(ddata->mb[idx].chan,
> +						&dummy_data);

Why is this changed from the original implementation?

> +			if (err < 0)
> +				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> +		}
> +	}
> +}
> +
> +static int stm32_rproc_release(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	unsigned int err = 0;
> +
> +	/* To allow platform Standby power mode, set remote proc Deep Sleep. */
> +	if (ddata->pdds.map) {
> +		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
> +					 ddata->pdds.mask, 1);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set pdds\n");
> +			return err;
> +		}
> +	}
> +
> +	/* Update coprocessor state to OFF if available. */
> +	if (ddata->m4_state.map) {
> +		err = regmap_update_bits(ddata->m4_state.map,
> +					 ddata->m4_state.reg,
> +					 ddata->m4_state.mask,
> +					 M4_STATE_OFF);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set copro state\n");
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -519,17 +567,9 @@ static int stm32_rproc_detach(struct rproc *rproc)
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, idx;
> +	int err;
>  
> -	/* request shutdown of the remote processor */
> -	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
> -		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> -		if (idx >= 0 && ddata->mb[idx].chan) {
> -			err = mbox_send_message(ddata->mb[idx].chan, "detach");
> -			if (err < 0)
> -				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> -		}
> -	}
> +	stm32_rproc_request_shutdown(rproc);
>  
>  	err = stm32_rproc_set_hold_boot(rproc, true);
>  	if (err)
> @@ -541,29 +581,7 @@ static int stm32_rproc_stop(struct rproc *rproc)
>  		return err;
>  	}
>  
> -	/* to allow platform Standby power mode, set remote proc Deep Sleep */
> -	if (ddata->pdds.map) {
> -		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
> -					 ddata->pdds.mask, 1);
> -		if (err) {
> -			dev_err(&rproc->dev, "failed to set pdds\n");
> -			return err;
> -		}
> -	}
> -
> -	/* update coprocessor state to OFF if available */
> -	if (ddata->m4_state.map) {
> -		err = regmap_update_bits(ddata->m4_state.map,
> -					 ddata->m4_state.reg,
> -					 ddata->m4_state.mask,
> -					 M4_STATE_OFF);
> -		if (err) {
> -			dev_err(&rproc->dev, "failed to set copro state\n");
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> +	return stm32_rproc_release(rproc);
>  }
>  
>  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> -- 
> 2.25.1
> 
