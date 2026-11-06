Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986648;
	b=h/V32c6GJYplwu8E0UYrOhFg8nSZpwoi4CX6xvGNJorGCqBvy9QpAW9DOLRZLLH64eZ9
	 NSCV5MepUSSp1C+0dNCiaJDJWPnalQ5PE9pAuZBmFNT9sRZwSehRuYrqj2zNpNGHWyZcP
	 ATDMM4XGvryz7PSgRNUWgp63Iq3n1T8RTEazZUrTsGqMyUmR+W5X45tw9scAOm82MT9wz
	 Ro9zUeAsjRyPuQ3Qiiz4fbedjMgjX7X6yF2hKIogCk0uwbLVcysGUH5YAsIODTyvuZt0T
	 EiX2BYwEx+WjxmaBjrJuWEdXyx+rls5GWHkYEIV54WMd8nonWqjdnvZfM8QhcQhzLzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
	b=w7xV1Dar4vUTU/O3EpkC5eFf5pqwtC/gn5yuOvq166Go5juMAdxj5vfXDuy+Vib7hj3K
	 gIad9LCzxTTU+l3eHWijPbER+7tlIk+g7Ivek694ehyq71UO5EkuD/iqRa78BivhiolCr
	 keX3PxQEWxMdu9OqHuS229PQ/E/zDQDW8pNuJVA+uMY9Rc88UL02v9UloooZ1Mq9JxXV2
	 H1febrCRWuXnioepCuG68U/TTBM0OfrHad4nf97g3VG7gYL3NhubCHm43ZsK0ug+h9LAe
	 MvxbU9N9AHATi26IspfUofsGjAXqfaoiV7kMbO0N1Ukq5fdGbCCFTgTK/B9IVSXPYOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jv4JtOFW;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B9606A329
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 17:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jv4JtOFW
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so558628b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 09:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793986647; x=1794591447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
        b=jv4JtOFW99wiV4NDqacB3xGxzaIoev9XxzTmlZKpB4s5HgPqYQAP9WjI0lJyyAdZ0n
         AVtBO+jFOjMVpXF4CqRP9I52o35we8R7SppFx0ThINAFmXTKPAnY9sKUf03XpOkZxulw
         PQR78jkhiQi5OmslTsz4oFAxfbw4Hd7XaLeO4/VnwrAUTqSIX44x4NFPvZ19f23re1lp
         n9X2/q1v5BGUxI+SGFovsN+eGe4eaIgwNH/MCCbNyszQ40+DAFGfhrhB8uOadGJNueXl
         WLvbQ7u6v71wtjPEE5EbxtnN17tlIzSORnxNmVlSvJqFmumjfzGWVsRZZUOG8xVyBgRv
         L3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986647; x=1794591447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
        b=hflVkhIOBdSkHteEeq0QwxGz0L/kNPE6sRC04cmnRY0e49ByugeL3djcIxTCy/h7t6
         wbKJb4G7AjUHQEtc86SZnhV+XiPu5nf7maMghRt2ThPPjznTP1sXm5orGNlWaugf0+TS
         QdISDiK3P6kT4FhlI8C04cVTLyRKoXcOtT1ZZSTxtWODd9RoRAY4g0zoX9RWEbByCO8B
         D3HhcZ34nYC1jjxx/FftPFBn7yNasZvCSkhmZEGc6G9PlrkN0vUiYfuoZlrZZpFF1VQP
         VcjX6qfoHn1oDcJ81y3i96b50UMQckt+fbLLodI9XuOlXHslWTmvYGAft4NrC25WKJ6r
         hOww==
