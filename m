Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235776;
	b=FQ4ZCLWjReSEmVODYft2JQv+CYxHmGVbBT9bvqTMLKrCxNtihbIQGYSaV51ZgB+gAbNl
	 /ohHdBTM5+gtoqn01iWG2qhe2bAvs9j89WInXPC/dTDnMP9UNaUGvnT7nZmthy3Cn66n+
	 LwWYoCA1/JEGvWw006lQS6/WEAwU0AsotJxNKwzF+e4n8J41REqAqFEangt4daXJNBsIo
	 f1TKywvJh/iYsUDRSDEXBfb75Al0XPIS+mqEwSeFE2dbkad6h/1kU9GsUdJAe9vuQ5iji
	 geSUTw9RdKqJFMbTUvgtHOpZQm7SNg8TgsBfi3oyaTctxfvSBrH6mtRv4wlYQel7imQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
	b=smNE2mSa40uwFLtZukaXa7C2tKQ5FmqSOx546i+YOCACbfe5W7TUX+tLtYW0bCvjG6qE
	 E4rHeRFw9j5WexHU8RHIVPj0aIelIs/ws1sxnfCns4l/EVjuLcc1q4wAAiJXDDecSh57o
	 VJTBdu79mdrPE5koqNsZv+Vy8hwsvR50g/Czr7CyuIB0QCv5hwNZkVA+7lvXOdTpw3SqG
	 EOINRfE5HCcgcEVHb01vkrS9YGXS0UfWEsYTLcIMLBI5tbgQ7oRgbtzv0TkDaVuuCBs0r
	 pbBUJ1WqTP7trJO1ZFhi42KIKWeXbpz9aIHhNgqKvbmxmdpzvmBpSCM0l7eP5rP10VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qSn5tCrS;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D3606EE92
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 14:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 171D3606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qSn5tCrS
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so305895a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 06:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794235774; x=1794840574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=qSn5tCrS/iALUW2o29JpfVBSC/w/fuTlQyt/hQx5xjXyDT44VJzAaYeyiRe/6E13sV
         t/qlPhC87Um1dLFpG5KpIWiucLgomJuohWRGOypg0smWoG0t381yvGx+URJcaEX1XHdk
         kU05gVVRPg+aY1gnXsaOEJU4GylzKYcD9Ji2q/79g1AxgBbhW2ePpEhgvcwv0OwZmEPx
         JPM3A/U5YDvoU1ozBWcDBptNRytaOQbMJyeYyQFGo+SbyuFgSHdiZPORt/oRysZKvU4G
         YSXBWIQFBiS9bwlRZ5c0Rqmnbc9yb+dQG1h6v62selmhfmVcoywKT48t5H+ck2eXNHMK
         uLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235774; x=1794840574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=SrFYzwG3qlGSEyRe2CzalZMYJqSMx2zeqx4RYvOeHy7lYd8BLlXlU/3tzRS2eNUkug
         Nf+Vm+s6RXlcSvYmgX3IDQPZ9BstCorQt/LIOpbcUdIss9W9DedD40dQV7iK2IUeik6J
         WKagm1/BEih6RzT6aqZFi8wBIy6yd8uGCK80jCHhU0A+b1duLNaUjGdKxaMsP3FJt5WV
         uNjnYoF006QYsEhHbvmlUoQdcG7xxRtsKGrcoDwyZtFiUkRpl8wrVMhiazY5TIMi7kkF
         w4jnQ7NMEp0nPHBa6u2E0ES/czUh8T+eHmoMm5kU/wDLo1iHm/glRpapjEOOhUce70JG
         fQ5g==
X-Forwarded-Encrypted: i=1; AL+hErG23wdx+K44Jp3mhyp3TRa94wqaprkyL2pOQvznpeJKj6IdmkXLNLiCjJzqg9YaJ0gN/JWzvUF7ZWAXh2bdWdEO@vger.kernel.org
X-Gm-Message-State: APuU4Z/m8qTr9kck7HpRyKJM3x1RABOy9ejsXIwQvDRg1QszfmMe5S+s
	GtycscYPNTcFlisZUbUs9lDeyMjtFE2vv0Ugzw1D/xnvpA/DrHzhCX0u2rMI9MYz7Eo=
