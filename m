Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098624;
	b=ww367unVGQ60WOa2oh+W8bvhOiak87GosZ7IuZw2mJIQw/U7qGYpAw73LRMt2ZgMchnR
	 oJTFW6OsoQpwQiO1OHSF3lEPf78e1uG4m1SHCdOmO8M5hI9hRR0YzQVrNA2fvT8U1w7rb
	 5jc5dlfXjujrJ9qVFZOzWQVv8acJHC0RomGlxJvq6h+tp5f9a66V85ShUU2ZxWG6WE841
	 uZY4ZxHWQpGNIdLQriVK7lwa9RUcdlCDNDpgtQxe16F1jVIvJ2paGvCZP/PQfTX3Zo/GM
	 RtAxD/iVeWkEYOX00T+yT67X+u3UXf07zikNzn+4SEhX+R5w0A4n0IyppurinhQnDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098624;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FEcK1VASWBIoUCoyKyCFXja3r1A/FxKQfO0b3GK01/Q=;
	b=pGgi3xbBPIQr18+gvj0wS0i32FXQT16tThokvz2qZihVdm9WoUu5BFxxc3o9Dv40d9Vl
	 wUCxtCuA/Digo/0u9o+GbZj0uEmWy9qKgA1Vh1pcRiRRucM0QgVOVvhNntdcNfvZNcKLZ
	 UOSnYbae5PS2yP6e2Cvwxwa3mGsHwKy7omRpuPycvLvetyhu595kctiy2v+IXwp2g6/kG
	 DLkV3p+dyQQfBzcExSCdt3b+YqAcBKaaryl5XY5fuGhJmIN2IkuVb3vvk27aDhI2amKoW
	 QLyopdBes939vzsI/YS1dmpGuqPp3b9n+C8FJO8RtOW11Z+7xgakNXw6hcZxoK3Phnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MCO2f6aQ;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF7606A330
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 14:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AF7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MCO2f6aQ
X-Envelope-To: linux-remoteproc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FFz3gGYp69FcAIj4l0Zmahf+dyqjlU9rmv2m5wrHIas=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795098621; v=1; x=1795703421;
 b=MCO2f6aQ7MENRTRxOZSuXhCIHs0kP4m/P2pSRGN0KQ5QH5QW9nTGPRbKwmFOQM7R2mVxlLHu
 1+NV82S/YGKgNpIXHn8kOlbhKVQKPBcpnZ1/0San3lfWbHiPdY5TVoRBf6wcw3h1yFF9hIA8WX5
 V4Wjn83e6XhdRbq82s+Jk5/Q=
X-Envelope-To: linux-remoteproc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 650b3532e440f0d6;
	Thu, 19 Nov 2026 14:30:20 +0000
X-Mizu-Trace-ID: 650b3532e440f0d6
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 22:30:06 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
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
Message-ID: <av8H7l6C8fmiHdbV@fedora>
References: <av6Wc+kHFKqwFHAR@shlinux89>
 <20261116102331.K8Sc86V9@linutronix.de>
 <20261119114041.GA166708@francesco-nb>
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
In-Reply-To: <20261119114041.GA166708@francesco-nb>

On Thu, Nov 19, 2026 at 12:40:41PM +0100, Francesco Dolcini wrote:
>Hello Peng, Sebastian
>
>On Mon, Nov 16, 2026 at 11:23:31AM +0100, Sebastian Andrzej Siewior wrote:
>> On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
>> > Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
>> > and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
>> > still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
>> > MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
>> > 
>> > 5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
>> > to 60k+ on v7.3/v7.4.
>> > 
>> > Peng: any idea/suggestion? Does it makes any sense to you?
>> 
>> Can you pin point it to a patch in this series? My guess is that
>> something with the masking/ unmasking went wrong. The increase might be
>> result of the interrupt keeping firing while the threaded interrupt did
>> not have a chance to run.
>
>Reverting 36cac4b5101f, 3225a745f517, e55bea377d49 and 692e1bc96a5d
>restores 149 MB/s with schedutil.
>
>
>On Thu, Nov 19, 2026 at 02:25:55PM +0800, Peng Fan wrote:
>> On Mon, Nov 16, 2026 at 10:23:41AM +0100, Francesco Dolcini wrote:
>> >Peng: any idea/suggestion? Does it makes any sense to you?
>> 
>> Please help test whether this helps:
>> 
>> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>> index 683ccea6f2ba..e29044cf4b92 100644
>> --- a/drivers/mailbox/imx-mailbox.c
>> +++ b/drivers/mailbox/imx-mailbox.c
>> @@ -635,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
>>  {
>>         struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>>         struct imx_mu_con_priv *cp = chan->con_priv;
>> -       unsigned long irq_flag = IRQF_NO_THREAD;
>> +       unsigned long irq_flag = IRQF_NO_THREAD | IRQF_ONESHOT;
>>         int ret;
>> 
>>         pm_runtime_get_sync(priv->dev);
>
>It does not help.
>	
>The analysis below was done with Claude help, on measurements I took on a
>Colibri iMX8QXP. I hope you can pick it up from there, this is not my
>area of expertise, and the best I can do is to send a revert for those 4
>commits.
>
>Every SCU RPC now wakes the SCHED_FIFO irq thread (TX done and RX), and
>while an RT task is runnable schedutil requests the maximum CPU frequency.
>The A35 clock is CLK_GET_RATE_NOCACHE, so each frequency change is
>followed by an SCU RPC reading the rate back, which wakes the irq thread
>again. The loop never settles, even when idle, and the transitions (ATF +
>SCU) are what costs the eMMC throughput (and I assume there is more
>impact on performance than just this).

Not sure whether this is root cause, per my understanding, cpu freq update
is not that high frequency call.

Let me setup a i.MX8QXP board and see what's going on there. BTW, i.MX8QM should
also have same issue, but seems not impact in your report, a bit werid,
might be because i.MX8QM has more cores :)

Have you tried pin your emmc test thread to core3, or core2, just not core0.

Regards
Peng

>
>v7.4-rc3, 4 CPUs, idle irq/cpufreq transitions per 10s, hdparm --direct -t:
>
>                               irq    trans  schedutil  performance
>  v6.18                          -      -    149.7 MB/s     -
>  v7.4-rc3                   16203  10800    113 MB/s   150 MB/s
>  v7.4-rc3 + IRQF_ONESHOT     7832   7813    113 MB/s   150 MB/s
>  v7.4-rc3 + revert 4 commits   60     36    149 MB/s   150 MB/s
>
>The 4 commits are 36cac4b5101f, 3225a745f517, e55bea377d49 and
>692e1bc96a5d; reverting only the RX part (e55bea377d49) is not enough.
>
>
>#regzbot introduced: 692e1bc96a5d^..36cac4b5101f
>#regzbot title: mailbox: imx: threaded IRQ handling causes a cpufreq transition storm on SCU-based i.MX8
>
>Thanks,
>Francesco
>
>
