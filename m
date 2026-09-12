Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9119D47A0D1
	for <linux-remoteproc@vger.kernel.org>; Sat, 12 Sep 2026 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240496; cv=none; b=JWOhym1VoWhxqaaSRKLPyxmIWpyJF0/+gQOryDruR6ED4wd8Ge3mrgQHVo482jirtHue4d/EsddcTnCTc9qWw8YRsicoZYInrtbaKOp/btGbTfxmva5epch2RbltWylFq8narbBOOvkLPpWYBeN9GNVyB91wwiKy7YcVuznAtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240496; c=relaxed/simple;
	bh=9jZZHtUJ9Vlf32LwXhb6U36qZzQLoX2JpeFyt2215wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNlR/eyb/1CCy/qzso24+EALFO06cl6qhK3kdn12Qx5w8mA8snD7lD7aUnQTpiBpqVEV59lKjUe/ZtnQO+rMtustSBuEhIlbLFYTf0pvWjjDl3fu+2koSB425XRZBNwSWjcfXyGrLdPuKbh2xyWrFHngN6WwdRPj3UOcJNu3xUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hihtw41B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hihtw41B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hXxrm04WuYpXWj
	7dY2iBnpaQCrhs6vSTXPHoviyO2Lk=; b=Hihtw41BDNXixCQAOap5zxnNxAdcja
	znNMqe3NGDepcOFB+axnRMONkBpHkhSoNk0UVaDfofyU7vmplXEgdbx+YEy0z98z
	D4Y5jP2UrSqTRG1sKCh7JqL64k5K8VbnSKfNgQeAhmCYMQORZZx66tv9Fp2s9Xhp
	o9WJ9nbRRH6Vg4e35CfytWrrzohe6QcdorHnBjBMzsoL1+rn/8ckbyzPaZvgGqI1
	nBi7p2CmKOpRsfJkA9qRziHCdy8qlf1n1RWr6j+f6ykG44u7q6cBELBfm2aYZsRw
	uGp9yugoyj9OQ5nrkkP9h6aA7rNO2pzImo6N8FcMWsfdpdBV9Fm8xhJQ==
Received: (qmail 105194 invoked from network); 12 Sep 2026 21:14:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2026 21:14:49 +0200
X-UD-Smtp-Session: l3s3148p1@hOzLA05bnrYujnsz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v7 0/3] hwspinlock: convert to XArray and add debug capabilities
Date: Sat, 12 Sep 2026 21:14:38 +0200
Message-ID: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v6 are only a rebase to linux-next as of 20260911 and a
typo in the subject of patch 2 (was "list of mailboxes" instead of "list
of locks").

I would really love to get this applied. Since there have not been any
reviewers lately, maybe it is time to put it into -next and see what
happens. I will be there to fix things. Or we just revert if it goes all
wrong. But Matthew is the creator of XArray, I tested this as much as I
could and I took the Sashiko reviews into account. I don't know what to
do else. But I can't continue fixing the real issues in the hwspinlock
subsystem unless this series is applied :/ Here is the old coverletter
for more details:

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

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/xarray

It has been tested on a SparrowHawk board (R-Car V4H) with one MFIS
instance and an Ironhide board (R-Car X5H) with two MFIS instances.

Looking forward to comments.


Matthew Wilcox (Oracle) (1):
  hwspinlock: Convert to XArray

Wolfram Sang (2):
  hwspinlock: add list of locks to debugfs
  hwspinlock: add low level debug capabilities

 drivers/hwspinlock/hwspinlock_core.c | 369 ++++++++++++++++++++-------
 1 file changed, 270 insertions(+), 99 deletions(-)

-- 
2.53.0

