Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710A37F30A
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787141742; cv=pass; b=qyeN8qaDY3wl4PYBswyYWUacscE5YwPVLB4PoLPWqA3oe/CHvPq7WFpicTvgmDhv74+78jS5wnoNGIeUEpsFs8j2rSCrIK2VeOJzEUAlS4Zq8Y9aIxajj7u+v1fBzB1q751Dk90Zy8peufQyLm0K+n9tdsKCiseRpzOIRMzrWAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787141742; c=relaxed/simple;
	bh=4fMeCgiEb7KH5DAj6ObJDXdV0rN1foJUWuxcGDEvDxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1DmK9DwKUbLB3Gl+/kf7BnLG9eNjk2rt1eKQsVpJhBRE5g9goD7c1UYBh2XVBOBYiI2vylZGJKJ47DUaOZMqajpBms7fOdYAOdU//s1Ejr9kch1/DETYeWIZS5xio9VT+hkQoez2E2t3UojG6/sl4QTZcU8ruWZ10aEl2XRqKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBks0T6j; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBks0T6j"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so8015245e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 05:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787141739; cv=none;
        d=google.com; s=arc-20260327;
        b=NTV0z8l1c7dC2tqXx1GdEEMFxsYVf9/rXfRyIeqaLjD73uwDcVrNnYH9m/vP1ipaSd
         1uMqp26wASmWY0v6jbY4tsgGR+I29NEhhYOxVwGGM3Y7WpMn3wNPycU47686jFF9i5IR
         HAmzpwGLYOoekgaX5QN0Aj2vrVRI7xbSCkxQ3r6IMjAOAy6GIACwsdGXkxtU/RzB2Sb9
         h1WrZBroswnJ83dtkH8NWN6Oig1JzLKRGbE9hxddaFjogmy056MyZKcyPKBa34BL9ALI
         6Al+UYucpgv60nforoOCpIWeO72yw+EVK5DDcsl6QBdw7d7tnTWxQ/rJ0tuasliq1Fs4
         5OXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=72eOsfV6zir1DGDYJWBdwYLSoDHNbYLfxtcu28MhLOE=;
        fh=BLCvpmbUosOHaMwwN1zqS5Z6+ib3Gsha98IOZqkr46g=;
        b=rDJN7ssu1XybYIFfuoUFWNS1krwuBHtj/B/nnUYKSTqo3v2Df0++qqCzV/nsVtFW1E
         BP4yCFAnlAPZe2V9M0b/RJEq0hg8XZxbFWy1w/oCVEuKCdaKjtxkWZV01VHPq9nZhZkm
         q5GflONw5NA/Pxc1ke3qOnO9icgwq1tWNKx5zXLL0+wtz1cniRmyRA6cwDkPtNEZJh+9
         H+EiH6hW4bBGOwH9YJ+JFh547ObHMXEvKobKiMinlece+KEx6ARaFbQL20gjTvH6WIAL
         kPUvdJ0m5e5AgdN2a0fKDibiAymcN4gshwDaMvtyv1GAH6HevVhycZYzQQVfUJ7ltgqO
         Ecbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787141739; x=1787746539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72eOsfV6zir1DGDYJWBdwYLSoDHNbYLfxtcu28MhLOE=;
        b=lBks0T6j9HEpObbvpWeAGBePdh6GTjy9+iMWAEIfOojnKud/r9HCMFRj4R/cJHas+P
         0xvlucBqgFvSj/lquo1MD5iq7/r+kQe2jgx1jRchXjH4dAlVLegN1FvOEoY4V1DE1DYu
         EzoJus8MPsnYk/ErA9qC/V5v0JWCBLkVrZK+O2nbsDh8rYfRrNK8qec5NsJcTlpiVsZK
         1C4Lt0xgJl/jxAhsr/BBwbA6Ap0AnpXLI6tpNoGO6/YET+sKn9kWKUkLNZO7fcGnX5mI
         THGQRZwGEAV6JWxsbS4NN0wFYSdwefeh3uDP1Uxhv0HGowPOZNseFG5593cIpeVOSiNH
         aveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787141739; x=1787746539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72eOsfV6zir1DGDYJWBdwYLSoDHNbYLfxtcu28MhLOE=;
        b=DYMIoFvSJhW9oI3vpvl01PUNvwiSaUDnnel+KT3LBQVw4Bv5a7q9sfVe0VYc8BTAfv
         xzzbJLH5FEUXB3K61Yfo9UcqUPrszBfQasZcCX7pnOiOcC1O13h7+l9+4FaaUEPZvePA
         fUOO/QIqCTQovQzwlLkn0UGm+KXoRHbgvi5zTHBD5sdb5ct1byJS1RenTgS3ZstoIj4W
         FLDw6jCt9/DTVTpCu6WqodeB0av1KILE6Ebc7wxDaDBqx1ymHfExrHPKV2O8Qr7qEw+5
         h2QPmB3nPxuj27U/TQgkyDjIZU7EYdETw0UXovHM4BFuXOLWFDdRrVvCePbZON5gjFcs
         jy5A==