X-Forwarded-Encrypted: i=1; AKwUvBxg3C40tJvG9vWKxlBzeRT8P/id24VQrg2XgZb6kak0f5wBsA/dfWi0bgOXYxoPyNLAsoLXaMT21xDdfM0gj4Z8@vger.kernel.org
X-Gm-Message-State: APuU4Z9GwPKRiG1MyqpRZekQeYisv3KhdqK6xfoElHSxC3oTm/QzHTXz
	IDVUtZWKcTpz1I9ruUlHD9iHN0vOkCCSNtD5g91hs+OhV5W14hbeJkOW4QnEGgC7+KI=
X-Gm-Gg: AYBFou09dSANtjatcuMi+c7J5iYmgEeE2CPGH72ffkva1F6EgOSdxy+jim75PPwDc/p
	WOFMY5/PvMwssXJZrrf86mtlR/y/l1s1WkSFrqkobxHQHMHepwFTDeC7OeK25J+PxvxP8+dp/Na
	YG3+OE5AiI5YKpsJusa4weleEcx9j11HDMljHRyse3rmF09KcKIntYgvqur2DgR4nn2XlZaOcR0
	ViV+AU6yUweIhFZtEZHJib/8IAVHNq5EVrSzXOO6STDFx4o/JxPKpqWaBK/uO6SZjr1wvc7HqzW
	r4/H1x+8E37vCns6wKrPUuQX1D4JwfN3dZryZevYOYvf4nWNRM30hu7KjMt3ZG3Xs95LTPdIB/M
	QHbUygA2vRg3MJA7Dho4t/ItjDoiJpVL7DPf7oR2Cm63yAS7BUD7i7d3liZfgEtu9P6oqnLaVL8
	wflmQct5YmvpWpSRwoPBXGlVwRsphE/pd7avkI9E6JMSH3EK4mo7U4jTTof29MN2vomYnE4pdor
	1+ooGU0wmMzWySgpqIqquaTMYQMYnf0QwM9o+MZPKqHtKk2Dzr0K++wToI9rjYhxXMypLmIl2YD
	IWB8MMhqshPeqMB+PhzGIxd425pcbJc=
X-Received: by 2002:a05:6a00:2e16:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8b37bb5b9afmr3072808b3a.35.1793986646752;
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:b47c:40a0:a4eb:29ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm855952b3a.31.2026.11.06.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
Date: Fri, 6 Nov 2026 11:37:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
Message-ID: <au4QVFyk7Zzc6y2u@p14s>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
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
In-Reply-To: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>

On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
> The comment for virtio_rpmsg_config says that this structure is
> naturally aligned to 32 bits, and this is desirable by some
> architectures that don't get along with unaligned accesses.
> The content of the structure itself however isn't aligned, and the
> __packed attribute prevent the compiler to add this alignment.
> 
> Fix this by adding a padding byte.
> 
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Hello,
> 
> unfortunately I missed this when the original patch set was sent, but I
> think it's worth fixing (or at least discussing) this now before it
> enters a stable kernel.
> 
> The same support in open-amp has already been merged [1], but maybe it
> can be fixed before the next release there too?
> 
> Another, lower-impact solution would be to fix the comment, but that can
> then led to issues on architectures that does not support unaligned
> accesses (e.g.: AMR Cortex-M0).
>

Thanks for bringing this to my attention.  I agree with this patch.  I will give
Arnaud a couple of weeks to reply to this email though.
 
> Thank you
> 
> Francesco
> 
> [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
> ---
>  include/linux/rpmsg/virtio_rpmsg.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> index 0872cbca4593..d24fedb63023 100644
> --- a/include/linux/rpmsg/virtio_rpmsg.h
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -23,6 +23,7 @@
>   *
>   * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>   * @size:	size of this structure in bytes.
> + * @reserved:	padding, reserved for future usage.
>   * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>   * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>   *
> @@ -33,6 +34,7 @@
>  struct virtio_rpmsg_config {
>  	u8 version;
>  	__virtio16 size;
> +	u8 reserved;
>  	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>  	__virtio32 txbuf_size;
>  	__virtio32 rxbuf_size;
> 
> ---
> base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
