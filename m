Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A07231828;
	Mon,  2 Jun 2025 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873358; cv=none; b=jX0GxHGZRQr+guG562iTw+sFaV5bjxQj+/LvpoT/P3RkhJJ2SvHM2EScojN5H9c3qNpdYGybwNlewBPCK0RW99ggma5+I+02XEQLm8MJkNwjp146QZFgOUR7a4fe3aM5ZYD8K05Lce5uPunXRSRi0syZsF819veozFVWkPNAOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873358; c=relaxed/simple;
	bh=y8w/66BIL9zmkxAHPtrQCTX2H2tnoXUIU+AQZjQdQcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AB0oZMJid0yuL32WgoTlz4uSZ5sBiOLtyiMW/G7bboHbcfCrKCTYZ8GDDVoRVT9sTPdb/HyldimrPFeBP5rjRdPjQxzGZJjQlnt6Hd4dmLRbqIaa4M9leKbarQ3Wxr/oiGDqFt4seIDzKZ0Dez5U40N9PuDQgXXnLOVWo9tg7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8DYVgqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8DYVgqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D723C4CEF2;
	Mon,  2 Jun 2025 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748873357;
	bh=y8w/66BIL9zmkxAHPtrQCTX2H2tnoXUIU+AQZjQdQcA=;
	h=From:To:Cc:Subject:Date:From;
	b=i8DYVgqZK4sRljYzaiZX2DqEBQYEsVVOizInbwCAIbcSDVya7kXDKya9qKfaeo2vY
	 FFmXyn9aHnfcsfbbYmT44a0/G/VFzx3vBLunWcUOUM6YQusOgTorm9eXNXBzhF/rfw
	 Asv0iFxZr/Di2rux3uh1VtO6RCzeMOqQ3GUj+X8udnIGJoNUV0mzlPk+81rd5nIWMB
	 eq0aoV5UCbW1tsxisscq23tOTFuJ/TFazEYt5BJj11yNjyjN3awtCQN5gEIVuudtNO
	 xquWvB8nq2AbXiB5+xmd1eSyEkHhBrN7SMWhfwpQFRBptYmO6Y6T1SBqTfStlEBEWk
	 qlKOKtCpNs4LA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr . David Alan Gilbert" <linux@treblig.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [GIT PULL] rpmsg updates for v6.16
Date: Mon,  2 Jun 2025 09:09:12 -0500
Message-ID: <20250602140914.2086-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.16

for you to fetch changes up to 5de775df3362090a6e90046d1f2d83fe62489aa0:

  rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send() (2025-05-20 21:46:10 -0500)

----------------------------------------------------------------
rpmsg updates for v6.16

Remove some dead and unused code from core and virtio modules.
Improve the error messages from the Qualcomm SMD driver and initialize
an uninitialized variable in the send path.

----------------------------------------------------------------
Dan Carpenter (1):
      rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()

Dr. David Alan Gilbert (3):
      rpmsg: core: Remove deadcode
      rpmsg: virtio: Remove uncallable offchannel functions
      rpmsg: Remove unused method pointers *send_offchannel

Luca Weiss (1):
      rpmsg: qcom_smd: Improve error handling for qcom_smd_parse_edge

 Documentation/staging/rpmsg.rst  | 46 -----------------------------
 drivers/rpmsg/qcom_smd.c         | 10 +++----
 drivers/rpmsg/rpmsg_core.c       | 63 ----------------------------------------
 drivers/rpmsg/rpmsg_internal.h   |  6 ----
 drivers/rpmsg/virtio_rpmsg_bus.c | 24 +--------------
 include/linux/rpmsg.h            | 22 --------------
 6 files changed, 6 insertions(+), 165 deletions(-)
