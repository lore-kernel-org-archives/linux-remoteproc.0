Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116525;
	b=au3mY0kyjEndKqADB/7Yhi9z02GjuK9njeM6M2/btzuKXsV5iouWzWBzQ/e96RtsJlkg
	 zcUAkiiYE3qkVkY25TfxwOZW7AnKTzgskMB+MeKXlabV66uZgDX4vNw5dgljx7SwnW22A
	 WJ+XcG/uSiMY9FmSLQczOLFVwCsqpmoNv9WLIrCsNXeKB3QpbKWDe/OcbBKY6IzFpsAxR
	 Qu7XafOlZ3oEz2hpKIa/8XDIOuXWoKxEqJFJbomCer4wRJKqIrBUhSzYeymT3JvjO0rrj
	 zpMKpt1UFqsC4bY5PKEfaZSO2h2sqStjbNpsH2xnz328wPZMGBHgC56omqVv5Cf89Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
	b=1oqmnqGAv0vjDf9NmF0lNNWwW8htbZ+A4LqmYTUoK4KEBYj89vwTy2f8ENao1uz5q26f
	 JAFNrm8fHvklJeGqtq2nKpVXwdpP6LocxI+XLHc/AsM7k5h1ZcLK2EExW/ueEmWsLTY/O
	 hoZRFzqsSG/TgaLWGar6nBxrEtwxdDUeXpHYWJT4Ixfu6w7cmkz6KwnrWlA4wkdHs8Ye/
	 nMC8y2fWPS1FTz7M9l1nVrqTlmHSITHtcFMrL0VeGjghQYR15mgi6KznTWYeQrdvqHsL5
	 2tErPU7Z5u0LZEiPiBkGk0jzMXWzAW9LZ5XA5ErYkOTd7X4L6DNmw/YOek4/d2hgAXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YYAtO14g;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF8606A31D
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YYAtO14g
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8b20a899fso28273975ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116523; x=1793721323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=YYAtO14g6YyipYU7Xy23qUcfcDgX1naqq2UP38OzSC6pbPNZ1WBHPCgKsXfFidmHct
         oEExOd0frDeV5bshZkEldn67Co4G5mLW1orBx7QKN/kCyiTWjNXoP9tGmaCNUGcu1ung
         PIDUkv/K4opp7kJgggzIcZCJrAXyXv3g3IQkuJB3/sLo77jcdg3Op8g+OhxXATeKPSlq
         e/lr4nec5SHCWqzDi9GVhueAp1h6Rk++2rng8S5GHOXMyG0+Mvi3nY35+N5k/zJJvDkG
         PJ7dwvU9ubNQARd6CGAS3glOAcJa2tNw+awYAdqONi3sgaHaeLl6Fo5p7gKzOialWq3a
         WZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116523; x=1793721323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=c5ohP6hvPtOCJOYxDA3dwzhsLSt7MK5wcV7muCz/1ZRCIT1SIdwZE4+Tp635yaC2o6
         YS07uITg4zYRG6PRUNxmKNI1Rlpc+Oduo8gsOpapAeNhaAL0bpYGmUfsiPhvR9ZyUs8b
         pCqraf/XTWyiU1Th9zsQyLQMPg1hr3YMsv69/HeGsKMlX2WI3ilb6rmxONwhYyifSdzO
         cuOpZUGofPXs6A3+5tJNT+ets6Zd6U82yUUefiMedMUwpTS+pFodPN5Xz6pV7xxdThju
         hw62yYmXFU0u1oAM388qGCcFomF6Eun7RqgJM/LlnIEkh33t9+P2AuZS0FP/mcPSRDT+
         lkKA==
X-Forwarded-Encrypted: i=1; AKwUvBw6NXNt1YpbtyQDJf2lzKF5A7zj0qK84UN2IYX4oMExB0P1gLtPxkBl7lgftR/K7UEu6LrU5hLf5FNtQjwYi9VH@vger.kernel.org
X-Gm-Message-State: AFq9FYIXqRV15tSMV6MStIFn7jcI5LkgB1AAFK6mwZNNhR6wb+MRC67P
	bQsPbUAj09mbU+W9kASpsnviekYaadiGX49OdljhtfFtrltLExUSHIrwbD6Z428jDAs=
X-Gm-Gg: AYBFou06a9hDbQfPf3iNOyDDySIfHYAKvbk5flySzBz3Fs1voAowhv3EpsClWU9XC+n
	KzlwHVmTEkOMgFTZpV/1+EslFdk/oK1/J52ZASvWjWKSWEzDjDWXA1Grd8WdsDwM6/qvtNN4lCO
	sJlUgux70jVcuw3Rel7/3E9LrDkWHAls454eWtXNVjclyPBfOp3WLI/9Zs6zdwYCgNIBQbgR4oX
	syYef5pQ1w2MVgK2twOYihXkz+I914FoQDTtw3nwL6jmXj/SSnmJccJg9K3DiW2Xej2/me1MMDv
	RjMrCvnljQ4OmeSF2hr/g0MkjAt6NZi6z0U2YXr+FNqyFiD7n09iMCekzlgviw3U22b0ZDWKIRx
	P5A63e5XlxdnOMsoJT9s5bhaQ1VQR3YIRwHifwD9OdJ4/VlpF+2mu+z8pqUoklShRMyS6FIauxY
	vcR3jKHX4mAQhkgQKWYCrexQtUW2sruFVQgiQSPnuYL+Ozjh1UctfD5ZD+vgceKtjRi4L1vRFsa
	WQVsyZDNS4zDic8VCDwXIdTPkjWsse4M9dKwRffYWaUQS0KNLR0cCjnmqo=
X-Received: by 2002:a17:902:ce0d:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea9c7f6e25mr84880745ad.23.1793116523155;
        Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaeeda3f66sm9720725ad.8.2026.10.27.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:55:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:55:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <auDJaIHqoBSOxGHK@p14s>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>

On Mon, Oct 26, 2026 at 11:09:29AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
> SC846 and others). On at least SC846 the memory of the remote processor
> isn't directly accessible by the main cpu. (The memory is mapped into
> the cpu's memory space, but cannot be accessed directly from non-secure
> EL2.)
> 
> Instead of creating another near-copy of rproc_elf_load_segments() that
> just differs by the memory access functions, generalize this function
> and make the driver that already has such a copy benefit from it.
> 
> This is only compile tested.
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
>  include/linux/remoteproc.h                 |   3 +
>  3 files changed, 69 insertions(+), 117 deletions(-)
>

$ ./scripts/checkpatch.pl *.patch
----------------------------------------------------------------------------
_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch
----------------------------------------------------------------------------
WARNING: 'addres' may be misspelled - perhaps 'address'?
#56: FILE: drivers/remoteproc/remoteproc_elf_loader.c:233:
+                               dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
                                                                                  ^^^^^^

WARNING: line length of 101 exceeds 100 columns
#106: FILE: drivers/remoteproc/remoteproc_elf_loader.c:264:
+                                       memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);

WARNING: line length of 102 exceeds 100 columns
#129: FILE: include/linux/remoteproc.h:103:
+       int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);

total: 0 errors, 3 warnings, 86 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch has style problems, please review.
-----------------------------------------------------------------
_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 151 lines checked

_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch has no obvious style problems and is ready for submission.

> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.47.3
> 
