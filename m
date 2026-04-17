Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333D2494D8;
	Fri, 17 Apr 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776456205; cv=none; b=dtPqGYOCNAvIc2l2Y3LPp21hzveEMmB8wpYTEpR8clkrgOIxkliOvtRCTUknTdq+VPf2Gh9onFtuwekKmMWYflQwbvxTuo3LNOu/LsBz8hErkpA3stKfsPzJDBILHdKumId4iTo+NHBZLdYcOBuh8yN9N9I3eCyUL+erpdFhAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776456205; c=relaxed/simple;
	bh=KnlmDb+rqMlj2COiPZu3IRaJApa0qLpmYVfWdZX3qEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQBVDv6c6g8SzK1Tgh+WhzcSBx2m2NfweYhnPYodwE4OSJy/eCtQ7BIYWGjJZxxNu/LWBjT/SrrT+grkXeriQTL+Ra2GWVI5NUfWEXSrt1J+NnnsZeSBgsnZfWVNDvuWgxRdQk2MrWi2slWlTHPvIi3bB1KYCzrqh6PNh+9vwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T26j4lfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T26j4lfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770F9C19425;
	Fri, 17 Apr 2026 20:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776456204;
	bh=KnlmDb+rqMlj2COiPZu3IRaJApa0qLpmYVfWdZX3qEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=T26j4lfb2x2PhS4QuXANHF4ZHID0wGk2bNdAUM5KZink1xFx7Js3nKgm2m4tHhuOy
	 7Bg503GLpUAu3/Cu7ecmSG4NN96t2lJlKvtzDovsQsDvTBZi83oEFTZC1czihlTDBA
	 nSJcwVKPFWKsZhUniBrEJzP7NdsWM1HiG9fdxAY85nUvlb9myI0na4BZmi8Ndl4Kdf
	 BjIU9gToAlzuVOHTMzfmWqXvkQ+N+HuS1qPA18ZxUbxLpr4TptGj49EXvlcxED0tJA
	 qgUoMyGkA4V5CBn8K5C3BzulxC6yMkLTHLdqjpnZPp/2SVHznZNpc0tO8NkigVO8XQ
	 oz84AYaJ1pKOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL] hwspinlock updates for v7.1
Date: Fri, 17 Apr 2026 15:03:22 -0500
Message-ID: <20260417200322.2582396-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.1

for you to fetch changes up to ad5fd5aeb65a4426635cf55ef06c96e60a66e648:

  hwspinlock: remove now unused pdata from header file (2026-04-06 09:43:18 -0500)

----------------------------------------------------------------
hwspinlock updates for v7.1

Remove the unused u8500 hardware spinlock driver, and clean out the
hwspinlock_pdata struct as this was the last user of the struct.

----------------------------------------------------------------
Wolfram Sang (2):
      hwspinlock: u8500: delete driver
      hwspinlock: remove now unused pdata from header file

 MAINTAINERS                      |   1 -
 arch/arm/configs/u8500_defconfig |   1 -
 drivers/hwspinlock/Kconfig       |  10 ---
 drivers/hwspinlock/Makefile      |   1 -
 drivers/hwspinlock/u8500_hsem.c  | 155 ---------------------------------------
 include/linux/hwspinlock.h       |  28 -------
 6 files changed, 196 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c
