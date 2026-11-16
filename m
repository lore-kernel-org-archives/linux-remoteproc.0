Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824614;
	b=l3Bm72CN/fk4NdoGbO5CwnaJ5FsBSTCx/s4IIjp0xw3Ph5OOEjn1qw1BfC9rME7i2eu0
	 pd0eYU5YEGCenyxxO4Q0ZIIlLDcKt1YjYbSEHo+J/zJEPnzoI9mcbj5wv+lMVlkblLSW1
	 QuYoCSbXOxaHuw9WpDGbGDOfCtaf5lsVq4LnaVCeRRp9PnGNm4hrKd5k9CS08GP4rUOc1
	 m4rX71sa5uGu7itwZfggjfV1Eil9J05U2tXLs0JWk2ME8DR/t4KXzxE72VJtvzqrMmoHh
	 PC8CtQRoFIxdoSzxpLVilMCqsmnovCynXtDUE/Ddz9dj2u+gnXEd04qpx844Z2/dCfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824614;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=;
	b=e/QaUX8dUtA6anVinO6Tv/qIvNTp74W+jI6UuNEI/b3fCrbCXOOqzeITxdQWLsjqpj9h
	 PzORuEzKTYHvSEezcVCcdGn+MUiOTH/iQBsh72qAt22Pws6MN0QwPkOD7VvtoisGsla9o
	 7pKelyPuL3xQWjaHS2snknA9kEjbMtuim0TF3vk7jCeCxRqic1DV94zM16UT2UJLCGl1K
	 i7wSfeUyf7l+w4Z2EWWNHGz/RBwWqmoYmGJK2eGnHgpRSU12tg2to9vM/MCUY14Q++sfa
	 uv8NkCOoyJDlSrALSjGaXIDs7rHpEBlUvuLlYwVYuaryEy8DY2stsz7iY1Du/SnycZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y3ECxk1X;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lh87NrjJ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6E606A331
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 10:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF6E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y3ECxk1X;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lh87NrjJ
Date: Mon, 16 Nov 2026 11:23:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794824612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=;
	b=Y3ECxk1X0lq2PhiIOrgb5SeiDxNyMSKFDPbrm8MoNGCUez1qQcDXzbQAEz2yIS6+Ds7/MU
	flFSYoRRn4Puqvjvy8Cpu/4dQxUpvhbJESOfOGI1wAio/Fg2OFoA//DFq9cC/p0jU5e+dA
	jSIgizVmlEqlL2Qg1nuz2JnwWEnN2dvU3MNn835XSqtnH4ZZK+nw8Qzd93kHY8NfF6ljQy
	ztD2NCb0DA/UQYzuNqKMOahr4R1PsataEYElrS6YnIh1N9HF98khKkCwA4ksycZpT53j6X
	TtkS8uxkkTymJn+Us4IOh6g/0DjEotAezGczG4MbngbMoe96+Z6BsqJfSctLUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794824612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=;
	b=lh87NrjJ//Joe7OcB/t175TNDdjSwJpL1xTn7bJKTPko0Wc/RduqOIc/UERvkPBE4kH06f
	vw+qaamOybnJI/Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid
 kworker in imx's remoteproc
Message-ID: <20261116102331.K8Sc86V9@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <avrLnVFtgobyTwN1@francesco-nb>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avrLnVFtgobyTwN1@francesco-nb>

On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
> Hello Sebastian, Peng
Hi,

> Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
> and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
> still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
> MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
> 
> 5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
> to 60k+ on v7.3/v7.4.
> 
> Peng: any idea/suggestion? Does it makes any sense to you?

Can you pin point it to a patch in this series? My guess is that
something with the masking/ unmasking went wrong. The increase might be
result of the interrupt keeping firing while the threaded interrupt did
not have a chance to run.

> Francesco

Sebastian
