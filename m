Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE635C181;
	Tue, 25 Aug 2026 20:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787688919; cv=none; b=nvmHmlVzfDACwYsb9CnWWS6QAA7Q4cUkhsw+1Y24F55RydejNIOh4KGtRzYrBRqOdTmel9zu4+DSSP4I9VYVb3ohvzRZQSh8liz0y2zvUk+HJ0Rqnrl2EOKMBTY2kZI7R3fdhb6e7lt2O9XhjK0a9GCVwSxm9tan/oMw0QOhc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787688919; c=relaxed/simple;
	bh=SPVoKYDrqAY7kw68rFHzca4QTzWZB7B7Q5EQE57XdUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9PguX+C8U9z3fRivg7f2uFj+WH7smsisJYvijf7cMigoeSPUGHhuTzvs6+uzxdz4E3+3YTuGYKe3uMdMioiLzUFrpxcf5FtRAXRoeMa7E9ikmQhRsKi9aN9OukfwTuyftC/TX5mWmYol+o5rOPtYDt+9mumm4Rsoy7/ftGkbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWdXxeUI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWdXxeUI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5341F00A3A;
	Tue, 25 Aug 2026 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787688917;
	bh=Y2q+gNmf0AwMTF9XK/vyceND/li66liyrsEaj0X7vAg=;
	h=From:To:Cc:Subject:Date;
	b=FWdXxeUIwJlLYAeQ0AikLL4erIy0PI5YY9eOIquk62qRpCCn10Q2AyvqCNa4Cl5Jm
	 xBcshDKSgVsWSUJvKhrzN4iqm/OcvaOCjGS0FveAmmRdKy08oAATRFfLa0j8vtvKgA
	 MJxOR9NclM1UaRdYHi9JdrGTb+6/ka2tnz7j9PeoH1S9ctuP9nzrJ4NoY94j/Q+vnb
	 AonTjHWh9Hc9a+Q1txZrCX+4WBVh8EXb6KY7bOIH+mEieBj9kZDJCeDmWHMWhUVkZL
	 8/GPpAybKjrlNyLj59rN9nBLhQGytHHWz2BnsQS1DdVh6jEr7dfVjxq1g6rgJBiA8w
	 3lCbO549uH12A==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [GIT PULL] rpmsg updates for v7.3
Date: Tue, 25 Aug 2026 15:15:15 -0500
Message-ID: <20260825201515.925724-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.3

for you to fetch changes up to 786439ad58763e04b91bc2ec5f590e463939f197:

  rpmsg: glink: smem: order FIFO read after availability check (2026-07-13 22:11:52 -0500)

----------------------------------------------------------------
rpmsg updates for v7.3

Fix a GLINK endpoint teardown deadlock during driver detach and order SMEM
FIFO reads after the remote-updated availability check.

Prevent duplicate rpmsg character endpoint teardown when remoteproc shutdown
races with RPMSG_DESTROY_EPT_IOCTL.

Replace unsafe string and sysfs formatting helpers, and correct the
unregister_rpmsg_driver() return value documentation.

----------------------------------------------------------------
Chris Lew (1):
      rpmsg: char: Check for ongoing chrdev destroy

Chunkai Deng (1):
      rpmsg: glink: smem: order FIFO read after availability check

Sudeepgoud Patil (1):
      rpmsg: glink: Replace strcpy() with strscpy()

Vishnu Santhosh (1):
      rpmsg: glink: fix deadlock in endpoint destroy during driver detach

Zhongqiu Han (2):
      rpmsg: Replace sprintf() with sysfs_emit() in sysfs show
      rpmsg: core: Fix incorrect return value documentation

 Documentation/staging/rpmsg.rst   |  1 -
 drivers/rpmsg/qcom_glink_native.c |  5 +----
 drivers/rpmsg/qcom_glink_smem.c   |  7 +++++++
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_char.c        | 11 ++++++++---
 drivers/rpmsg/rpmsg_core.c        |  6 ++----
 6 files changed, 19 insertions(+), 13 deletions(-)
