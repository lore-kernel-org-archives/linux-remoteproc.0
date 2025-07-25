Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD314A4F9;
	Fri, 25 Jul 2025 23:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753486330; cv=none; b=UZal6cacN4Tqge8IWfWMw4JdzjSsDxa+VAJGMQm8MapJtjet5gpCO5ThrKrttVtzxlJuhXFQp1QCslqPFrBTqmDJZz+IiYyRPEP0Oo10VDUumGuQTaI0l7+CCLFQsdObyi7E9REJ410Kx6cHAHQTnQJVTvOJbuejCmPXnU1USmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753486330; c=relaxed/simple;
	bh=9URlH2ndt3UpdLd3LKcDTOjMFwU2/UUy38G9eZRBiKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7HHzUEOoN5h9PpDZI9UFK6tFOezHjIQpQwGsCKMpbZkmRwjQDtw7jODumxAOkVIyQlkrXdmChh3I0oTu/+SE/VckuhGkurFWlivcqPDgGOQL/MZPwCNN649CeQEAmN618H7am8LcfkH3QFPuXsPUOgZVM6jVNQ2yQNSbkZsp08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLJ9xBkz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLJ9xBkz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d710d8so35186565ad.1;
        Fri, 25 Jul 2025 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753486328; x=1754091128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iX7ScivCKaakwstrIpoJfXfxXwrLSxFlD/4wYv4/lSY=;
        b=bLJ9xBkzSVf0kXrM3tEXh/1OqdiWVcnAjGXjJ0OvkAu9ChFiPtuC/+OuobKOcDc64W
         rKgK4y9/zqezHpZqqs62hCrjs0OWtjiEqfuzP4086fJj4hPfgtplQowkhwPIhKeh3QCn
         ABCrfpqWL973A/ugmzPIFG1N6CXEwV0LGljgEPbh2cw4zly6dWctTKZNR1XElMBNRdcI
         Q2TVDcOU1ISutvaU48VcYzLrE3ekyUlGfaql3hyESl80QsEAK9hyKJW3EqmDPgVcM8Vl
         l1RJrTFJKOr9nKetZtl6wzlUFluRJaUu1SRVeikqAEL2sDPlEyG2myZQqY6dJpBDg2vx
         jBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753486328; x=1754091128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX7ScivCKaakwstrIpoJfXfxXwrLSxFlD/4wYv4/lSY=;
        b=i1SPo9xDwdJLcrN40n+ZC0Ohw+I5dYs2zTjJSx5EO2boMl+TWsjDwwvF4oY63TSIkq
         A3Zg+40SSyihAmST16lS2HW+2WUpov87OmmjnxY8sCpch29lc4e1n2SQUkf2D+qSkmet
         S8bPd1IaKgwH/Uu2ePtyaOl70f+0a6DjfOZmi7E/m1mWajNYUgiUUbPmKxDQ6ijfi3SC
         jIbgixS/Td5mBqHHtLKK33RYzDWfv3G4/5LuVpmnLqckIGdoA5i9vut3y1LfdoFGCwjg
         5BMwdTIMPaC5bsVf+/9z+6Ik0DDfvKcZrUUepsu9BItgOkAK2u86NRCvykDSQJSvv3hz
         rZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOnzF0xVktkchdE13zvLVnNjjUDI/KKM6tQtlgCnzRKt5htIydsPFsed5ADvFk2jGH7HdSI9tKI1mT14o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzoSZNuzQfU29RDzB+KlCm/zMPySls2GxDh+vXg49HOcQOuY91
	D/o9BX78tXnDGfGoVXsoj/50oMFqtcw3Krt3/S2yUYXH+ZQxOtWdfMyE
