Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDCB2BEFFF;
	Sat, 14 Feb 2026 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093878; cv=none; b=Vqjpc3B84kZVDNSugDq+TUsSWffGY8InJWgM600H1ywIJVzK6q0NfEESBTw050+7Y1fMayiOrxGbnWUFQ7g0uQEQ0DJ4+dx2Nc3Svbx++kAKWrtQNRl2mDDlNFZxXAjNlcfZ/lDP1RQsG7cEdOmIyKr8V8SMAYT57A/bjfReeaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093878; c=relaxed/simple;
	bh=wXnXZezlS/6Nmto0gGwbiY+2Em2s+sAL0u4dh5lAfm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rii8drXDV1lQz1inyU1lDwxVjnHQfJeLR+Ygrd2WnEo95ReeLuSbAmsVwAJvtzlOXiFT3byfCUHMrz+2JKc4bOX4dUfc+O2qhds58ADqbsvfkFCmsj6S1ApU2xa0PZcHhxB4FujpO4Fxh0N3qQsOXC+3EbJOAf0jBAka1XOfxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g93ky2LC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g93ky2LC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C627C2BCAF;
	Sat, 14 Feb 2026 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771093878;
	bh=wXnXZezlS/6Nmto0gGwbiY+2Em2s+sAL0u4dh5lAfm8=;
	h=From:To:Cc:Subject:Date:From;
	b=g93ky2LCE395CqRA1Vm+71fGnvzSaIk7Avjv8AZ/yuVBrPVvVsnqNjtMfC9xT0fqN
	 LJVGU+wwW/Qlt1AshWQwGoysms8j4F1prEUMTPxAHZNwdndrHBzET0MagxwjDehwz1
	 WySFutKt8FHJ6rMpavYgcakprErrUWNQ0Dlw2KTKpuWNeqH7uwZ6qgk6UmGn+pBem8
	 NJ1aq4KAjjUQttg2ZVMLt6SK8jiwt7sPX7wx4/96Nqq02KWPVV38wFY2Rgqtupu/nU
	 syo2vFH6qQqtZ2390bbNKy6AgBC0eqpiRQMAZh2tovlHhjv+vjLZtIdnIuP+9xJe1G
	 lAFnWN07o7//g==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>,
	Patrick Oppenlander <patrick.oppenlander@gmail.com>
Subject: [GIT PULL] rpmsg updates for v7.0
Date: Sat, 14 Feb 2026 12:31:16 -0600
Message-ID: <20260214183116.3718674-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.0

for you to fetch changes up to 42023d4b6d2661a40ee2dcf7e1a3528a35c638ca:

  rpmsg: core: fix race in driver_override_show() and use core helper (2025-12-14 18:37:49 -0700)

----------------------------------------------------------------
rpmsg updates for v7.0

Fix a race in rpmsg driver_override_show() and use the existing helper
to implement the store(). Implement support for EPOLLOUT in the virtio
rpmsg driver.

----------------------------------------------------------------
Gui-Dong Han (1):
      rpmsg: core: fix race in driver_override_show() and use core helper

Patrick Oppenlander (1):
      rpmsg: virtio: EPOLLOUT support

 drivers/rpmsg/rpmsg_core.c       |  66 +++++++++++--------------
 drivers/rpmsg/virtio_rpmsg_bus.c | 101 +++++++++++++--------------------------
 2 files changed, 59 insertions(+), 108 deletions(-)
