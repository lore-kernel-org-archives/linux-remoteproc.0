Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308313AAF69
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668502; cv=none; b=djcRTUsyXUA/WJi85Z65B+KW/Iz7SzueZS2yM7U6GjnXURwgNW+NQtXlIY2/0p2q9Niu5p6gukFjMiS4VhQ1KRR+n0rZPWBUqhwHP3A36Ev6qHqoai5UOTWvV4cCOMELwxViM9P/zu/mr2VK70/Tk4jQ/TnazPNr8JN2cxbmxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668502; c=relaxed/simple;
	bh=dkbdgQo2iGH3uRrOoNgwHElz5EaD8vx3Q+1mc9s1RGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jZ6MNP4y4v7Y6GLkYlob7I6zVLHrQe755A8kBjMOcewWV+kRA9aj/taHxEsAOWeaR4H+zRBZL6ZOhjg67XL78ivRe4bWWCvwG74LINwrK4/K4oPBL1wusQ5Xqvt2Zi7/AgnM+PUT2QRUgB9MDdc4olBgX33rQcbz23p71p8HsJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpt85CGM; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpt85CGM"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2230739b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668500; x=1791273300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RJ/FxYuCVKMvGANdB0chLAu261gG0sMypkNzN9JtA4=;
        b=cpt85CGMBdvsVBpYJyP4KyvvVECr7evBC1k709yYzMCp1dY2rDI/XPjfWSLxeTfeB5
         v74b1+RdFvrpMYFZ2EsiURU4+JUd3GtF/EocoW7XL3zHh/IzxDoS8XYXD1g5ue7j4pW0
         4DjwQM+i59gP5NIBvDqwoHzjlcI5MKj1jgX38NVu9uL1R7QhkKYhucf2JnUTO+X6bFr4
         g8cH4KtW8DoTYPAD9VbvWZ+ZECmYkgH/4eShdFiG8D0dI/cpS9c+1gK1POtWxpQFcMM3
         kFGv9uZv1qlrXvSE0rKm3TKVII1+g7xxspbiue48K5HkaI+C7nofaoAf2bSdrw7ixyv2
         CvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668500; x=1791273300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RJ/FxYuCVKMvGANdB0chLAu261gG0sMypkNzN9JtA4=;
        b=ttXIyHY/8S5SD3WqsX7eF4u6PDb/yX0836p0Ohze+pSBT6amaLrDc0wGpAncGgYi6R
         JdcYn4cRPVw58TZtNMrs3Ro8Ao7Yaa/ZkQHF6WZjjdxZyXjeUQojEyH76GmxcVSc9tOh
         cmi1Gd6y7EJfBpyuzGfLpzQmOT9n9HNpHf7ADL9EBS7aB/bD1ZqNKPsukV6gNl6r1iGO
         Q76Sslpp8gs5V7UHWPLszdqgO14/AWwX/1NHk3a8KpbYkpE7yC7ZgSxD8tSB1nN6Cs85
         K5tP8Y77yiaG8neM+7wEbETl1pFnx3X40GWNWhwJZogvJWtp0TtDtXw0rlizDufLjHZe
         pX6Q==
X-Gm-Message-State: AFuF++khTp2MZPt/vgejN4gK4mD/Z8mHti8PD/3Z1BjDYhUNe87hM2/D
	GkTZV/32Te/WXYrxs7APH2KLc/+2Ci5Ce+DdYZI9NFEtQZ7RuqK8V8+K
X-Gm-Gg: AYBFou0CBHPikKFpvYOCD9kJJ1uc9+tyGpFXGxS1GNZEtD8nHHbWg21Y3yrJ7Q4C4Yb
	Y9ZWWM7XhVj6rF5/A4zHfb0AV2gLQVTGJCYSh6fjdH0tQ34ti4A9A1/zSbIujGPEGat/SpthuuV
	t1wctv2+h57kDRc6MJW9fz/SVnrbYCzGfcoCGjBEzf2F7eGE6/GDjtmeEyPJOlRLVh8/m2d8WGA
	nrCr2Xd4ktJ9QPyc7ayFO9rPcMdvAKRzBNqi20t2HuRU7X1Smpb18P5w0F091R1w1Gk9sn/XgjX
	79zAe02HeWxQrh43/ThF0iSbQzFtvzFHoMrR5vuoSNVEFDaZG/ki07Yx8nPkJxQ3OWBqvpGJxQq
	kGmT0jcVCUB67O4MLRURXbv/+hUbEKQJKJKdR3PlQGIMQHhc19Pj09g2VPWoU1UQnpm0hEtTiqc
	ijlzlhKQ3DJqXVuJOSQxhahAE24/O+/dTDyuEvj2I/dYTIkUVWQoEfAI5cs5vvwJbQVP5tC9opB
	6qoCV6HArtQTgXVeA==
