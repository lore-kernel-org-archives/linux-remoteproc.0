Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1B2DC765
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631084; cv=none; b=g2mUX7CmVpyRJzFQIl2kV6YHtSGh7wjPJM34Zb8+/pajMJJ91o8mkqKBhfiS2troizceusXXDv19S9ji4I50iyTAL81URVKIuSW/Zvbn6JpLFssRBlocO+h2vP2ohap19h4ijv0C8WRW4nQbwepLcf2mxRnIy3drdniMV5e/fe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631084; c=relaxed/simple;
	bh=8Hw80TAgKPDNBf0vWklNUbq3jAIqiU6weeac3Z8w6a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpIFMNdSWYiWO+w4PPg4dnlt39gac/+Ztrwe6cuQamvTreJLA+mROSSt0lhsI5QRKhb0lrAb6eJhPDylBQhH2eXcD/cd4GYf7l2oE3O/nGHbo6ZV7JhkUMKfVYLt3j9L+Ikhkbt/AYpZ+APxQGpHPswB6Q7EYHxuOX0E9QmBU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790ec94be85so195553137.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631082; x=1790235882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TZYjUR6uq0wvJ7yfCunhZRC4s2XoZDscTLrj+tpsIdY=;
        b=pLkX/o2MVXEnQUc216Q5ZUnqzEcxeOvyqvy6mdFgVL+pazIFqPZcXzG4yBbns+c6R+
         eB6k25NJYgaqaxzcQC5ncxEssM9tuRqfQW0r6Zg8aXd6Ojveh5zkcSnyqFFLui4Q6Qs5
         CiSp/0EQLbykWbuHkHwjhU8703zZSq5pP6kERP/8Fu3GS+w8uuuXcIXQa8iaP+YAQp3m
         sX3n/uyJTgerixA1daGvI06jTnUsLLuHW8YcRP/LPEkXTPxJLWcM8UFyWk10+5uF3Nd8
         zNa8kXtjkJVs28XSgitaZkI+V4r3W5qWOHvOlq8B0hjFnGIaLOlHBHVSWarJ7mXrQYPy
         /g4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8IExuW5N3mGsXZMGSOsEtlCKKvN9ilMq/tLsn21d8X3ZV+yN/CZ1xHK7YAp90B7gPLrYc8+ihcnm2+iwe46Nv@vger.kernel.org
X-Gm-Message-State: AFuF++mznMHTfHAPoqZi5xXzM9dIiwH3znCCURjL6cXy2Fy7+tNMFy2X
	mgs0Fk812KLkLVzXRmDMfNNgSb6uGTA8GxqoPNHkPGBd1i0nzBTX06rkHjcgCfE9hWU=
X-Gm-Gg: AYBFou0WnqzLNtCSCHAO9ppm9qH+FqUXfoEelfx7at75Qikc8QeVbvhfVhDp/YDJfwf
	m1AMaIPjYhlNeJt6iN0q4p8811+9XGolnuMCvTI2jxRu1YcdSFS39qH/pzP2mhR3kCj5ZEAbYjq
	dRc05ObjpCDfbWfdAeZX2FMtvYulClt07hsHdhng9yY+aYfZFfwNhvKk5pDmR3Q9iEYZLybUNky
	VgEiSrKyGWe0PssYvFexta9YseRtNlrhGZaBPiQssvKAdYHIp/+EYnNhsgNwW4KU0Jf8cCqMOdC
	uS8NhZce6OWiU6GURjrxRDPdhAqP7F0bpZohn/AyMN6iFqUAmLDuaAxxjEbdmhte4FlHTqf1pnP
	BR/3K4ywccFZRanrhuGHU8PaGcGSRrNAHllvRP4A37DDpw/hJIYgQJ2P00u8579M1iIftigU9Fm
	U8FfnGKk6tP8MnL0Nx/YiKEnBWPs6HvLTNG9icd5zUVPytWSl8i4WYB8IsOIBFiWt+5ez1I3kpi
	huY0jNDGMIOz35L6+BpPfF9ooJPAkhG+6l/
X-Received: by 2002:a05:6102:144a:b0:7a2:2068:6b5e with SMTP id ada2fe7eead31-7a22068752bmr551646137.24.1789631082080;
        Thu, 17 Sep 2026 00:44:42 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e334979asm2482999137.10.2026.09.17.00.44.41
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so189520137.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMwXZm9zYe4txIXbywtVJj3rCBJY6NcdGDH71zURJ+zKiGysRiNAl5tCFYiAekWSaUG3jM5nu+Ee6x7NS09eAj@vger.kernel.org
X-Received: by 2002:a05:6102:3e0e:b0:79a:47f7:6cfb with SMTP id
 ada2fe7eead31-7a029f141f5mr6828795137.12.1789631081396; Thu, 17 Sep 2026
 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <aqsMzXQ__BsWXUqH@shikoro>
In-Reply-To: <aqsMzXQ__BsWXUqH@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
X-Gm-Features: AcwNN1WFTEVxpdlneYZzV24ejd-9Z4yFFiZKF6ULft6pvA_51GkjVjhhS6OMQds
Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> > > +{
> > > +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */
> >
> > Do you mean xa_find_after() may loop forever?
>
> Ehrm, it's been a while, I need to look this up. Which means the comment
> is not explanationary enough :/

Yeah, I'd expect xa_find_after() to do exactly what you want...

> > > +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> > > +{
> > > +       struct hwspinlock *hwlock = v;
> > > +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> > > +
> > > +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",
> >
> > For easier parsing the output, you may want to use a string without
> > spaces, e.g. "busy", "active", ...
>
> I get the idea, but haven't found a nice word yet. "Busy" could be
> interpreted as "lock taken". I'll think some more about it.

"used", "bound", "unavailable", "occupied", "reserved", "in_use", "inuse", ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
