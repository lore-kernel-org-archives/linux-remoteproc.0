Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887A20CCD6;
	Wed, 19 Mar 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378387; cv=none; b=IteIQGw84JD2Etw3G3MDwCDuVgUqYuI27JU5TznsSgQivaH9/SHohi0zdAVqGwCTLqtL4Z+83fUYeX2xtgoZ2/ASQhqUV6jTGvqFi+sQ8mZay2GDx34D/H3aSAW5EGu5HF30VYJ7Chsf1bGovDgqYrYlHT2qlrEiHY0JfXHavRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378387; c=relaxed/simple;
	bh=A7/fZiQcIOJ5NJ0ZIQ3qSpzwWLkKdoNXZfhF+uZsw6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FJ5T6q01VL2Whb6jB6wU6WsC8cOaYQEWhibAuemPsSm+nFtTefVU4nERHDzldgqGR2VJQ7+pgfe+kf6DVqM42xjnCNkaeMR+NxLdrcoPlAe2HnDpF9iJKkIbjHvWHy+7XiBzT2TH/gJRTgG+t1BeVXfz1FEYmFHKbRDn2NOWsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pp/sMAVL; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XTsKLwFy reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pp/sMAVL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XTsKLwFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742378384; x=1773914384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GlT/C20cWGKRSDi1pjWsYB6aiO4zGZT8fzSlsIsRNJs=;
  b=pp/sMAVLMst7v8AuvmFb1YvyDxc066YMwOKdxOSEa7YREozsVqrTNoGN
   PmdDEJPPCEqLFfF9NyOfJUIOqKPz1GAjvUG5hlkErtG+C0/slrrglKTwl
   PsNV7TLM7EDfcqX5iiYue0FV65E9oLOFfvPQACr/1KD3FHC+vhlR2ORtz
   S78Zsm5fjqoULo/MtLTPZHVmr+Nt4gDM17cK0psn6e4FklTJ9DM90cGnR
   MC95Pc0P8pw6EUhjt5ZArWQWSeD+PKNuHVoVVEd84dJepCWPg3HVb+nhS
   q6DgmUWHpKUqfWdTib3rjdcmfgGYyLqvgJNnbfi+4NUZp0XrcDG3TkP40
   Q==;
X-CSE-ConnectionGUID: xLtByYCFRwm1Mpj9OTlMyg==
X-CSE-MsgGUID: xhT83+S8RHS7Vf1VWKmArA==
X-IronPort-AV: E=Sophos;i="6.14,259,1736809200"; 
   d="scan'208";a="43041375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Mar 2025 10:59:35 +0100
X-CheckPoint: {67DA9587-18-7141A0B0-E6EDEC14}
X-MAIL-CPID: B0D1A9EB8A7FE01E6C3F0B58B214D668_3
X-Control-Analysis: str=0001.0A00639D.67DA957C.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 695011609D3;
	Wed, 19 Mar 2025 10:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742378370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlT/C20cWGKRSDi1pjWsYB6aiO4zGZT8fzSlsIsRNJs=;
	b=XTsKLwFytC12f2y9DCUDnDU+amWCWgwRNDRiqQi5I4Bsc4+JxbzXJfuaHE1in7liXkSSNr
	57rK2Q+kycs4U5FtJNk0kZO0Z9gl9cWEqa1ePkJX7V8vLrtrlR4CjrrKIME9oS1H6ezQGT
	PYNwhJb5SKVHoB6uU+t/DZ3BSpogTvdEGezueBbqfnOuVOerS1QmJ/iTLgk0uw8Zd9K/Gr
	1EbJvqeWMsPNMMKd2cAOwY9DJ8e4CIyBgXpqVFxyPApeyMItEMHfebPRBtSRGViDsSmed7
	FN4cwFtkkLO7GipfLuEAM4vtFz6YI9gfqJCNdgC2be1h0r7rFAN3T6fT239+Pw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com,
 daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
 iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Wed, 19 Mar 2025 10:59:28 +0100
Message-ID: <4999695.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250319094621.2353442-3-daniel.baluta@nxp.com>
References:
 <20250319094621.2353442-1-daniel.baluta@nxp.com>
 <20250319094621.2353442-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Mittwoch, 19. M=E4rz 2025, 10:46:18 CET schrieb Daniel Baluta:
> Enable MU2 node and add mu2 root clock.
> MU2 is used to communicate with DSP core.
>=20
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index c26954e5a605..d2fdb420f2d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -690,6 +690,10 @@ dsi_out: endpoint {
>  	};
>  };
> =20
> +&mu2 {
> +	status =3D "okay";
> +};
> +

I think this is supposed to be part of patch 5.

>  &pcie_phy {
>  	fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
>  	clocks =3D <&pcie0_refclk>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 3b725fe442d0..deb98f03180a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1254,6 +1254,7 @@ mu2: mailbox@30e60000 {
>  				interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>  				#mbox-cells =3D <2>;
>  				status =3D "disabled";
> +				clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;

Please keep status as the last property.

Best regards
Alexander

>  			};
> =20
>  			i2c5: i2c@30ad0000 {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


