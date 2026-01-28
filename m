Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C668F28682
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620754; cv=pass; b=NuIco6xjV8p9YF1qrJZxaKWqvrnKSeLL+teyJCyUuq+GouHWprcnk3S4FaovJpmksuusNdFbjL6NZm7ApJVTGTtoDaFuaOUoUBnFm7MSBtrhQpYXGaJ6alYSGrJCzYZte/MJHDyKHsMw2Vpv74drQeSbZA31X1tp9xLq2ug67bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620754; c=relaxed/simple;
	bh=HU+2qV9g/s9S77R3j/OFeZGFjqpC0FxcFKPAXfJCMbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBCjDf7xs3ztKvHUe//bbJQyWm3j9UhTSQHXP2PZ7WVJvfA21MAHYGOsfXvc66HxP1JhLw28oxje8I9XiP3UVyQ5k5hTRsBl0kGUeTH//eYSgFJNFLPOlOemBWmSWd6LkKtaUxt4GGcyeYjC9l1fedrsOvzPrJ6/rz/hFjh6ib4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emgAG8BD; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emgAG8BD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b885e8c679bso13884766b.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 09:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769620750; cv=none;
        d=google.com; s=arc-20240605;
        b=jJskIq+x3f6EP7WyKli9yeILHHoKIJKuzzoWUHAnpEsFavsi7hAwkCi/vPk2UT+K7Y
         QI+oj5eJRE6cfMcGaCVwM+pjZj/SLkl8mH5xuagWuWazODdIvFrN6Z1cY4gfOwt7B6va
         TSXdphPjQIdmmEaf1CJFlGYkwaU9z9dWHIXjnuBy2Ip8bDoVAW3oQp4/Yp7qw5b+k/xW
         m4PZH8fzJD55U6YD3IVjW9q8BlYThm2R5onRdBiYUu0k/kf0j66Mapj4eNFznJCaUMwE
         ZHJNMCdzkkn+8TNY93zC0ZojMb8m8NrrmUBB+REnBQEUnsKn/+bd/QvGANRa1eZ4ufc6
         kn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        fh=9Gk8r8uRUU7bLafjcJShRsYc9I+VGRGuzBVmubl/vO8=;
        b=ltm6gk8yDJcrW6USzoNLcbVH/U3V4kxuSQ+RhCXisUN8WwYiWmBuqdUrSW4TVOOyZ3
         M/k90PgPz1KSHIUM5pD54dK4SP0o5WAyB+nh6rJCer2vY34m4+6OUAcfKBTIe4/oxHtZ
         gOh08pJTifo2rUT/bCAQufxW44TwClgIa1D1IJkQ4y8G9bQ6FtBVcvdx3/KwfaAnrVH3
         diMV/xpgL6icRmDMMwDX3ICc1DjBgwxQnGgRC4CSvr9mQCy0mJvyq/L4ILbyEu2Kxxu7
         kzSd56ykTkP1ibkcqalrsRdMRO/276onH6wLE7J/9HfTsE1DCsAEYaLlQRniubo/3uMb
         1WPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769620750; x=1770225550; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=emgAG8BDJNaaUSG6V2gc6gDgLN24ig8B6gi29iRk1HErKeMq7bNUz6wF+HwKH8vOUy
         S7yhjYSIlvLC/i5YXF7GXCGH59a500vVt9q6rkDXmhbhLHCPpkg3mJRqYerOMeIdeteW
         vfaerpeK6WOWqnQGR4+4g/0LH4WTkYAVCmLVcE7+rk0aVY8HDeK8IFW68cHpaAJuN8ZY
         IH7d481Q9bPFQosJF75J3SWi9bw8U7S1xyfT7/VH5SaPJWg3EvbmFuQJvh/LmhtRmI09
         LQV68BkwZ9PpUzGNZvOiPhjjBjMbfIy5CWUvXweorWlGLo6MNSlbBX7cMg7tYpDgz+5Q
         f05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620750; x=1770225550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=DJgICh5mZ+X1LVU0naiMSvLPnjVou9sJ/yX1pcwRM9jLihjK5PYu2IDgD0HuW0/V7t
         mjGLXOhOalMTZI3gyCQdiM/Xa15kQInaCUvW5wNET+2/cgHwHq6Tfj0OQaABaqMQSyNX
         zACbCZTnYM7dnTKfrs5ZuQLcqM4vf4QtX11TeYc2hSpOaSzqWNOKP5i0c2W106wHH24I
         dyMqYrX2pKvWTMHpXFpBXCVdbaq8vQCDkaVNn5MaoZ6n3cORBkohGnAhu5vKq1+NZuAk
         SKysYuHT6mKL1nLl8UPQDNeiKeNcT13j9SQqn53PvB0blrjCnuc/TEjZxkP+agTx2aB+
         QiQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/BUXkPDklHawUe9KF31/XCGDZIzjFQl+fhO0sDNHdJPwQGzeU/Ha5hVWe5ML2dsAWEgk902AA6o6Z00HZbZgm@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhxBSzB0Y2OLt9dpn+crbOz4x7QdhV1rcXcvFng3xGzLO1lFE
	OQJ47bQa820ueq1HguWyOhKhsVw9OvbyXLtFd3KP1HRTVE+eaTyUySYCzuvxM0iEG9E3R71mqsX
	8VEwlf39L/DqgNBh4WeLXdVhxLQcTg7kr5D+etQrn+g==
