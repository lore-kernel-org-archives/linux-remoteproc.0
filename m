Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A05246326;
	Mon, 17 Mar 2025 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225529; cv=none; b=K0PF/OMrJjgvFGNCktatsej12giMYGXLbYvGI1BPO84CnX+BvkhLEtNknjz7KTi4/mKbGtKychFXcxdIQvaKHl6B04kq8y/hy8JJ5HA3f+FwT4gxbcfY1FCUd08+zOZhmGrDERag2qSGxRf2cGszTQignXSxILt71fyeCf7xAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225529; c=relaxed/simple;
	bh=kG3UyNjWkxYSO1d4jwmEOZf0a4luiENZknkUpyNY1Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjkqCULnf4WnAP0rMtG40lcZvH2Jnn+BfX2GGfCeOkKKePoSja5SYrezExqFIFCPa2xMu1S0VMACvH7TM7By5IQSHi+VHtExbCGZpN0qeKC/YKxx+zk7ooLLk1hJKJbaNLIEOxESLrpKndbjobuiPZyU+d8iuVwwWgqClDfEtq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=LgtyJd8F; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Uq5zOxs0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LgtyJd8F";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Uq5zOxs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742225525; x=1773761525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KipOP6WZevqOmUSTSh474YO5ixrB7kPV1cCaZGSd0cc=;
  b=LgtyJd8Fzbt5O1cW1nCE1DAcJTavjGwyWr3MtX/ia5SQ5NDJyn2uw7AT
   mlNomYf0CqzHJ5AxiWzbt6DIYYpHMM9+5YVbZ8It+vf1MEaklCALm96TC
   CFKYK8XC54kbarbYtl9Lf5TKGz8UtVHJObKN6BvP+aoSPs2WJ/Mj3AyBx
   GUGAVG7vO0n/44F3CgNMnnAIUstPGci+9cqPSzZhz4ntwpg3EKBVx9/ek
   FxOm0Vn4pnOmcxkvJcufS0l2VeuEQPY4+uX22syj+uU82OpvpUVevVyv8
   XjK/zTOPlo5Q/vm2nDVOgZwSq0empJJH4Z/wJ1+xaVcgvU0W/iFhDMHLB
   A==;
X-CSE-ConnectionGUID: 8oKGuws+Tk+2dnMvWspdJQ==
X-CSE-MsgGUID: ZUbpwkqrR8O5ARb/CW7m0g==
X-IronPort-AV: E=Sophos;i="6.14,254,1736809200"; 
   d="scan'208";a="43000310"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Mar 2025 16:30:52 +0100
X-CheckPoint: {67D8402D-3-903EAEAC-E04C76C8}
X-MAIL-CPID: D69F11ED0F4E03A24B6BC23DFFFEA6EF_5
X-Control-Analysis: str=0001.0A006397.67D84023.003C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B47A1648CF;
	Mon, 17 Mar 2025 16:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742225448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KipOP6WZevqOmUSTSh474YO5ixrB7kPV1cCaZGSd0cc=;
	b=Uq5zOxs0Q2Oh2zzZOxB4inAAzXeHVrTzt2nX709skPbcWUDR9LYBoiUiAYyf52iv2YweG5
	JkLN6VCZjNG8ALhUIQovwtDil5XYyo96mm4Yxbz1Z/LE9/s1fn6eFgm+MrMDIu+xriBYNn
	8f6sVJQ3EztaveLY8jMPucGHgQHW8GEmi7SOL/EWp972DQyRggo5MmHRUv/+YE0AEig3Ag
	BIK+aNKm9A/LxUAabR4O3mapr8jb0kyL3GTWJEgLDYpVURN8x05NjMBX4K72V2duHca+7p
	a9vaGfhs2e4JvYhdHosyBG4cdHddSLC1Avxty8JerPZw6RCV8C07fcF7zpkZpw==
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
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Mon, 17 Mar 2025 16:30:46 +0100
Message-ID: <5873285.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250317133306.2003909-3-daniel.baluta@nxp.com>
References:
 <20250317133306.2003909-1-daniel.baluta@nxp.com>
 <20250317133306.2003909-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Montag, 17. M=E4rz 2025, 14:33:03 CET schrieb Daniel Baluta:
> Enable MU2 node and add mu2 root clock.
> MU2 is used to communicate with DSP core.
>=20
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 3b725fe442d0..5b443fbeded8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
>  				reg =3D <0x30e60000 0x10000>;
>  				interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>  				#mbox-cells =3D <2>;
> -				status =3D "disabled";

There is no need to enable MU2 if the DSP is disabled by default, no?

Best regards
Alexander

> +				clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
>  			};
> =20
>  			i2c5: i2c@30ad0000 {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


