Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E683F1676
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070481; cv=none; b=qOkoN87qOC9DggQUtBMUb1YpkQJ8DEdFdeheCgnpOMAm1l2rnzNJNj28T5sRxwCmfroSvJJKEOFwCN8RZGblOz9uwBR/yrf63FTQ2BxA9Bpc8YyxJK8TlQMPdO3X6JJ9PjaL33ZS25c/JFFGjBi3btzq5YQxx4mJPekBWs6Irqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070481; c=relaxed/simple;
	bh=Vlvj9dptGi8Yd8FQGnQFcpe/MLXC7vtZfH62TXMBV5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Elprg5Rsu2jMgD1VzLsDNerVwKDWKzrmSSwHsm369yTiJ1y6hpR/C8hJqLv/CALQeVseFMpRSoqyH4BhxK0N21bMLR1deEC0JzQ/GCO5VLzoah+IwbOly7LVdusJtBfYzIB8vWDRmhMldrDOLvq6jD6Mqjbaad2dYOP7tFRYqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2FQf+zoV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8UQeTzW4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2FQf+zoV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8UQeTzW4"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T/oTAOOJ1Z4TFN7Yr5Hcs60Jolfhci9ej79a+pR3awY=;
	b=2FQf+zoVYHyZMx55iz81hh2eO+Wn32lxoHRdPcg5lmlADigZh/T0t8QZCtaN733yXqdW32
	5+5IoTjE91BPrOxXOf1Xo+q+XR/HX0fJrSnA/+ZiUeXqhu4C37L7LOBk/z2TRt+xg4N33L
	TQP7R7aWHNUpghpH8odNPUVMleswH2OR6JmrG6+ZlvX05FSXc8KjHn1revDiyv/qSWWODz
	T1rHASv3zd/3d8cNxzU9/EO5reIspIBiTxmzbUAK86395J8HaeOWAgyqQHlrgP1p76YZ47
	xfSKIuZNqn2qymVuSgL3Cb2k48MO2MEg7NvTxWm5quNwB6hj43yVN0ZptM4Adg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T/oTAOOJ1Z4TFN7Yr5Hcs60Jolfhci9ej79a+pR3awY=;
	b=8UQeTzW48huPWiCb0oKS963hXt6P4PSvE33NB5++XlRKFXUgoNFz4k3u/B8uLtXYnKxwHj
	8RtyUnWv1J8Av5CA==
To: linux-rt-devel@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
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
Subject: [PATCH 0/5] mailbox: imx: Use threaded handler to avoid kworker in  imx's remoteproc
Date: Fri, 29 May 2026 18:01:02 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78
Content-Transfer-Encoding: quoted-printable

The imx's remoteproc driver uses a kworker from its mailbox callback to=0D
complete the request. The reason is that the imx mailbox driver invokes=0D
the callback from its interrupt handler and the remoteproc callback (at=0D
least the rpmsg-tty) requires a preemptible context.=0D
=0D
This works but is problematic in a PREEMPT_RT environment where the=0D
latency of the invocation is important. By scheduling a kworker the=0D
high task priority from the threaded handler is lost and the kworker=0D
competes for CPU ressources with every SCHED_OTHER task in the system.=0D
This can lead to long delays on a busy system with other RT threads=0D
which are less important than the completion of this request.=0D
=0D
Looking over other mailbox driver, like the arm_mhu for instance, they=0D
use a threaded interrupt handler to invoke the callback. This avoids the=0D
kworker detour.=0D
=0D
The here suggested change utilises a threaded interrupt to invoke the=0D
callback. The primary handler mask the interrupt source so that the=0D
handler can run without getting interrupted by the interrupt again.=0D
Doing so avoids marking the interrupt IRQF_ONESHOT so that that in a=0D
shared-interrupt environment the other interrupt can still fire while=0D
the first one is masked.=0D
=0D
This change was tested on a im93 board with rpmsg-tty driver.=0D
=0D
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
---=0D
Sebastian Andrzej Siewior (5):=0D
      mailbox: imx: Start splitting the IRQ handler in primary and threaded=
 handler=0D
      mailbox: imx: Move the RX part of the mailbox into the threaded handl=
er=0D
      mailbox: imx: Move the RXDB part of the mailbox into the threaded han=
dler=0D
      mailbox: imx: Don't force-thread the primary handler=0D
      remoteproc: imx_rproc: Invoke the callback directly=0D
=0D
 drivers/mailbox/imx-mailbox.c  | 65 +++++++++++++++++++++++++++++++++-----=
----=0D
 drivers/remoteproc/imx_rproc.c | 33 +--------------------=0D
 2 files changed, 53 insertions(+), 45 deletions(-)=0D
---=0D
base-commit: 9e171fc1d7d7ab847a750c03571c87ac3c17bd84=0D
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78=0D
=0D
Best regards,=0D
-- =0D
Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
=0D
