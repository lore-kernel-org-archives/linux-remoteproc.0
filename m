Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794190985;
	b=12cFtAOj9YLLz6Kv71WfuoFdPN73LqjZeqAhSK3FQkPoYCJMz/dlTaZTtA7a5Cz9g6wA
	 2qld9It/VqpJ47evaaHgqfFmH8HuDzHm7Mk9E4wQK5iPAd7ZC+18o9DQgATfhd3j3exQL
	 uWDdier1angkxWK/8onIIGtKZyXnf9bILya3uYVK5qV/Uk0L47J3MNaJcy8ClhYZkS4rz
	 e12zuF3BWSln8Ps8Xe8NpOgDpGPltsUaolP3gEbJRkyDpRBrNQ7AxUx2H2tkFkENfezAi
	 efX207HnCeDPzGA/FyXcNFAx9tDQ71bb5qiVP7P4RGrW4+4gZ2Ix233hXJ8INac2pnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
	b=PuBUHbdDqoj6MIHpkroOmREec/6svVR5YfScbhD4iDQksH9O40t1uuIcXP+s5C4y58AV
	 80C33ap/IQgiUogaVcQOLS/UOrOprzktjV5nwzI5r+NG04MFHA6TcEeefnHkYor40aGIA
	 Imgers8Cnlux8mSIR7CPOSXOV2K3BzWu48lcC7WbqaMqny2/75pWd5UEl//J0gY9QHHS9
	 FuGOBfoL64KaQ05SM2iMrR1SHg/6nK12lUeqSvECNxxb0dWdm/ncvWo8ctZTDjWrl/Dnb
	 nNCdmW8Q8NGr//rIrRoGZDui6qQ60L3Rzy0yMKPbty6u/76YB1oO49FbK4ne110rM5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBC606A321
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 02:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EBC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso171619a12.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 08 Nov 2026 18:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190984; cv=none;
        d=google.com; s=arc-20260327;
        b=eSAtfXWNK8EL6QZ4o1yFR+o6m772jbNPgxKBB1qvRaBV0Si2zZFBFgWLtoi/bwAwIC
         76kUzUdZXOBthmtpd1nDHyf/QESkt24sfkocivbfRIvfLWj7CxCFbSrEiiafQVeqV6DU
         9l5b2Vg6os9Pgf5HCsPKn0NgvMXaKa7qEfClb+8N5SMplxYpOAXhka0YUWwzmXFDUC0n
         P0iQ/dFF/h3+Qigqz7HXC0FE//mJ+uxfiyrCMChLNBeadcPY3Fc7oLMg/o/8Lq2gLRKE
         4xxuPVbfCcAfItKLLYkJNni3+YgbBv+4L9lJPaxQyjuGqy6IKk3EqG6XaihtyDulDl6I
         VkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        fh=pkd5XhOvoVJeaE8R8KB5UdIwH+n+VmykXi+EweI7rhg=;
        b=avYYsaEOb+2I7nwZz85Ka3id/IsKTe19t18gYAca7iL7Y6x/bojXIqgbCHQyTHbajF
         yz/jo89nSVM+SGdnLbxLtFN2YAg/W+fhpwzU/VUkTs1/CEnWHKns9V5JzGqWtrFAwg6s
         oPhRq+Gss1YnjAmz56jiBt++7urevG2ZPAk0K39E456p7Kr3ymiNGTjgeTFNYq/Vfr6l
         jxrjmFljaE9ss/GRsnaAx8INduiQS6RhPfvU2VAM7NTwb1U0XIBl6qrqEw4J7JJqN6D/
         VE7Ht1E9d5hPtvt0XSthcRDlevT5uDDpxymbuFlCOv7Ya8a2rWeaTnrD1Dr1J6Unnga5
         oOdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794190984; x=1794795784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=BCMkFxKXZilOqS5qGGm3zfzewgjNuwk+ApN5Tn6q039iGQMx1tnYeShFlkP5g0aptX
         mtRlkVraq2DkEaDbMUdpfZlR4BXbFSXTkySnLKRQ/I2NTWggzuAcHySDasGW70gDDyXC
         Aqo2aKPslSKIN5QMxdI8XFw4SYLYSEM01xtE7ZmKHWPG4sx+He6tS5xMNihqgp0cYgwM
         w3h2wLk8afqVpScQ//Tb2pAJlIhsDzOiRCpNTon0U8VjNvzGLDtg/ma9pJ3HLTKB17VO
         m8GaGRFacLDudVzNYAglpjAhNc354xwCpvv36Beh6ZTSvi+wbXTbC0lz60vF62ALlC0w
         UmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190984; x=1794795784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=SYsS6YDJi85nll2zvIRoy7q0ITvcaE32fS0OUOUpWJ7xcYLxNAVRFpfUBl2DsS9ovN
         1IDDmG/U1jXzdsv/X0tlntzAoddn5jgyjRJ2WxO9X9hbLU+L+EeIx8XVgPwZZQxXU7p6
         pCVckrDv7/wJ1Em02l5/gNqkX1kWcRAFMdiMClOGSoLsLettcfvhKwv+SA8MFNtl8ujO
         oqJGhAvakOPv7ORog0078Ad28wllDwgX2L1xiwHWSnGzN/goSMdmMJcHX8EtRXNa2EqW
         iZ+RFWp8rVUR1bMaIML3i2Jaqnf03n4xrf3Z97Hgzb2jPxyNaZycvWEbbBWjJa5RDphS
         CWgw==
