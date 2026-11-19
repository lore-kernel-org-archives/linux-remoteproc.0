Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106701;
	b=3RN/t1jH5yuRi8bQRqDXQVI2+3tr3akq+Le5jLpvju8+v3cSJT85ngMXtjVJ4yqK6xEo
	 /TCgJx9OtHRr3Y3yLrSeQV0Xs+uOmuloYFnxODaKD3lI0Nvxo5RDtVDg0Alp9OOaoktrY
	 nI9Q6XKWKfW4CHUC6lyqKyA/aZiRerL1KiPGYp/mCW+eNg2nwdWO/78J4hNRcO5OTOffA
	 iRSQcJyXKMgdAIjAWORQ4o5MZRSYODt9PDpFtZKFrCxtRvcGJ1Ou/FPBamcCmn5QtmHsG
	 FMvqsoU3Ljacmat6qFIlCZFI0nx29fg0scrDK/pdS06x0DR5Ji2Harf2RzR/PUHeHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
	b=fCaXpdV7AUcP5rWBdG8oMsp+3SM5ht1Dj6BgzzAW2WATkbJGCiqq5vVc8sBosvvpjamT
	 CcHu9xylJam3/vMLfDSZbhLv6hzhKUyy/OTI0g13TXUEcDIZHRq2GvMO1MzXMCV5lW3+H
	 TFk1l+QhdVDghU9Klde2p9vJIwP9JAkaJlxiRbtFy2fbwsz/E5Y5fKb/j2NmYyMIDH3vM
	 H8fjLBdqb/ikDG4HLZq138ZLrfF7A9ctb8bx+50JOJCM5wM/rYUhoA11FKDB4VgVGTLhO
	 kiQ1LAP35slXb/+a5dTRCGAaEV6jrxkgl6tiYXzzl/cs9wi6CAWE3oQf1P/FaTUxGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZEzG5oHZ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E20606A333
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 16:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E20606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZEzG5oHZ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3034a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795106700; x=1795711500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=ZEzG5oHZXxpB8oa9rwNRv50HM5CC3bkeHTb4Mqa8N0kfcPCFI7ndYnYkPsZQTx2UkU
         8AYW1pftII73bkzkj8Mljub2ZKGXw7Dd5s5mOI+xuV7wKkJeqGvuGDOSlEU4FqAJy3KQ
         ss3b9CZopEfOuKeZKkILe32GZeHxS96Put/wKCT9M8mjyHUJ1Ym+PFHC3tPv9J9ruNuo
         TPJZdt9dZW3R+K8v70phsHoTTO9pY+zpKE3NZsByk1wF0/LQEtil7BJjoWObI7wIPpDV
         UjaAPnUR81MQnLYqklptBdBDRsuBmhzmSvrfeKAqr4JYEYzjVQiLrk/7O8+6/U4qYFeT
         5iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106700; x=1795711500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=NTDt+S64iiosq2rdFwVvrxXajTHn5Odt4pwkAmz9/qQKXhD8dwtGlhwUCS1BOc1s6b
         ra1BXwJIe/oVCqF9J56dU1z+FB4j6cREMISNAV8Bu8GwiEAAzNpN8CBYShwpDCr0kKlO
         bBkdgwqfsZjEQkFa1kgH5pWsZQhnIuSO8XS72SWNkM94T9/JDjt6kPSiZCJ6dh9Ei6qU
         rtJ78I7ijzS254TTdSqQRmcB3IR4ClCccD4Dc/L1dY/lyT63erVHxVbxDjuw8dPvd1L8
         z9HWgz7PAspJzO17eTyHWD7RRJwwPI2+SWsJBKBzH/q8iGfz4NStvSkpx7KeBirF/O4N
         x63w==
X-Forwarded-Encrypted: i=1; AL+hErE9SSKZZQsmcG8mvHGpIJO235y3bWJ7h8mFHVJhkZgvHPVX4En7sCHN/dbp+chLrVOTmD1qgB0ioyv0gdHRdicw@vger.kernel.org
X-Gm-Message-State: APuU4Z/wBTa3WebHX6/m8Fxxt8YBpsPHjrl9g/aGJQpEYVT+xiHxwzkl
	FbKjpX74PmYKhJmez+jNreM5NXYdusuv7shgD7q4Qgbku5D6T2UmMehKB5haio+C/iU=
