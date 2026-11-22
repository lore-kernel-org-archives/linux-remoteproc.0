Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385922;
	b=aoULaBn7vLJur8aFzNrG7xMkJZjBM5TEDf/ktD/pG1+z0uqGyu5SI7Df36bRFrxlW1Hb
	 PQcxRuH4Hvy/6viKMvsM+juLBXLV0nNPO2zKYFf/VcwxA0N4MOCLk4gw39rmz697VFLpc
	 DYRflHR+Eo36lFIcirwkvctdBnsU9jy8aLV9SUAwTq/7AJT2XJLz54CIuAag+9u2rRPfY
	 74dE3EJX9oinvEp4FWiUPSOEfg5zEwgTgJW6H5ALWWkNe5eupFCNg/yHGXR7y+it/Mus0
	 XVfwVaCneNby/CPy5+Vv7xPOXZAplcZmCafLyU97d5Q6hjTHUZuz1bPpsT/ax2raKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385922;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=k5LjoGaNZQ67mdl0htfbMa2Xp93tcUEF/ZOF14J2AHE=;
	b=5PFR2Jt2waaQVt4anwmm5siLlqe+/DpPMXfI6G/1QS5tk0J0CsAVDO4oHKQ7uDB9sz+x
	 41PlurUp2Uw0btEI+SXt+fNga10xmksNAWRDep51aTU8KUERnnIh8dovgvKimBr5pYAFq
	 9/cvcsrl70Nqcwm7cglfbLwqKWAuAsjy/7ksYavSKI4s46nphky7TdUL1yVWjDAuPAUxu
	 26Y96hBJA8Z+vktQ336Vb5s6oLkgUkYd7rjwK/5LedaDWmo54DZapKsbB5roFKCqiDDL9
	 eRgaR7hd9XhnGYAIu+375auzr+ifCkPTGUMAu79F0mjzLY23aJvT78tiGhobn2cmbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=kp8FJCxX;
	arc=none smtp.remote-ip=198.54.127.87
Received: from out-zbxj-a87.jellyfish.systems (out-zbxj-a87.jellyfish.systems [198.54.127.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5C606A32A
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=kp8FJCxX
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jXk3v64ysz2x9G;
	Sun, 22 Nov 2026 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795385904;
	bh=k5LjoGaNZQ67mdl0htfbMa2Xp93tcUEF/ZOF14J2AHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kp8FJCxXmz1yoFCDsNPizvZK9OvcBZfWo1xz7Ru4ipuRaPT8ErsHbXIrelfytJc/C
	 akn5uCr9DHkF2IWJN8WZg132oslL8W88CwG+5bpDKNBg7/EVBUUh4HdHeUs4uVtbMe
	 ub1ZZQqJ7bUtpSjOuE/mDWo/KdI8ohClIrz5dWp5G4e03L+J0hCCTqqBYaKB4bc1jf
	 A+f75w4zbST0Dll3ZxQAsc6HLpdsZpSgAHSMBTaeus4k79rDdbIpG9oTkjEMMZ0va9
	 sfLTm7KRo8GxdG0tSR+xu6I2U4dC/Ne81ukDLO5UL8hMizF3UYPO/hpTWpV2luoYS1
	 tR5LY1rcaLnpg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Valla <francesco@valla.it>,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v3 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Mon, 23 Nov 2026 01:17:53 +0300
Message-ID: <20261122221755.88160-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122221755.88160-1-dev@chrispinetinega.com>
References: <20261122221755.88160-1-dev@chrispinetinega.com>
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

A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
but k3_rproc_mbox_callback() only logs it. The remoteproc core never
learns of the crash, so its recovery never runs, the crash is not
counted, and the core stays halted with every rpmsg channel to it dead.

Call rproc_report_crash(), which may be called from atomic context, when
the core is RPROC_RUNNING, that is when Linux booted it. The core then
moves to RPROC_CRASHED and the crash is counted. Where the driver leaves
recovery enabled, recovery stops the core and boots it again. Where
recovery is disabled, the core can still be stopped and started again
through sysfs.

In any other state, keep only logging the crash:

- An IPC-only core, RPROC_DETACHED or RPROC_ATTACHED, was not booted
  by Linux. Once marked crashed, rproc_detach() refuses it, and the
  drivers' remove paths skip the detach and leak its resources. The R5F
  has no start or stop ops in this mode at all.
- Each K3 driver requests its mailbox before devm_rproc_add(). A crash
  queued then would not be cancelled if probe failed, and the work
  would run on a freed rproc. The state is never RPROC_RUNNING there.

Recovery on its own cannot yet restart an R5F: the reset the R5F needs
before it starts again is applied in its unprepare() op, which sysfs
stop calls and recovery does not. The R5F driver keeps recovery
disabled, so this does not change what happens there.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v3:
- Guard rproc_report_crash() with rproc->state == RPROC_RUNNING and keep
  the dev_err() print in other states, so IPC-only cores do not lose
  detach and a crash queued before devm_rproc_add() cannot run after a
  failed probe. (Sashiko review, pointed out by Francesco)

Changes in v2:
- Drop the dev_err(). rproc_report_crash() already logs the crash
  and names the core. (Francesco)
- Say in the commit message that recovery cannot yet restart an R5F.
  (Francesco)

 drivers/remoteproc/ti_k3_common.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4b6da3363..29ca51861 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -61,10 +61,16 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 	switch (msg) {
 	case RP_MBOX_CRASH:
 		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
+		 * Report only a crash of a core that Linux booted. Once the
+		 * remoteproc core marks an IPC-only core crashed, it can no
+		 * longer detach from it. The state is never RPROC_RUNNING
+		 * before devm_rproc_add(), so a failed probe cannot leave
+		 * crash work queued.
 		 */
-		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
+		if (rproc->state == RPROC_RUNNING)
+			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		else
+			dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", rproc->name);
-- 
2.53.0

