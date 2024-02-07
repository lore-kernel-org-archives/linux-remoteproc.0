Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204F81AA2
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Feb 2024 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707323368; cv=none; b=W0KjB0N4SWrQ8FvMgjjxN7QYhW+5n5Lf+kVtnoXiiwlWh0g2K0uxvNEz0L0AoExIw9BrzdnpkCukbXxGIJbttROPLcyvD6RrQp2rvMHfVDgnhapbllJzrTzNP2eXKB15iXtB27AokOcuE9E6COUdbKAcXkAS2rE3rTP/+jNjSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707323368; c=relaxed/simple;
	bh=lw7lJqamj6paXkbZ/Sbln7d4vFMYCEU8sluR2zkgqeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDUnxIWbORhDsMtMMPuWYgXJHTleiqfhuW6TR06TuOS+hqBZNkcaKhLXJw4/NnfDSU0JDO31CUAddSxf5Uf1Di9kr8RwfjfvKxWNY2Wi5jflOdPnw1as8WJxDCHhXemuQkTAM+/6CmlLAE8Qu4SO3lXoq7TAsOh/yiIlw3IXMwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXcH7h8m; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXcH7h8m"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e05d958b61so697333b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Feb 2024 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707323366; x=1707928166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRIcWq3lPfILCGhdxmWyNaeRVReDmSlSg1CGLnuiOcw=;
        b=rXcH7h8mJnTcGnRgEjPNGZMg9Xdmygb3PxhyEM4hR9FYCdQlsdwAvZPer1yooiCKG9
         C53HGgaDqWdRZPdn5+HiFiS+T35CqFyBFrn/6yX/QBex2nKY9iRzvYuIL9Jc8gwLNRVw
         u8fpkzXH5QJ86twHGnVyRvq7uM2rpQFy5juyVB19/NEndXJdAtQUrhc7thQG4PtglJWd
         Tqbgl8f3fsqUsSByhKB4w6wnCM100Ahk2gAKES7NVxifD0+GLuQ15OHzjajL/aOh421U
         mfo/aZ7vD3X1wge/73au7UJz0usqhsk/L2ULeU7vbfCch4E4s1ih1KcPOWhUhOuPF/OJ
         yEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707323366; x=1707928166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRIcWq3lPfILCGhdxmWyNaeRVReDmSlSg1CGLnuiOcw=;
        b=bQgKZMrYRe4PwNdWh887VZucBZdQ0ujMEbaaYYXWxawsUzAp9uba4KOjEo1Lj6KKfm
         Z7OgXp40zC+AMEJY2bIuuxVgV5OPdLNYPmFX8qMMExAbI/Gzal824GFMiXkCvO4/fjoN
         QpWlBSfQSAoJ0l1nmMuArsnx4F/RCHpl4Dsq2BbNZFxRgAAAfTPFS/REcsYLdjT/nJoi
         HhIE3o0elH4Ijw7Xybxd0ElXDiaaY3qq61VGhm+MOdKvQ8a4kk6LEBffuczIICl4g8a4
         2zpgCR1iq06xBDsBu6cLxZO5nk3mqu+dZIl1q8eAKXY30ySUtJogHInuwvxBvKU40wn0
         KqrQ==
X-Gm-Message-State: AOJu0YznA1CzbiQskTGMkhcYwtkUKYtFiK/5f+DDH/tZqw0vyHv3EjY7
	UENA0O1SJJ6P52avtpTo/q1aQKPlajnyJN5m5rniLkoPKhymCsnXi7FIzgEpSOI=
X-Google-Smtp-Source: AGHT+IHUzbDds+YlweIIYqKt2a7rjHMU/vzO+ioKkcmRtRFYM5wy96+da2+sKeULgKnEh5CpqkIdCA==
X-Received: by 2002:a05:6a00:939c:b0:6d9:9613:cb9e with SMTP id ka28-20020a056a00939c00b006d99613cb9emr3364980pfb.29.1707323365971;
        Wed, 07 Feb 2024 08:29:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhNUrl+HmGZrOh+jZG5eUhFoECLbm/8o3rg2U8rGXGi6IR9raB4meWefzMwlIeJSu4GUGPMTGDIxmXcKDreogg6nhqJ5yCPLifFUwa2oKJ9A==
Received: from p14s ([2604:3d09:148c:c800:b7a9:9867:b1ab:2708])
        by smtp.gmail.com with ESMTPSA id 9-20020a056a00072900b006e03c7e74fesm1777061pfm.126.2024.02.07.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 08:29:25 -0800 (PST)
Date: Wed, 7 Feb 2024 09:29:22 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: David Hess <dhess@data-bakery.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: Kernel panic apparently when writing on RPMsg TTY while or after
 coprocessor is stopped
Message-ID: <ZcOv4lZVOtSiLdrY@p14s>
References: <4BB17D7E-D9BD-42A6-8E1D-6C6CF0C218DF@data-bakery.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4BB17D7E-D9BD-42A6-8E1D-6C6CF0C218DF@data-bakery.com>

Hi David,

