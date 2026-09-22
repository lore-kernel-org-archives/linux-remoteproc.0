Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB874A2058
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104510; cv=none; b=AuOFKIXYwzH3lfRe9UvpdYCQsK31ksjqBVi4CsRI1QxhF/BDWspAZqd+yw9mBVZqgzJldi7bEmGTw56oCnCj4Le1b4udsGke6tyhWZtjsJq1x+AAuPtRMaO+pygqNxoRXCcnmWtwUf1ncY4G0+5dMc0CeiBmRKKiKXGT5V2WyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104510; c=relaxed/simple;
	bh=OpmXgWq8ZDTVoehX0GIhvuMbtExpE5nV+LxDCEWTwaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAoxlbQq7NLkl7TXaFkhsnPY0z0tOEra82FTM6sF96oqxJ/fs6GqpvYQHngXd4Ir+DhDRbstiDSt5MfkV3wbYtJVbGlq0HjoKmvtxYOJ6BgiBCwKMUHSRJj3S+uk5ITV+Ic6OWwoHt4TZlj9aKCQSLcSbbED5pEgOUqKcEbL270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmH4kUoA; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmH4kUoA"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso163679eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104508; x=1790709308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4MMy3c11m09yYQkyC62fSxMbfPue+ahbcbfmx6F730=;
        b=rmH4kUoAr0DdOPq1M1M8lTibZ9LABMVoSfAhSWzrf5cagUq0BVfdM4sl2SXfPIirm0
         F3ZknxKr/D2iTA2Q7+UqxjkK8BIi70XcI13QxMxO/k1B1q1UUG7psWuz74NkEb8RRXUU
         yvnrCaW7nCxXd+d4gdGfW2tN9kiFAX9WHZJqXZjrtkpD1LKxs9bUJgMcwW9V3ezC8Cv9
         TuSgBjhppcjtn6nxrjeZEfEzwsBkIUk/OItvABy+p1x+Uj0OHpKKGhsrBxg/TLT3oi5q
         zuBmbAv3S542TyQZSRbB9duV+hPvEq0ENOHGDb0dyIHLDo9QWyR3LmzSjBxxhdhws5hY
         WWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104508; x=1790709308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4MMy3c11m09yYQkyC62fSxMbfPue+ahbcbfmx6F730=;
        b=xEavwr9Aq8JaeFkiBwnDISZabvReNy32G/soKBGYGJO5LRLqTQevkWF+dqk575RlY0
         7Y1D0aLwHzv8qV2zLUlHFUnReEjWi4g9dLVdKKNTSMsVSWJb0nCy9KqIAHlYRy+tOP9y
         oJiazoMvl0/1jNOuAe/WEFiutRGmVho2LWYKfLtCEHdm+Y7VnPC8SjQZtHpLUWU/EclQ
         4mGgR60R3S1YmN6gRovIOVRA81tHyWW7ylxFK8z+8QWih2HotSnrPmtdM9qlTTCz6zEE
         mwHxpLxVP4BAU/KTn2MSEXFOd11I6R5qnCEdYhDMInMfNoBaAnHR/8Onlu3Bve08F9/M
         oLUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpLUjwBkQIZNoKE7LkCvAZ8xmTRlSkH8a+3UsPlupIUYkerPp+D8xRDN/p5XY1rgEo5q9hiprbUX48R9XvFJzE@vger.kernel.org
X-Gm-Message-State: AFuF++m2+I0pgj7Y/ThrZnv6M5snJ7pnxmUZI4aWmomQKo66fl+ilmg+
	W4RvFSI7DdHPodWT2Rg4XyFeSUm3l1AzqUN0ZxfDm2xlA7nzy/Y6AN8H
X-Gm-Gg: AYBFou1QWgww5XKw7oFuTJYWzoLP6PsAcyoJinljzTrz33j9jnyXG/k8iIevpy9lvHy
	TgCGIfngXm2MK/Ri1SrPEipz3IrxlG97kBdQNmauSNvyO5hGaBcj1/5Oc7T9QWqWkSE5DGb6xyX
	Z4tb/lJVxI2+5evlVxDCyTv8aaF1Ngq+ApP3MeAvII75ku3QJlw+icxq0le87gokdhKasjV256w
	hNAZNgRKa+OS00D/e2NV49dN6hVqTF6MMJXym1pkWHG6aUtgVOYDtjRG7ay+/PLcuJAtHpHGoV4
	nhCt2ejp+/h26LL4BzujcD7Da/XRh0O2qW4EByzfJVNpT4lU0xHKJRdk5P0g+rWSsFYmplTQmrr
	c8P5O+Lk3VgHo0Z0Q44IgceH4rXyO49INq/1cxVlLrR7fx+cq+r94oD4q29NNED4Auss2YDJ3F8
	GNekLOgCju8N+Sbru3o3JQygIGwgSV7fmDusv9BC75oZQzbngua58xDilPrXgJvLKbo7371955d
	DAwvCx5xA==
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr235823eec.28.1790104507377;
        Tue, 22 Sep 2026 12:15:07 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm310518eec.25.2026.09.22.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:15:06 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH 0/2] remoteproc: Add ti_sci_dev_ops abstraction
Date: Wed, 23 Sep 2026 00:44:51 +0530
Message-ID: <20260922191453.324983-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
in the driver code, this abstracts the property read of
"ti,sci-dev-id" and the function pointers supported by
ti_sci_dev_ops such as is_on, get_device and put_device.

The goal of the patch is to maintain a single source
of origin for all ti_sci_dev_ops call sites. Any stray calls
to any dev_ops function pointer members in driver code should
eventually be abstracted through this header.

The second patch abstracts certain device ops' firmware logic 
even further (such as get_device/put_device) via pm_runtime.

Siddharth Karanam (2):
  remoteproc: Add ti_sci_dev_ops abstraction
  remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through
    pm_runtime

 drivers/remoteproc/ti_k3_common.c         | 16 ++--
 drivers/remoteproc/ti_k3_common.h         |  4 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 ++++------
 drivers/remoteproc/ti_sci_dev.h           | 89 +++++++++++++++++++++++
 6 files changed, 127 insertions(+), 49 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_dev.h

-- 
2.55.0

