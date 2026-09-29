Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432383AEF22
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668505; cv=none; b=YdER3NWQyjQFGlUaJYYZeHCOY78ocMIEj+eBt+eT/YPeGMgmMGrdyT1EgQjV2FT0/bVOf4wyc0zN2WcSzl0gl2CfkZcMJz03gKv3YUGNdtYTXtX2vOr8EDqwgwUkqIqMuQr6+UTqEBn1rk53gOdbm9sPmmXXj3WPWpToZXXVukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668505; c=relaxed/simple;
	bh=ZPwnTQuqWtBfGDhVm8mEJ/KjEqEJ1mZMGzmHV9RX+P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9R3Hx0Hi4RR/epNHlSmCYrMNmRzo2/h87YyU1CKDI993Z+lvPzgBOEAwXHGvxjqqzFPYi0hni/Ztz9wULvRMUYsSYnL++hoK8QzOwjSxw4lCyfrqMv9PzUcpZLSapqxOB1DbUAQX11xy4JTIQhInF4ttkkjFZZWb9fs2NCshXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icJoi6F9; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icJoi6F9"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so1608990b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668504; x=1791273304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ulju+lbgB7hZpat+8achefWD3iZ013qQmnKJozx8hJA=;
        b=icJoi6F9DlxdwEwZeWSci31pJcv3+vnku9VWKo/2Sp29iZhk1pOGU90yKZE7LPrxsB
         z4wrKe3FZ5UiRZSYCkZPQQPiH/YnnC7TQMzIkQKesifPWouf9X72Lj+jaXLsh9V8+sIJ
         RMHRoOrszUx0MR6OEZRbvWbHkc5DFS8LDnb2jUi0IZaSmhiAeIvm+EVFKuGHOEW4zOLD
         LuPrrT+jo+841oxAVTQ4Or7KLjuYm8h9XKo174tgoSFbCsuex87mHt9tsoyKTf3A5agF
         7bt9Q0YMD3BWWE995Lb114PlStgLZoTA5HHJAh8B7TiPPnxi/OweMBF0bnDiGDjCVaDd
         lwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668504; x=1791273304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ulju+lbgB7hZpat+8achefWD3iZ013qQmnKJozx8hJA=;
        b=tRQHfpkTU4dTZwBGpmMvmEx/omdEB17VlZRqrhBS7yMEcqQryyID2Wjf/uZr7Xvo6v
         r9vFFOLSsgCWWBkbG/6+J3C1VQSQHWHemxME1nKXxcMSjdgUqbrV7bSkr5Wic1FB/RsW
         zHWn6yngYoZ148if1fmnVQ2R2jjQRJnPr4vQrogK/Nbxbs/PNl5smWUiVt3N0JDzSSUw
         eRG38CJTupJoMrFiU2R0HLQQAT6kAGHpSLAn3CBDH3YnGupT1w8vbP41EhaymhTDkeAs
         IVxTUtuxZERkd1DMgOaTrEOpWZkTaKp0rbb38WKHqrDJihxvxZuY0godgBbNmq3MT1TQ
         lS9g==
X-Gm-Message-State: AFuF++mVbm+kZvm7jBaxqg6NxGfBparBuWgDD2ja5gPFHsAJ97v8BPjN
	PWg58H/PZCQNiNAisP82GQmr8J5s9glLIzDp03zJtQ55ahfnRfEx40n2
X-Gm-Gg: AYBFou3uH7LTIsHpz8LIN8GdZGGJmaGD3zPSKxOpUNzrew7BnoMu9cZAjGn+n7XDvGh
	wMqpLyWcK8b/vxDhKqEXN7mob3L9mMfGFOkthodCZaBSkQ7rkFj+HIXNQq31CUHK3//Y2qevn9c
	tespmkw/SR7lrQ3QCskocfx/xv/bNH4fDmeHBzyBvuwhwOFXgv7gdIgrR+EPQSYS4Wqtt/H6Jf9
	sgtNuNc3NyjhH7ids3NFYvDGC82gLReZVz4r7yKE8voaLH4N/4KGLIA5ObCI2F7OOPyJH1gQjCA
	Y3hw+QH+jzck2jCsBHMFEXssIynpbXUKufLmJSD0DKQPV5/2cLF+7YiWHy/YDQe+gZAsvU/boSm
	at69dhowN/CsZrvhKtfefDqGQHmnWeg+GwV2tcsTtmtTxTmAsjFJ49WTeCAmVuVH61r7pQHFlfT
	ZQU+lQZzJKNdBslYuDRFa4EumlyFpM4cH92npFEPhuFUedyFtY+dmf6pXV+EnnB/bkJijhRVpbs
	J3UnpPSMZFTarWPig==
X-Received: by 2002:a05:6a00:1795:b0:880:b709:cefb with SMTP id d2e1a72fcca58-880b709fc95mr8242883b3a.45.1790668503728;
        Tue, 29 Sep 2026 00:55:03 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e22ee338sm351772b3a.45.2026.09.29.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:03 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH 1/4] remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
