Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088451;
	b=iUUYoUY+Bzv1MOyr7PvPna57FQq1N4UvgcC6IHp+6XNbroHF4IlDQT+6PWFIid9AH1Fg
	 LUDTdib3EUEy3mcT7LkH12bzClwvAetJelv/QNFkkp6/ZYaE6UDl52Dba5X69lyQiUpTx
	 3DOBbgDXqogWOwEOJ0GJhLyfoWIQbVf21eVGXaVfJf6tcDkCX1wvCzzQzyeo9W6xX45i9
	 Yz1dDYR6dH/vSX4TDmnDpUqFb+JjLApG51D8FzMvo/VzfvlvRHJtZwaRIgxBE74ShBUys
	 nsOvYWyjSc2fL7IXeqR1GSNsub4V6G23SrgTBklbXO06G9ru51N8vOptw1I6cHdZhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088451;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bUsF2BFmyfh8u4YXfKRfweeg9EbYkyMl9BdaPhOcFI8=;
	b=Xs53vSxNi1VjNMh6iK++R8BKW//aXNXaVau4ygA3PM4KZHP9Q4He0bAIoDcqkeThMV0U
	 JAPbZYZd8D6fEwUUz9rK4xUP3VDs64wy7kwsdxCProTs72MZ0BCFQJWpKSwLiTcBXLmFE
	 Z5czFn2E03Oqmi+5BrT4tlWqF33LVGcYEu2XG6nc/yGIymYdmndoENT0DOpU0mwBdlnq1
	 25LnpLbTPEOBVisjv0lE4E5Tp93wVz1/i7pUhbl2U6p7PO74wvPfZ3jIImrKawgAuY0M3
	 h1jVriIKFliS/xy1HPwxCsT5BQAKg2lJyVCj1MMMqbNhdszQl2Jf7ug2sgvrKNTtKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="iSp5/LpD";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF136606A320
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF136606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=iSp5/LpD
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 83B30249CF;
	Thu, 19 Nov 2026 12:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795088446;
	bh=bUsF2BFmyfh8u4YXfKRfweeg9EbYkyMl9BdaPhOcFI8=; h=From:To:Subject;
	b=iSp5/LpDRebEE2dL1d8oR0gjk2x4hoaFOYKH5eR1fQ0XANEJWSMg713KP0F/tTkcH
	 59X2iUmbKsTrWu9aB78yyv4lens8+4d7a3BUDi69lsiC9kjhcgapB+8UJGr4C3sF1B
	 t348F4A2tuaWsF9JiNNqO4f9BDonT8YRwzl3kE9gnTtvNeJIow2ljGoscks7QeGG4d
	 Hrp/mgraJIfLF/crc/xqZT/922etN77mUXUA9ftYZbVh4JoCCAC/lcPjmIvdAQOOfY
	 5PRacq4vo16f05C6NVv3sEeuSl6dEUt50HfrrnWyDHh2t556GEGpbOgzq8hsgmo8ua
	 yjP5WVb9mhZ/Q==
Date: Thu, 19 Nov 2026 12:40:41 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@oss.nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
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
Message-ID: <20261119114041.GA166708@francesco-nb>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av6Wc+kHFKqwFHAR@shlinux89>
 <20261116102331.K8Sc86V9@linutronix.de>

Hello Peng, Sebastian

On Mon, Nov 16, 2026 at 11:23:31AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
> > Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
> > and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
> > still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
> > MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
> > 
> > 5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
> > to 60k+ on v7.3/v7.4.
> > 
> > Peng: any idea/suggestion? Does it makes any sense to you?
> 
> Can you pin point it to a patch in this series? My guess is that
> something with the masking/ unmasking went wrong. The increase might be
> result of the interrupt keeping firing while the threaded interrupt did
> not have a chance to run.

Reverting 36cac4b5101f, 3225a745f517, e55bea377d49 and 692e1bc96a5d
restores 149 MB/s with schedutil.


On Thu, Nov 19, 2026 at 02:25:55PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 10:23:41AM +0100, Francesco Dolcini wrote:
> >Peng: any idea/suggestion? Does it makes any sense to you?
> 
> Please help test whether this helps:
> 
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 683ccea6f2ba..e29044cf4b92 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -635,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
>  {
>         struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>         struct imx_mu_con_priv *cp = chan->con_priv;
> -       unsigned long irq_flag = IRQF_NO_THREAD;
> +       unsigned long irq_flag = IRQF_NO_THREAD | IRQF_ONESHOT;
>         int ret;
> 
>         pm_runtime_get_sync(priv->dev);

It does not help.
	
The analysis below was done with Claude help, on measurements I took on a
Colibri iMX8QXP. I hope you can pick it up from there, this is not my
area of expertise, and the best I can do is to send a revert for those 4
commits.

Every SCU RPC now wakes the SCHED_FIFO irq thread (TX done and RX), and
while an RT task is runnable schedutil requests the maximum CPU frequency.
The A35 clock is CLK_GET_RATE_NOCACHE, so each frequency change is
followed by an SCU RPC reading the rate back, which wakes the irq thread
again. The loop never settles, even when idle, and the transitions (ATF +
SCU) are what costs the eMMC throughput (and I assume there is more
impact on performance than just this).

v7.4-rc3, 4 CPUs, idle irq/cpufreq transitions per 10s, hdparm --direct -t:

                               irq    trans  schedutil  performance
  v6.18                          -      -    149.7 MB/s     -
  v7.4-rc3                   16203  10800    113 MB/s   150 MB/s
  v7.4-rc3 + IRQF_ONESHOT     7832   7813    113 MB/s   150 MB/s
  v7.4-rc3 + revert 4 commits   60     36    149 MB/s   150 MB/s

The 4 commits are 36cac4b5101f, 3225a745f517, e55bea377d49 and
692e1bc96a5d; reverting only the RX part (e55bea377d49) is not enough.


#regzbot introduced: 692e1bc96a5d^..36cac4b5101f
#regzbot title: mailbox: imx: threaded IRQ handling causes a cpufreq transition storm on SCU-based i.MX8

Thanks,
Francesco