X-Forwarded-Encrypted: i=1; AL+hErGThqY4suq9XyhKXqKqVEaDxa7Tk87UWRwmyXRwh1y5SPOOb0HRyTLQs1Q0wsMLj5X9pIGpZQJOYO8v4qiEF1WB@vger.kernel.org
X-Gm-Message-State: APuU4Z8kSl/9soqB0U4UDCQgtfhyqNlwfCLFYr54UFqG8Qz4qXROKlW8
	sxR/a1hEFw6CRjqr7ML13dgghQ0vpYbcyF7Im4nmMjfnLz72bElVQMLsMQvSyCmGRnmX9SuU9O9
	1FrBQrLeAzkClOUnxEsfwRXRdcGK2XAw=
X-Gm-Gg: AYBFou3FuGCnqyn5+hbN4aVXbPBqsyQ5mrKi3+QIYTLoMPmQPv/DebscnXYHgk6gBsC
	/XfZQk/rMiNE7aWjzzmFh4dVIk57xbtWeGVdbINZwfj16Lc3mkNY6/d0PgMOAs25VnBxfgKLw9q
	y6RoeEZRUlcLCgVjw66sB2eXKLODY7AkEMTAbxZWDUH9h3Txrs9cpz6aWbgfBC9vzUppPeHNK54
	BvqQIvIoQshyHjiBLIwf5E/g/eD/x5tauuTRu1UGVgOzjvHpxXzdeU6dSzze2+l36KzlvbHBfku
	YSBIk+JeF56NR3luTpeX9l3/G41EGsv5IqupQA4t0Oh/IaKzXG1LWSj7TqD/wVFXd8fGNTK76aU
	KSwY/Ult5ZWowOoomnCr2hjuJTZBJUwEhptDAZV97AzVEhvrjsXnyvuN/Aw==
X-Received: by 2002:a17:90b:4d07:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b12d488e88mr1529576a91.20.1794190983895; Sun, 08 Nov 2026
 18:23:03 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
In-Reply-To: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 10:22:31 +0800
X-Gm-Features: AclHuK-so4ygy7ZQpiwiv8L7y68F48OdPR-9-HT6EDLnbJ3aW8Kx7LpzrpeA0Ho
Message-ID: <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HiFi4 DSP provides a separate reset control for its debug logic.
> > Keep this reset deasserted so that an external debug agent can access
> > the DSP and perform debug operations.
> >
> > Also require the reset properties for the i.MX8ULP HiFi4 DSP.
>
> That's ABI break without explanation.
>

The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This series
adds the DSP node for the first time, so there should be no existing upstre=
am
DT relying on this compatible without the reset properties.

I will add this explanation to the commit message.

Best regards
Shengjiu Wang
