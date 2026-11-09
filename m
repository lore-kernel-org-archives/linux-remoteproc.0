Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.177.127.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240307;
	b=cPGHxI4+7Gc7BKBlqSq5zfRDQuPle34LPphOLFpL3sXE+f/13JuopiGViE440Dr453yB
	 VUF2BCfbPh+z+RAHjvmosyefECAiBx+/RyDbqmaC8H/IzC43/u5ATaHiKqKI+u0sWaAdS
	 Ol0S5b1MQFuU++I9ddwFrNBnh1UX93fdZXJJcSXqMN9nNsHnZDQMyrRlcpnFl3IR9iFJL
	 ezKl1mOgm8yZw9sOPFQF9EQtFN1LF3MuXHzlodpc29CeS3WmJQ/ukMj4YKytgnwIvEM3b
	 RvjtxmMKxWxC18/18tU42+yHeBEoSlWWi127g+FT5fSeY5GR6SbEASwgvb9dTyX+9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240307;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=HMybIJ+NL5B4al0WkPk2fEXktLZGmJluZwLVZ3h+rsA=;
	b=n4T0tTroShoDJ5khMrCFRbfx+3X7qxHqlqCHdoviGerMGaA4Fyw3qukThYH6pJzvntPQ
	 u+WBdV0YZR3YGDj72zhZBWdVvac8E1nr3mgzGEWD+kK72hrjVZYNjdTMzKO3818c6bFZz
	 ZNvACdrRf2HWHUc+hDmWq7lEr7jy+fF5O9xZjDEzTLsDNWIBs2RJmBROfDFh3aPXqyijb
	 jeT25iZRDMX/ZfaFK4GRpyahPRgW3CY73hEoBqe3384nBgbuYs4auFqGuiANsD/zdHfo2
	 vJ4Tz2pMQgjs5n9VaipJIln3Z6gdyj7eE3jLeOy0NlVe4plV85GTSHDxsUtq22Ku4YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=Pyon9Ymi;
	arc=none smtp.remote-ip=198.177.127.221
Received: from out-utut-a221.jellyfish.systems (out-utut-a221.jellyfish.systems [198.177.127.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53443606EE9F
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53443606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=Pyon9Ymi
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jNZNp0PWdz8sWX;
	Mon, 09 Nov 2026 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794240285;
	bh=HMybIJ+NL5B4al0WkPk2fEXktLZGmJluZwLVZ3h+rsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pyon9YmiYOEFxzsXWAmI+PtkdwWauWMu9o1R0NCoZ/Svvvz9sI9TtJ12ammZA22N8
	 +e+2UYVyFgXTgNcaZRAggozswAF8ohtJxi3v0SXwvHUZLXH4vEydZ4q+1G91hwzh3X
	 fVC3bftvi+iYiz1TqbHGlPKgq5weC3bY6gUNgcDtNhBnyoDdv7+AdlaZWt/kaX+/US
	 nlqlITrSODOpN7EFA3Pj/o8hmGVhYVXNUkiRTEIicEHE/fL4LnPP1/agU06+Z5jvUT
	 lgtbURcVQ8eK2qh+uQOgvBXlnZphT66vxQ3LGFRzH/0JpJ4QeSDzWo0CuRfdTexd0w
	 oAwIz/B4QywQA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: Re: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
Date: Mon,  9 Nov 2026 19:04:30 +0300
Message-ID: <20261109160431.720498-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
References: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

Hi Francesco,

On Mon, 9 Nov 2026, Francesco Valla wrote:
> If you share details on the Zephyr side of things, I can test this
> against rproc-next on a AM67A (BeagleY-AI).

Thank you, that would help. The AM67A has no M4F, so patch 2 does not
apply there. Patch 1 does: the R5F driver uses the same mailbox
callback, and it keeps recovery disabled. So on the main R5F I would
expect this:

- Without the series, the crash is only logged, and the core stays in
  "running" until the next boot.
- With the series, the core moves to "crashed", the crash is counted,
  and it can be stopped and started again through sysfs.

The Zephyr side is upstream's openamp_rsc_table sample with one file
added. The handler sends RP_MBOX_CRASH over the mailbox before it
halts, and a thread forces a fault 20 s after boot. This builds on
Zephyr v4.5.0 for beagley_ai/j722s/main_r5f0_0, but I have not run it
on that board.

Copy samples/subsys/ipc/openamp_rsc_table, add src/crash.c below, and
list it in CMakeLists.txt:

  target_sources(app PRIVATE src/main_remote.c src/crash.c)

Build it:

  west build -b beagley_ai/j722s/main_r5f0_0 path/to/the/copy

Load build/zephyr/zephyr_openamp_rsc_table.elf as the main R5F's
firmware. After 20 s, check the state:

  cat /sys/class/remoteproc/remoteprocN/state
  dmesg | grep -i crash

To bring the core back:

  echo stop > /sys/class/remoteproc/remoteprocN/state
  echo start > /sys/class/remoteproc/remoteprocN/state

It will crash again 20 s after each start. That is a quick way to check
that a second crash is handled as well.

--- src/crash.c ---
/*
 * Report a fatal error to Linux as RP_MBOX_CRASH, then force one.
 */
#include <zephyr/kernel.h>
#include <zephyr/drivers/ipm.h>
#include <zephyr/fatal.h>
#include <zephyr/logging/log_ctrl.h>

#define RP_MBOX_CRASH 0xFFFFFF02U
#define CRASH_AFTER_S 20

static const struct device *const crash_ipm =
	DEVICE_DT_GET(DT_CHOSEN(zephyr_ipc));

void k_sys_fatal_error_handler(unsigned int reason,
			       const struct arch_esf *esf)
{
	uint32_t crash = RP_MBOX_CRASH;

	ARG_UNUSED(reason);
	ARG_UNUSED(esf);

	LOG_PANIC();
	/* The FIFO can be briefly full of vring kicks. */
	for (int i = 0; i < 100; i++) {
		if (ipm_send(crash_ipm, 0, 0, &crash, sizeof(crash)) != -EBUSY)
			break;
		k_busy_wait(100);
	}
	(void)arch_irq_lock();
	for (;;)
		arch_cpu_idle();
}

static void crash_thread(void *a, void *b, void *c)
{
	k_sleep(K_SECONDS(CRASH_AFTER_S));
	k_oops();
}

K_THREAD_DEFINE(crash_tid, 1024, crash_thread, NULL, NULL, NULL,
		K_PRIO_PREEMPT(10), 0, 0);
--- end ---

Regards,
Chrispine
