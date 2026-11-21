Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266279;
	b=RT22YbZhFR/Xc4yBD/IYzArZvgcIYIx3BYcZTKUd0KktL2v+FPw9rmESBwzmC4eKUPEq
	 Bfl1blNAkS2khDUUgXQv8NX1StunXOaLT2C6iO0NlZXbnOuqsR7wjYGs340WOhZq4njp4
	 2qMmHr0SxrqCd5Uu6f2vNyAWQOGSaNDPRD9py7BwXVT5YGx3M1scMmL9w9QghQGQRW9PP
	 qZUbFJjYP0HbV28Lp5OD4O/N4Zg6BEnOY2Nf1HKJiM51PRMHgsv2qGglbKEEOd73z9jUi
	 EjETyhd13COaUBMwSm1kbz3sxZrOTh6oLdNwOA7si/0ZP5QWf3Txy3GNAejhLicysMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266279;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=VRKpYW8QrBp27bcN8LkOSgbQ+XcLXzwp3gfUtGX3I1Y=;
	b=GYbGN2UMng6Xjm/3miMVBuobgmKY12Bt5ysy1Qc+KBXJzunY5Z0efbJr3+dJwgUz9y7h
	 0gjaWzxyw42oZ11OJnWmgKke5fVkYHwAaefv2UbvosGjQOrMpwruAIZui/TSBd5JrQCki
	 rfLYmTj/PAvCVfdvwLaNTaUR+S1fDuYrYI5/llH54Fd722hBNkA8VWvI3f3bu2TJgrLgb
	 GpKZ9yIq4UnfzssZaPx8P6OVT9p0kRlBmupa58ldWMGig744dtzltuZqYm9BAbxHRh/+5
	 SaGxaWPQhGB5iSHuOFnbt7KAsDrsMXgr+pOe9Nf2IgorvVLzQ+mfO6KVgrtvCrnvJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=IQ5S173g;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="xfD/3ECA";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF591606A32A;
	Sat, 21 Nov 2026 13:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF591606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=IQ5S173g;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=xfD/3ECA
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795266267; bh=VRKpYW8QrBp27bcN8LkOSgb
	Q+XcLXzwp3gfUtGX3I1Y=; b=IQ5S173gVSHPRxsYONXx2Ivuzqga75mNflODxaHa0ZRwOfqlWf
	O6WGD3c4CXQ3wU2/R8PtfTvxXzIDF/CRLKtVe/l6T9D2+lKVkz1y51DwwR5DqZx36CCNnUIfZ3Y
	Bp90FXtCgg+8ZvdrV5aUKjKzUlyR0c7aUJPtK4ZAEsfBoCnXvksBQ5VqVaP08PTEerAiNHEDf+P
	4oUI4zOgub6aiFCNJz0B87L0tCsMXs5+WpZxEsLMvz5JE/GEmpZiDmBu1RGWbwW0GpN+XjTH4k7
	7HtRSPraHsnHOF1e1aakBKBderiMA/nevs7Pa9EzeUlTh/KgprmwnVbJrKCGkEsFMxA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795266267; bh=VRKpYW8QrBp27bcN8LkOSgb
	Q+XcLXzwp3gfUtGX3I1Y=; b=xfD/3ECAS0+mo9Oml06xqCboa5tPxmg03DtUHpBilXDZAYADZ4
	0U+51YKk1/8iXlGAmqH1Asyh4h1ySkfPiCAA==;
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 14:04:26 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Save the need_pas_mem_setup
 into qproc
In-Reply-To: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
References: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Message-ID: <bca16109c94e7bd5fc057cca895ec50f@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-17 20:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> On hardware requiring Peripheral Authentication Service (PAS) for modem
> memory setup (e.g., SDM632), the remoteproc subsystem skips hardware 
> memory
> authentication because q6v5_probe() fails to copy the 
> need_pas_mem_setup
> flag to the allocated device instance.
> 
> Original commit didn't save the value into the structure thus quietly
> skipping if (qproc->need_pas_mem_setup) condition.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: 
> https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae
> Fixes: f56052f4d87c ("remoteproc: qcom_q6v5_mss: Introduce 
> need_pas_mem_setup")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
> b/drivers/remoteproc/qcom_q6v5_mss.c
> index dd052a62b8583..5d084aa2eac36 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2189,16 +2189,17 @@ static int q6v5_probe(struct platform_device 
> *pdev)
> 
>  	qproc->has_alt_reset = desc->has_alt_reset;
>  	ret = q6v5_init_reset(qproc);
>  	if (ret)
>  		goto detach_proxy_pds;
> 
>  	qproc->version = desc->version;
>  	qproc->need_mem_protection = desc->need_mem_protection;
> +	qproc->need_pas_mem_setup = desc->need_pas_mem_setup;
>  	qproc->has_mba_logs = desc->has_mba_logs;
> 
>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, 
> MPSS_CRASH_REASON_SMEM, "modem",
>  			     qcom_msa_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
> 
>  	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
> 
> ---
> base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
> change-id: 20261117-qcom_q6v5_mss_msm8953-aba81523223b
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>

Thanks, i have tested the patch on Redmi S2 (MSM8953).

Tested-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
