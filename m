Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED23D269D06
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Feb 2025 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491727; cv=none; b=WOdgaN13TL790+u8cRENcd7wrK2T+iBg97sH2cBEpaueGRMAFEJczvuFNaCeXnpbFqJho5Ufo2JKc3T5i9WE3KueqEA/h71nCFkszbbN/vZx8GcnUB+hVx871GDlwJa1Nhx2lwqJ2DSKaYnUItY4zwLT/5MKIwV2ImJgULJOD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491727; c=relaxed/simple;
	bh=VcJKrlbLSdRhpFre3KIRw2OrgXKAi3d9H2jhcUDLdk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kdp26GWmKFyMeZiZZHqIrgOKzyi7zsfU9mmy9diRyxfgVf3pe7Pt51YylNmjLlu95fA7ivp3JEiLWZ45x/P6YZjjhuCM0/sOamIhrZIrTcBwuiOHVzJ9Y6ogepddtF9c8d51iLoUAF1b5S+rzKb+T+fWIgRPd9213wBzYV7m1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-0003K8-TI; Tue, 25 Feb 2025 14:55:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-002mjO-1D;
	Tue, 25 Feb 2025 14:55:14 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmvP0-0009vz-0s;
	Tue, 25 Feb 2025 14:55:14 +0100
Message-ID: <460ce86a847cb13e6e51cf0c89a65602e0080e67.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org,
 conor+dt@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Tue, 25 Feb 2025 14:55:14 +0100
In-Reply-To: <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
	 <20250225102005.408773-3-daniel.baluta@nxp.com>
	 <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
	 <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

Hi Daniel,

On Di, 2025-02-25 at 15:41 +0200, Daniel Baluta wrote:
> Hello Philipp,
>=20
> Thanks for your comments!
>=20
> > The DAP core reset is mentioned in the commit message. Why is it
> > missing here? After reading the discussion in [1], I'd expect both the
> > stall and the (core) reset signal to be documented, something like:
>=20
> There is no reset controller driver for DAP area yet.

This is about the device tree bindings, not the driver. Even if the
driver maps DAP address space with a hard-coded address, ...

> We manipulate the bits directly by remapping the DAP address space
> inside remoteproc driver.

... which it should not, the bindings could already correctly describe
the core reset.

I'd just like to make sure that there will be no confusion about the
stall "reset" signal, and adding a reset-names property would be an
easy way to do it.

> See for example: drivers/remoteproc/imx_dsp_rproc.c
>=20
> /* Reset function for DSP on i.MX8MP */
> static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> {
> =C2=BB       void __iomem *dap =3D ioremap_wc(IMX8M_DAP_DEBUG,
> IMX8M_DAP_DEBUG_SIZE);
> =C2=BB       int pwrctl;
>=20
> =C2=BB       /* Put DSP into reset and stall */
> =C2=BB       pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
> =C2=BB       pwrctl |=3D IMX8M_PWRCTL_CORERESET;
> =C2=BB       writel(pwrctl, dap + IMX8M_DAP_PWRCTL);
>=20
>=20
> If we agree that this is the right way to go, the next step would be
> to create a new reset controller driver for DAP area.
>
> I want to keep this as a follow up patch in order to not compilate
> this patch series even more.

I have no issues with adding a reset driver for the DAP region and
hooking it up to the DSP driver in a separate series, but the device
tree bindings could be correct from the start.

> > Is there nothing else in this range that will have to be controlled by
> > the DSP driver in the future, such as the IMPWIRE register or the
> > XOCDMODE[OCDHALTONRESET] bit?
>=20
> We are internally running SOF for couple of years now and we didn't
> need any of these bits.

Ok.

regards
Philipp