X-Forwarded-Encrypted: i=1; AHgh+RpY2A6ycCDZ6wTcFj4bCJVvYEqxkjh3R+7uftdXSiN2T7+60y4/euo9qz22/S9CBy1d2bljLsuemSzcOH2khaMM@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlwNu0cTm675uoAOFgp/36asxi/SQ8mO0okZuNrB3e6ZIZgIx
	8BJPOj862JWmRWtYO54ndZQAcdnbkeWe8qjZW1M81HSRuxnv8xtFzY6JxMYLyHO1yLptWtTDKep
	KCsifi/E8LEo3c6oq4s5UgTUxyokQYtE=
X-Gm-Gg: AR+sD11U/LzErBUlAXnBVpcOUBJiCVL+fuwbxw/EkzxnkVMSeCEzdPs2FiTy/Y2I68/
	Frgt375COh5XO36xyGU5oLC9p9KPJqoHcTGnMHcNXMitnsvI8m8NvilESd1iRXMZaAoh0jKC1IF
	PD7JPjy7m1e9z+x164GjIQ5hDHZ/2w9+/BQWI3Hl17GqH5ORxzHvR0xy0Jpr1qU+SiNlQTF+ULD
	pWzb7SRhRIJttF1vF4bq4kIGfVDYertWunc5kd3EgFrqT6y3wuigVWpUe+msFkxB2LpGeuIcGC8
	tvEULT0gTgY3W933lP6YbqxNPW4YSUGxG51Hf6naGe2ko+vCWp1ZKGGClHbLm+CKzAfIWCLkJza
	opA==
X-Received: by 2002:a05:600c:3f12:b0:499:7a4f:d13d with SMTP id
 5b1f17b1804b1-499aa199777mr77339065e9.4.1787141738948; Wed, 19 Aug 2026
 05:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724025322.2341205-1-sammiee5311@gmail.com> <CANLsYkz+h6ONmvhgdfGLNu21J+LrMSySFw9sxRcR4ZxLwPfbsg@mail.gmail.com>
In-Reply-To: <CANLsYkz+h6ONmvhgdfGLNu21J+LrMSySFw9sxRcR4ZxLwPfbsg@mail.gmail.com>
From: HyeongJun An <sammiee5311@gmail.com>
Date: Wed, 19 Aug 2026 21:15:27 +0900
X-Gm-Features: AcwNN1UpRanTlUxzoBhHyJNzchxXX5y3Agcm4VcHLo9-bTKNg0iBcNni_1ps50w
Message-ID: <CAJciObG2OahhKz+t9pbA1yCHz4pFQLK6EKmZMwY2zxqD33SgQg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: elf_loader: bound the section header table
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for taking a look!

On Wed, Aug 19, 2026 at 1:42 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Thu, 23 Jul 2026 at 20:53, HyeongJun An <sammiee5311@gmail.com> wrote:
> > +       /* find_table() reads the header at shstrndx even with no sections */
>
> Right, but if there is no sections, @shnum in find_tables is 0 and not
> arm is done.

The loop is skipped, but there is one load before it:

  :266  name_table_shdr = shdr + (shstrndx * elf_shdr_get_size);
  :268  name_table = elf_data + elf_shdr_get_sh_offset(class, name_table_shdr);
  :270  for (i = 0; i < shnum; i++, shdr += elf_shdr_get_size) {

:268 reads sh_offset out of the header at index shstrndx, before shnum is
tested at :270.  Both callers, :336 and :380, reach find_table() without
checking shnum.  The value is unused when shnum is 0, so it is a 4 or 8
byte read past the buffer and nothing worse.

> > +       shend = size_add(size_mul(elf_shdr_get_size, (size_t)shstrndx + 1), shoff);
>
> Why the shstrndx + 1?

To hold the header at index shstrndx the table needs shstrndx + 1 entries.
It is keyed on shstrndx and not shnum because nothing here requires
e_shstrndx < e_shnum.

> Also, there is no point in doing this check if @shnum is 0.  Please
> move this block in the "if (shnum)".

The check it replaces, :95, sits outside any shnum test today, so moving
it in loses what master already has.

If you want it inside, the way there is to drop the read:

if (!shnum)
return NULL;

at the top of find_table().  The loop already falls through to return NULL
at :313, so it changes nothing today, and the bound can then go inside
"if (shnum)".

I am happy to do either.  Let me know which you would prefer for v2.

Thanks a lot!
