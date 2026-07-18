Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5C2DB78B
	for <linux-remoteproc@vger.kernel.org>; Sat, 18 Jul 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784392246; cv=none; b=l+E8A0XtYicPoAZXEaGikiLjdcOwiaQjXvNyIRlu/BGukfccXC2Fsj4QAkJEZFL+8lCDwIbW8bIh8xd0Mm9nqFxYayXlDu5oiqtqh5bW3JSgG1lhy5mivzSJ0PimA1N0mhrjnfiI1LKcNUVy2cA4n1WkA+FKK1g+Cb+RrVBek3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784392246; c=relaxed/simple;
	bh=qu8m8QD1E2U36sIqtuz628n6tAMxKMazcdDd1ni4Kuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULm6OJ1D96ZvgC6bZJronZPAVpYA5prDl5R02UkCOlqNTw21DO4QwzxCpo6wAciCuQ6ki/+9tEvWqnvxbxhN0USyQMngr+diIgt8OIs17D8HeZjdniQgwThBMSdw0YJ9Bc7eebous2fdIsUwuKKzcrJXHU2WmipqkH8QDzSDWqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e03PbpcS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e03PbpcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=mP0Kw17yjWhnUe
	O5Ll8UWMFcWaACmGmYdHm7GaJ9VFk=; b=e03PbpcSZ5D7HuVLMXR2FjyL2ztZJ5
	2HqADW8V+Yj09h9GJHnHWcNAiBgcgn0eAOe+NNZGbT5won0gbEqDmztoVlVfGzMB
	k1dksV9paIHwIj35VU+fMSbLs19Fns/NzdmSO0y6UTlWmMbd3B6TZgeE0gKzNH7O
	6U4D4KaV9DxEbKL6J63HS9S0mm+yGRuP0IAtxhxUq9I0cdapOh+gc7GZ54KuWOg0
	ZrO1E/DdgOiDf4B+dEuBKZW2v2y6GyeyenBlFtX5K0Drk822tukdOTVusafIu5Ai
	C6EapM10IYyeXr1xVzBH76Mg1914Hh+QA64vjZCEbY5zBHGJH8tAcvUg==
Received: (qmail 1799867 invoked from network); 18 Jul 2026 18:30:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2026 18:30:30 +0200
X-UD-Smtp-Session: l3s3148p1@u4oBMeVWqSxtKXE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 0/3] hwspinlock: convert to XArray and add debug capabilities
Date: Sat, 18 Jul 2026 18:30:20 +0200
Message-ID: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TLDR: Changes since v3:

* address XArray-issues found by Sashiko (patch 1)
* rename functions from hwspinlock_* to hwspin_lock_* for consistency
  (patches 1+2)
* add low level debug capabilitites (new patch 3)

I will not add more functionality to upcoming versions of this series,
only address review comments. I do have a list of issues I still want to
fix in hwspinlock, but only once this series is applied. So, I hope we
can upstream this soon.

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. Also, for debugging the hwspinlock
core, it is helpful to change lock states from userspace to trigger
corner cases.  This series adds support for all that. The first patch
converts the subsystem from the deprecated radix-tree to the easier to
handle XArray (Thank you again, Matthew!). The second patch adds the
summary in debugfs based on the new XArray implementation. The third
patch implements the low level debug interface.

Patches are based on linux-next as of 20260714, no more dependencies.
A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) with one MFIS
instance and an Ironhide board (R-Car X5H) with two MFIS instances.

Looking forward to comments.


Matthew Wilcox (Oracle) (1):
  hwspinlock: Convert to XArray

Wolfram Sang (2):
  hwspinlock: add list of mailboxes to debugfs
  hwspinlock: add low level debug capabilities

 drivers/hwspinlock/hwspinlock_core.c | 349 +++++++++++++++++++--------
 1 file changed, 254 insertions(+), 95 deletions(-)

-- 
2.51.0

