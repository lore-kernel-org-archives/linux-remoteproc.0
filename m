Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D943CEF9
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026397; cv=pass; b=U3hrYwHKtMgXhWMqilDUasiIjF++vSc58T3YTI2b7SBhgOGEo/vQGeGPbKAMphV9RkGUvBjneKh1sC7E24J9ODQu2MdckVc1+WlCPDHTm5zm9eC5Yv95yoSi553yVWKBeIodunLfOV/svoSXF1yIGTTq0jCMaxFFw0o8mmP3s7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026397; c=relaxed/simple;
	bh=jxQWVxKxN1OM9wmfJgsxdUMXh7ls1hDMi7sURvf3ApQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JK3BtVjWcTwVCEBYv8M+NfC7a0cloMpnO1YGjONJ+ZDLA27D1RH0OCP0Mm5rhp7BD9qEJ9AX4DCDsUeaPXGRWIAG+ji6zUa7R3o5uXKB60WQdzQ4JrBfb+iR49AuiNMvk4/xfbVlRos1XBwX3aLSommlXviN/eZgwpRi57fl1aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVgOJmvc; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVgOJmvc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so10797515a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781026394; cv=none;
        d=google.com; s=arc-20240605;
        b=hdv6VXXM4OB1OkotgZXIkbflOlkz09sOPI4xSzCy9a7ycUHgOiHm9N4EyJtYPpS6Ta
         y2UZ02gHkyLm5ACX8yShB0NWWSaxB9t8OvexB7xutZSjlKPALR90BTLnAXWUzDgoXO1G
         SFgPrtQPgXsTbPnCafyKW27rgMz2kivOCbigVor3yzHreCxDPIb/EmD2o+umUPV3yHwE
         QbE2+TXxUCBtqV0M1YPaV1/3RBKC361mRP+Q1zwmkN6ZCmjxxvnVWQvN1fM6GBRK1Ko6
         jLlvvIhK8H+FirleUSSdITB93wnGsZhf0pjQR9xdpYSbxAi0vB/c7CVx4Jgm1iw2oxMZ
         ccdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        fh=IhOwiHisQYjugoNgonu8/5lxPUX22rMkzGKin0J2nIM=;
        b=IsGIyECHeL8peZUZ6X+CogTLdIRFcYHKitE6CrA0b3z6J8qe8h6wQHsog0vueTP9W4
         DLX55VTay1nokY/izNuhsdFRdhAOKqhdAF4ju3Lv0NlzZOoMSHGKcc5ccYrFXOBXj/PM
         ZFKR/+t3vN6SWTDgIUKHuQNcOOXMsijKP+xi1miJRWSrxATc1q6IePVGhPTskxDaY1Fw
         bqwmP3F/45x3T0OpMx7lwIWe8UwzioidnU97vZZBdoes2yGwx58ifOaMa1j3fSIi5sI5
         eMFtzI+0RrLvY6JbJPuPjHYWB6Y720nMpojNtg4N341Dxf4ajWu60x80+FGFsCBC3MjW
         /6yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026394; x=1781631194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=SVgOJmvcFoLOW/HEbCmF+l0Uga8kDmkZHWFybxBRHElCprDTKTzfkIFrH88qTQFPBh
         1744NY2PbX01qOvEdu0B7/G9YmR7La4npRtB1q5bstedtJjfNFIAzLAiOSRLTyvvo8Nc
         ikJdf+ADyTQLX94K6TaHMr4jZHwb5ZEKYK1JwhawdlVqUWjTgxH5u0THe3OqD6/2jKB5
         cWz/Jl906f09xtRxccxTOgY/g4eeHLLAE/PduWmSfTuBa2Q8lB0A60acAS28sIEgOXyT
         F2ri7QHwHog3AfeymIe7TD3N2qZZhEnTiqHa1WpN6zVPv75+gzcc49YD9Ppe+d2aFQYT
         xVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026394; x=1781631194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=k/+vmS6DkJ7gHM0XxRpWX94CKzV2i1Bk2sy52I6SwEuIr1q/s+uC5SimcNIISeMhV2
         IcFBJ0642/DqXL0azTjQJEwYa/Lpt8aPsu7/GStUCBhp76khsSoDigBejbtMyuB+E9aE
         jmij3uMMztEU2XZuEoxYHHaigduBWCU0DVxfVO95oQO0uoOTBKsp/8jE6h/34kmcNBam
         v4WYFv9fbpukAIAuv38HYJymSiu4ljuBwCilD/HGLzEMAzY5OPeeN63rHJKwNkTtY8cD
         QPeDGV3ZseO3bEDSqM6GA5WZIgeujZY9wT7eo4PKXhHm04oX00EWcwwr1ZrZCmUL+hkt
         aifQ==
