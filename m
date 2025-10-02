Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2A54758;
	Thu,  2 Oct 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413926; cv=none; b=rP2j49N5TpgxL8QI8F9KyL4dni0nlM1XVc9qW6OCAbIfc2kqLHKHicE1OGLIyWaA4AQsEZniNMYojWHbPoIQ6vP3S73iC4fFt08JJ8ENNaqZOZmAGVhV6hdt3BdIkCSrNHtf8fR7wu2dWgm1tDNc8cTHlZHAv6bPfszsGqzpKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413926; c=relaxed/simple;
	bh=fwUU75tE/L/SaSj6jeuDJTLxUm8dKRC/V2H9lhFfP5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dS77Iwedbe9qOuiE8i2b3ByThRqWxB9v+yIdpvIfVR/jqbO7xStFELPM3o/qu5OyGxHugptNylJRiq8fNKIR7et4A2+1M5vP4Vt6i8/8m/mUPgeKOLQBBMi82J/ergWFytYxYMa6g2SeSq5HndYK881y3OPRltsKumpNI5x9H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0B9VjXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0B9VjXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5720C4CEF4;
	Thu,  2 Oct 2025 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759413926;
	bh=fwUU75tE/L/SaSj6jeuDJTLxUm8dKRC/V2H9lhFfP5w=;
	h=From:To:Cc:Subject:Date:From;
	b=X0B9VjXQ3AbAg1xZw/dUv4ctIVICFUOEYxtzvdgPoELB4yNdweSPl2lmyWyJm8Qy3
	 MuwZ27SXcIgzoisVQQMG6Wxg2NlvwxUIX3PVoMnmQLVOXiudG8DnyZZXU2m6Gt9I7x
	 ZmgwZ5BWf5jN1nAPe5Y6NmKnQxlyhXAzrDSvYQP3q0K00z2LveSV0ixlwTZ02NSr1c
	 S85fwj2MAJ044ean+EAdaTBX/6JpkuCagAfzLHpiH1XrNRwR1mYIRZUYjoiSbBde+B
	 PLu7BCnpllVxbPI67jYAGBYi8+f+4Qe6azHv56KneDFzWk49NVLyCq0qyFeaRNwPLW
	 ntSHDZfNBqf/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Davis <afd@ti.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [GIT PULL] rpmsg updates for v6.18
Date: Thu,  2 Oct 2025 09:05:21 -0500
Message-ID: <20251002140524.64158-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.18

for you to fetch changes up to 09390ed9af37ed612dd0967ff2b0d639872b8776:

  rpmsg: qcom_smd: Fix fallback to qcom,ipc parse (2025-09-20 21:29:48 -0500)

----------------------------------------------------------------
rpmsg updates for v6.18

Clean up the dev_pm_domain integration in rpmsg core. Correct module
aliases for the rpmsg char driver.

Transition Qualcomm SMD and GLINK drivers to strscpy() and fix the
regression in legacy code for acquiring outgoing interrupts using the
non-mailbox based mechanism.

----------------------------------------------------------------
Andrew Davis (1):
      rpmsg: char: Export alias for RPMSG ID rpmsg-raw from table

Barnabás Czémán (1):
      rpmsg: qcom_smd: Fix fallback to qcom,ipc parse

Claudiu Beznea (1):
      rpmsg: core: Drop dev_pm_domain_detach() call

Thorsten Blum (1):
      rpmsg: Use strscpy() instead of strscpy_pad()

 drivers/rpmsg/qcom_glink_native.c | 2 +-
 drivers/rpmsg/qcom_smd.c          | 4 ++--
 drivers/rpmsg/rpmsg_char.c        | 3 ++-
 drivers/rpmsg/rpmsg_core.c        | 5 ++---
 4 files changed, 7 insertions(+), 7 deletions(-)
