Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197458;
	b=HTD9wKt4jMeaRof31XJGYuwMpOF++S0uBG61AoxM2VRIWHA/SBpRb18wrnoJL1l+3F5g
	 nUhP1pU7O79/eKHjMfP9GK7xsVtBSvi+jCthW6uoghfMrWGXLVIq4aRsOnaZmEfzOr8PZ
	 oaeNEmx1i4gGBl2CQOyO4qogg25ZhvPjIIK4ZfncnfFLiP2a3bT2/1d0Cq/wPEsrAUXbo
	 6Kp4+tvj5Ka216+lcKMBEY2cWYDLhUBMM880zP8oZdK07p63YloKJO6ODF2mDJwpuV7Lc
	 z0vgf/PlfRFn62wMJQl5lsrwrEJNHKMMb+VRpN3SCW1KSJnSS3iifDdZ62hOQkB430g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197458;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wcp1drlgK5GgoHNBSUScC8DcoYuNFoT0Jg2id6Fg4Nk=;
	b=EYpzZIEiKF9yJWY7c0jWvmc149H6vGzT03DjssDfdagEuYPcqej9cX+1k/vJoCPatoRI
	 hhDOIyGwf6cuF2mVwdoyJNQaOKHOg6mH0X/EXbiyfSsa31kulZ6g3JHQUIqZPxSy4lvlY
	 r7a/HKeMPM6nM7otGfphyFltCEXmf5122YaUrVywW96rz99p7v6BX4YEQusDcoM2rYgN3
	 4151HghUZvVgzoWMMNYwcNfSO+FiB6MIDVtUxTHqFT8QRHZC+oqXAniVzi2FV1kCRBW7F
	 LaiteelhPWFmf68/HqrCYQ4fTZNWE3ILAMrynvv/kVxI0fu4/916oodRCM8dNKW/vBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O35NqLXi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5889A60A2619;
	Wed, 28 Oct 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O35NqLXi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262981F031E0;
	Wed, 28 Oct 2026 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197457;
	bh=wcp1drlgK5GgoHNBSUScC8DcoYuNFoT0Jg2id6Fg4Nk=;
	h=From:To:Cc:Subject:Date;
	b=O35NqLXiTuXlpROfriABfhzuOc2Cu4YGCgsKgflgUkET9p1A/P+ZzAVJOCeumUW/U
	 FnUDeEHbPLFaiH3NwdPJgdIMHkgq8m66Zl+jeyDkNda/f87MLFt3uQCioC/Dxxa//3
	 8S17q2woEqkhxLB0MrXopLyFhYjmrjyUE4CfSxFCgGTY3PLfgo1RzIx4Kdu2KFNE95
	 LHT2v8kb+EaMFpPVg8ahKsK4lFzVdIVoCqkAQWUjskQhzpR+CrUpoHqlvaj8r4JYNF
	 lme03Z0YFrPNK/FTjvHmxxDdAnM+HYYlb8Lkd0oLZBgxSTOoV4eDg7LaNIxCLxep1W
	 hZ9Wmq+skF/zQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tanmay Shah <tanmay.shah@amd.com>,
	Atul Akella <atul.akella@gmail.com>,
	Avi Weiss <thnkslprpt@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [GIT PULL] rpmsg updates for v7.4
Date: Wed, 28 Oct 2026 09:24:14 -0500
Message-ID: <20261028142414.19573-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.4

for you to fetch changes up to 7dd4cffdf4c2a496ccf783303a03d687a2127baf:

  rpmsg: virtio: fix error handling in TX buffer wait (2026-10-14 09:45:47 -0600)

----------------------------------------------------------------
rpmsg updates for v7.4

Allow virtio rpmsg to use separate transmit and receive buffer counts
based on the vring sizes, and obtain buffer sizes from virtio config
space when the feature is negotiated. Document the configuration and
report the MTU in the sample driver.

Fix signal interruption and timeout handling while waiting for a virtio
transmit buffer. Release the device tree node reference on MediaTek
channel teardown.

Convert the rpmsg control ioctl comments to kernel-doc format.

----------------------------------------------------------------
Atul Akella (1):
      rpmsg: virtio: fix error handling in TX buffer wait

Avi Weiss (1):
      rpmsg: mtk: release channel OF node on device teardown

Nathan Chancellor (1):
      samples: rpmsg: Fix mtu printk specifiers

Randy Dunlap (1):
      rpmsg: ctrl: use kernel-doc format for ioctl macros

Tanmay Shah (5):
      rpmsg: virtio_rpmsg_bus: Rename rbufs and sbufs
      rpmsg: virtio_rpmsg_bus: Allow different size of tx and rx bufs
      rpmsg: virtio_rpmsg_bus: Get buffer size from config space
      docs: rpmsg: Add virtio config space details
      samples: rpmsg: Add MTU size info

 Documentation/staging/rpmsg.rst     |  17 ++++
 drivers/rpmsg/mtk_rpmsg.c           |   1 +
 drivers/rpmsg/virtio_rpmsg_bus.c    | 161 +++++++++++++++++++++++++-----------
 include/linux/rpmsg/virtio_rpmsg.h  |  41 +++++++++
 include/uapi/linux/rpmsg.h          |  15 ++--
 samples/rpmsg/rpmsg_client_sample.c |  20 ++++-
 6 files changed, 200 insertions(+), 55 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
