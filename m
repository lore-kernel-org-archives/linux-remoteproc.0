Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C044C8F;
	Thu, 12 Sep 2024 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155112; cv=pass; b=ma3+/wEosPeX3zQzKSEnxC68TRihUhOcXmA9SRauuwE6lhtfT8zgm29vPqEGskXWM9mGey6UypiVeUyvorz5zzuDemu0yFJVPeMNlOlOdN3GdxgE5vzHBnn4w5jBBG9ja0e4LTdE1NJmtsp17ZLtyqvLa1Xxv++P7+SA69Gc1os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155112; c=relaxed/simple;
	bh=/ayxcgN01zXL94O1IKevl/0D45Irwt/+UChGAHvQ3m0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EfhgyVYK3tEYSxAgQFn483x7LWpabjbDoqoUs5o3xlIg4sid2RK7Gd7WLwH+ym3U6obZA7r2xSpbkKfLO3QzXPMmGyCiadECmuCfnRCmsD1q98QIwmG+3Slbwf75TgdAt/wt+s5LRMbeTpB9eLaSZZgI+KU9Tj66sPeQuH42zLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=K8X2v6ld; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="K8X2v6ld"
ARC-Seal: i=1; a=rsa-sha256; t=1726155101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QtUiDmtRqijCE0ndDFf52cBBR3ZcTFXQvpljq9B4dpqan2FsORJDPaHjSfRwM7mkiP+epUfbm9oCBth0XkUQ6/TnRcwzyS0+FlGoBz85sYaqZQqYJHLK4pnrn6Z6rPoxTh2U0dpWTC+peg2TRsCtKfMcwdznVphEHPMT9HgseUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726155101; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b9WP+mxv6vpXOPr0ioQLGuy77w7vcW8unNzXox+cGqo=; 
	b=JEGYyfybs0AEWhb2QvivZ6jBJxkoty6Sb6tl1Au5Xd3oAVTFGGZh7I/QWq/9c0HZqC2cYd+sSuVjLbeypaPuxvjx40mX92vM+Dcptb2KTFRkbfY1bktbyeNmztcan/Xr8zTi4f5ncJyN0h3WhrvZVGYB+ZsOBg+7oktPPxp3AO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726155101;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=b9WP+mxv6vpXOPr0ioQLGuy77w7vcW8unNzXox+cGqo=;
	b=K8X2v6ld2tDd8Fiz/uDyO2Rq37IrbfycayZlI4mP+ZqQdd2DKnaL+2h6nulbXUgc
	fBEcs+t1AoK+dlJ9E6rMsvViFrzKFgu5cStIx9R8dlguTgpMjDr6HJDltLpjzrAwO4V
	13/DAkNEtB4eXfOl1JPbZGJhubfVV8tPkDGzflSE=
Received: by mx.zohomail.com with SMTPS id 1726155099067152.57015306927974;
	Thu, 12 Sep 2024 08:31:39 -0700 (PDT)
Message-ID: <cfeb02df9a3f34b3509b26c40a90799aecf22fb9.camel@collabora.com>
Subject: Re: [PATCH] mailbox, remoteproc: omap2+: fix compile testing
From: Martyn Welch <martyn.welch@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Hari Nagalla <hnagalla@ti.com>,  Andrew Davis
	 <afd@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date: Thu, 12 Sep 2024 16:31:35 +0100
In-Reply-To: <20240909203825.1666947-1-arnd@kernel.org>
References: <20240909203825.1666947-1-arnd@kernel.org>
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

On Mon, 2024-09-09 at 20:38 +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Selecting CONFIG_OMAP2PLUS_MBOX while compile testing
> causes a build failure:
>=20
> WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> =C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> =C2=A0 Selected by [m]:
> =C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 ||
> COMPILE_TEST [=3Dy])
>=20
> Using 'select' to force-enable another subsystem is generally
> a mistake and causes problems such as this one, so change the
> three drivers that link against this driver to use 'depends on'
> instead, and ensure the driver itself can be compile tested
> regardless of the platform.
>=20
> When compile-testing without CONFIG_TI_SCI_PROTOCOL=3Dm, there
> is a chance for a link failure, so add a careful dependency
> on that.
>=20
> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in
> function `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined
> reference to `devm_ti_sci_get_by_phandle'
>=20
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for
> M4F subsystem")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0drivers/mailbox/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/mailbox/omap-mailbox.c |=C2=A0 2 +-
> =C2=A0drivers/remoteproc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A03 files changed, 6 insertions(+), 8 deletions(-)
>=20

Looks good to me:

Reviewed-by: Martyn Welch <martyn.welch@collabora.com>

> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 4eed97295927..ecaf78beb934 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -73,7 +73,7 @@ config ARMADA_37XX_RWTM_MBOX
> =C2=A0
> =C2=A0config OMAP2PLUS_MBOX
> =C2=A0	tristate "OMAP2+ Mailbox framework support"
> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> +	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
> =C2=A0	help
> =C2=A0	=C2=A0 Mailbox implementation for OMAP family chips with hardware
> for
> =C2=A0	=C2=A0 interprocessor communication involving DSP, IVA1.0 and
> IVA2 in
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-
> mailbox.c
> index 7a87424657a1..6797770474a5 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -603,7 +603,7 @@ static struct platform_driver omap_mbox_driver =3D
> {
> =C2=A0	.driver	=3D {
> =C2=A0		.name =3D "omap-mailbox",
> =C2=A0		.pm =3D &omap_mbox_pm_ops,
> -		.of_match_table =3D
> of_match_ptr(omap_mailbox_of_match),
> +		.of_match_table =3D omap_mailbox_of_match,
> =C2=A0	},
> =C2=A0};
> =C2=A0module_platform_driver(omap_mbox_driver);
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -330,8 +330,7 @@ config STM32_RPROC
> =C2=A0config TI_K3_DSP_REMOTEPROC
> =C2=A0	tristate "TI K3 DSP remoteproc support"
> =C2=A0	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
> =C2=A0	help
> =C2=A0	=C2=A0 Say m here to support TI's C66x and C71x DSP remote
> processor
> =C2=A0	=C2=A0 subsystems on various TI K3 family of SoCs through the
> remote
> @@ -343,8 +342,8 @@ config TI_K3_DSP_REMOTEPROC
> =C2=A0config TI_K3_M4_REMOTEPROC
> =C2=A0	tristate "TI K3 M4 remoteproc support"
> =C2=A0	depends on ARCH_K3 || COMPILE_TEST
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST &&
> TI_SCI_PROTOCOL=3Dn)
> +	depends on OMAP2PLUS_MBOX
> =C2=A0	help
> =C2=A0	=C2=A0 Say m here to support TI's M4 remote processor subsystems
> =C2=A0	=C2=A0 on various TI K3 family of SoCs through the remote
> processor
> @@ -356,8 +355,7 @@ config TI_K3_M4_REMOTEPROC
> =C2=A0config TI_K3_R5_REMOTEPROC
> =C2=A0	tristate "TI K3 R5 remoteproc support"
> =C2=A0	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
> =C2=A0	help
> =C2=A0	=C2=A0 Say m here to support TI's R5F remote processor subsystems
> =C2=A0	=C2=A0 on various TI K3 family of SoCs through the remote
> processor

