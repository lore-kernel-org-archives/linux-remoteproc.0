Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615D1A7AE3
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765371220; cv=none; b=SRE5aQ+cJwYvuiXSSAB3l1FwM8TjJkqENMXXmJlxyOqynNKkQqd4wBBlcfjwH92SJOh9O/VW8KZh5JLxpKd4zi3MX7F+PcOFfEyEiUbhnv3Fl5w3fxhg6B2niVxk6QnyIfMD1/8tFiONRG/0HnS6VhAn4ZCgURO9+QdzKWO0dnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765371220; c=relaxed/simple;
	bh=ffYwUy6DmitdjmTzpDWyPfbMV0e2+AUk8x9YqrUuwtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2EMyA8UeRNAQYq8G33MmPsPcoyn4A2ByulW5fVYOChj5ZUhZQ6Qb0yF8Z5sZc/slIImS05pfxxLrmIDjrOvS7b6tahVxUMoqYxpwK2x21/L6c9Kb89e9qWI1byyCZkrACnqBOoMjNus0tQ/Uby8HrVGksE0K3rZtfVGm/hZvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6f+83/s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6f+83/s"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29555415c5fso78319525ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765371219; x=1765976019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=Q6f+83/slsAcdpRM+fwl8nH08uGQBZeYqZDDFWkXmOlEhwMvmd5/XWV2ga4ui9O8Ev
         au58z0l4xLGDmMI4IjYg9axuWqbJAQ5HCvBCnvBO2o17/TdBhg2FyMKZyd4oHVOo6a9P
         3+V9D2at49bTr8xie8IDR0pDWgYAJkzgxbaYHxME3chlrXiMRW1muAZ0Ws0eaWBktcsk
         4PAMuB9IquF7t3ZRo7CqTitZNITyUFYEWgz2qaUtVGCXItIR7xekbsZHXwmUV6S8Pefm
         pQmkbCWJORAx+odZh7r5wwArE/Fcx9yS1AYwZaPzbHmFJxzl48GLblbRbcknBzyMiFg7
         57mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765371219; x=1765976019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=w7Ww/wARy6F+g5MZ9Vm2cghXpKOn+6hCU0aIdbNUbDI8TSVnRgh5pVLYPccRsw4x3z
         S0Vq7PTHFBnlh3iQ2pW03C1CDtIqMheCsb1nbshZcQC21gWeedqjoQyZhEtxL+Ndd6kZ
         Ag6Tha4aw4vY4VR6CCPAm4Ug7qnY6MXvN4AnZylNXoIZqP8H7mARkp0yaoWakEoYKRps
         CuFuKMmGqXxrN0d8YfxmBE3HODgL2162DDls7fqUVwirpT2rlhmqrNH8JcWUwM4B5q3k
         RcMqFm19beeRK8NFyvCS6l4GvIemGcSYhPbfnLqRpdswQAFPvzhp7iFUu8vC4s+NHOn8
         nl3A==
X-Forwarded-Encrypted: i=1; AJvYcCWlM82Lzh1rI/cclSGwVA3fox90Rxt4otPyDQKQN5vDyq+Re/69R+hqH6kN4wH2LKGJKnOY0A/2eqh0kDtvc3Bg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zBjL78nFtsUVWhfkgeWCNQfDPngg7Q5SP8WZauwT3oLjBc8C
	6m0XjqWzqhGrfDcXpS9bBXFteF0I3JDvCuxYzcbPPRzVyiN1aFjqR8RZdhlcB+YTu73vtDcMpYo
	Tyl6ECeQ1d/CwYRGgvB/SVNg6aKA3Bkg=
X-Gm-Gg: ASbGncsUvwGkKvFXGrifw/2gDmcRUeex5Ahizg6kYtyzAkvBSgeOzetAWBt2JTVwhRL
	+woFUmEpVg7ZlOWrq4wr+1ypaIC/hhVCltOOUgjRnCyyiiH4zWTlAvkB8idYgiVPVjuDFWvwBcf
	v/pY/Mn7+15u6mCno3xtHDHsR1iwBAApVCJls/GrhI/AdfN4NDrI3CAfhawNp9nGhz+BP6q7Bri
	tJMCq5GuED2Fi1kokPcKR2jCHastOnkjFS6gx5EJCsHBWdOfL10dOkTZufNWhzZuGvRgtkdyq83
	w/nTYwVH33OkqMjVdK9WnLHTiEPiWkNvXa5s+AhzAjppgcFtSFhWefWvhIJ8BNhYi1+7ZRlaBIf
	1c9P08bGNXA==
X-Google-Smtp-Source: AGHT+IHA0/O6Wzz5bHmU/nrt457oLGG6ttX7cTEPQvhKpMwwd+6y16V/yTRgGiSk5FyZ9tp/nr1ta5W4YzVSuYnLH8Y=
X-Received: by 2002:a05:7022:30a:b0:119:e569:f622 with SMTP id
 a92af1059eb24-11f296898ffmr1599113c88.27.1765371218722; Wed, 10 Dec 2025
 04:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209140425.766742-1-daniel.baluta@nxp.com> <20251209152720.GA189083-robh@kernel.org>
In-Reply-To: <20251209152720.GA189083-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 10 Dec 2025 14:56:13 +0200
X-Gm-Features: AQt7F2pjwUAPAG7KNebgVirJuHxCoxM-g3DuFH_8a1gb0qP0UWiUfxOVxedsKqI
Message-ID: <CAEnQRZBV5ECT+P0FYPuS0Yt3C0xdpSmBpxjknhX0wa-c-LBXMg@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop commands
To: Rob Herring <robh@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, mathieu.poirier@linaro.org, 
	m.szyprowski@samsung.com, shawnguo@kernel.org, kernel@pengutronix.de, 
	festevam@gmail.com, arnaud.pouliquen@foss.st.com, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 5:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 09, 2025 at 04:04:25PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
>
> So unlike Marek's case, the first time works. Can you confirm your
> region is fixed address?

Yes, all regions are fixed addresses.

> > +             cpu_addr =3D devm_ioremap_wc(dev, res.start, resource_siz=
e(&res));
>
> Best case this is reusing the same mapping and we just have unnecessary
> ioremap and iounmap calls and devm entries. Worst case, we get a new
> virtual mapping every time. IIRC, arm32 will reuse existing mapping, but
> arm64 does not. But that's 10+ years ago I looked into it.
>
> Seems like devres is not the right lifetime. This should be just
> ioremap_wc() instead.

Yes, looks like for arm64 (imx8mp-evk) will not reuse existing mapping
but creates a new one.

Best course of action would be as Iulia suggested to move the operation
at probe instead of prepare.
