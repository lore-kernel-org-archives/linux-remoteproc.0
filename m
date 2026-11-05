Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886104;
	b=vO4H1ur1EGcAVGg8VxOT3pVLeBNe1pKrbQXXTXRuRJ6WQqkfO5C7rbMSUSKK2xPIrTfS
	 EzbDZyLqq3XcYNNbFsiP/Go2YghIgWy1RZ5dXlRBR8F/DLuYDeUnU838X9NpkcwGRct1u
	 MeR/YdVxmOMXbGukE4CwXG+52FqlPYk10PMxiL/2Ci+lsLJW3xgms8ph7uXZt/IHBl/HZ
	 sr+hgdQGQrTkwd3VZC+lEcmYaG/ApE36yMdMaJMreqvQIwkKOK84RT7OHGcldbdcUkiVZ
	 N4HAZedBMTIVmoACCN2f81HLbN0rv1kir2sH+ZjwrymBSarmC4q88IdJEbYb3fxodzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
	b=g9ehkq4NTksQAcak0KBMt276JWHbyH8RVnTLpTFookTo23QIUOyb5fTUYagxSRl6Llw9
	 B7bLdFaZA9saKEMFGQ1ITNllb0ZPVZrA4OJ0d/+7UusmP/ipI1kPS0Hqh401+9bxrbUti
	 SLBC6ZVZLB9rek/fw6trBmndDzk8RrBijASh50wplZyrYnf5I5e1lRaxyeqVkRPIbZEkE
	 UZE/1UUEYh5hmkXs/eXwo8fKzOhu+x0fKRlQLeIgDJl/xIi85BAnGdNNuLRJISWwnLhJf
	 aOHcJ+aB/iN8YOAjOuMde018slLFYPVRs9vggUO49EnswNzB1dRNfeuB/ImJ2Zcj8yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hr+5+VmY;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664CF606A329
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hr+5+VmY
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso502678f8f.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793886102; x=1794490902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=Hr+5+VmYwlvXWWmnx8xC/o+Rk/3DN396WTfJJ8axuTDipMHcCljTfd+46AhY27xyRg
         J2mE6RVfiV8B/7RU6gn19BfadVmWzZ3Mevy0z6BaIGpLpl2V0gOTASpf8XtBcwWxMCfi
         XLCwkK2KbrcObYOwNpnuvF+9DTBaU/KVxNRv0dS/2nDkvsU8s3CMCT9QAcydehJW/trv
         GsAVZ6erkHBKsboC3h3/KYS3DmC0HM6JbwdFQKw7FFjiSmA/Py8r5SERm/klEONZ44C2
         o9qCkFk8bKIXH1DxDa5GqqUaCO0FCLW/ZkpGYck1lzoEVfK5gYw6O1tcIv7C4qX8s7E1
         aESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886102; x=1794490902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=xOeERTsnS2q5bVuFR6mY06DHsKDlfi33/1doGmrUnXZLHVsvdcP0JwutzZ8sa/GSio
         Yl/nLTTu5uDaLcBC5yzflBkvKgmg3cikI55AtHTLdz1cVxj55HyjZr3mV9pTk6rAyF5X
         jKAxuZPa75KOEtL2+vmlXyKGu0gdIyCDQ6PI/l/89ceXE5eJ5m290umlfpY9JLX+K6ju
         LG+iFXaIg9WYxYvX7AIBkHbq6Qps8Rn/Dowm8qYRV+R7M1Duxs7+SY8F8vOng+nrZbOD
         JcuLB6xcjs9qRV3GpPo0eocCByVH76ZxQrrEjaxy56HsDZrpPRGdOo7LPiM1tcPtB9iP
         Bh1w==
X-Forwarded-Encrypted: i=1; AKwUvBz0++7LMYkZjS//NpJPt3kOrI2nI5AqTSLCLpBzWOT7igXevNE76etuxkZZBsBMZL6Os8SY98HMfdn4dtKFGgd2@vger.kernel.org
X-Gm-Message-State: APuU4Z+/K0xr2uxMTF0eOL9BX4kulvksYeqJAhE/zJQJxLQ8r3frBh4w
	m8fIqLMqAAqdsHQr3+05LxGz6scArhwVunCpdxx8eOElJe+n94Gq6lm4yD2b4oMX8NM=
