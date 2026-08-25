Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E82882DE;
	Tue, 25 Aug 2026 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689953; cv=none; b=D7739jJrT+NP26bfMat3BlExYCE6Bi+hzViqsWHucFvjMyp4zcRIbQ5xHhAy+74mVDUsE27ablmkNoCUEmEF2fdjqApQzoj1V3OQ2R7NvMx29atZX0fbmhcB/nIZfqXGT+shQuhYuznBI7CjcDWdYoS0W83R8k4xHABO/1JunB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689953; c=relaxed/simple;
	bh=h38V3pH8+om1t/WpUoFuAJDKlMuY9FRasz53mybOZjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PA/aaYQ8HzsTzEcaR5AE2ytypPl73wj1gL7au/F6yDofGlUZ2VpA7q77Fuapy/vdDAVCmKPT/RjlM4fX7eBwzbRLb9hVdyk6Rcb0YaYoZ+zttwTqZuRy3+AKpn1rqFInTq15vSNFHQjC8rkCLYNOXYtzCOM3t7L35Xkk5zu+hCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQ8CfbWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQ8CfbWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9721F000E9;
	Tue, 25 Aug 2026 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787689951;
	bh=/S5uyk4+sK0dycfMN1eEdKiBkxQZrr65e1SQBXsaQeg=;
	h=From:To:Cc:Subject:Date;
	b=ZQ8CfbWijC68ovhTc4c5aQwKWBsNCjLArK2f20hChByIH5JBkeCGAQP8TfNAzFjWA
	 nbsgO5tj5PKZtzXJl0i51V7He1xMR8LWJkOK/dUBMn6nAccibh20VgGIFYa3Bnm0LK
	 2QNpThX0XET1nVsIx60qeNaAOfRaZSO6xniI3xtDdH6wFwDZlaGmsbY1B7dXNXuCQy
	 ZNHOMxzCXkPlTG4f0WmRcW4S4HCaZdoCzBZqaFSU2/rYnockvcK6biE7X4QVZebxnh
	 aiumdKKf2vVLbppWp3+KoyNC6xf6uB/e+0CiB6/1gYTpGRQOVCSI533VTOH4DGuFMd
	 XCiMvOCgndDtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL] hwspinlock updates for v7.3
Date: Tue, 25 Aug 2026 15:32:29 -0500
Message-ID: <20260825203229.926213-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.3

for you to fetch changes up to e088ffa9a00eaaaf90da74763e774ca160969c26:

  hwspinlock: propagate errno when registering single lock (2026-07-09 15:31:44 -0500)

----------------------------------------------------------------
hwspinlock updates for v7.3

Propagate single-lock registration failures from radix_tree_insert(), making
caller sanity checks effective.

Update the hwspinlock MAINTAINERS repository URL to the current remoteproc
tree.

----------------------------------------------------------------
Antonio Borneo (1):
      MAINTAINERS: Update remoteproc repo url for hwspinlock

Wolfram Sang (1):
      hwspinlock: propagate errno when registering single lock

 MAINTAINERS                          | 2 +-
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
