Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2027F40D56A
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946793; cv=none; b=mGwpa4A5CjNTHWdWxaj8739CXjUY0D7ds5fjxWdLzpkiRywTMGMVPhZk9luocZYm49v9sbwdPywFiZ3Jp7cCSz9Olccu/qmWfqUmfwGTieYH/NZ/ya7L9mbxYnUZjSwVj2oUqh3ZQz9KJ6abo8318fUbx3Q0+N3JomDB2PWn8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946793; c=relaxed/simple;
	bh=rz8CWkSn+49i2NJWWC5d6JiBRZXfpOPZXkL5SqKfX1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aa49ldmn1ElAxH3+OsFrUFLXZR/3M6CoP2ybTaDImdiRFrcAqKUT27CCJt1wW+2jbLoK1nhdhFGG5b6dykpzbszmHHN+IdyRUlOFJmFy86iDFZ43qS5QrY+29kYiKIQ7YTLAIpgCw3DrB7tLhtCda7pFSTxULwMJwS4/CJSwP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FHKBIU8C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FHKBIU8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=KYKAFdYP7u5NJk
	Po0f0N0TXThdhpbi/KyYDSFQfHFD0=; b=FHKBIU8C3yMW0i7XDKRbDguGSLSqPi
	rgax/OsneLaabCCU13LeFQ1D0iC1fZYTwFjvjZ2vpGII1NQiMPsaWCDUCTuwO8m8
	qKEIRPOLPDzEq8PsZm7D4XaDiNW8ED8iw/N30JzcwjHEH5/wwJu0bTl49mdJvjg6
	AYb76rJMxWFqUU0GPBFXl/fuwxfZqplRxVSP96YPuGRPnGa2aRp6mcL7WiQ2ohuR
	1PidZHzv9EK/Btxy9vYc63WBBMkVPdXacFRoroWBO1wrrqlRynNLgRZOQnWvoJa7
	As/Vh3Y/nbDiegbf4SiM6ZJ+xiH3kgnxEGi3a3FOU9VNsBIyGAz+rjAg==
Received: (qmail 2634198 invoked from network); 13 Jul 2026 14:46:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 14:46:24 +0200
X-UD-Smtp-Session: l3s3148p1@86Reen1WuNEujntq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 0/2] hwspinlock: convert to XArray and add summary in debugfs
Date: Mon, 13 Jul 2026 14:46:20 +0200
Message-ID: <20260713124622.63181-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TLDR: Changes since v2:

* don't hack radix-tree, convert to XArray instead

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. This series adds support for that. The
first patch converts the subsystem from the deprecated radix-tree to the
easier to handle XArray (Thank you again, Matthew!). The second patch
adds the summary in debugfs based on the new XArray implementation.

Patches are based on linux-next as of today plus the already applied
patch[1] "[PATCH] hwspinlock: propagate errno when registering single lock"

[1] https://lore.kernel.org/r/178370682988.2572738.9921265128936208294.b4-ty@kernel.org

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) with one MFIS
instance and an Ironhide board (R-Car X5H) with two MFIS instances.

Looking forward to comments.


Matthew Wilcox (Oracle) (1):
  hwspinlock: Convert to XArray

Wolfram Sang (1):
  hwspinlock: add list of mailboxes to debugfs

 drivers/hwspinlock/hwspinlock_core.c | 220 ++++++++++++++++-----------
 1 file changed, 127 insertions(+), 93 deletions(-)

-- 
2.47.3

