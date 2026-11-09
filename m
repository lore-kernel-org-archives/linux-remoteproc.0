Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794268569;
	b=QisRPq6FjLD/+yJ6ztLTkjP9Lh4WdbZhKPrY9VNrxanuC6f8Jg2QXpTXT+gWDsFrT6mS
	 isM07KdeIRC+7/ZHN4q7StTYApeD1gHVZxZDo4FnrfWvETf0f8tVf8s4gAVCSr604jeWW
	 Wbmn8Pn6hFdO2WTGpyVlqPtkNoHA2DPQnvvefnEsERPv5X3sHXgYGNIBY0jcOC8LvPn2f
	 MJQbpFwpEbO2HtF24a6+geUKlPy6cLXuYuPQOP+/itrRqEk4jk4azDsmntMCvdTdTFQPv
	 9meAs41xPsHWzWHpnfrWIjHZjQFJPsWC2g0x1twNbcjFaxEX4cyDl1rv3pPPBet89ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268569;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=gim1oJ1ePxJ3vdOAQtzwVGI11fG5kPHKo/ag868og+g=;
	b=Bv8SU4poQwlLfaiojh1YIvRycM68x2udP4sr4z4W1qGyYpe5xzVJwLj0Qyl8TQ1NKvtG
	 0x9ZIAIrs/07LAzKXAuA+BswcsSpvdip+5JJBiIPaDZGE9IzHmZcfLW9WrcFHd2mt1f06
	 Ec3EkYm8xiTfRgSbL8ls0Pg9HzSRcqZ2xmJj8EY4TR4nT6d9n16VAB2bBLHaL12V+ebi1
	 MwuwpTjFtmIfBBviu4jwydqYyrVGTlqFxZmbRZem0XAsQ8RYB775pfSREPP6+FhBxPvxp
	 iEoTuf+rmWLQKEcDLZjnTP/TJjSMU9KSieChcfemzO6sjGijtwyTDuSxnXMYP6t+c5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=u5LL0pzT;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=qfqHeVMr;
	arc=fail smtp.remote-ip=185.56.87.7
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99E606A321;
	Mon,  9 Nov 2026 23:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F99E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=u5LL0pzT;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=qfqHeVMr
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794268568;
	 b=HSNWi6VJ4aZB0LkLnCkwf8U3TjIXEOg/+fwnflAdCWXWAwoLYLr1RWtCQKBUAwQHzH0Lqkl1Og
	  dbx9SqXVwpTiW8W7YnhJ0MokNwqNZiHKjbHwikJo5Aoy/T3qOK3SgfvW26wdFvbRMkbgzC6soN
	  2ZPAP7QsDJ7GaN0zuhCMxYOWSLO/si+OlDFIv/3KB2AW8FZ1RdtDqTdofWX22UKzFTrDsg9t28
	  etltaDh8YfRJFmv5lp7ua97xRXobFRZOK6/RiP3FzlvAJb/axDq9gXzk2RsoeOm2Oqohn9FVL+
	  1Nt+OcDVJgb+J3BkB67hQDmj0qYD2s9QyJBpnOLnmsT5PA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794268568;
	bh=AaYmPzMt1Zbav8ZLszRreNvHb9kTClH06Tlsv278sHA=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=kBN44PLjK1Lg/B8zetsmkOqWzrWEXjbT4HLMLHcKKXmyjCBFfFdu2JBsmZZcZ2JHUXK7Gq67At
	  t9YFtyjA9zqIBFfooOFhsvR0DMhk4cWuIGbS6t0YSrlA/4RoQ375EztaDsO+EhqPTrfRvLtZ/W
	  wbUmFdm+hO1t5ORHYtNcAZJRdvuuURrlWUTjCQ9ORu5dkzVsytG9d/Zy+oVVRLfAqbKKsPLRxr
	  Qrgvqgl4ifJ0ledAMWTwHp6p36qrs7/lFCzJ/7lP1mE5WhkjH/oen9aSPfiZWg4iYQpKktO0Zg
	  x9EFNekfyaBtdcxV+44XVCrBwgLe8y/zBpudZ9ptZnM/Sg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=gim1oJ1ePxJ3vdOAQtzwVGI11fG5kPHKo/ag868og+g=; b=u5LL0pzTKIBaHpr9h0u93PAbmu
	ukOQxw10n6GAiTBIZ9vnlAriJm4dnp6TOV/tbjampFxCCAgocdtuuRzLMr/y4sjlG3g8cDNsfVJlW
	GWQ6IDzONnj7Z7ncvvACuJz/UIzeZENFkJ8+0LsWNZXwXwXi3UhRTJ9h4Ip2/tx71neE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQZDU-0000000EVdT-18EL;
	Mon, 09 Nov 2026 23:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=gim1oJ1ePxJ3vdOAQtzwVGI11fG5kPHKo/ag868og+g=; b=qfqHeVMrTEDdGbC4Ue/pfvGTKJ
	dakYiQWrmooe//kH6lzJdjvZDm0X+tpgeGpI8P5YjfVkC+bJtSKvXB5kAs7bZeFPIGRGPgSEyi86s
	6w1QIVme1fFgL+O/0wG8A3tV0adEungI8lXEdRfqOVzvoyRDdq2hLd7y38kESa7AG+BI=;
