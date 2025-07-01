Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD87F477;
	Tue,  1 Jul 2025 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751336933; cv=none; b=ML3EpnsT6EcYp8QhSjGbLiQ7Z2GFic6xuWskJiu3eA66Li6G+V/n9oQueDxaYg5bFThN3Y2DVS23CsUJlkteF5ET61er3Da3mZsBPlNPkkC5xkTU7l42JWp7zvcyxN19PBVPErn+32QVgxBMFNlIZB+hLi7Y4sK2pPLGDvjTbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751336933; c=relaxed/simple;
	bh=Lrz0kz30AUWccq98T4dRyobo6MRF1NrxZ/Xylcz6Doc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooph//kz8M1Rv6RflukgpjXWwfGWwoTjqX7Kh5LcXpYEnqms85miEalxFu6sLaTtz+fndX88HSOWO9cQhHF6Ii7Q/5N4x7cRCJf53icZaZuKz2lbZBp3zkWuEFd0BCOCl5JhmUtWP6HmsVoe5qURBq44fW2CMjjTD4Gb9jKIvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKgRcEXB; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKgRcEXB"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3de252f75d7so33165445ab.3;
        Mon, 30 Jun 2025 19:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751336931; x=1751941731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=gKgRcEXBvnLtB4qQs/+5FzAl8F9btBG/P+SBz630wqE1XcsHnvGanTGAeEv8EUAonQ
         Nn0uuGQmb4LUC3Qp5Mn1llhCd3EguGzzhsqWwCciH02bjANx5ERSudFwWabRtMu/I/Ev
         vamfcHscQ1muzxi2EXcjKfJ3bIoJXxLvgSY2IQnj/OHI4QPi0gK/2fc0JFOeAYjl7cMY
         RxG2+f87iLJP+85aztflOUm2D8oimN5z7QpWnHMpX1Wb+zIHImIzeZJSO1qLBFa+HQlJ
         KYl/Z58mwG6H8TI3qx/CHoqhDBD3qlGMIb1w+5G4iTGZiTiMjH0ETG1/4bTkVUkxxZ56
         1pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336931; x=1751941731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=JYaOVes9xysFjDxwzmLj3pc+9nV810ZkOPgqT5vTD5t3RyVWKVYAv5H6sTUskVU5kr
         dsNms1nrjQc2q60GBKM+w6N4yRxQ1pnEzm7TFwoez5gus+8u3i1YOTGH6SS/pHBhUCUu
         iVLezAXR6sFMH8vhbb2s0331C/bqAHtDij468TzC3PqjY79mw9/s0D2AYBmOAntAcRoj
         wIuU61ZXBuIwVGrlPN1Fi/rUgFUEdTigYXAteaX/vl8an5QPux4GSUQyB+gryscKmCj3
         ImkEVnvycAHCSFkECs1ePu2lPQKmVG342A8bJiVHCGs3hbYFfaMbyRq+VTdnvxqeScdV
         1Lyw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3xJ2E795CuXfH2e0EMDU8+zJ7LN8OLXqlUPzIvIcsO9c5X+NW83tJ6FzgzBVDTZvFGZ6eF/sZRBrXSLG6EYXiQ==@vger.kernel.org, AJvYcCXjMag28EBnqn7Msjdb+fVvNacTnNIqPBZ864UH1ZKRoC+muMFadDrp655efdO7p+sOF7gJ/A+EV+DtmDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlcc8mtV2YEHNRN/MeMO4OsyYmJXzto76n3aOOcUCAKRDVA0Mj
	5ltMBDxHUy4jnnYd1k+SGnIqisod0EUMk9FDDO2qFOhPcjM3XeId2EMGGo+0q3TePu8Emq4S35D
	QgxQ1ybsYATn+LzCtnQ03BlNUQoAnzN0=
X-Gm-Gg: ASbGncsm+23CA5c++7Elerav0UyHeg7Oa3sg3Dwo2bfOnu95qJd5gy6aw5xyIt98ZJi
	fVSuYiCgWQ9DyBFeP6lRdQtK/PAE6ynJguDlE/XCvUavqpQh7+O+V4CcbQjih3QjoZ2UR658Ufm
	pFqHZleFqZBDpdOAvQNWiAuz6jeTb3OY3mwZvIOxGDHGU=
X-Google-Smtp-Source: AGHT+IEaK+Oqxa1UESMKPoud+tU+k8pmCnsDP4v/QP35UzAfFMMddZZHfS6lrrDcwsfSXwaF4LiN3WkQsGFbM229xa4=
X-Received: by 2002:a05:6e02:1c23:b0:3df:49b0:9331 with SMTP id
 e9e14a558f8ab-3df4ab56743mr192074945ab.4.1751336931069; Mon, 30 Jun 2025
 19:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
In-Reply-To: <aGLBvXtSRlaKujqM@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Jul 2025 10:28:33 +0800
X-Gm-Features: Ac12FXwmhVBFMgE6Fak7mzjMWtYs4A9XOu6UqBu7aKxFpRZeBK5SE4ED-1Fjy5k
Message-ID: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report an error "ELF class is not set=
".
> >
> > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 9b9cddb224b0..9e7efb77b6e5 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >               mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> >                                          att->size, da, NULL, NULL, "ds=
p_mem");
> >
> > -             if (mem)
> > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > -             else
> > +             if (!mem)
>
> Flag rproc->recovery_disabled is never set to true, meaning that since th=
is
> driver was introduced, some kind of recovery was available.

Actually since this driver was introduced, the recovery can't work.
We didn't test the recovery function before. sorry for the mistake.

>
> I worry that your work will introduce regression for other users.  Daniel=
 and
> Iuliana, once again have to ask you to look at this patchset.
>
> Thanks,
> Mathieu
>
> >                       return -ENOMEM;
> >
> >               rproc_add_carveout(rproc, mem);
> > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_de=
vice *pdev)
> >               goto err_detach_domains;
> >       }
> >
> > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > +
> >       pm_runtime_enable(dev);
> >
> >       return 0;
> > --
> > 2.34.1
> >
>
