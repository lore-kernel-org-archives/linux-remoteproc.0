Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2225394C;
	Tue,  5 Aug 2025 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419296; cv=none; b=Wc9cwTbqqCOv5OMAM52EwyPeCpaYwL8uzyNP2KTp/4WAbjgnE321X9SVEsSS8T2jHFrSNot5zUIctDa3das4FN5Ufw0aH1hJdxUvfEkCxQYL/4BiI7Hrm9K0ewT2/HMywiNctTvaXyHY3igtMDSXo9acH485DqSkmPoM/PccZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419296; c=relaxed/simple;
	bh=G4av0tf8j3H+vgDZMRG69qo10dZZE2uClT0Lfe5Bl/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+LiV3EJM71rUpQpg5Dw6sO912tirerVr1dANEHtgavs15lTnjqsWNVW1xfPLyDVuxDOginJqD3a8mmLdVcF7FvQkwpNUA8aNj2Dh+Jo8oPyTQNImAZnIGCuqNza8uvhtJXr0ayJ+qPu5UrFzviULLErCoK/f6nMWE0ymP1DGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvQ7vGRu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvQ7vGRu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74264d1832eso5553822b3a.0;
        Tue, 05 Aug 2025 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754419294; x=1755024094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRQ1XVejo/qWVadxnYzHwmtR+oOtc0Jwo0/IudE9CjY=;
        b=jvQ7vGRu1jykrz8qdGVf+3dSPwwExs4hB8mWAxuLyX3eP89rSsNpI/N8I5DVKJ/qCR
         DIGIRfKW7WhA7s49/sxLgEJOsCPy4g46Ir8yIQZlA0MEfS7K6NglSXf0eRgJ3Z/Yk7Tv
         SWDjdNWOZVaaOTD0S5U5ArjC7+obaAlD05rkTmGDBRzpdpkvKKSCy7GOo27l/Kce62Ac
         U5i8A8LpJiMm5uPFdtNKKsHsqPCEszoh0YhP4pOS3k9UZDHe0t96YVd7kuVTlpJROUvR
         Ob75Im6Y3ZFl0lsJlso0SZRF97X/60+pdHA2p+eEiJLBO8QmPhKTAZwm0PPocswFfh9o
         BSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754419294; x=1755024094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRQ1XVejo/qWVadxnYzHwmtR+oOtc0Jwo0/IudE9CjY=;
        b=Lr0gRdYZDEWhSLAN5zDuDNBncqFCBvJMYn5X9Sa0V7dzSWdD7ImDZQN1KjpkU/1tiw
         3GfFCxHiEDgHrrsqdol7e3fd7GHCC9ktrOU9+M8KEaNWjmUJ8YO4cUiv4zErfaNHDe1g
         CAqFq+RDP7Vwjun/ijoMhtU8GhcNQAFpZXD4S635m0Oc2FZlV2JYTNUuJDZNvOhlr4pQ
         gXX1p7MV9RRAKN6Xc4UMa3oWUJGvyyVP4Sm7yPgYJwJ7FK7KJJK3SRNqpZto/H4tZxtB
         oAPigrzhL8EfJHqkBAqKFDTDSSAcV4S2dVE9oe+YFtXEFi4qnPCAisnpmB9e5YbdXGXn
         xH/A==
X-Forwarded-Encrypted: i=1; AJvYcCUA6PbFt9azIUhEahKxJpM/vGRtPRD3vCWHMtPE4bJHsu1SVYbjr8VHwJYi28qTlsATdCf6fp9EjoCAT3g=@vger.kernel.org, AJvYcCUhyLfJPON3IioHC6inR4IqvNG4jJI00N5yUMgAs+2vPsZMz/57Kr9mB/A4IOp1RzHENbFEr/5k3ntBXFWn8/GL5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMXL7IoQgrEMlcl+UQ+comwMEFZiKNzzctkn135yZpsLVclT5
	m7JLMJ1bJfzk+T8SujJEC0pGmwoXQYOD1RZcl9ADhyRBszfAkLrIqGHQffh2kg==
X-Gm-Gg: ASbGnct6bifxkaiLUeLl3xK0X0IARlb2MZaBd2C9GFsFO1wycJrMWyVWaUSyor3i6Iy
	Yz8cdEfVnlekFNFC4XhFWY7+JFPQEYdzA4IlfhrjIoh5wPq7Yda6n8V8n/+o+DbPFrhiHTo4Kic
	IxVvCsx8+PesmYKNi+30kdZwZA6gORC9L+l8i+eQkmORpMS2T4G8GruO3fUNEUzLYbk66LnNCxV
	3cN6AFbOXF6iKMsej0GunPl4K7ATFskim2HCgIdHAT4Mm8e6o0Xy+CwPHhHq+hJb2qVSqRo5ae2
	l+Ms0XY23Pa3mMKhKLfTATDNy/EOtBR/Yt1Pein+g3uLzja5JWjYzatw5fKqLNz9qUaVzLaAEBI
	kbljsXEcqM75NoaanSKpn
X-Google-Smtp-Source: AGHT+IFOwJbYZT3sPdhUa5jGGg7bp0JMNtYXQQ9TsQpEFG4Gt1bHamim9GaD/vuJ0ZOeIV6qX75hKg==
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id d2e1a72fcca58-76bec2f304fmr20203456b3a.4.1754419293591;
        Tue, 05 Aug 2025 11:41:33 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:6302:da79:b882:519f:fa23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c020a4a1dsm6233457b3a.13.2025.08.05.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 11:41:32 -0700 (PDT)
