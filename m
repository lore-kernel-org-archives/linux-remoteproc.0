Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DE45D182
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639029; cv=none; b=eJ2LU8YlAAo91Hgde+FOjvBJGBC/H8FA9EM35T3/ZE+rtLiW7jY7ED1weli7C7m8DBhK30/1l7KiIi+9yWMvWeJaoajCjkuezepQoD6XlFiOes0ZiZbZ7M0xN4H5taAmVEfXb9UHLyE7QPzNfw7m8/qrGttMC77jaaoiKhfOzeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639029; c=relaxed/simple;
	bh=4KIKySTrl7ZFxe0OOUgwjc+I5pZFMisp4lHZa1xLLpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbdA0inDCPuslhq14GKaseO6/qOHf1gL1u2u7r/fdYMOFcp0XRjZNNtmHDs/TCNHdjK8qKIuB32X/mtkeDDUpGmQFTPXCPEjRFNTY/kJ9ujNBun3OUSDIo2UwfxhG7xs0HXh15QgWVoooT6A+2Vv47MKTzItkxHYORHYLHkJEy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DnVzmPSw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DnVzmPSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=qTObec7rpLi74s
	aO5NJa0A7ZhO5/fgnROEGa4je+kAg=; b=DnVzmPSw5KKj6owOD/t4LineHS+Jjz
	UnefkQfFrv9dY/eebr9/czpx7Jb05hxDDZiuwSkWHW0tOTj6xoeFnb7hjeNdVfu7
	TSMS1uA/GePZZWTx9qOAq4pRzEo1FCF9xtPXtLWQbx82xcbYzELUtP5rWzaCGZ6i
	mlF4TDHEkrci2txbCW9h343rawny+p+WzE4SX+IQekd+CYsv5TDLZdFRQbxGkj5W
	PqBagfohXNTXUcSyX/MEEyCic7PfSIFUPq1J2SU7/G8aHlpp/jmbGkbiXSEt3c1W
	QYnZEp7WdWaVSUzlVSe24rD6qS4QwEbmBYuj0BqlUxeEVJWtAnwuJi6Q==
Received: (qmail 1948009 invoked from network); 17 Sep 2026 11:56:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:56:51 +0200
X-UD-Smtp-Session: l3s3148p1@IBaRzapbkJ4ujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v8 0/3] hwspinlock: convert to XArray and add debug capabilities
Date: Thu, 17 Sep 2026 11:56:35 +0200
Message-ID: <20260917095639.44159-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v7 are minor and described per patch.

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

 drivers/hwspinlock/hwspinlock_core.c | 372 ++++++++++++++++++++-------
 1 file changed, 273 insertions(+), 99 deletions(-)

-- 
2.53.0

