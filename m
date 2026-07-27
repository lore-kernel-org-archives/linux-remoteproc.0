Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818F3EEAF8
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146778; cv=none; b=Nxgnq8Q1XkXGfAH7SnZwUZeoSYCUb868QykBtCKqVT7G+Yc5FpI2PJgVff1zK3Ly1O8vu4NVQkqQggGqBXQa3x+yTC45vwU1sUuH7rfviFMsHW5RN+PKsVeYTAAZ0e8swioma/V71W3cPDGvH/7z0TpZHUhvFiC9Uo18JwuGzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146778; c=relaxed/simple;
	bh=+6rutF/0oIgNb/DPqcwB2osVtEnA+E+Ie1S8yM6zQ70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ve5XGYpHap9UVIH6b9TgvMvO4/xo1tNpIdRJf/58qVa6OyvnNHi607xi7BUACttSW6fUaC/Iu642d/Ug1fLqGXE7wNL27b+UAIWqgKdsfuN4cZtajxdwNDW3MXd0b8a0TYWvnOocAE2hVlX4pYY6NEZnckA6AJgwRlAqhi9bOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KlcbnvcT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KlcbnvcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rufiXrhTADm2oI
	YaL4YEPVNWH+5IYs7q5ZEjOJQy9Fg=; b=KlcbnvcTycZDhEab3i/tw/F/9yhEcO
	UnCz+Sgf2cE9rCMRt6I1s9xiSHoA1IAR7SetUYwsvDl/Jan1sc+BxBZAFPZJaJja
	XSM8UIp6qyzKu+6MnJ7wei2+onIdi4hyB+myfGLwR8m3ys6qyiccaYb8QEQ3UCl5
	6RBJgiRLvZyeKRoKxtz0SJcJinKstjLK8EyaB0otLT8OwJZicESdoSiEF26Lld8x
	8AnxBzWU0340gre1ghv5NvvH7/OCVBY6RXytqJE8dKGF+vhUpoK+sucMCPXorTu7
	QFilVs0SrHEeCxrzOC9q+xQPWvdtQG1t1q3SVpi0X9JP3FrXwwpqonkw==
Received: (qmail 563919 invoked from network); 27 Jul 2026 12:06:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 12:06:11 +0200
X-UD-Smtp-Session: l3s3148p1@Kjgk35RXnJAujnuy
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v6 0/3] hwspinlock: convert to XArray and add debug capabilities
Date: Mon, 27 Jul 2026 12:05:58 +0200
Message-ID: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v5 in the individual patches. Nothing high-level, though.

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

Patches are based on linux-next as of 20260723, no more dependencies.
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

 drivers/hwspinlock/hwspinlock_core.c | 369 ++++++++++++++++++++-------
 1 file changed, 270 insertions(+), 99 deletions(-)

-- 
2.47.3

