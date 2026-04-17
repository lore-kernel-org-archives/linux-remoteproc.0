Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCCF221DAD;
	Fri, 17 Apr 2026 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776456119; cv=none; b=PFUBk5kad9cfbeZW92IaGJEb3tZKv8t4eMqZlDPvsS1+sJL9lBPnhVuZNgWsKC0N1QBm7O7BPLp4ASzv7Wyvf1BvVTyQARw6c2kQHdEwA5SG+6xp6XhjXja87x/0j1Z5u56QI8ZpvMrm86yvZXwQy9gn9Kwgn2pAiAIveFure+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776456119; c=relaxed/simple;
	bh=DvI9nhLTfPcuZgfIlJKxk3JdSOqp1/x6jXyQ57VZL9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/sNU6KmBBxuqLdIMAM9o2LvYDrC6Cb1jxi0trHqU5iRc4qCy+tTPHS9i8ILsJQS2/R6qZtxeDhXEBiilLRpfK+iUcKP5FOGc4qU4zZyuZYtSf3iCkQTY4yeq5jPyf8LlplTNpwM5+vocbfxdFiAdmPF2Qe41LSZ0ww00XjsQiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4wU8/BY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4wU8/BY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B271DC19425;
	Fri, 17 Apr 2026 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776456119;
	bh=DvI9nhLTfPcuZgfIlJKxk3JdSOqp1/x6jXyQ57VZL9w=;
	h=From:To:Cc:Subject:Date:From;
	b=c4wU8/BY77cntM/bYHR4TMSQnDoVwiGktLXvNPy0OoojRbuQgkALhk3YvSUAp4aIi
	 Znoa0T1VxIaKIXrfrHdH/mp9pbcZd0fpYyzrdhQpMyxX+tPGFae+eqi2bfIu5CaJ2r
	 +4CbB2IUzthJUhx2+VLHUeL6dPTs3bLasK0wHo6O+kCpbhlIIAyFPDl8/R5SPObaip
	 hKFEOS4ylc/zyiUHIAUfFOCZaOAInF2vaQHpCJejj0TZrD1RHyWzp8xlgl/OPuQNkG
	 xI+aBLacrje+2JGdVl0FTKi864BU1UWa9E6UgZfKTnCJ9S07vIHv59ZNvdRyrR9SYn
	 C4LQLU1vw4jfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>
Subject: [GIT PULL] rpmsg updates for v7.1
Date: Fri, 17 Apr 2026 15:01:56 -0500
Message-ID: <20260417200156.2581631-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.1

for you to fetch changes up to 3e2fa997d1e2b651993ae7e81646aadd55470bce:

  media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg() (2026-04-06 09:40:34 -0500)

----------------------------------------------------------------
rpmsg updates for v7.1

Mark "data" argument in rpmsg_send() const, and perculate to related
drivers. Replace deprecated class_destroy() with class_unregister().

----------------------------------------------------------------
Jori Koolstra (1):
      drivers: rpmsg: class_destroy() is deprecated

Krzysztof Kozlowski (5):
      remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         | 12 +++++------
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 67 insertions(+), 58 deletions(-)
