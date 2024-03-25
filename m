Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A884C637
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 Mar 2024 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711385509; cv=none; b=S9ElkUF1f7vZDcER7ltY0Tz7voIsxfEGsZo2s70w8YNvB3R/HWr43nP4qycpQn00O6Iv521EKEBV+qKerOBOnKr0518mnZtGqUyfa0zbe5e9niaeZ+zxIzGlEhXHqAKrHhYLCa/il35msDCfn74MhhbQMOb0VJazMyBlvcUXjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711385509; c=relaxed/simple;
	bh=R1UgrdHtX7NaBhIlzazKjCiPt8qDyKrwuHqMIduiCrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajEV9/y1wCJenBHwyWk5I102epiEzrGVKahV/bLqobwqvXc5DwzG4BNdBu4xVBw4w6N6nMMCmDjCxxzq8aOOBq//730hx195cEVPBzS6Hm/qYpuUFqaY/sJpUc70XR65TtBbdVJHtIXa2QOtjRpdpiYXBcE6ilz0kWJrldqWYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqSN8ykM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqSN8ykM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e034607879so35610385ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Mar 2024 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711385506; x=1711990306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pj8PTKVryqKwwdBoZ+0WnicFRNErWIn69RAMUd5IKdc=;
        b=vqSN8ykMVrd2oHNvAGS9j0SG0p8EODHibAzv/GO+LRemaM7hMLCowpopYxNYTlQmVH
         n7y5rZXwnx+5RAY+Gz/+NuYNk7Lm9ktAuVAQa9EXWRPb9W2xPKMvvlQq6qaFjz5SmqXl
         CwSWRTKHM+DHoEAIz3Gkyy4BcOTyV5suZSdoEy0y8q3ffnviZfgiHoWcDZk8XEGJUawz
         fWrg6DEixZQVpv2XRklgjQBM5Mz7JEhb9K+uN4UuhVxyPk6lygsocVWDicgvGX8KZKqL
         nl3L8jnvLywG28l2P0X9ExdesLhCCplB8w8R50k/SDIsYdKp+KIXXXiGkNY8LTJ+G0Uv
         UJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385506; x=1711990306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj8PTKVryqKwwdBoZ+0WnicFRNErWIn69RAMUd5IKdc=;
        b=HG4X3UExdDPnVlKCAB5zSq/sg6qRdudhUGsBgtGD33cd4ApQgtdCjy2qosf2nQgsIM
         G8a05hO7V0MtcaDGJWjvifTJdUue18mtdiNkJC9NxQ42NqkPgvj0juZJBGLw18xiWaxl
         FrfXz0SucJ/DL2F+eatTnyw9ihCoYZVZKEt+NR4wI+o9Dx1Kb43UhBflVKNreccrkmd0
         tb0r4psue4OutJqThNP8UTcjSEpkA9vmEd9yGngIo/5WfqaRscqHDCJDqgTX1JIgqUa/
         BCJ+8/K8ge5i1T7cP2PMmsrTb2vJNFR53YzBnYeLDGjqigudECMx0prmSNVPHk/yd/iQ
         qQYA==
X-Forwarded-Encrypted: i=1; AJvYcCVdEnFxEDwlhkfW/G/VoiZKJpZho4S+Y0diISl+S18pKpKbB0NwhdBZmS7tCBIasnDYzPdgMRheFpxB74bioZ/VEWJinOISbP5hdaZtV69cQA==
X-Gm-Message-State: AOJu0YzBjamA3DmHOjkk+ZgWgj4EulzkQ+7NfXodFq03m2d1pq0U3RQo
	sjZuAcowwQC3JLeZS88GmU4qyLo7ioA+Z0e5c9tFkjW+VvItdOyVCpEkFg8KkuQ=
X-Google-Smtp-Source: AGHT+IGoV4RhZKceQIINbyMVzRZ5e1HPuju79F8lHHNd/Bx3c+IjzhBFu/0IBlEFjOn25VeKI5qwIA==
X-Received: by 2002:a17:902:f54c:b0:1de:ff81:f650 with SMTP id h12-20020a170902f54c00b001deff81f650mr12006579plf.10.1711385505732;
        Mon, 25 Mar 2024 09:51:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4a22:28de:eba3:89d1])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e0c568ae8fsm1517672plx.192.2024.03.25.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:51:45 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:51:42 -0600
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
Subject: Re: [PATCH v4 4/4] remoteproc: stm32: Add support of an OP-TEE TA to
 load the firmware
Message-ID: <ZgGrnkcebcIQQic6@p14s>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308144708.62362-5-arnaud.pouliquen@foss.st.com>

On Fri, Mar 08, 2024 at 03:47:08PM +0100, Arnaud Pouliquen wrote:
> The new TEE remoteproc device is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from V3:
> - remove support of the attach use case. Will be addressed in a separate
>   thread,
> - add st_rproc_tee_ops::parse_fw ops,
> - inverse call of devm_rproc_alloc()and tee_rproc_register() to manage cross
>   reference between the rproc struct and the tee_rproc struct in tee_rproc.c.
> ---
>  drivers/remoteproc/stm32_rproc.c | 60 +++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8cd838df4e92..13df33c78aa2 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -20,6 +20,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/tee_remoteproc.h>
>  #include <linux/workqueue.h>
>  
>  #include "remoteproc_internal.h"
> @@ -49,6 +50,9 @@
>  #define M4_STATE_STANDBY	4
>  #define M4_STATE_CRASH		5
>  
> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */

Why is this the case?  At least from the kernel side it is possible to call
tee_rproc_register() with any kind of value, why is there a need to be any
kind of alignment with the TEE?

> +#define STM32_MP1_M4_PROC_ID    0
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -257,6 +261,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> +{
> +	int err;
> +
> +	stm32_rproc_request_shutdown(rproc);
> +
> +	err = tee_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	return stm32_rproc_release(rproc);
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -693,8 +710,19 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= tee_rproc_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.kick		= stm32_rproc_kick,
> +	.load		= tee_rproc_load_fw,
> +	.parse_fw	= tee_rproc_parse_fw,
> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
> -	{ .compatible = "st,stm32mp1-m4" },
> +	{.compatible = "st,stm32mp1-m4",},
> +	{.compatible = "st,stm32mp1-m4-tee",},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,6 +881,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
>  	struct rproc *rproc;
>  	unsigned int state;
>  	int ret;
> @@ -861,9 +890,26 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;
> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +
> +		trproc = tee_rproc_register(dev, rproc, STM32_MP1_M4_PROC_ID);
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -915,6 +961,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (trproc)

        if (rproc->tee_interface)


I am done reviewing this set.

Thanks,
Mathieu

> +		tee_rproc_unregister(trproc);
> +
>  	return ret;
>  }
>  
> @@ -935,6 +984,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_interface)
> +		tee_rproc_unregister(rproc->tee_interface);
> +
>  }
>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.25.1
> 
