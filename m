Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26B22F01;
	Sat,  7 Feb 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770486495; cv=none; b=ilPcb1ZEKtcmPO53msIpYwfsMRgDOGCJV5f/p1RdAbUTfDUCpe2V5FmrXEcNUFobtC6MpDz0hXSsqvAdx1sZb3qNefItP3BcrOvTo/1N5BsOOPPYsZXNxxQBvylW6+kLzrO5V+u61Rs8gRVFO6Dte3xeRt+gUi2Ept4Nc2PKWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770486495; c=relaxed/simple;
	bh=1Uij8yWbr/rN53Y/rDH6dxMtBk5uz07N+TopiVt9W2g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfF/9gR4Ubcfuo9J6w/4CG1n6P4b9Ior0yvxVDP83QKn+7+Hqczf797K40KLFp11i2b7Kyf78HolapRdX3+yzAOdpc0KUQ3/15qKuA6iqPSEhONx+U4vQ/NVG3GKsVnUhPEnyJIrscaWm3PRqcEREi0HOWfMjSCGd/DfvmGozZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=D08GjLQO; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="D08GjLQO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CquahxHKt4LnZp81M4US2qX/SZr84sRWCpQh6jX8rkk=; b=D08GjLQOVFQwok8iRjt7kcHuHa
	nu6xaLbrOUbyFQo8DBJFFG6HpqmHMBdYBUxEU4qXN2TvpJXyYs4/K9W4xiWftc4s20fXgvggP5hR6
	x8MfrzLS0ULv1umJBAJPaIm1buum/Uj3/pJ91TUKJf4f5OMMWlasHee/jT2OhcrZl08qNS1kXfCnr
	vRlqzsoMKIiciYKKvUEhPmjF5cRErWOy14SyqtLg+41CbSf05/1JrW1gmm5j5F5TON7eeMVSxZstu
	8+N7ttb3VeN1m1CxgPWzh5Q00CQCqiyzNPsI6JmRyjffGQhkXyI4ZyoGOI2RwhtnNf/b1vVnKJPJG
	YbXhYJqg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1vom7b-000DKa-06;
	Sat, 07 Feb 2026 18:29:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1vom7b-0004LP-1V;
	Sat, 07 Feb 2026 18:29:26 +0100
Message-ID: <0f24fbffee25ded20f536577c6e0e3b3055d55ea.camel@apitzsch.eu>
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix reserved region mapping
 failure
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 07 Feb 2026 18:29:25 +0100
In-Reply-To: <20260128220243.3018526-1-robh@kernel.org>
References: <20260128220243.3018526-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27905/Sat Feb  7 08:24:54 2026)

Am Mittwoch, dem 28.01.2026 um 16:02 -0600 schrieb Rob Herring (Arm):
> Commit c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
> functions for "memory-region"") switched from devm_ioremap_wc() to
> devm_ioremap_resource_wc(). The difference is
> devm_ioremap_resource_wc() also requests the resource which fails.
> Testing of both fixed and dynamic reserved regions indicates that
> requesting the resource should work, so I'm not sure why it doesn't
> work in this case. Fix the issue by reverting back to
> devm_ioremap_wc().
>=20
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
> functions for "memory-region"")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> I created some dummy regions matching the flags used here and did
> request_mem_region() on them successfully, so I'm not sure why it
> doesn't work for this driver. Something else is requesting the
> region?
>=20
> Perhaps there's a deferred probe and somehow request_mem_region() is
> not getting undone correctly?
> ---
> =C2=A0drivers/remoteproc/qcom_wcnss.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/qcom_wcnss.c
> b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..4add9037dbd5 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -537,7 +537,7 @@ static int wcnss_alloc_memory_region(struct
> qcom_wcnss *wcnss)
> =C2=A0
> =C2=A0	wcnss->mem_phys =3D wcnss->mem_reloc =3D res.start;
> =C2=A0	wcnss->mem_size =3D resource_size(&res);
> -	wcnss->mem_region =3D devm_ioremap_resource_wc(wcnss->dev,
> &res);
> +	wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss-
> >mem_phys, wcnss->mem_size);
> =C2=A0	if (IS_ERR(wcnss->mem_region)) {
> =C2=A0		dev_err(wcnss->dev, "unable to map memory region:
> %pR\n", &res);
> =C2=A0		return PTR_ERR(wcnss->mem_region);

Thanks.

Tested-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu> # on BQ Aquaris M5