Date: Tue, 5 Aug 2025 15:41:28 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Andrew Davis <afd@ti.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <prvj5e2y3ruqgn35auolaia5zwoahtfecosumwshappy32ylrq@eivdt62vp7rh>
References: <20250726143908.ayug6dedkmzulldx@hiagonb>
 <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>
 <20250729180420.svxtcukjlgg5sv6p@hiagonb>
 <yz2x2ywvmms6xgdvefqwr6ioi5cateagf2egqjnug7ozkcatx6@f652ifqzrm33>
 <f74d44d5-c263-4d82-b1d5-7e542e47672b@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74d44d5-c263-4d82-b1d5-7e542e47672b@ti.com>

On Mon, Aug 04, 2025 at 04:14:26PM -0500, Andrew Davis wrote:
> On 8/4/25 2:31 PM, Hiago De Franco wrote:
> > Hi Andrew,
> > 
> > Sorry for the delay, I am back this week, I was testing the patches and
> > removing the ping was not enough, there is one extra message being sent,
> > which is the k3_rproc_kick() from ti_k3_common.c. This one is a callback
> > from remoteproc_virtio.c.
> > 
> 
> So tracing back, looks like this message will be added to the mailbox
> when Linux tries to start communication with the remote core, and that
> happens if the firmware advertises vrings in its resource table.

Got it, thanks for explaining.

> 
> > I belive this one is necessary to make the firmware works, but with the
> > hello world demo, I still have the issue where I can not go into suspend
> 
> Which "hello world demo" is this? In Zephyr, we do not add the VDEV to
> the resource table if the firmware does not intend to communicate[0].
> But MCU+SDK firmware might add these unconditionally, I'm not sure. You
> could check what is in the table with:
> 
> $ readelf -x .resource_table <your_firmware.elf>
> 
> and empty one might look like:
> 
> > Hex dump of section '.resource_table':
> >   0xa3100000 01000000 00000000 00000000 00000000 ................
> 
> one with VDEV will be much longer.

Correct Andrew, indeed by removing the ping and testing with Zephyr
Hello World example, it works fine, the resource table is empty.

I was testing the hello world from TI mcu_plus_sdk_am62x_10_00_00_14,
and first it was not working, I got a -22 from the remoteproc driver,
and no .resource_table is present at all.

So to fix this I enabled IPC sysconfig, which created a non-empty
resource table into the ELF and made the hello world work, but broke
suspend. Now it is clear why this is happening.

On the AM62X Academy it mentions a empty resource table, but it
reccomends to just enable IPC instead [0].

Thanks for the help, I will then create the patch to remove the ping.

[0] https://dev.ti.com/tirex/explore/node?node=A__AcD0ahYJlxouUnP8vWuDYw__AM62-ACADEMY__uiYMDcq__LATEST&placeholder=true

Best regards,
Hiago.

> 
> Andrew
> 
> [0] https://github.com/zephyrproject-rtos/zephyr/blob/main/lib/open-amp/resource_table.h#L34
> 
> > mode. Removing both mbox_send_message() calls makes the suspend work
> > again:
> > 
> > root@verdin-am62-15479173:~# dmesg | grep -i -E "remoteproc|rproc|omap-mailbox|hfranco"
> > [    0.000000] Kernel command line: root=PARTUUID=096221e5-02 ro rootwait console=tty1 console=ttyS2,115200 dyndb
> > g="file ti_k3_common.c +p; file remotecore_proc.c +p; file remoteproc_virtio.c +p"
> > [   10.520920] omap-mailbox 29000000.mailbox: omap mailbox rev 0x66fc9100
> > [   10.711357] k3-m4-rproc 5000000.m4fss: assigned reserved memory node m4f-dma-memory@9cb00000
> > [   10.753040] k3-m4-rproc 5000000.m4fss: configured M4F for remoteproc mode
> > [   10.793640] remoteproc remoteproc0: 5000000.m4fss is available
> > [   10.856735] remoteproc remoteproc0: powering up 5000000.m4fss
> > [   10.895961] remoteproc remoteproc0: Booting fw image am62-mcu-m4f0_0-fw, size 451080
> > [   11.000752] rproc-virtio rproc-virtio.4.auto: assigned reserved memory node m4f-dma-memory@9cb00000
> > [   11.101614] rproc-virtio rproc-virtio.4.auto: registered virtio0 (type 7)
> > [   11.151665] remoteproc remoteproc0: remote processor 5000000.m4fss is now up
> > [   12.123724] remoteproc remoteproc1: 30074000.pru is available
> > [   12.171118] remoteproc remoteproc2: 30078000.pru is available
> > [   12.337287] remoteproc remoteproc0: vring0: va 00000000cabe42be qsz 256 notifyid 0
> > [   12.337337] remoteproc remoteproc0: vring1: va 00000000a651968a qsz 256 notifyid 1
> > [   12.348543] remoteproc remoteproc0: kicking vq index: 0
> > [   12.348559] hfranco: sending msg 0x0, name mbox-m4-0
> > [ 2514.508396] remoteproc remoteproc0: stopped remote processor 5000000.m4fss
> > [ 2518.010399] omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
> > [ 2518.010433] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> > [ 2518.010461] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
> > 
> > In this case, I was wondering if we should drop the messages for now,
> > until we have the routine to save the messages first. Any suggestion you
> > might have?
> > 
> > Thanks for the help,
> > Hiago.
> > 
