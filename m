Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412EA282F1D
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973977; cv=none; b=X6VsKw+4h6mPuIX8kOWVr23TH+KArIuCTD1SBno4/RFPrW5Q72KUFSOd0qf/4Wsm+sxmXlaHCywsi6lo3gWp9hXmXHh6kqDpRBhinPmtHOpXIzp+oVLyrClogV1UavKqGZ1AF4q3x+aYr3EWme0nsHR8aoRmNtfExNTzx8YskAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973977; c=relaxed/simple;
	bh=Jznyf80dGgdWTP/0QEAd4JX4pzVoDUuSYrH1N/VLUdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qIaCuxX84LJYa7E90PiL4Q+JH5GojdM4tv+N4XQ4y+Hfik88BrTcpMvUxwERp8zdSjJL502gPe7c+vOIq5LQcrHT56kVqEX5oPtVdl2TyRF2oPczHCX9muH0j99Bt4CF+PiMK+S5nP1DYR6EGEAInCbJbtjNGfm9STSOZYiDmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhCW/uO2; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhCW/uO2"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35834f72d94so7076838eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973974; x=1792578774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYRfGH6x4ZC6itbOwadHAvueNYUJVYtsL/kjvOmVY14=;
        b=mhCW/uO2zSpPCyDq97NODBGNlHYh300+niNZkfwSWu252SF7YlWrY9egaUIm1/DJZp
         8PnIbqw1WvyVR4ss+w7cjPY50Gwd17VUiaw7GgOYfwQS/qrj8eSj6DrNrY3kOJoaDxB7
         vJn/U120KtM18Op0wEMhxYhH4eFbQ4/tITAVuChxz/nJW8XvAwZSQjDFEWOvvUJEy8ok
         7skELZpvgDsoGhGUdNbsqA0bhfVyg6jsZWm/atfJRFI43al7dNLzYaacS0TzBplCTt15
         R4CgF17FgkrzV5pM4zDkUmNm6HVOYMgUGO5If1dV4csbrzAUOCKKTGVbgDMfyD4ARCeP
         PtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973974; x=1792578774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYRfGH6x4ZC6itbOwadHAvueNYUJVYtsL/kjvOmVY14=;
        b=vdL0h0rNJzlDhWDEIzngzBdgiPhMOs+UX2dhHJdNY6IIJlBIJ1vPfjr+wgo2+W8LFv
         ooAb6X1Tro4prbS2MNaPMQsmPCl07sNoLc+KA8E/v4J7NRQoXsaJBy1vrJ42WqFX3NwV
         jHYCGiCxP/nhyUaWgdKbPytJ+fCHp2IFXtuYQIZY4kd2NWE7KzA7rEXKpInL+5hhkBgf
         MlDTXS3LJxmMLZp2WVjiSQD5P0YUpFhAz7ogCGxI5rNl52j/XV2TQY0luCpNdlFOWg3b
         whb6KHYjJcL8y2wzVl6n/8/2amMOw+ThkhtsyUKgTZh0w2zNieaIwKx+kOdKfqVHhpl8
         P0Ng==
X-Forwarded-Encrypted: i=1; AKwUvBygl07Aua4Z8GRB1TdAmtzepV76SHm+D8+ibfAXsn9DhjDYNxYVOLphqrNkkM5jyWcxm0PoRRC9t4GI715mx40O@vger.kernel.org
X-Gm-Message-State: AFq9FYJn3ww47lY6QOlIxpwjwdbhy2mRSSYh6qrJj7nHkRGDKrp6zWcT
	lXFkYX3oEclTzd5dbY3W99Y05EmsmxSWk+FZA+Ve3SCWuIJCiDcQyE9B
X-Gm-Gg: AYBFou1bO8x++pmRjrYVQmjws5YJYIXRt2g7inrgoRb+Ms9V86j1e0nID9J7NMo/pAG
	q0RT6DHP4ZcYLabjl7DV6XtSOn6HVD/HOi9HZphho0WEN4ZbP98krTFB0Bq8G/9ABhDXk/Iwh64
	ptqaN8PdzqAgUR7YkO/thunMyCFQME/xqNaTHyy8BK50oP3igdq6KSb2YJcV4bZkgAAAqTkEPW6
	t6UhRxIJ1BpDUoa+60ksa9GxpZRGQreXIm1biDAIc1aTfNrwzKeT8lbOL4cJ+mAISkuT9Yl34iE
	pXt9PZ78EgD12vaBLzuA7nMsvm0Wtd60lcL86Z4ZkSom6hu3Ixe3MFz31fRWctZLIA+fDPZkoiG
	Hd0qdZ3ygalPJLBIr8ONM3bOI3PPclfCKbm5ezfR0vtagRMMRBvog1PxGnU5pDMSaXdDDttnPKL
	y5OrfZ8TCuF3606dm+U+GgMNxRT/wnK3iHer2HtBx6Ov6xHCyp854IEojzsTlf8P3xqbosJaw=
X-Received: by 2002:a05:7300:8d:b0:35c:89df:812e with SMTP id 5a478bee46e88-35c89df8359mr6439561eec.34.1791973974193;
        Wed, 14 Oct 2026 03:32:54 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm42371533eec.15.2026.10.14.03.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:32:53 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
Date: Wed, 14 Oct 2026 16:02:39 +0530
Message-ID: <20261014103241.3847-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version of the patch had a new header ti_sci_dev.h,
that mirrors ti_sci_proc.h in terms of the struct decl and
its helper function structure, with the goal of abstracting
all ti_sci_handle's members like ti_sci_dev_ops from being
invoked directly in the driver code.

Lore link to the v1 patch:
https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/

Upon discussing in the original patch thread, it seemed
better to combine ti_sci_proc.h and ti_sci_dev.h's structs
and merge all their helpers into a single header. That is
what ti_sci_ctrl.h aims to do: It has the union of tsd
(ti_sci_dev) and tsp (ti_sci_proc) and both their helper
functions are prefixed with ti_sci_ctrl_dev and
ti_sci_ctrl_proc respectively.

The goal of the patch (v2) is to maintain a single source of origin
for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header (ti_sci_ctrl.h).

In the future we can try to abstract tsd's dev_ops even further
through pm_runtime, but there are some roadblocks that
I am unaware of, so that warranties a different patch.

Siddharth Karanam (2):
  remoteproc: Add ti_sci_dev_ops abstraction
  remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction

 drivers/remoteproc/ti_k3_common.c         |  21 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
 drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
 7 files changed, 231 insertions(+), 218 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

-- 
2.55.0