X-Received: by 2002:a05:6a00:4514:b0:885:8472:16f2 with SMTP id d2e1a72fcca58-8858472238cmr1322638b3a.50.1790668500298;
        Tue, 29 Sep 2026 00:55:00 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e22ee338sm351772b3a.45.2026.09.29.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:54:59 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH 0/4] remoteproc: core: Fix the error unwind paths
Date: Tue, 29 Sep 2026 15:54:49 +0800
Message-Id: <20260929075453.2324597-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remoteproc core unwinds failed boots, failed attaches and failed
recoveries in a handful of places, and those paths have drifted over
the years: an unconditional stop() here, a missing cleanup there, a
reset value a running remote processor could misread.  This series
fixes four of them.  The success paths are untouched, and no in-tree
driver changes behaviour when nothing fails.

The single-sided ops configuration that two of the patches guard
against is not hypothetical.  Version 9 of the TI k3 refactor series
briefly introduced it [1]: ti_k3_dsp registered in IPC-only mode
with start() kept and stop() cleared, on the reasoning that
rproc_attach() never invokes start().  The shape sat on the list for
a month before the rework that finally landed removed the ops
overrides altogether (commit 41d746b3423a ("remoteproc: k3-dsp: Don't
override rproc ops in IPC-only mode")).  The point stands: nothing in
the core would have caught the intermediate version, and a driver
sent today with the same single-sided ops would pass rproc_validate()
just the same.

Patch 3 mostly benefits the attach-on-recovery users (imx_rproc when
the Mcore resource is owned by another partition, xlnx_r5 when the
RPU is already running firmware): since attach recovery was introduced
(commit ba194232edc0 ("remoteproc: Support attach recovery after rproc
crash")), a failed re-attach was unwound with an unconditional
ops->stop() -- powering off a processor which, per the feature's own
contract, "does not need help from Linux to recover... Linux just needs
to attach", and which zynqmp_r5_rproc_stop() would additionally flip out
of attach recovery mode by clearing the feature bit.  With the unwind
detaching instead, the processor keeps running under its original owner
and the next attempt attaches again; attach()/detach() stay paired
one-to-one with the attach() calls that succeeded.

 - 1/4: rproc_free_vring() writes FW_RSC_ADDR_ANY rather than 0 into
   a freed vring entry, for the callers that reach it while the
   remote processor is running and the reset lands in the installed
   resource table.
 - 2/4: rproc_start() no longer calls stop() unguarded when it
   unrolls a failed subdevice registration.
 - 3/4: __rproc_attach() rolls a failed attach back with detach()
   when available, keeping the resource table accounting and the
   state consistent, instead of unconditionally stopping a processor
   that was started by another entity.
 - 4/4: a failed recovery releases the resources of the boot it was
   trying to restore and voids the power count, which nothing else
   can drain once the processor is offline or detached.

Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
driven by an out-of-tree platform driver for the Allwinner remoteproc
hardware.

The error paths of patches 1 and 3 were hit on this hardware rather
than constructed.  During development, a subdevice registration
failure during rproc_attach(), unwound by an intermediate version
that called detach() without the resource table reset, left the
freed vring entries at da 0 in the installed table: the next
rproc_attach() failed in rproc_check_carveout_da(), called from
rproc_alloc_vring(), with "Registered carveout doesn't fit da request"
That trace motivated the reset bookkeeping of patch 3 and the
FW_RSC_ADDR_ANY reset value of patch 1; with the series applied, a
failed attach can simply be retried.

The failure path of patch 4 was exercised by renaming the firmware
file once the processor was up and then crashing the remote core:
recovery fails in request_firmware() as expected, and after the
file is restored the next rproc_boot() performs a real new boot
instead of silently returning success on the stale power count,
with no "already associated to resource table" leftovers from the
failed recovery.

[1] [PATCH v9 17/26] remoteproc: k3: Refactor .start rproc ops into
    common driver, 2025-03-17:
    https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/

Yonghao Zhang (4):
  remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
  remoteproc: core: Guard against a missing stop() in rproc_start()
  remoteproc: core: Roll a failed attach back with detach() when
    available
  remoteproc: core: Clean up after a failed recovery

 drivers/remoteproc/remoteproc_core.c | 144 +++++++++++++++++++++++----
 1 file changed, 127 insertions(+), 17 deletions(-)


base-commit: 586a2fadadb160295a93e5d5d32db1a2558a4d3f
-- 
2.34.1