X-Gm-Gg: AZuq6aJV1vzA1H1fTVQ0D2kN38nN4D7LKM8hoTorhjaN49zKOfNLxLyX21Ad1kiRw/j
	yGuVpzCzDbPKnkOimZyX7uhA3T9ypwYDpbUjHWuw3mouj81b02ND5fzvrQ7kyy6wtKJ4Pou1vg4
	0dPXniuWUj3RzeRPU17j0hLFP5CnJfqflCLt0iNTHqf9l2ekPA20v3ENEkHa3npZdb+8vRZlptI
	itob59tbfsTvYgjkxoFeTYYXmpkRTH2gmHvMSnH7P6oQ9nqz/Isat790Z9ofugQDkwfjUq8aT7g
	6o+Zwuba8YqZ3d3v6AFeRjTFhN+m4g==
X-Received: by 2002:a17:907:9620:b0:b6d:73f8:3168 with SMTP id
 a640c23a62f3a-b8dab15be8bmr411653466b.3.1769620750053; Wed, 28 Jan 2026
 09:19:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
 <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com> <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 28 Jan 2026 10:18:58 -0700
X-Gm-Features: AZwV_Qi18JCueG1u3J70NR_1Vvtj-phyG744RAEAtU4_AnPA_NPI-ZDjNCfkuhc
Message-ID: <CANLsYkyrz+A1iEabGZ6rFybFo4=mM+TPVDRSckFB2YUS_7aKow@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 at 20:22, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded
> > resource table when none
> >
> > On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS)
> > <peng.fan@oss.nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > priv->rsc_table is not NULL if the DT has a "rsc-table" entry,
> > > priv->indicating
> > > that _if_ there is a resource table in memory, that's where it should
> > be.
> > > Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the
> > > narrative about a previously running FW with a valid resource table
> > can be dropped.
> > >
> >
> > (sigh)
> >
> > You apparently did not understand my last comment.
>
> Sorry about this. Does this looks good?
>
> Daniel, Iuliana, would you please help review?
>
> remoteproc: imx: Fix invalid loaded resource table detection
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource table,
> rproc->table_ptr is NULL. The function still returns priv->rsc_table, and the
> remoteproc core interprets this as a valid loaded resource table.
> .
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>

Yes, this will be fine.

> Thanks,
> Peng.
>
> >
> > > In this case rproc->table_ptr is NULL because the current firmware
> > > does not contain a resource table, but the remoteproc core still
> > > interprets the non-NULL return value as a loaded resource table and
> > > attempts to memcpy() from rproc->cached_table, leading to a NULL
> > > pointer dereference and kernel panic.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()
> > > when there is no cached resource table for the current firmware. This
> > > ensures that a loaded resource table is only reported when a valid
> > > table_ptr exists, which matches the remoteproc core expectations.
> > >
> > > This issue can be reproduced by:
> > >   1) start a firmware with a resource table
> > >   2) stop the remote processor
> > >   3) start a firmware without a resource table
> > >
> >
> > Another sign you did not understand my last comment.
> >
> > I had hopes of merging this patch but the changelog is too garbled to
> > be salvageable.  I suggest you ask Daniel or Iuliana for help.
> >
> > > With this change, starting a firmware without a resource table no
> > > longer causes kernel dump.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook
> > for
> > > find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Per Mathieu, Check rproc->table_ptr, update commit log
> > > - Include R-b from Frank
> > > - Link to v1:
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > lore
> > > .kernel.org%2Fr%2F20260122-imx-rproc-fix-v1-1-
> > 36cc64369a40%40nxp.com&d
> > >
> > ata=05%7C02%7Cpeng.fan%40nxp.com%7C781fb4227e024211e71c08
> > de5dbb609e%7C
> > >
> > 686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639051256532
> > 530786%7CUnknow
> > >
> > n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> > MCIsIlAiOiJXaW
> > >
> > 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0
> > 3sG8la72ysD
> > > ivP9SMmA9Ry2YaiMvCjsHWAWaGFOVQw%3D&reserved=0
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > >
> > 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d679051936
> > 0f446f063e09
> > > d018c5654953 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct
> > rproc
> > > *rproc, const struct firmware *  {
> > >         struct imx_rproc *priv = rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> > > +
> > >         if (priv->rsc_table)
> > >                 return (struct resource_table *)priv->rsc_table;
> > >
> > >
> > > ---
> > > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > > change-id: 20260122-imx-rproc-fix-e206f8e6e477
> > >
> > > Best regards,
> > > --
> > > Peng Fan <peng.fan@nxp.com>
> > >
