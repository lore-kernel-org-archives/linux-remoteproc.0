Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F91A727F;
	Tue, 24 Sep 2024 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188383; cv=pass; b=FNhTLzOGFmhgxAReJxQBe8F+/snJ6fmnZ3iCg+sdZROh3x1laAnvA5902VNGU/KCSE1sw2f1tBIYNfpLn+X6RorclsGEar0AIOaVsoznqyH8LfKmLvpkwmOtlXANZA3uQ9GQW//yK2KduvHg/xvMAKGEUsI/HMGkboQxndlMJCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188383; c=relaxed/simple;
	bh=23fVss+xS/ckVWSTt2m9xuYjlQhKmAqEs+otg54uhuY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DE/mnclleH6G5d+z25bysvFtTPxwjTDkq9IL2P4pHibqje1Xqb8l4cHTk+bH/Xk+89sZUrbY5oghplhFXLDW7ifufDZGfTQVUWrfpsWd8zxPKKXSEEZKsYEQ4z984BJIiDh5I1zc9fwqm/KkqRP0f4X48O7G4c5HcjusDQVLOcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=GA59/yGp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="GA59/yGp"
ARC-Seal: i=1; a=rsa-sha256; t=1727188371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bTGQXtrVzd+sHg3DBNJZZ4ySUOQrKex/bTbM+19HhoQmxU0coGNFMuVwJ8SG6wfo2J+o4q0ua/jQINEN31MMWXxi10IPdzjIHXVNcp1oHinQIUzGd8SZ7+Tw9QVI1IjvG1VOe/bK25zQgBgbSkAF9jQHW4nxROze/+O4JdRaYMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727188371; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+OsLGtoXi6t+3n8dPBbV9wId/flKJmi57qCOu69NY3c=; 
	b=ewpPPqvtCLED5HUWrmHNyN1NEb9URXNaKyOdZe0P4iBQDjnQ57ez+36tQmPMCbHcsMjLVkifxubhy/QL4EnUibG6GevXdhOBzgKvqdajEmwEABZF8/xXz9xXe/NWm0hOlHgA2Ar6X74as+7tP1bA9hr8Ue0Xsr8j7NFQDJujUBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727188371;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+OsLGtoXi6t+3n8dPBbV9wId/flKJmi57qCOu69NY3c=;
	b=GA59/yGpq31CsY54hQlEcQMN2u2N9GzZ6Ud8dZoqMTlWYi2KyM5Jc/56zCkQLEZz
	phH6DTcgzR2bu0hLDUJs5/qiOFVBN/BDrluiayZm5CnxBzy+RcClgYg+bcS0z1hMMmH
	i7JdVf1Em9AxN/doVGZVFw9eA6NO2qS1oFv9F0lE=
Received: by mx.zohomail.com with SMTPS id 1727188370492496.7893157926309;
	Tue, 24 Sep 2024 07:32:50 -0700 (PDT)
Message-ID: <ad422aebf347059c7dbdaee5a13d2d98093b77ca.camel@collabora.com>
Subject: Re: [PATCH] remoteproc: k3: Call of_node_put(rmem_np) only once in
 three functions
From: Martyn Welch <martyn.welch@collabora.com>
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-remoteproc@vger.kernel.org,  Andrew Davis	 <afd@ti.com>, Bjorn
 Andersson <andersson@kernel.org>, Hari Nagalla	 <hnagalla@ti.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Suman Anna	 <s-anna@ti.com>, Wadim
 Egorov <w.egorov@phytec.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Sep 2024 15:32:47 +0100
In-Reply-To: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
References: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Tue, 2024-09-24 at 14:43 +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Sep 2024 14:28:35 +0200
>=20
> An of_node_put(rmem_np) call was immediately used after a pointer
> check
> for a of_reserved_mem_lookup() call in three function
> implementations.
> Thus call such a function only once instead directly before the
> checks.
>=20
> This issue was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

reviewed-by: Martyn Welch <martyn.welch@collabora.com>

> ---
> =C2=A0drivers/remoteproc/ti_k3_dsp_remoteproc.c | 6 ++----
> =C2=A0drivers/remoteproc/ti_k3_m4_remoteproc.c=C2=A0 | 6 ++----
> =C2=A0drivers/remoteproc/ti_k3_r5_remoteproc.c=C2=A0 | 3 +--
> =C2=A03 files changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 8be3f631c192..d08a3a98ada1 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -576,11 +576,9 @@ static int k3_dsp_reserved_mem_init(struct
> k3_dsp_rproc *kproc)
> =C2=A0			return -EINVAL;
>=20
> =C2=A0		rmem =3D of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
> =C2=A0		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
>=20
> =C2=A0		kproc->rmem[i].bus_addr =3D rmem->base;
> =C2=A0		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 09f0484a90e1..a16fb165fced 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -433,11 +433,9 @@ static int k3_m4_reserved_mem_init(struct
> k3_m4_rproc *kproc)
> =C2=A0			return -EINVAL;
>=20
> =C2=A0		rmem =3D of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
> =C2=A0		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
>=20
> =C2=A0		kproc->rmem[i].bus_addr =3D rmem->base;
> =C2=A0		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 747ee467da88..d0ebdd5cfa70 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1001,12 +1001,11 @@ static int k3_r5_reserved_mem_init(struct
> k3_r5_rproc *kproc)
> =C2=A0		}
>=20
> =C2=A0		rmem =3D of_reserved_mem_lookup(rmem_np);
> +		of_node_put(rmem_np);
> =C2=A0		if (!rmem) {
> -			of_node_put(rmem_np);
> =C2=A0			ret =3D -EINVAL;
> =C2=A0			goto unmap_rmem;
> =C2=A0		}
> -		of_node_put(rmem_np);
>=20
> =C2=A0		kproc->rmem[i].bus_addr =3D rmem->base;
> =C2=A0		/*
> --
> 2.46.1
>=20

