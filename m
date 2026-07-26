Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4A36404B
	for <linux-remoteproc@vger.kernel.org>; Sun, 26 Jul 2026 21:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785102160; cv=none; b=UtVrzP2tgvlKLEVU7KNQSiJjAh5AxvpVWqKf9irAeU5nIGULcRFNvAl9ITvJXeJFfd71w4VH7lrTk1KspcIJg4yZWBi1jvKJ7OhRGInzluDsniC9LBTo9yVNU9oAQSOP9e2p1ggsyDn/cMdP+DLlF6D/8pbsKmWw2ua6Vhfi3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785102160; c=relaxed/simple;
	bh=H3GLbf6k7oCfeZthKcNg9O9r7TeUuasD3M7s8+JNdDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJybGeK82ezgZHeLW9pkv2pHnVFHuApk74CJtrBYbu8CX7QfCtdrGsR03JFYnkYfW0OKjwR9FCP14B5/fpc/3AMxR6WTLU303OtIMs+W1ZSY0umKz2xmJHiqAkrOt4VlrwENPRzKIjp4Z9VrwwvhmA9qFzPItmjpPIyCB7DYJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UQvQjm+9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UQvQjm+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Y+Hbs9vNai3Nyz
	cCh9dwLoAtkQ3B9+h1czgHOCz2f4U=; b=UQvQjm+9ai9LHTanb6L42+WdY7XEs8
	CGU273I5SL5Z2EoNithL+8CFfDWA2cBXHGk914nSwFp5BEBeXOJt3lMPdCvxey2A
	sXvcJhWMh6yOHg1FeC2WZtBoMKs8Y/+5V9SH3TUyuiFcA7jYAM2JnzLDHh3/Z5nq
	pI9+kNznbh5pbLfsFN4sMhfGOh2+BwGsHsw02lFOdD6bj1Y+W9rJdNGlUmg6rgqe
	GqLT4VXwgamPKzltD5VDsxCGYSA2/f/7QaBZF3Aainf2tpE6Nl4S/uh5Nb9VOnEJ
	cDgQzb4u8h8Uxx58KN999Hxd18UxtV9iY0dGTqC61kSWmHz+TbO4q70A==
Received: (qmail 384125 invoked from network); 26 Jul 2026 23:42:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2026 23:42:36 +0200
X-UD-Smtp-Session: l3s3148p1@DcHue4pXip4ujnsw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 0/3] hwspinlock: convert to XArray and add debug capabilities
Date: Sun, 26 Jul 2026 23:42:19 +0200
Message-ID: <20260726214219.17703-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v4 in the individual patches. Nothing high-level, though.

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

