Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854550;
	b=ZEAeruCyNsAndzkQMuElJPEUci3yQLjJ8KwZi4Z5q7oxegVrbAS2es1H+GjB7lB0pAO3
	 3UJFw/crYpwmSMh12qOQRO+foIW/dfL1RK6C6rjdRmeW9z/qxZR5piV8rWfrt8A7ttsu2
	 1PyM8KsKZlSetw9o2hIkr2zmJ6SVc1fDy/18G9ZNvULGq0zS+YmWkYmzD5wUAs3mcFSEs
	 3vqzMlZ1rXW/c8ZHyPF7APOGJd+CStopRwGsGXaAYBihf5i1Apar9G2IPDgjTKlTLf3+E
	 akYC8fyAJSvYvQrvotXhXIm/pdajpHD410nDeabW17j3H4DX9SGJzJl3NZugYLGcKDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854550;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=mAPZ2ABkS3wwZkajNWaNlZyPRST/bSpQmiNaCbexNCw=;
	b=SkD5N8J21Cam6XwVl8c188COuMQJUPh2LXfvysw54hzYSa/4xrMZFT2e7fQowdrlua0S
	 4hg/3ETXWv312zLI7qhK6PhotmUOrVkhxtLJfIzQhx9sPB1p+RFbvhVcH4+XX/whACKrB
	 5iCIxMzwlg8KsNdpHLvONxs7ETGx0anyuoiScAbCN7ly//CtmMJORUPrnE2cqqkP+qMAv
	 +nTE3Grv/3edBmuflEPBKvDogJ/fSblZdMyhT+EST7cDagyvh/KjhDRQvM+/qfWx6chvU
	 QMsVKDxbH1HlMZiYbfl0TUbJDIoQxsNU9JfAZwSBNdsX3fNv7BLPoCNiLR0cCoR2hmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=hB49LBFU;
	arc=none smtp.remote-ip=198.54.127.153
Received: from out-2z4y-a153.jellyfish.systems (out-2z4y-a153.jellyfish.systems [198.54.127.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89186606A31C
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89186606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=hB49LBFU
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxY72k1Lz2x9D;
	Mon, 16 Nov 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854526;
	bh=mAPZ2ABkS3wwZkajNWaNlZyPRST/bSpQmiNaCbexNCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hB49LBFUW2+3UktnL1aAIlPw0HvJKlNJrDM62LsCOjcOdzPTxQO/N2DaclotLqR7A
	 fBc4iPFdBzTp1RyIFNMfx+Yd4EwDeQB8f+oBpVDv5xKUq4wMKeof339be8GMJoI7Cl
	 2145xrGLrZEDpxNPwarkZi7PziyUjMqTXIKc1L2VmuRtIy4GfD5VXuKx//g1eM5fpZ
	 /YNuUvmowgu8TKfgGPQ/PaynKZ8/DzvD45Lc8sbA58RMSPtFd6SBwJEVBNitZP9nHn
	 /ojy7eEbChiwSnEVudd0uNbyItNALmN6HgZriqCRF/3peN35yiANllbmEoUzxJ0kNF
	 e6zyhslzFJkcQ==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	francesco@valla.it,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Mon, 16 Nov 2026 21:41:44 +0300
Message-ID: <20261116184146.1897281-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116184146.1897281-1-dev@chrispinetinega.com>
References: <20261116184146.1897281-1-dev@chrispinetinega.com>
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

Call rproc_report_crash(), which may be called from atomic context. The
core then moves to RPROC_CRASHED and the crash is counted. Where the
driver leaves recovery enabled, recovery stops the core and boots it
again. Where recovery is disabled, the core can still be stopped and
started again through sysfs.

Recovery on its own cannot yet restart an R5F: the reset the R5F needs
before it starts again is applied in its unprepare() op, which sysfs
stop calls and recovery does not. The R5F driver keeps recovery
disabled, so this does not change what happens there.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v2:
- Drop the dev_err(). rproc_report_crash() already logs the crash
  and names the core. (Francesco)
- Say in the commit message that recovery cannot yet restart an R5F.
  (Francesco)

 drivers/remoteproc/ti_k3_common.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4b6da3363..43a7a21fd 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -60,11 +60,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 
 	switch (msg) {
 	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
-		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", rproc->name);
-- 
2.53.0

