Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789150C282
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568209; cv=none; b=ZVgRXMCMtMzYaTaWxtS/mryPV9yy1oXP9b2mtb2Ga9rbnxYnvDGRgzNsB7x7EokaFOcioGhe62vry3ubFLSu0JSh9G/afmI8ae0/HodA8balD3yl9Um7tOFCMn/3R4PCR5DwR49IGKUF9+UqTop2jqqyo+Mxd8Z2c8WAjvGgyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568209; c=relaxed/simple;
	bh=coXDW1UKwjEqw5hqQQ9LkeV6OHpNHzYpysQ3EUt3FgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE0ZvjTzQ7nSZjJQ60BpF8Gdc8ihJivbjXpv6Tsh/m7ZdI9XXjDm2HecUMHPU9HIGtmplOT2pyKV2Rm5MYtH0U84ul0uwl18reydTv35yC/LEOtD36PjzNp8IT0Jpa7yLr6Gwu1ta5DigRNiJc0NLnVAlHGOF6KBucEZFzZjbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca9371so284544137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568207; x=1790173007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZHEC+8AwtULIzRYVyufRQWIqPmnKtw3N56/Q6kikwc=;
        b=m35hL44igXbkscb44t7u+9fyQlijI9K2SEnU5yiJhLZ78khTqo9iWJUKMVgZsCTVin
         HgBG8yh/XFEl1pMbUydt7A5mAWl2We5sQ+zif+eyuGQmmaX4MfgaYPjaUnZZgLKiLKnA
         HWHFJ+ZkYr8UZlSdLXWOC8+KMD2At/rk4LMFC+L2ZKb8JKLGSu0rOQjsAfhfRndPKTWB
         q+g9VjefEk2GemtFmZN5DQmGCMgAELWjXcAjKQN2mU7qj3tfStjXU9DPUvaONwogdtFc
         piEE2bHbPL9snOmoYZ3//IW0xJh/MzDg3ZSCfPfJnSA6iC1J7vTXY4tfJ2JQ6HYXu34i
         2Usg==
X-Forwarded-Encrypted: i=1; AKwUvBxczY0/dLCRRyfhvcj7vSPXNIR7DQmjBfzhNdhO5wAFxZXcpstQd31UlZstGI9xVEN5Jpq92GQzNY3DfMpHMqa6@vger.kernel.org
X-Gm-Message-State: AFuF++l0gHtH4yGOsRZdNfWozFBZMZsY+puMrKj9zvwx1a0HpmwQzAfD
	kLmE/ew6vwiua5MtG+5hCkT9apE6ghKR3FQ1Nc+nbCC1FGMEGXhwVmrlRfdiVdjUy9M=
X-Gm-Gg: AYBFou0s891UC1k/sjWHx5HOByQmiHJTznryqryqz7sLQpfcFVuNQO2vLzNfoqy032S
	L/CEvqqzF15jU6wCU4epRPTMFGX7M4UZzzvegDXlz8rygbnhyN5KOHn6j4XxD5FFmcmfUPrxJXx
	aQaHQbwCgFcvvYtc5wAJ9Ka926hQS22TmLcufZIgfIbEhO/KWpHws2FHLdPv2BVAPjqk3L2fw7L
	D21faTmUll7XFEn0br9jhrjCe7jZE8jOB8HPBl9KkydkJxU1omAD4hlp/4M8dlK8HI9fkVeV8ZD
	e5nJC5kERp7qr1hVD4Bp1kcPJnEiiyE/PeJUzpNqQ6oQYS7lHXO5IwB7bQJ9X776sv/sQr4E41k
	igkwfPbgAlg4QcjyonvL212g/ojYiPJvxUci/o54DhVa+b8/rqs9HaLN3k53jazBE6hGiWcG6w5
	psWP/kZqD54eCm72II/eWcd8tPfxFLwk/d7Uxr075IcYqI4cg4dY/heIhln6FbxAvWK6tVRflBF
	toBJAOZrwjfqzCCV68IP2EuJxzhk+doJeJ7
X-Received: by 2002:a05:6102:5121:b0:79f:45dc:118e with SMTP id ada2fe7eead31-7a0263727eemr2598231137.5.1789568206590;
        Wed, 16 Sep 2026 07:16:46 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb104b2a6sm2887816137.3.2026.09.16.07.16.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fffc0so371776e0c.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1w4OMnRx1drg6ca2J1D+DWQWM220A3f5FU2byB9GUb1/AUXIqLo/1hMxSQF5JvgeYSrydPgFIDuT1APHmHgHN@vger.kernel.org
X-Received: by 2002:a05:6122:218b:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c99ab6ca62mr2524815e0c.1.1789568205123; Wed, 16 Sep 2026
 07:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
X-Gm-Features: AcwNN1XzX8LDXZHoO39ZbD09Ieg2WgEZcpweNI1kL3Ki-y9eZuEEawv4X8fTBcM
Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 16:01, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > To help debugging, offer a list of registered hwspinlocks in debugfs. It
> > will also print the responsible hwspinlock_device and if the spinlock is
> > currently used. It does not show if the lock is taken because of
> > side-effects. Often, reading a lock means actually taking it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have been using this since quite a while on R-Car X5H Ironhide:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