Received: from [79.17.15.196] (port=60430 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQZDP-000000005KN-2cLq;
	Mon, 09 Nov 2026 23:55:55 +0000
Date: Tue, 10 Nov 2026 00:55:54 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
Message-ID: <avJbc4Aebflkjgap@bywater>
References: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
 <20261109160431.720498-1-dev@chrispinetinega.com>
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
In-Reply-To: <20261109160431.720498-1-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 70194f2650fe92e883fe30848340172b
X-AntiAbuse: ID - 70194f2650fe92e883fe30848340172b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQZDU-0000000EVdT-18EL-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Chrispine,

On Mon, Nov 09, 2026 at 07:04:30PM +0300, Chrispine Tinega wrote:
> Hi Francesco,
> 
> On Mon, 9 Nov 2026, Francesco Valla wrote:
> > If you share details on the Zephyr side of things, I can test this
> > against rproc-next on a AM67A (BeagleY-AI).
> 
> Thank you, that would help. The AM67A has no M4F, so patch 2 does not
> apply there. Patch 1 does: the R5F driver uses the same mailbox
> callback, and it keeps recovery disabled. So on the main R5F I would
> expect this:
> 
> - Without the series, the crash is only logged, and the core stays in
>   "running" until the next boot.
> - With the series, the core moves to "crashed", the crash is counted,
>   and it can be stopped and started again through sysfs.
> 
> The Zephyr side is upstream's openamp_rsc_table sample with one file
> added. The handler sends RP_MBOX_CRASH over the mailbox before it
> halts, and a thread forces a fault 20 s after boot. This builds on
> Zephyr v4.5.0 for beagley_ai/j722s/main_r5f0_0, but I have not run it
> on that board.

I did run it on the "MCU" R5F, and I think I found a bug... in the Zephyr
ti_dmtimer code! With that fixed, the functionality seems to be working
as expected, but I'll stress it a bit before declaring a Tested-by.

> 
> Copy samples/subsys/ipc/openamp_rsc_table, add src/crash.c below, and
> list it in CMakeLists.txt:
> 
>   target_sources(app PRIVATE src/main_remote.c src/crash.c)
> 
> Build it:
> 
>   west build -b beagley_ai/j722s/main_r5f0_0 path/to/the/copy
> 
> Load build/zephyr/zephyr_openamp_rsc_table.elf as the main R5F's
> firmware. After 20 s, check the state:
> 
>   cat /sys/class/remoteproc/remoteprocN/state
>   dmesg | grep -i crash
> 
> To bring the core back:
> 
>   echo stop > /sys/class/remoteproc/remoteprocN/state
>   echo start > /sys/class/remoteproc/remoteprocN/state
> 
> It will crash again 20 s after each start. That is a quick way to check
> that a second crash is handled as well.
> 
> --- src/crash.c ---
> /*
>  * Report a fatal error to Linux as RP_MBOX_CRASH, then force one.
>  */
> #include <zephyr/kernel.h>
> #include <zephyr/drivers/ipm.h>
> #include <zephyr/fatal.h>
> #include <zephyr/logging/log_ctrl.h>
> 
> #define RP_MBOX_CRASH 0xFFFFFF02U
> #define CRASH_AFTER_S 20
> 
> static const struct device *const crash_ipm =
> 	DEVICE_DT_GET(DT_CHOSEN(zephyr_ipc));
> 
> void k_sys_fatal_error_handler(unsigned int reason,
> 			       const struct arch_esf *esf)
> {
> 	uint32_t crash = RP_MBOX_CRASH;
> 
> 	ARG_UNUSED(reason);
> 	ARG_UNUSED(esf);
> 
> 	LOG_PANIC();
> 	/* The FIFO can be briefly full of vring kicks. */
> 	for (int i = 0; i < 100; i++) {
> 		if (ipm_send(crash_ipm, 0, 0, &crash, sizeof(crash)) != -EBUSY)
> 			break;
> 		k_busy_wait(100);
> 	}
> 	(void)arch_irq_lock();
> 	for (;;)
> 		arch_cpu_idle();
> }
> 
> static void crash_thread(void *a, void *b, void *c)
> {
> 	k_sleep(K_SECONDS(CRASH_AFTER_S));
> 	k_oops();
> }
> 
> K_THREAD_DEFINE(crash_tid, 1024, crash_thread, NULL, NULL, NULL,
> 		K_PRIO_PREEMPT(10), 0, 0);
> --- end ---
> 
> Regards,
> Chrispine
> 

Regards,
Francesco

