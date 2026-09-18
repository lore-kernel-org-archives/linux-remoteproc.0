Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E964D17AA
	for <linux-remoteproc@vger.kernel.org>; Fri, 18 Sep 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728399; cv=none; b=GHdQhzRCM0KLnSSS0kairsuPy7HahbuJFrd++dCJHAxKxZUDWnp6cW7wzFoOF01rVV7EHDQYbOZNA0vf7nsO2rTpMQY1uevGXrHw7HrbgTDSRedvaGcqs0qXBsmeimg+nw5Dbs+oxu152rxkud6rzwPX0yxagFGW/Gci+wRDvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728399; c=relaxed/simple;
	bh=p2TRymqGITnyOvwm3MbWCG5QzBOAuBr3rvTBDH/Ha5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7Nm+c0WwJ8KqKEQRKd8EY727Rip/UAvcexNoFWPiXW59XUCeACxBm6XXuA8ZHJ6YfmodO90lCFYdCRsa8rqxJ1mXOFoe2jwYht113u0JLQLyuwQbV/ZTkFZpLq5Xt1u/fI3oac4sc6tbBiPCC9mncIMMF+nmugzKhiCZUX8a8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MG4X+neY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BUBNEwNA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MG4X+neY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BUBNEwNA"
Date: Fri, 18 Sep 2026 12:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789728389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=yUjyh7iyKVvgrOg5csLH8yE3nXWO9tNjCo7nwOtFFQo=;
	b=MG4X+neYPg+ceuYqCWMi2HUF3kOVLzeypZRWEabSQp3tp0w3LQY76yGGbd4fDtOCEZ0/pr
	xQjROpADaH8EO2soZfRDW1KC/jv+7bppTk67hcDdSLOr6Av/RQN12V+SP7gdESgY0tXV7H
	AyZUBVePc0Dgof7jjjzcGneZdwTakFGUF8aeOTbY8VrVeIokNEOKt3tTjg0lgYi2XOqRly
	PpbmNzoKg16aqLA+EqEO/lDMpTyJpNScED7gsIC22B1eof8jtp7jpxSInvtSt7ldDd89zv
	VgN9DINBNHO51M6Yd0nSfi1yyeqWB90t48pLDt7uolNt7Em4fijQMrEXhAJ91A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789728389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=yUjyh7iyKVvgrOg5csLH8yE3nXWO9tNjCo7nwOtFFQo=;
	b=BUBNEwNA5cq2bzChSqAap+oOTEvGng/rxxTlX+bctnFvrMcx42NITB1utZNUY0hO8j8CcJ
	qVBBam6wz+51lnCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH] remoteproc: Use %p for pointer formatting
Message-ID: <20260918104628.jqQhAlF-@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Commit 276ec9934231e ("remoteproc: replace "%p" with "%pK"") introduced
the %pK in order to not leak kernel pointers.
Since commit ad67b74d2469d ("printk: hash addresses printed with
%p") pointers are hashed by default and the behaviour can be controller
by `hash_pointers' boot argument.
The policy on %p is to not introduce new ones.
Removing %pK makes it possible to remove its handling from the library.

I doubt printing the address of struct fw_rsc_hdr with an unknown type
brings any value. The va is printed already in debug output in other
places as %p so it makes probably no difference to remove it from
rproc_carveouts_show().

Use %p instead %pK for rproc_mem_entry::va, remove the address of the
unknown type.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/remoteproc/remoteproc_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b86c1d09c70c0..e8e7b6a3769b8 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -347,8 +347,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			}
 			break;
 		default:
-			seq_printf(seq, "Unknown resource type found: %d [hdr: %pK]\n",
-				   hdr->type, hdr);
+			seq_printf(seq, "Unknown resource type found: %d\n",
+				   hdr->type);
 			break;
 		}
 	}
@@ -367,7 +367,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
 		seq_puts(seq, "Carveout memory entry:\n");
 		seq_printf(seq, "\tName: %s\n", carveout->name);
-		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
+		seq_printf(seq, "\tVirtual address: %p\n", carveout->va);
 		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
 		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
 		seq_printf(seq, "\tLength: 0x%zx Bytes\n\n", carveout->len);
-- 
2.55.0