Date: Tue, 29 Sep 2026 15:54:50 +0800
Message-Id: <20260929075453.2324597-2-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929075453.2324597-1-hyz3367@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_free_vring() resets a vring entry in the resource table as it
releases it.  Resetting da to 0 leaves the entry looking like a vring
at device address 0; write FW_RSC_ADDR_ANY instead, the marker for an
unallocated address, which is what the entry means from then on.

That matters on the error paths of rproc_start() and rproc_attach(),
where rproc_free_vring() runs while the remote processor is already
running: the failure originates in rp_find_vq(), called through
virtio_find_vqs() from e.g. rpmsg_probe(), which the core only
reaches through rproc_start_subdevices(), after ops->start() or
ops->attach() have completed.  At that point table_ptr is the
resource table installed in remote processor memory, and whatever
the reset writes is visible to the remote side.  Whether and when a
running processor reads the entry cannot be known, so the value must
be safe for one: 0 is a plausible device address, FW_RSC_ADDR_ANY is
not.  On the teardown paths, stop and detach, the write lands in the
cached table or in a copy of the installed one and reaches no one.

The comment replaced along with it was written for a call graph that
no longer exists.  It described the teardown callers only:
rproc_stop() has run, table_ptr points at the cached table, and that
table is NULL for a processor started by another entity, so there is
nothing to clear.  Two facts have overtaken it:

- rp_find_vq() has been calling rproc_free_vring() when
  vring_new_virtqueue() fails since commit 6db20ea8d850 ("remoteproc:
  allocate vrings on demand, free when not needed"), and that call
  was present, unchanged, when commit 9dc9507f1880 ("remoteproc:
  Properly deal with the resource table when detaching") landed: it
  runs from rproc_start_subdevices(), after ops->start() or
  ops->attach() have completed, with table_ptr at the table installed
  in remote processor memory and the processor running.  The comment
  never described this caller, not on the day it was written.

- commit 9dc9507f1880 ("remoteproc: Properly deal with the resource
  table when detaching") and commit 8088dd4d9316 ("remoteproc: Properly
  deal with the resource table when stopping") later taught the
  detach/stop paths to take a kmemdup() copy of the installed table for
  processors started by another entity, so the NULL case the guard was
  deciding between is gone: table_ptr is always valid where the teardown
  callers run.  (Those callers have since moved to the rproc-virtio
  platform driver, 9c31255ce5fe.)

Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")
Fixes: 4d3ebb3b9990 ("remoteproc: Refactor function rproc_free_vring()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 40 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 263e12f022ea..123aadb467a0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -403,6 +403,33 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 	return 0;
 }
 
+/*
+ * rproc_free_vring() runs while a remote processor is being torn down
+ * (rproc_stop()/rproc_detach() paths) or while a boot or attach attempt
+ * is failing.  Whether the reset below can reach the remote processor
+ * depends on what rproc->table_ptr refers to at that point:
+ *
+ * - teardown paths: the call comes from the rvdev cleanup in
+ *   rproc_resource_cleanup(), by which time rproc_stop()/__rproc_detach()
+ *   have switched table_ptr to the table the core was booted with, or
+ *   to a copy of the installed table when the remote processor was
+ *   started by another entity (rproc_reset_rsc_table_on_{stop,detach}()),
+ *   so the write cannot reach the remote processor.
+ *
+ * - error paths of rproc_start()/rproc_attach(): the failure originates
+ *   in rp_find_vq() (virtio_find_vqs() failing in e.g. rpmsg_probe()),
+ *   which rproc_start_subdevices() calls only once ops->start() or
+ *   ops->attach() have completed.  table_ptr still points at the
+ *   resource table installed in remote processor memory and the remote
+ *   processor is already running.
+ *
+ * Especially in the last case the reset has to tell the remote
+ * processor that the vring entry is not usable: with da set to the
+ * invalid FW_RSC_ADDR_ANY a running remote processor sees the address
+ * as unallocated, and notifyid is invalidated along with it.
+ *
+ * Reset the virtio device section only if there is a table to work with.
+ */
 void rproc_free_vring(struct rproc_vring *rvring)
 {
 	struct rproc *rproc = rvring->rvdev->rproc;
@@ -411,20 +438,9 @@ void rproc_free_vring(struct rproc_vring *rvring)
 
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
-	/*
-	 * At this point rproc_stop() has been called and the installed resource
-	 * table in the remote processor memory may no longer be accessible. As
-	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
-	 * resource table (rproc->cached_table).  The cached resource table is
-	 * only available when a remote processor has been booted by the
-	 * remoteproc core, otherwise it is NULL.
-	 *
-	 * Based on the above, reset the virtio device section in the cached
-	 * resource table only if there is one to work with.
-	 */
 	if (rproc->table_ptr) {
 		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-		rsc->vring[idx].da = 0;
+		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
 		rsc->vring[idx].notifyid = -1;
 	}
 }
-- 
2.34.1