X-Forwarded-Encrypted: i=1; AFNElJ+e7CKsU9QxuXd1ezKxTd8YjuMseCy2QLvBGHFzr4N2AJQKev0y5HNWcrDY5Xhs65ZLn7Ep0xccYqSqgkFLhICo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qV9saWPgtO8xE7zABsxY8D1dEY4UssLn0I3RK0W4jCOlYm5F
	ea1j2eRxMNo8XUS4pVwWeS50oE+DGbyf4loAYOWImKpi88lkhy3EPZY7LSNTBstlQ6vqztUJU6S
	H/7FhgFywQAdI2074+kZEuaJSrH7bZrCObHpZYei/PA==
X-Gm-Gg: Acq92OGQChseh1xTq5IYTDyVDy7VTukgGZ3YO84IQU1cBAGp0srr4NOcP0y7/fC54JR
	te2TnGf6fxHSxnYdGKqiCDL1PeTcQWXWXnSmT83qh35lQbnr66KG/hJyXjAIYOAZH2R0dimGZxE
	hrbqHJoNXdf5SNvcb/k1PNZ3cWl3iGhJG8aFhcuUaHfryMKs/5pk5A30fVfQqbjOdsQdkWvDo4f
	Fa5QGDNmp+hgb9Y2gSBxIyMSyY7SxdwC6KV+ndl5oTZC33gtxsrN0cNoKdFUUx9CdznFeEqQJaH
	z+PWQwKEAdUG3hZ5mVkQg/XBp/bxq+SfK613AlP/BNpnhBFwHVhS
X-Received: by 2002:a05:6402:2686:b0:68c:3994:45f2 with SMTP id
 4fb4d7f45d1cf-68fa503fde8mr10046906a12.19.1781026394348; Tue, 09 Jun 2026
 10:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com> <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
In-Reply-To: <aihIIwt_9T7yYxP3@SMW015318>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 9 Jun 2026 11:33:03 -0600
X-Gm-Features: AVVi8CfajwXrk0zh9dxoFsW97FohDkxe-xDUhgkWnVGwuNvfV4UW4Y-xjQ1W9M4
Message-ID: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >
> > > The names of the carveout regions are derived using the names of the
> > > reserved memory devicetree nodes, which are referenced using the
> > > "memory-region" property. This adds a restriction on the names of said
> > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > specification's recommendation, which states that the devicetree node
> > > names should be generic.
> >
> > I don't see what is so restrictive in using the node name of the reserved-memory
> > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > will you gain with this new "memory-region-names" that can't be done with the
> > current solution?
>
> DT Binding check can't find such wrong if node name is not what expected.
> Binding can't restrict memory's node name because there ware not specific
> compatible string for it.
>

But what "wrong" could that be, and what kind of restriction are you
hoping to enforce?  What specific problem are you hoping to solve?

I'll wait to see what the DT people think about this - I personally
don't see the value in it.

> Frank
>
> >
> > >
> > > Fix this by documenting an additional, optional property:
> > > "memory-region-names". This way, the carveout names can use the values
> > > passed via "memory-region-names", while keeping the devicetree node
> > > names of the reserved memory regions generic.
> > >
> > > There are no restrictions imposed on the values of the strings passed via
> > > the new property since the software allows any name to be used, with some
> > > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > > special meaning.
> > >
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > index c18f71b64889..8e3e6676a95e 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > @@ -62,6 +62,10 @@ properties:
> > >      minItems: 1
> > >      maxItems: 32
> > >
> > > +  memory-region-names:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +
> > >    power-domains:
> > >      minItems: 2
> > >      maxItems: 8
> > > --
> > > 2.43.0
> > >
> >