X-Gm-Gg: ASbGncvHMeiMqHTDpm9x/n0VJVFI8q5SMrz9lxAQ+GelvocAijTgqtu8Z94z40fCvrN
	Ia8slFMo4dj3NqKY03AcYF486I8w1HUnqjnEX3IsAITABTKc1IgLdthfcxJIS8c1Al4Ey+t/5JN
	PvRtfMjZSWCHAMzkSUcZOZU4Ir4qInMYWCvUTM7mdne6LoVTfIz5gBYXn3pWfV/RVj8ovoOnDBa
	DDFR6F4NpP7UQKW48D2nIxz4U90tUIfRY3ksKlcdT03Na57zlJdPMSH1GTRrgsQMUl2d21/t96x
	K8n5+TTu1CO1B2xPYJYJQ2v8aPl3UNFVy+A9p0bLhSbzVwnSzc3tgKRtJ9b8Zx7B/VmEtLHJoOl
	JtVCoN1les3Z4OGCtFFuw
X-Google-Smtp-Source: AGHT+IHGWZlgXwd4cFBURU5Hid9LnOcy+OkCHBhurn7x950aLimOS7+rqqKNPAigw467fKWUiiQX7A==
X-Received: by 2002:a17:902:e841:b0:235:5a9:976f with SMTP id d9443c01a7336-23fb3145e1dmr62588685ad.24.1753486328146;
        Fri, 25 Jul 2025 16:32:08 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:ed11:1206:361d:4c46:cefb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe5777a2sm5192075ad.204.2025.07.25.16.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 16:32:07 -0700 (PDT)
Date: Fri, 25 Jul 2025 20:32:03 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Andrew Davis <afd@ti.com>
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <20250725233203.btxntw74cxktetv3@hiagonb>
References: <20250725150713.barg5lhqr4reoxv3@hiagonb>
 <06186d01-23e7-4fd6-b5c0-b6c1f8ae7fb7@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06186d01-23e7-4fd6-b5c0-b6c1f8ae7fb7@ti.com>

Hi Andrew,

On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
> So the issue then looks to be this message we send here when we setup
> the mailbox[0]. This mailbox setup is done during probe() for the K3
> rproc drivers now (mailbox setup used to be done during
> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> is correct, but we should have factored out the test message sending
> code out of mailbox setup so it could have been left in
> rproc_{start,attach}(). That way we only send this message if the
> core is going to be started, no sense in sending that message if
> we are not even going to run the core..
> 
> Fix might be as simple as [2] (not tested, if this works feel free
> to send as a fix)

Nice, thank you for the help and explanation. I will check if it works
and let you know.

Thanks!
Hiago

> 
> Andrew
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> [2]
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index a70d4879a8bea..657a200fa9040 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_reset);
> +static int k3_rproc_ping(struct k3_rproc *kproc)
> +{
> +       /*
> +        * Ping the remote processor, this is only for sanity-sake for now;
> +        * there is no functional effect whatsoever.
> +        *
> +        * Note that the reply will _not_ arrive immediately: this message
> +        * will wait in the mailbox fifo until the remote processor is booted.
> +        */
> +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> +       if (ret < 0)
> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> +
> +       return ret;
> +}
> +
>  /* Release the remote processor from reset */
>  int k3_rproc_release(struct k3_rproc *kproc)
>  {
> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>         if (ret)
>                 dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
> +       k3_rproc_ping(kproc);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_release);
> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>                 return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>                                      "mbox_request_channel failed\n");
> -       /*
> -        * Ping the remote processor, this is only for sanity-sake for now;
> -        * there is no functional effect whatsoever.
> -        *
> -        * Note that the reply will _not_ arrive immediately: this message
> -        * will wait in the mailbox fifo until the remote processor is booted.
> -        */
> -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> -       if (ret < 0) {
> -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> -               mbox_free_channel(kproc->mbox);
> -               return ret;
> -       }
> -
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>   * remote core. This callback is invoked only in IPC-only mode and exists
>   * because rproc_validate() checks for its existence.
>   */
> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> +int k3_rproc_attach(struct rproc *rproc)
> +{
> +       k3_rproc_ping(rproc->priv);
> +
> +       return 0;
> +}
>  EXPORT_SYMBOL_GPL(k3_rproc_attach);
>  /*
> 
