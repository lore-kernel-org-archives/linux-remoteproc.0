Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBB402BAB
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567895; cv=none; b=BUkb0EbWYf0xKtnou7dGgondQs+oMTt/eOApbxglE1DDZJjTDpTh8fMkPWJEBalA65kA56tt7MTCu74/0dLDOM/AWRIITOjXS10iO2Z6glWEWIifN4ZThWnIKh4ANvyyh4QS1cn27ZveQbfvIFTaoozRSSaJKad+cLsMX1m3i2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567895; c=relaxed/simple;
	bh=w/eXQPGbd03iM9t96bJfR+o+/5L1N7pSYa1fCCqF8nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMPSbnzXDmEkaqGgb3oiOVvgLiOA4VCfAkEJwM+GbzEx8bl+4rcja41R6s4ANiMmdo+FIBH1gqlS4iqe/1ssYNvbU0ouv5D5U/R6rouhX1MePHLP20WjkRDStgERFmGXPSTpbRrkDHL8Jj1IlEsx/A5ir4gKJO7STBRDJfbjFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so280900241.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567892; x=1790172692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8tYTO2oWmvq4rR3J0AZylxe0N8AEtq4E2BxgNYjJbc=;
        b=vhN7HQGh7r/yplCKcG1DSG29V0UWVSP8WVsb1DwszHqFkxDmTzjv1AiculCoi+yiL3
         FoZoobbjLl37YslZh/O2/nEpbHGPStrgNrWnSiREuTqXBnfEWBFi6JSDt9IZcZQr9nPs
         Qu+0nzvuNuKKN46NWQFl7oBaBrcZK4j/f76D5e4T/+Tk7EV8pp6KRI0DUUbwOD0lkN+j
         OxOXO0OcpilrWTkcMc+L2AJRudy2wHsB+OeYQZSF2blQ/rVtRMxa5iwyjeVsgue7jcZE
         Kda3Rjq9BuU5rcm8OM/whA9IUzQq0eSsND3z73M4D2iKSqCsjSj5YgN3VICYs6kERLVf
         lw+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEiyGS/i4ivfUHb5Nu1zhJ5dICyc1GCJ75obe8bbbzaHF8K/WQVHAQtdLu0nO8boSPfobdf2swkhTcDfJXjy0y@vger.kernel.org
X-Gm-Message-State: AFuF++nkWZIM6noKXzIXdNFoCX9Ll1QGecFQmb8+ykbNkUdgjOPYe2V4
	bxVmtdeLlDapxotcVIWN0cMrgrr9jtUAGz21dn5oGUPx4SiAeE78G2MYGB54Qzi6qzc=
X-Gm-Gg: AYBFou1OanfkZyaEbxNi8OyONqKgvrmwDo8mzoN80xNOx/1rUFUW6GvjnR447nfmzOt
	dbAp5KpZSLm1iz+cITGINLlEW3siRJBi/9mUmgtICU0C94UfXFE8bMOxf9Pg7nko1xpJNH2CM1H
	op3hIz7TFL2OuyRKnBe9fHljXGBRpIsKzaKE7LjkpQyueE053YAWM9lC+i//nGaksj1vxY05iUn
	8gumxbvaJb3IiFpa8nrm2eErxojEqL1kww8rzLPoIwPZGpjWTL8n8UpGcKWOzIWaGB6c+McNqrP
	+uY6XJERvWN1GLFgZOHa7biACaPeKp209AZH9TqUc5eW5EEC6CNl2mO4Wcla4ppuPbjI+tdHT+K
	p48Ia9XavN/CFNWYjQjLGVecoYM2gBTZrInfSL7vxiWGmpvsTX8Qh4DbLtaFBdiYEC+MHX7q3Y4
	RSywNkQYaGWsHi+jVFIwqUEz+tYs66jm/MG5v6jwanN4ILPcL+0tiJFHYyTlSNKKrBqOpWjjUmt
	0SZEGprCVNCwe+OVGtl0nryOoaUHioRSEGz
X-Received: by 2002:a05:6122:3c4f:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c99acc0a29mr2611993e0c.6.1789567891655;
        Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9988e5f27sm2748024e0c.1.2026.09.16.07.11.31
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so358170e0c.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSHGI+zo+UFpbN7pfqJicmIkWz7Vu/VFM7IF3TRjz6/LDT9BBt1ed5xsPf9kkAP+oENEDUeT1OC3cpsw1mgnip@vger.kernel.org
X-Received: by 2002:a05:6122:2986:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-5c99ab5599emr3306736e0c.1.1789567890852; Wed, 16 Sep 2026
 07:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
X-Gm-Features: AcwNN1WJafhDFv8HErK5k3kvDPcaoO0zG6c_BSadTCdG1pMVoaBKHlljZ751d3o
Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

On Sat, 12 Sept 2026 at 21:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> While developing the hwspinlock core or a device driver, it can be
> really helpful to change states from userspace. Add a debugsfs interface

debugfs

> to request, free, lock, unlock, and test hwspinlocks. Because this is a
> potentially dangerous interface, it can only be enabled via source code.

... code,

> Similar to writeable attributes for clocks where this idea stems from.

similar ...

> The created files take a single id for a single lock. To test all locks
> in a system, one could use this oneliner while in the debugfs directory:
>
> for l in $(cut -d: -f1 hwspinlock_summary); do echo $l > test_lock; done
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c

> +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> +{
> +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);

Perhaps just "test"?

> +}
> +#endif
> +
>  /*
>   * subsys_initcall() is used here but controllers may already have been
>   * registered earlier or will be later. The rationale is that debugfs is

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