X-Gm-Gg: AYBFou13/T3zhva1X8ge56ihDzW6SgeJSlJe0oRv/FhUCOHdPPqSuZpWoVsx8pDcMCv
	vak754W3vT3sCP1XPu9rYz/2bhWY5iyaV4nMh8+L67E75+MpS2U4xKH0HqQHzG9gd5yujZBu5Cb
	xhYjmw3yXDiVthRaTvxscECjPEI3Dg90XB7uCSzjt35jGPFss232PDAM0GyuXuQ0VfvywtRge5c
	jSuOdfxRx0q+7H4RGv6001Foo3rAbhPvllRVd0R2vtchMXD2wA8CkplmTlhYYB3KyJjU3SAdZAD
	6rXa9Udy7PNQesrJwz1KXYV8BXaon2CORn89DAJBxIw5EzQocuwKVJfBx+ckOpZxFxIrLRkSr6c
	j4CdRlkOfYJ0W2bf/vnCkAKUTcviRzT6UdwNSmcn9pjMfFGYSCfZIzD4CG4B4w8mH2KAMrOBS4H
	5JrDGB0QHFMt9Z9vt8RolehtGzGlkNbYmBZckswcwwpiUQp0j8tPpZpdW2Q4e3OZ9nZYEwrngya
	i8fO1weBDpF2mZFPxTPjSKhD5onSJjVAIRnvIYEBdZ547752dbZQjssaxxLrYACmFg44hCVLN6h
	n5zpbSg17p6dDebrUwxfcIDS7uXMQtJUnUmFWx1Fk67ZmTYT
X-Received: by 2002:a05:6000:25c3:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e6e5182bemr39618525f8f.51.1793886101892;
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fea1811c4sm10123361f8f.3.2026.11.05.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Date: Thu, 5 Nov 2026 14:41:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auyGiW91Ir0JcuxG@monoceros>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwyxkko7vmbusv5v"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-198999@kernel.org>


--cwyxkko7vmbusv5v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello,

On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 00019b1895e6e..e750a127cbc4a 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> >   * @detach:	detach from a device, leaving it powered up
> >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> >   * @da_to_va:	optional platform hook to perform address translations
> > + * @memcpy_tova:optional platform hook to copy data into remote memory=
 range
> >   * @parse_fw:	parse firmware to extract information (e.g. resource tab=
le)
> >   * @handle_rsc:	optional platform hook to handle vendor resources. Sho=
uld return
> >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > @@ -99,6 +100,9 @@ struct rproc_ops {
> >  	int (*detach)(struct rproc *rproc);
> >  	void (*kick)(struct rproc *rproc, int vqid);
> >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_=
iomem);
> > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > +			   size_t filesz, size_t memsz);
>=20
> [Severity: Low]
> This isn't a bug, but is memcpy_tova the best name for this callback in
> struct rproc_ops?
>=20
> Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> ops->da_to_va), da denotes a remote processor device address while va den=
otes
> a kernel virtual address. Since rproc_elf_load_segments() passes the
> untranslated device address da directly to this callback (including for
> devices where remote memory is not mapped into CPU virtual address space =
at
> all), calling it memcpy_tova seems somewhat misleading.
>=20
> In addition, when rproc->ops->memcpy_tova is provided,
> rproc_elf_load_segments() skips both the filesz copy and the trailing
> memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_to=
va in
> include/linux/remoteproc.h document that implementations must copy filesz
> bytes to da and zero-fill the remaining memsz - filesz bytes when
> memsz > filesz?

That's a valid concern. Maybe `populate_segment` would be a better name?
I considered being more verbose in the kdoc entry, but all the other
entries are very sparse, too, so didn't want to add a 5 line comment for
the new callback among all the one-liners. But I can if you tell me your
preferences.

Best regards
Uwe

--cwyxkko7vmbusv5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsh4YACgkQj4D7WH0S
/k4IJggAu4L1Wed3i0W4vuPU7pAQ2mQJvf3FezMAeGDQffUtpvt+zlonpWqYwV7r
HK8tL4z8k28POxQlGKhkCLJS0JLSFnZpN2S0YQ7Kh2gQyzfxq6sUkwUkHKGNtYSX
0kI4wqKgdURieKMj4hFmGKeX9o/yXSX3F9W+uF+FwTl78oOZAK6YWgoZLjSbiagt
M40PJrmpoCTPln1ZcWc66RLVoA9IBR8TELu2VNA536pV3RSAGaCbHHmECAQMrBMY
IfGrXrxhI7fCIhMC5OT/hBBRB140ekbyW0PC1kdVqu1iT4j1WI7f+2wMV3e5ba2D
Yl1Q7lDlQ/qxjmKRlfF1oyzKWeAl8Q==
=axH4
-----END PGP SIGNATURE-----

--cwyxkko7vmbusv5v--
