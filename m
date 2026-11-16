Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854525;
	b=KusfV0ovrPJ++Wa2uQbMlvTpUtA315bgu3y6xJLFSaspj8/6TWj7f6F9QOWMqZQhfOCA
	 4qa/v+F1+apb/7KdGaQNY4z7+oO7cZBUC+fbXg1wsJ48Y2JKlS/UBQsRQ0FrOxXK4GQNj
	 M/OgEglsgk7Bap6RqVevMX0adqEEwNjCg89zCx62+U4KI8nzLoimKzhRqenFRtwSto1Rk
	 mtAasuTsrLSDmzYwViS5bAXJQ4xFpFCsEyon31VuNUGrjglX1MJazptRB2iNbBmSDPnP0
	 5hqnGbW9XUyELnuAzD281s9GSXh5WuGHZrR4D4tOLb25Gb8qbMuIsEiCzjPTmRBADLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854525;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=q0InDNKnpgiQTfM6ZmzG57ILR9PKesybT9FFdKyUp84=;
	b=hlB0aqf1QklZYVCZcHkIIhLTEA3griDP9F16SaNxGcNe9VjdykbihcfG4jFbnyuzPLFG
	 EUxZ9YS0bUtBf7e+pBihib3jreUq6ZyM/E6x/ND+VUgb+KiBuvv7YHzVahIPJqA5RjzJf
	 hrr3GMZHqWYUpOyvivr1NqMtuqA6K7sYl1gBjH5yfe5Q6532YKi44pioNJHNARc9tCSik
	 3rNCJgoIHMwPunZnzrz2EO3GnnhzdxccNdP0tl08fh3cVwoHKEEUV6dAAAneEQ+shIRNY
	 ZZm+wTJVoaoODEU2IT08iwKIa5eDomlqYNyiiR8CYl1H6AcSWbXF6FHcY4Ycm1W8+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=SJCYkk8T;
	arc=none smtp.remote-ip=104.207.68.34
Received: from out-93wp-a34.jellyfish.systems (out-93wp-a34.jellyfish.systems [104.207.68.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AD606A322
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0AD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=SJCYkk8T
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxY415DFz2x9J;
	Mon, 16 Nov 2026 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854522;
	bh=q0InDNKnpgiQTfM6ZmzG57ILR9PKesybT9FFdKyUp84=;
	h=From:To:Cc:Subject:Date:From;
	b=SJCYkk8T9Qk9hYwS+JkMQ3Rt2BzerwbKv6trhmzmrJZliN6ZBL4XOw8bEPZbpPBBx
	 pLf9K86XXRo+QALjVKe+hhyy5iQRnTPH5KgLDxAU++FN4rz03x6n08tEsT0yq/Wxnl
	 hHGU5xGMX4KoVV7VLr5UGQ8iFe0DXe/N1rSyCEEw3+2k5R8VDBBWaKToPYddpQVRO2
	 5zSuEkcy98vNYNedgsuYFyjVzMaiyG/TPBnS9R+yQOvoWD27e9ggKtmSw/zl7ZkETF
	 iJu2sM45KRFN33j0N3mi7mro5kDFfh2XezX81CTBAuJrm9spUPlrnpxXI68iepw2nK
	 WQVs4mmIYqhNA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	francesco@valla.it,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 0/2] remoteproc: k3: Recover a crashed remote core
Date: Mon, 16 Nov 2026 21:41:43 +0300
Message-ID: <20261116184146.1897281-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
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

A K3 remote core can tell Linux it has crashed by sending RP_MBOX_CRASH,
but the K3 drivers only log it. Nothing reaches the remoteproc core, so
the crash is not counted and recovery never runs. The core stays halted
until the next boot, with its rpmsg channels dead.

Patch 1 reports the crash with rproc_report_crash(). This applies to
every K3 remote that uses the common mailbox callback.

Patch 2 enables recovery on the M4F when Linux booted it. Its stop is a
plain reset, so recovery does not need the crashed core to answer. In
IPC-only mode recovery stays disabled, because it would boot the
firmware Linux has, which need not be the one started before Linux.
The R5F and DSP drivers keep recovery disabled. A crashed core there
moves to RPROC_CRASHED, and can be stopped and started again through
sysfs. On the R5F, recovery itself would not restart the core yet: the
reset it needs is applied in unprepare(), which recovery does not call.

Tested on an AM625 board (BLIIoT BL350) running TI's 6.12 kernel with
the equivalent change. The M4F runs Zephyr, whose fatal-error handler
sends RP_MBOX_CRASH. After a forced fault, recovery reset and rebooted
the M4F in 71 ms, and Linux kept running. Mainline's M4F stop is the
same plain reset that this test used for a crashed core. The Zephyr
side is https://github.com/zephyrproject-rtos/zephyr/pull/125770.

Changes in v2:
- Patch 1: drop the duplicate crash print, and note the R5F limit in
  the commit message. (Francesco)
- Patch 2: keep recovery disabled in IPC-only mode. (Francesco)
- Rebased onto rproc-next.

v1: https://lore.kernel.org/all/20261109054830.42715-1-dev@chrispinetinega.com/

Chrispine Tinega (2):
  remoteproc: k3: Report a remote crash to the remoteproc core
  remoteproc: k3-m4: Enable crash recovery for a core Linux booted

 drivers/remoteproc/ti_k3_common.c        | 6 +-----
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 6 +++++-
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 3035b6708f61259c93a368238e206dcec313e584
-- 
2.53.0

