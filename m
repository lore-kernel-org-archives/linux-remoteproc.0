Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AA3290C7
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468552; cv=none; b=DV1C0UnHaGIqzvXraNVDf3CrjInbZCJPLNCNb9jqdbuzcPAPfBMO4t/zbyWG6xlv5N1IejAXT0sQWnrs9y4CzoZmB7UWu/z2UnrEMjfcMLTl67BXXBoxSQlmnm8xl2kAuMdviUbr42tI458qmoWUuewuLC2PA1Nux79G1y38Sdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468552; c=relaxed/simple;
	bh=Kfz2zWMfzB9wq23vgHVGrRpmrC6gJaa3/SRAlOXdmx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K+2qMieNQ/LCDlRXkohOuwkatS+XUi3JXoNB6jn2f+ulnkfAPm8311qVAtJaXDZzaOqAjub3kyHA8NWya0hYZQuAO/SWXznS8EiTk2p9Iflzb4kAAQIuiIGXkM9fJWX1K3Ojfo8hnv2HB6pQKiUlTPa4/qgcMvGTCcpzECtmppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch; spf=pass smtp.mailfrom=humanlearning.ch; dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b=Yjpe2RLI; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b="Yjpe2RLI"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKJDM0t0Hz140G;
	Tue, 11 Aug 2026 19:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=humanlearning.ch;
	s=20250828; t=1786468546;
	bh=hs40Ijp9TC+Mg0TnXGwnwbT5DvC/p/SgByQCuC8GYJo=;
	h=From:To:Cc:Subject:Date:From;
	b=Yjpe2RLIgxlHdSH4JM2D1XB7BXEIwS/HB++W7ybj3jLHf82Dz6H6gpp3X1cRVCFJK
	 diLjYp3N2Zo1cuaJFVR1qNS4BbEyZ2+CPTto15Ea9DA7rKwlc40jHaLfku8v/ptIJ/
	 zmmcSZvBsrPb5dCK7gqLIPi7YRNu7PuyxMlGsdTmeB7zaAfLIB96BKhUUAbiBUUeW8
	 I27diKDzXPwRUYK2qMHjAF1WC1v2Poph3RGi/QRMylbfAD3c+/L04p4oMmqnHnCVnP
	 Z6KGK1VdyGS5q9o4AZiyYcs2evLkFOT+TnumBUR5tUaJxPMImvVGO0R2CKzSNrvwQc
	 TPtW0fZU7DjtQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKJDL361kzDwt;
	Tue, 11 Aug 2026 19:15:46 +0200 (CEST)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <info@humanlearning.ch>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: [BUG] qcom_q6v5_pas: NULL deref in recovery when using attach-only ops (qcom,broken-reset)
Date: Tue, 11 Aug 2026 19:15:46 +0200
Message-ID: <20260811171546.188660-1-info@humanlearning.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi Stephan,

Running your remoteproc "attach" series on a Surface Pro 12in (X1P42100) at
EL2, I hit a kernel oops when the CDSP crashed on its own during a long
build. I was not trying to break anything -- this was a 28-minute kernel
compile as a stability test, and the DSP failed unprompted.

Reproducer: any remoteproc using qcom_pas_ops_no_reset (i.e. a node with
qcom,broken-reset) that crashes at runtime. No user action needed.

What happens
============

	qcom_q6v5_pas 32300000.remoteproc: fatal error received: sleep_statsi.c:537:
	remoteproc remoteproc1: crash detected in cdsp: type fatal error
	remoteproc remoteproc1: handling crash #1 in cdsp
	remoteproc remoteproc1: recovering cdsp
	remoteproc remoteproc1: stopped remote processor cdsp
	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
	Mem abort info:
	  ESR = 0x0000000086000004
	  EC = 0x21: IABT (current EL), IL = 32 bits
	  FSC = 0x04: level 0 translation fault
	Internal error: Oops: 0000000086000004 [#1]  SMP
	CPU: 3 UID: 0 PID: 82168 Comm: kworker/u34:5 Not tainted 7.1.0-next-20260626 #10
	Hardware name: Microsoft Corporation Surface Pro 12in 1st Ed with Snapdragon
	Workqueue: rproc_recovery_wq rproc_crash_handler_work
	pc : 0x0
	lr : rproc_start+0xc0/0x164
	Call trace:
	 rproc_trigger_recovery+0x148/0x164
	 rproc_crash_handler_work+0xb4/0xb8
	 process_one_work+0x15c/0x29c
	 worker_thread+0x18c/0x2e0
	 kthread+0x11c/0x13c
	 ret_from_fork+0x10/0x20

Analysis
========

The link register points at rproc_start+0xc0, and the instruction before it
is the indirect call:

	rproc_start+0xbc:  ldr x1, [x0, #16]   <- rproc->ops->start
	                   blr x1              <- x1 == NULL

which is remoteproc_core.c:1292:

	ret = rproc->ops->start(rproc);

rproc_start() calls ops->start unconditionally, and qcom_pas_ops_no_reset
does not provide one:

	static const struct rproc_ops qcom_pas_ops_no_reset = {
		.attach    = qcom_pas_attach,
		.da_to_va  = qcom_pas_da_to_va,
		.stop      = qcom_pas_stop,
		.panic     = qcom_pas_panic,
	};

The reason that path is reached at all is the branch in
rproc_trigger_recovery():

	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
		ret = rproc_attach_recovery(rproc);
	else
		ret = rproc_boot_recovery(rproc);

qcom_q6v5_pas.c never calls rproc_set_feature(..., RPROC_FEAT_ATTACH_ON_RECOVERY)
-- in this tree only imx_rproc.c does. So an attach-only remoteproc takes the
boot path on recovery, which tries to load firmware and start it, neither of
which it can do.

Suggested direction (untested)
==============================

Setting RPROC_FEAT_ATTACH_ON_RECOVERY when qcom_pas_ops_no_reset is selected
looks like the natural fix, so recovery goes through rproc_attach_recovery().
Note that path calls __rproc_detach() first, and .detach is also absent from
qcom_pas_ops_no_reset -- but __rproc_detach() does check for it and returns
an error rather than dereferencing NULL, so the failure would at least be
graceful.

I have not tried either change: I have exactly one machine, the crash is not
something I can trigger on demand, and I would rather report the trace than
guess at a patch I cannot exercise.

Practical consequence, for what it is worth: after this, the CDSP stays
offline until reboot. The ADSP was unaffected and audio kept working, and the
build completed normally -- only the recovery worker died.

Environment: linux-next next-20260626 plus your 16-patch attach series, EL2
via slbounce, Arch Linux ARM (aarch64). The DTB is derived from the vendor
one, with qcom,broken-reset on both remoteproc nodes.

Thanks,
François Roux
