Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5DED520
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716310058; cv=none; b=GmYG+z0HQhH3bBpXQCL3aZQhVgpWZ891GIMx1h37aVxh6NpaROn3Qerg5q+e8CaXYHZAaUAC1pMFTrf1/FhfEml1ltbDYF2gwxOjJgAIK19ABzeusMNuC2MwNZKr1MFJjI3VQn5tYuhJLx/DSLbjybgrOz+XqycM/+WE1brkOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716310058; c=relaxed/simple;
	bh=7iOACG5IfAwJdby/0fwuDdIGvtdK3YwQtEFtX0fPrkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8DaDDJI6FqxaxHaNIUq9NcfJgSvIGaGY/BScU9lNFWiM845K7Iax9qdThvgz/BNLdaIarjv8ou4jvyT1NZyZ2iDgOyhW8iDMLcZs9tXcUpMzwB6CvmsM8H1266gpwv0DPyRwShvISRTkvT5cYl/aMcBSG4PQ6AJLmfYdg76SQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1vr8UKl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1vr8UKl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f67f4bebadso557076b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716310056; x=1716914856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZAIDSZz5noc6if4QKqooN9MLNYkeL9UbakI+8iRBos=;
        b=P1vr8UKl70aTwginlilJZb+vlUxgG6NpmM1BZ8cHGDE1j3UirMTlGYF1UMF4bqTyrG
         x02MCGUxqFpjwERKKh/qAQPKtzxN679ahg29hNLRkAH5SboMnYsBULDhGhdLd7ysCI2l
         blmkyU8J49BSz6m991r0ULZnYpPo6zqkR0ne0X9Mac90Dj9yczmO1cyAO4SdVvH0mDI0
         5O8rFf5CyLnOtdT6oRbx5TAVrCmThYkOLBY39sH4c7fQbBdwRfDtscl9V5hCclbR/DuD
         hdlJ0HLGeZ8Ta93Hn8cLNVrBkXOEK/L2O7K/oeVhaWqVhSo16ZtRBr8wNv3nokLElWfk
         1p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716310056; x=1716914856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZAIDSZz5noc6if4QKqooN9MLNYkeL9UbakI+8iRBos=;
        b=b2YfeMRduH4KbKe/Fap+IJcqgtmBpBJNxz7+V6hMYmFAqY7knM9SlRIGuvmZNwX8/W
         4N2pS/20cMYDJqc0MCcnPdRctTli4ZvxgA7Qzd6k1hAQYd2A/Z89MUUAgPjCD66/GWWW
         /2CuUtXBH0MQSSm9bor5eCva5Qhan+MKG93gnJWFCL764y9NROs2jJTnsV7eDOHpgW2A
         IYtweESRg2BmZOvIKhuVlLsxMYn7oXIsq5GfSh218ULsdXHHBtQDg1lcgppP2M1Tyl12
         enjRRBJld5KPJRmaR/sGK4av53lVkgIkpn3SgjJIHVsmv570WRVvVUMeUwwaj/hi+7BY
         Ldag==
X-Forwarded-Encrypted: i=1; AJvYcCUmn7qVSizRjZHg6B9Dq/V70a6aUdUzuuFpuJGhkeMSqitp10H39aOhL6IlUTZB6mx4deOVvEdtzt3Wsp4berhBUiGzzZsfJC8mtSBaL8DY9A==
X-Gm-Message-State: AOJu0YwK5FAD8o13E6Tg2q9hdZxF0FcOE7sLeW+tE5VmarCz/M+bP60k
	0+qiPHlaTlxF7eAdW5V8BqXPmRHJ6uWeyAKjsIdI8gl+xndcl/68C9gXq8E6NSI=
X-Google-Smtp-Source: AGHT+IEM61ROSOw0CzG0X8FSdmCEEg6WGFlarYhclikyQ2fR7QmVIqgP4xaOcvcYDgnr0vf49H+LBA==
X-Received: by 2002:a05:6a00:2284:b0:6ee:1d68:d33 with SMTP id d2e1a72fcca58-6f4e02ca2abmr35478343b3a.15.1716310056526;
        Tue, 21 May 2024 09:47:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:df1a:22de:40b2:f110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6584e7897bdsm9707304a12.21.2024.05.21.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 09:47:36 -0700 (PDT)
Date: Tue, 21 May 2024 10:47:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of
 IPI buffer
Message-ID: <ZkzQJepyjPz4Su+k@p14s>
References: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>

On Mon, May 20, 2024 at 01:27:24PM +0200, AngeloGioacchino Del Regno wrote:
> In scp_ipi_handler(), instead of zeroing out the entire shared
> buffer, which may be as large as 600 bytes, overwrite it with the
> received data, then zero out only the remaining bytes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e5214d43181e..dc70cf7db44d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>  		return;
>  	}
>  
> -	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
>  	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
> +	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);

I will apply this patch when rc1 comes out next week.

Thanks,
Mathieu

>  	handler(scp->share_buf, len, ipi_desc[id].priv);
>  	scp_ipi_unlock(scp, id);
>  
> -- 
> 2.45.1
> 
