Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385922;
	b=CLdHQnajprg9H75sRdWLRWD0yTKMKNssZ+cWoxmsuv2novJY4pJCvu5WqIWOg7G0QMUg
	 XjDnvZseiCk3+MOONdVscbXMcNqmNBS0ui5LfujcOXM6OwpPEnhWTZgghwsf9ARKp+y3L
	 EA+7VcuTwCxv9f/YEdpOriRxOyp4ThkHt25AtY9pX/HbAvtwTHgwr6I5QRKLfavtn+LQr
	 kmqlu/DLfbQQZMSHncl0SSBpvQayNxOgAnMvmcmWUFI0wAYYPjxerxAuOEwXdZtHA7J9T
	 mTGuOFnhih91BkW5iI+tTvU/SxOHaS/MQcCrE/5ZWasgxQGzc5ErJPTcmOOw4wUZyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385922;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=2K0hOPSzFGlyM04CdMKPAxpodJ/pAGufjNXPansEHxM=;
	b=sibYTZI1G9XO3mUVsOyUI9qeWfgX86CKKXP23bTaaqJcqmSUA+KP79KrToTe3KatBEdV
	 WEUrzsMk9HbkV/uu1/yQwiEDjWENsraEA5rx9qi2bzgb9bIDBDjyyggYZbd3bEHXofdZm
	 CsZ7IqhUoh3eHU+DxHUZfDh9Lhzm8isP2+UbFVZmGNxtpsFhKB/ovw8c73++nsIgIhck3
	 HJWaEknHkN57zqcJ5iN0n2z9Q11JMj/XYlVV6jnpykDXYr+/z8vNh/1cupB+iRtE1bYgp
	 5ozJmlohULYpvt3oDD0dde5fBSjKDisPa96tCCn1VAUBd1Xf723XmZFyprMP2DfIaog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=N1QzcWBm;
	arc=none smtp.remote-ip=198.54.127.131
Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E830606A320
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E830606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=N1QzcWBm
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jXk3q6Cltz2x9G;
	Sun, 22 Nov 2026 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795385899;
	bh=2K0hOPSzFGlyM04CdMKPAxpodJ/pAGufjNXPansEHxM=;
	h=From:To:Cc:Subject:Date:From;
	b=N1QzcWBmzPyWOGjluk39AQR/WEOuRkUfhZVtVspzTJhc+AjfJ5S1Mzo6mnchsEl8M
	 tyRk3CdRNYmd520eqNSYf+i0E8LhgNo9pdWoVrUwcaZUtDfFLU3tFLtVhWHb18tBpU
	 By+xMSrjz1uEURNpIP+oxZAYEIK9xQ8cE6IQzHlEN0hK5z94fN+DmPLMsJrb0kcJyh
	 EmbwRKccXZ9Z8vNI5CbFQXM79qW2wLfSAyVeCUtNSJDOPrkDgXYHKPxMo1A3tpSFHR
	 pjsvnVCAH1v9XksEEfZfRDej0ZyvSu9Mnz53Qj4IK5VEZkjRvQaE8q774CgJMcDx1Y
	 PZYJmi793DZXg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Valla <francesco@valla.it>,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v3 0/2] remoteproc: k3: Recover a crashed remote core
Date: Mon, 23 Nov 2026 01:17:52 +0300
Message-ID: <20261122221755.88160-1-dev@chrispinetinega.com>
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

Patch 1 reports the crash with rproc_report_crash() when the core is
RPROC_RUNNING, and keeps logging it otherwise. This applies to every K3
remote that uses the common mailbox callback, while leaving IPC-only
cores and the probe window untouched.

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

Changes in v3:
- Patch 1: report the crash only when rproc->state == RPROC_RUNNING, and
  keep logging it otherwise, so IPC-only cores can still detach cleanly
  and a crash queued during probe cannot outlive a failed probe.
  (Sashiko review, pointed out by Francesco)
- Patch 2: unchanged.
- Rebased onto rproc-next.

Changes in v2:
- Patch 1: drop the duplicate crash print, and note the R5F limit in
  the commit message. (Francesco)
- Patch 2: keep recovery disabled in IPC-only mode. (Francesco)
- Rebased onto rproc-next.

v2: https://lore.kernel.org/all/20261116184146.1897281-1-dev@chrispinetinega.com/
v1: https://lore.kernel.org/all/20261109054830.42715-1-dev@chrispinetinega.com/

Chrispine Tinega (2):
  remoteproc: k3: Report a remote crash to the remoteproc core
  remoteproc: k3-m4: Enable crash recovery for a core Linux booted

 drivers/remoteproc/ti_k3_common.c        | 12 +++++++++---
 drivers/remoteproc/ti_k3_m4_remoteproc.c |  6 +++++-
 2 files changed, 14 insertions(+), 4 deletions(-)


base-commit: f39ba58941efa63e6c7d10d53d183d6077524bdb
-- 
2.53.0

