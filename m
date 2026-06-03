Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCD47ECD6;
	Wed,  3 Jun 2026 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491921; cv=none; b=jqoyY/zmSLVnfPnk/nN8C1fmRYHXDTBBkrHdGH21Fh+W6ZAU40AX+Re7uxcLlpzZDb1M+NS0z/QgL3Q8rJmeRLPy/gUZ65E7QnlV2JldvbnNHqZlEIMLGqgwSqsDUaBLtIRUuTdy7JRj0q+IwR6QHSwRHUZfBjfKMqQBNalPWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491921; c=relaxed/simple;
	bh=9781m2SRvcy8SOxRyiapvUmNbJ+u0Wv9g7arYOLMgHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I45CZ+5yxaJKB1fm3kCldrV8ugENTUaKUgN88Z6qjTT43lzHkSyiwxfEb8YZyb9UTGwg7Hbbcd7ta/SSrPRDK4W7gIvYVrQ2Bnp+ZSPMz9rmvcvtQ4nqkjKTME0Fzgbw0QrhB7AxCmQ/FPj61cOyLJ0gTuZMqoCYTuCCZd+5rQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bLhZV4+3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BpOQHe6v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bLhZV4+3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BpOQHe6v"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smnfHwXHRkzzEhvhUiFBh6IWlVN4loP6QRpo40MdtYc=;
	b=bLhZV4+3rA+M0tfAjH7IrUXHcPwutz6J7D+nezxX/fvNCqdClJab2N0xH/0sWk5pv8GrUL
	vX1DE5lsM3MKOjG7lTFUAmaX9jEB2dsNIRh6T+j9fk+xciJCM/qRIJLqCF8MJ99WMR/cAr
	0TdGSyCa3KpJ3lLNAsSxiEUNKdKZImSf7Y4O21sWrOMO1MKUrMXA+Lbgv/uPinCZ3uMezD
	qjkSJCLuYCzIud3kJaVwKFVrmeJwxKJYskJTP/PxF2WAq01Mj1kKhk7pekuR295WkxS8Hy
	gjX+zZzF0hOyGqi0WS4pQQuGXwmIrW9NStKKTfaRqAING47nYm5a2REe7Ju1FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smnfHwXHRkzzEhvhUiFBh6IWlVN4loP6QRpo40MdtYc=;
	b=BpOQHe6vRJ0U5f1cJNCncBj0jhdla7xnn9+jXYzroPsWQ06vioMEQ0jIU9JPz8q0IkVdGT
	M/s8xbavRtIh4dAw==
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 0/9] mailbox: imx: Use threaded handler to avoid kworker in imx's remoteproc
Date: Wed,  3 Jun 2026 15:05:03 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78
Content-Transfer-Encoding: quoted-printable

The imx's remoteproc driver uses a kworker from its mailbox callback to
complete the request. The reason is that the imx mailbox driver invokes
the callback from its interrupt handler and the remoteproc callback (at
least the rpmsg-tty) requires a preemptible context.

This works but is problematic in a PREEMPT_RT environment where the
latency of the invocation is important. By scheduling a kworker the
high task priority from the threaded handler is lost and the kworker
competes for CPU ressources with every SCHED_OTHER task in the system.
This can lead to long delays on a busy system with other RT threads
which are less important than the completion of this request.

Looking over other mailbox driver, like the arm_mhu for instance, they
use a threaded interrupt handler to invoke the callback. This avoids the
kworker detour.

The here suggested change utilises a threaded interrupt to invoke the
callback. The primary handler mask the interrupt source so that the
handler can run without getting interrupted by the interrupt again.
Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
shared-interrupt environment the other interrupt can still fire while
the first is masked.

The first four patches are result of the sashiko review. Does not look
critical.

This change was tested on a im93 board with rpmsg-tty driver.

v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8ffc=
36e11e5@linutronix.de
  - Using correct register to enable RXDB event.
  - Update commit description for the "threaded interrupt", "unmasks the
    interrupt" =3D> "masks the interrupt event".
  - Add a shutdown field so that the interrupt does not unmask the
    interrupt if it has been already disabled because the channel is
    about to be shutdown.  A possible race mentioned by sashiko.
  - Use devm_pm_runtime_enable(). This should avoid a possible race
    sashiko mentioned.
  - Use devm_of_platform_populate().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Sebastian Andrzej Siewior (9):
      mailbox: imx: Add a channel shutdown field
      mailbox: imx: Use devm_pm_runtime_enable()
      mailbox: imx: use devm_of_platform_populate()
      mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx=
()
      mailbox: imx: Start splitting the IRQ handler in primary and threaded=
 handler
      mailbox: imx: Move the RX part of the mailbox into the threaded handl=
er
      mailbox: imx: Move the RXDB part of the mailbox into the threaded han=
dler
      mailbox: imx: Don't force-thread the primary handler
      remoteproc: imx_rproc: Invoke the callback directly

 drivers/mailbox/imx-mailbox.c  | 133 ++++++++++++++++++++++++++++++-------=
----
 drivers/remoteproc/imx_rproc.c |  33 +---------
 2 files changed, 100 insertions(+), 66 deletions(-)
---
base-commit: 3bc831df9ee16fceee851872315161377ca1417d
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78

Best regards,
--=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