On Mon, Feb 05, 2024 at 09:35:41AM -0600, David Hess wrote:
> [ resending as plaintext so it makes it to the list ]
> 
> Experienced this kernel panic when stopping a coprocessor while the RPMsg tty was still open and being written too:
> 
> [25016.237134] Unable to handle kernel paging request at virtual address ffff800015b3a002
> [25016.245244] Mem abort info:
> [25016.248053]   ESR = 0x0000000096000007
> [25016.251824]   EC = 0x25: DABT (current EL), IL = 32 bits
> [25016.257140]   SET = 0, FnV = 0
> [25016.260216]   EA = 0, S1PTW = 0
> [25016.263363]   FSC = 0x07: level 3 translation fault
> [25016.268242] Data abort info:
> [25016.271147]   ISV = 0, ISS = 0x00000007
> [25016.274991]   CM = 0, WnR = 0
> [25016.277960] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000049c2d000
> [25016.284680] [ffff800015b3a002] pgd=10000000bffff003, p4d=10000000bffff003, pud=10000000bfffe003, pmd=1000000075692003, pte=0000000000000000
> [25016.297273] Internal error: Oops: 96000007 [#1] PREEMPT SMP
> [25016.302859] Modules linked in: rpmsg_ctrl rpmsg_char imx_rpmsg_tty xt_nat xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c xt_addrtype iptable_filter ip_tables x_tables br_netfilter bridge stp llc mwifiex_sdio mwifiex bnep overlay cfg80211 mcp251xfd can_dev cm
> [25016.356332] CPU: 1 PID: 95780 Comm: python Tainted: G           O      5.15.129-6.4.0+git.67c3153d20ff #1-TorizonCore
> [25016.366955] Hardware name: Toradex Verdin iMX8M Mini WB on Yavia Board (DT)
> [25016.373924] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [25016.380891] pc : virtqueue_get_buf_ctx_split+0x28/0x180
> [25016.386132] lr : virtqueue_get_buf+0x30/0x40
> [25016.390411] sp : ffff800015db3a80
> [25016.393727] x29: ffff800015db3a80 x28: ffff80000a7022a0 x27: 0000000000000007
> [25016.400870] x26: ffff0000077dec00 x25: ffff00000e76c0c0 x24: ffff00000709bf00
> [25016.408015] x23: 0000000000000007 x22: 0000000000000100 x21: ffff0000014e1f40
> [25016.415162] x20: ffff0000014e1f00 x19: ffff000006c3cd00 x18: 0000000000000000
> [25016.422306] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffa5db3fb0
> [25016.429452] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [25016.436596] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff800015db3eb0
> [25016.443742] x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff0000075c6e40
> [25016.450888] x5 : 0000000000000001 x4 : ffff800015db3ae0 x3 : ffff0000014e1f40
> [25016.458033] x2 : 0000000000000000 x1 : 00000000000002cf x0 : ffff800015b3a000
> [25016.465182] Call trace:
> [25016.467631]  virtqueue_get_buf_ctx_split+0x28/0x180
> [25016.472515]  virtqueue_get_buf+0x30/0x40
> [25016.476441]  rpmsg_send_offchannel_raw+0x44c/0x4f0
> [25016.481240]  virtio_rpmsg_send+0x28/0x34
> [25016.485167]  rpmsg_send+0x20/0x40
> [25016.488488]  rpmsgtty_write+0x54/0xb0 [imx_rpmsg_tty]

I can't find either rpmsgtty_write() or imx_rpmsg_tty() in the kernel tree - is this
code public?

> [25016.493551]  n_tty_write+0x2c0/0x48c
> [25016.497134]  file_tty_write.constprop.0+0x130/0x294
> [25016.502016]  tty_write+0x14/0x20
> [25016.505248]  new_sync_write+0xec/0x18c
> [25016.509004]  vfs_write+0x24c/0x2b0
> [25016.512409]  ksys_write+0x6c/0x100
> [25016.515817]  __arm64_sys_write+0x1c/0x30
> [25016.519744]  invoke_syscall+0x48/0x114
> [25016.523499]  el0_svc_common.constprop.0+0xd4/0xfc
> [25016.528209]  do_el0_svc+0x28/0xa0
> [25016.531526]  el0_svc+0x28/0x80
> [25016.534589]  el0t_64_sync_handler+0xa4/0x130
> [25016.538863]  el0t_64_sync+0x1a0/0x1a4
> [25016.542533] Code: 35000700 f9403660 aa0103e4 79409261 (79400400) 
> [25016.548634] ---[ end trace bc845368ab15e73f ]---
> [25016.553257] Kernel panic - not syncing: Oops: Fatal exception
> [25016.559009] SMP: stopping secondary CPUs
> [25016.563249] Kernel Offset: disabled
> [25016.566739] CPU features: 0x0,00002001,20000846
> [25016.571276] Memory Limit: none                                                                                                                              [25016.574336] Rebooting in 5 seconds.. 
> 
> I think the simple and obvious answer is “don’t do that” - we should be able to safely ensure the RPMsg TTY is closed before attempting to stop the coprocessor. However, it would be nice if the driver handled this situation safely regardless.
> 
> This was experienced under the TorizonCore 6.4 distribution on a Toradex Verdin iMX8M Mini WB on Yavia Board with this kernel:
> 
> 5.15.129-6.4.0+git.67c3153d20ff #1-TorizonCore SMP PREEMPT Wed Sep 27 12:30:36 UTC 2023
> 
> Happy to provide more information as needed. In terms of recreating, I think it’s as simple as opening the RPMsg TTY (with receptive firmware running on the coprocessor), writing to it at a high frequency and then stopping the coprocessor until it happens. We’ve seen this panic a few times and eventually managed to capture this panic log.
> 
> Dave
> 
> --
> David K. Hess
> Founder, Data Bakery | Data-Bakery.com
> dhess@data-bakery.com | LinkedIn
> +1 214-684-5448
> 
