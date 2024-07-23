Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335215444F;
	Tue, 23 Jul 2024 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721754962; cv=none; b=hnGWY6G2mG36p4KeJgxf0cZEvjjAfA70IPn6laQZ1hWBs3JogsGwWEvhklUjJ9K+E53y7FdsOVvHT1N3a+jzY0hbO+vYNnSYbY9SM2M8vAMQC6sHCwbveN87j0/NMLmE6MEANa2pWAi2To3zJKn1UuVo3kKFnxdA65eJpX8v/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721754962; c=relaxed/simple;
	bh=VQxAeIcorpOyCUotQMknlDk168idtoVzp6TezVfx1Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deDSiPVDP7BvzkJqoVIRtQKKziq19PbDnevWJ8V9KPpxQNMqk1ksRtSTuuK7T8a9PNRojKP//fNlBB+L+8bxEbiug/ZfRGTDzxOOjXibiVxsuhvZ8cOFFfcBoIoElUhlPu15zsfdyzlS4mI9zoj/PtccLtippL6jeVdugj30Qto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piErJ3Ar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piErJ3Ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5372BC4AF09;
	Tue, 23 Jul 2024 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721754961;
	bh=VQxAeIcorpOyCUotQMknlDk168idtoVzp6TezVfx1Cs=;
	h=From:To:Cc:Subject:Date:From;
	b=piErJ3ArZcIr0ECPLcnjR4gc3luJgxls1HTR5crB/WJ83MtxJDrbc1UPv95greC2W
	 RTW6M28hdbzM2P8Jb8/xJbHNrnh9gMw00MK8j2wxxU5iSXfGcUXumTgWXV+aOxL+ql
	 6HmL+1mFST9jEa+VMCChB+Vns/0f3jUWHTU9HlCMQrXQRawEpyQNZP21cZSkxVJ1lV
	 9JLTbA3sfTDdWcKM7EAslQ1AP+YtkgemP07JUdoNYGA0BqCkwcjKli4XPoix7+8PSQ
	 lbrtoFfd6F3ntA/aGj4qoyXw5LhZFmayXZgHarsJ6clY6D8uN62Cngu2WWPxQYqP4C
	 iN4qzTQyMfg5A==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Maina <quic_rmaina@quicinc.com>
Subject: [GIT PULL] hwspinlock updates for v6.11
Date: Tue, 23 Jul 2024 10:20:47 -0700
Message-ID: <20240723172048.3684527-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.11

for you to fetch changes up to 718a7ad700b1ea86ae5a3ee636a275f98ba8ef86:

  Merge branch '20240529-hwspinlock-bust-v3-2-c8b924ffa5a2@quicinc.com' into hwspinlock-next (2024-05-29 12:52:37 -0700)

----------------------------------------------------------------
hwspinlock updates for v6.11

This introduces a mechanism in the hardware spinlock framework, and the
Qualcomm TCSR mutex driver, for allowing clients to bust locks held by a
remote processor in the event that this enters a faulty state while
holding the shared lock.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch '20240529-hwspinlock-bust-v3-2-c8b924ffa5a2@quicinc.com' into hwspinlock-next

Richard Maina (2):
      hwspinlock: Introduce hwspin_lock_bust()
      hwspinlock: qcom: implement bust operation

 Documentation/locking/hwspinlock.rst     | 11 +++++++++++
 drivers/hwspinlock/hwspinlock_core.c     | 28 ++++++++++++++++++++++++++++
 drivers/hwspinlock/hwspinlock_internal.h |  3 +++
 drivers/hwspinlock/qcom_hwspinlock.c     | 25 +++++++++++++++++++++++++
 include/linux/hwspinlock.h               |  6 ++++++
 5 files changed, 73 insertions(+)