X-Gm-Gg: AZFdTZe4H7jQXo9A32ZsCeRGPnJQldDO8T0uxw9eBcw0KgaQ9jJkOR1RlyLKd1v1b8M
	MQXvUvEoDQYZIIXzIp8xhSb/uEYcZb38iZpCSPhlVwmHHKjdSyDotnbP05DwHwMAX6rwyI/1MZA
	73zE+4zfItq8w7JBNu6WVk6p+hipgqfVJs7IKpbXxfkXLkQERBPFAaJ+mqdHWhzAHkPTHpezJyA
	6ASqBfDLQ8CHl3WjRdnNKAkAu4WRrS1V3V4Fs1aRp+5VdI/qOuQRS5GvXexvXnyly5VEoUlseiU
	hVTrrsqNiSAZ8SvYQAz3tM2CJLKrnL1JCYsmIbEWIJAgEAhPW3Yws3T+gVBvf1Kz6hPVUZabT6L
	rJPjzMpE0X27cbEmKAvub2DUL8gJG/v2qvnbAwJpHNgAyTULH6H4yJTG5iUGH+QMPV46bee5L79
	hYTC9dzrlEAjOl6Htexm0UeMXji0PbIo1kB6fBLlwEni6U+RZduA3NkwExJesRTVHGAxB4VQs0M
	qz5G/AWxNpCEE9EoLjAMn8YRvpYYaGWUVEjHJJms1ElP4SY6ZlPjW84uJKZxNOf3QsOi5KlFzHx
	oP62hD3K3cYLThbLdL93y3LtPfr6N2OgaV3aWgjiTPdTePP6iFGWGA==
X-Received: by 2002:a17:90b:3c83:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b3d06a2564mr6512769a91.7.1795106699866;
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm3203028a91.16.2026.11.19.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Date: Thu, 19 Nov 2026 10:44:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
Message-ID: <av8niGRg4Er7YP8K@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-3-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-3-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:58PM -0800, Ben Levinsky wrote:
> Partial reconfiguration of the programmable logic restores the AXI GPIO
> that drives the soft-core reset to its hardware default direction, but
> gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
> then only updates the data register, so the processor never sees a
> reset transition: remoteproc reports it as running while the newly
> loaded firmware never starts.
>

Where does the "partial reconfiguration of the programmable logic" happens?
What makes it partial?  Shouldn't that be fixed instead?
 
> Use gpiod_direction_output() for every reset transition so the output
> direction is re-established, and assert reset briefly before releasing
> it so each start produces a clean reset pulse after the firmware has
> been loaded.
> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index 6cf33c7b7e64..da621f62f7df 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Partial reconfiguration restores the PL GPIO hardware defaults but
> +	 * leaves gpiolib's cached direction unchanged. Re-establish the output
> +	 * direction and generate a reset pulse after firmware has been loaded.
> +	 * gpiod_set_value_cansleep() is insufficient here because it changes the
> +	 * value without restoring an output direction lost during DFX.
> +	 */
> +	ret = gpiod_direction_output(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}

Why is this needed now rather than when this driver was introduced?

> +	/* Hold reset asserted long enough to provide a clean reset pulse. */
> +	usleep_range(10, 20);
> +

I really don't like random wait times, please find another way like polling the
GPIO line for an expected value.  I also thougth the GPIO subsystem was already
dealing with de-bouncing.  And the question from above still stands, i.e what
changed to required sleeping that wasn't there when this driver was first
submitted?

>  	/* Deassert reset and let the processor run. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 0);
> +	ret = gpiod_direction_output(priv->reset, 0);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>  		clk_disable_unprepare(priv->clk);
> @@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  	struct amd_bram_rproc *priv = rproc->priv;
>  	int ret;
>  
> -	/* Assert reset before disabling the processor clock. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 1);
> +	/* Restore the output direction after DFX and assert reset. */
> +	ret = gpiod_direction_output(priv->reset, 1);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
> -- 
> 2.34.1
> 