X-Gm-Gg: AYBFou2054Cj2qaM117GktiOtgdtB1VAKTHT+yWGYiMwroqL3iE8x0Uu6LiWDTB740I
	L9zdZqFHjtmCui1O33hgx/Qbb3T/QFnvFtfpY2db4xOFimybjw54qT8YDm9SU74N5xsobW/0dXk
	zD6I+RhUCinFrYNoOkJuX8/uLlP/VKdvMv6RIwnw19y3uJhk17rQrCWojHWHFcgGYzSMpqDxdVR
	YYgjHC9BVD3Am3KxVMKQuXmPnBm6ic8lbbF4VR1ec095moyw3trkjG73RlDQiyZY13tph1G7M7o
	e8ZkDxejnMV9UBTW42RON4jEmMSRztiPzjse6lqkLAmjkr6m+4tvlQIPxlsizvfIgXfFi8Iv8SP
	G4T7D8n7r5h8t+A78O59fKOTEqJvBE8Pwhq1qtTy/0Kwbe4ibR3rX/jN51aiZPWnyuDWZw8P/im
	gZHvBZmyvyoTKfy9eUD/uuJkAjTJOtkEnXeloKozH4rGcduIDvAjdA/EdLjyf6/n7Y7NHXRAxx3
	/nv/9YHoxEdVw0LUt91OcmklHsawV42zw6lfxScoFYr+zydqx1dbEX3EbBSkuzsKUQ3azNzXkKp
	gVNHW1nq2TM8KlXILhExY0C8x+z83g==
X-Received: by 2002:a17:90b:384c:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b12d1080d0mr4128385a91.1.1794235774376;
        Mon, 09 Nov 2026 06:49:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm6647786a91.0.2026.11.09.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:49:33 -0800 (PST)
Date: Mon, 9 Nov 2026 08:49:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <avHde2RgEUtQj846@p14s>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
 <auyGiW91Ir0JcuxG@monoceros>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyGiW91Ir0JcuxG@monoceros>

On Thu, Nov 05, 2026 at 02:41:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6e..e750a127cbc4a 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> > >   * @detach:	detach from a device, leaving it powered up
> > >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> > >   * @da_to_va:	optional platform hook to perform address translations
> > > + * @memcpy_tova:optional platform hook to copy data into remote memory range
> > >   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> > >   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
> > >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > > @@ -99,6 +100,9 @@ struct rproc_ops {
> > >  	int (*detach)(struct rproc *rproc);
> > >  	void (*kick)(struct rproc *rproc, int vqid);
> > >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> > > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > > +			   size_t filesz, size_t memsz);
> > 
> > [Severity: Low]
> > This isn't a bug, but is memcpy_tova the best name for this callback in
> > struct rproc_ops?
> > 
> > Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> > ops->da_to_va), da denotes a remote processor device address while va denotes
> > a kernel virtual address. Since rproc_elf_load_segments() passes the
> > untranslated device address da directly to this callback (including for
> > devices where remote memory is not mapped into CPU virtual address space at
> > all), calling it memcpy_tova seems somewhat misleading.
> > 
> > In addition, when rproc->ops->memcpy_tova is provided,
> > rproc_elf_load_segments() skips both the filesz copy and the trailing
> > memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_tova in
> > include/linux/remoteproc.h document that implementations must copy filesz
> > bytes to da and zero-fill the remaining memsz - filesz bytes when
> > memsz > filesz?
> 
> That's a valid concern. Maybe `populate_segment` would be a better name?
> I considered being more verbose in the kdoc entry, but all the other
> entries are very sparse, too, so didn't want to add a 5 line comment for
> the new callback among all the one-liners. But I can if you tell me your
> preferences.
>

I would stick with ->memcpy_tova() to keey the mcmcpy() semantic already
rproc_elf_load_segments().  But yes, go ahead and add the 5 line comment.

 
> Best regards
> Uwe


