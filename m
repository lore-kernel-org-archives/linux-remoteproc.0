Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663794A2062
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567299; cv=none; b=m5MMTd0eq2MH3Jspeeo2iHh/eYuDLmKOQ7H1nfpst0CZO/s+i4GoiEDHBf+czBYpiSxK0v2vGsEapoZgqqJfYA0KMZJXBqxgyfcKTv65ghOi4Imh70AJnply/bSH9r6AdhThbuwC3BNseXaOEJJ3bX0C6pYO2irJNpQ+EQyTa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567299; c=relaxed/simple;
	bh=LOZA1HywhSNmDK1UoZyyxVq3wzA5V9QKlib/CveDAJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8eYqv6QzmI0/iOM6WarhJLAfTftXzNlRgflJkGumCOSPnMttLp8bqP/UkkLz6kVTj8CVOLL8ttsCaFvvFnHVe0zZZPW1n+6SoW6T39zJJ5+e14Gu4eqE9m5qrxhnpA53jteNeX54yW31RoGSWI5z6RqZAERAFgiwdDRldh7t5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6aa13a28848so1658944a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567295; x=1790172095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YB5wJdJp7iKTK9TemjyuyLSregIs6jY3r0wL3mFG0oc=;
        b=Bc/KQh9YOnNXZjWvvhw6nNLPx54yid8VKfu/QYeWjoncrQ06ALh6YyJWQCd0qNWjxf
         ZpmEtclEjmTSgWwc1xSo8ofZWNg5E9vW7iFiy/sR544+QFQr2x4LNqQJgcjarpFNvIb9
         Q5qz0KstvtRGEPQXWiY85WI1h4ZkcYzq8uSYHo7j3Pqgf14KVQaHdDhC4DJ+3qbHVHjU
         uzUl35c84pITvlgUsAO9tm+F5L12oPsYnwor4GEoHUmhn8NdqE5LWvbC5iO4eEutsgek
         FQ7ucw3YEfQs7c8gof1GXFxeYrq2TYThfD3+X2Q/hmCFGr6pZBtXb6w1rp1c4KcpZIdI
         56tQ==
X-Forwarded-Encrypted: i=1; AKwUvByJwHt7y3hyOcB33SiaH/dvaYS+VHwYrqYXpFtsY3xCpgCSAuRGEDuj5IGshY5uZ29hpaE4IL3Uk+4pvy4BVbCZ@vger.kernel.org
X-Gm-Message-State: AFuF++mb65cSXqv8iZB4Sppv8+YQIwuA6WrRxLaGdfyjIPY9tzcWCJqX
	0myBc5S8a1Ai2rdrh0kBRhwYZiZc2en//MLA3JwOa0MrrxlA6ZAyNxun449KP6xkntQ=
X-Gm-Gg: AYBFou122hLq0Fh9+xYWBS2qAAudDaY516ArgWSKWHz7DRuoFRgykCfed5WP8lhozOR
	CiP5i5zIcoVPPpM/2aLKyF1E4Etbewkk9IMuuNSRdHi7a6Av3hVtkktz9SaXCic2DWSIxVk9Ccl
	bJ/tmSwSpEqiKLMPH/KkhS5SqFTV+PET2JT9hbBOB7hM9LvARGxHY2jStPLtJborQi03v6/y5gj
	BZs7U3TACW1fGZRKqm4LuuZCe+3SgDoatRKeB49AsLaXGJANeoYtR/9HZkTXdkl6PlJs2G93GZx
	apLZD1dp5LB3MqmD5LmAaMMxDuGswUc5+ncOI2uBqgDUJ3eR+gyrCQ6GqavDVgxTJDmZQ63kcir
	AbRU7/NXo8/0Hfo9P13oUkoT7FIGesUn/exgMJSOOKTVIeZ1UoLkPS7q+Cyt1o3JcAm92Dab6at
	4AJWQjWPDIyQ414kU8LxVWwwzDx9k6QaIRQaanPHtN/EDzo56U4tBmSzC0kz0Ld63SPG2roKVIy
	iuBz0DrReQ/D6+fLqrzXmX4QrKd5kJxAa2g
X-Received: by 2002:a05:6402:5609:b0:6a6:b2b9:7667 with SMTP id 4fb4d7f45d1cf-6aa04039dfbmr4158303a12.20.1789567295219;
        Wed, 16 Sep 2026 07:01:35 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2406d6sm1685237a12.12.2026.09.16.07.01.33
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:01:34 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c294ad260fdso316517666b.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAF0y7D8Tqua8fsFlbWepRYycVOR9hyx3DbpjJTWolVbF9sjPOb1uwDSCCw90wZ8ChxLZvT94jGMeo7jxc+xZC@vger.kernel.org
X-Received: by 2002:a17:907:9452:b0:c25:f7dc:2dc with SMTP id
 a640c23a62f3a-c29c8bf56d3mr614247266b.29.1789567293068; Wed, 16 Sep 2026
 07:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
X-Gm-Features: AcwNN1UfyJCOGSEjRjtYLZ4YGwDs-hH1sGh2EPXUqWFwEQpikBVlS7z89oufr3M
Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To help debugging, offer a list of registered hwspinlocks in debugfs. It
> will also print the responsible hwspinlock_device and if the spinlock is
> currently used. It does not show if the lock is taken because of
> side-effects. Often, reading a lock means actually taking it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -860,5 +862,70 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
>
> +#ifdef CONFIG_DEBUG_FS
> +static void *hwspin_lock_seq_start(struct seq_file *s, loff_t *ppos)
> +{
> +       unsigned long index = *ppos;
> +       struct hwspinlock *hwlock;
> +
> +       rcu_read_lock();
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}
> +
> +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> +{
> +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */

Do you mean xa_find_after() may loop forever?

> +       unsigned long index = *ppos + 1;
> +       struct hwspinlock *hwlock;
> +
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}

> +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> +{
> +       struct hwspinlock *hwlock = v;
> +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> +
> +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",

For easier parsing the output, you may want to use a string without
spaces, e.g. "busy", "active", ...

> +                  dev_name(hwlock->bank->dev));
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
