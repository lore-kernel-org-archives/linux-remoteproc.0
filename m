Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B145179AE;
	Tue, 21 May 2024 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260036; cv=none; b=Rt8Wsr5z/a+aSXcKwZorvsnQE95j2i3DiG0aBpcjU3NEtVMrHIecj68cLgdi2IK25dy/higJtj9ztBOgOwPY8b2oWFArWNw3lO1RwhZK0EQ2GvMedHljQxjGAzDvcSdXdYuFDNYbYo2oSWRGUDv9MnsOElmuslWcVXDlsoVfoD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260036; c=relaxed/simple;
	bh=m35vFoqyb5qCD2PigD6YpSw4/l5DIPod9cy3ATBViJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IY4ZHLNP6Eo7f69LYMRZnUxDKbpU/qO9M3s4w6iMTlAujKc6KIsFH+BDgrvHuGoJ6jyFWJjMXkHEExGH1Ma5rdJLREkI59vQs4ql216IVFF3JPyH8s9vJBINFLPMMT8K0lobeSTJhg4Ee6oxnCNWozCIbadiX5u0zmieLTwU78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfKqqi+E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfKqqi+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E263C2BD10;
	Tue, 21 May 2024 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716260035;
	bh=m35vFoqyb5qCD2PigD6YpSw4/l5DIPod9cy3ATBViJw=;
	h=From:To:Cc:Subject:Date:From;
	b=bfKqqi+EA5MlvezAEMvQO5ctTlSrfm/li6WC2g7+tOcEd/vhuYPkkFgRj07Eo/Ydu
	 F35Tbz1fLgVKR3NxWKsgEbbkUWncXfZWzCLi3QVc3pgjQG1xsEVvzFLjqbWlR8G1Xt
	 /FNjlYeW87bxqxxrNz62aTIbM8zdRtIwlwXiEz9GJHKSe/eS3SQFgBQVuraJ821vvw
	 nZggfZEE62uYefThotv5FcEGs2vvGtEFt8K1SxS+/oAtsDqos1g4k89LZRQtQWOrSU
	 dDGA8pk0nVTMg+xSzJ6FVpEr3m+CRcYbDvsS0ze0DzuIj6egIJxVSJ/qWO+pldSkH8
	 8AblGRScUXmsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: [GIT PULL] rpmsg updates for v6.10
Date: Mon, 20 May 2024 19:58:46 -0700
Message-ID: <20240521025847.231912-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.10

for you to fetch changes up to bcbab579f968ffd63236d90227212e689ddbd600:

  rpmsg: qcom_glink_ssr: fix module autoloading (2024-05-06 19:26:28 -0700)

----------------------------------------------------------------
rpmsg updates for v6.10

This makes core rpmsg_class const and it ensures automatic module
loading of the Qualcomm glink_ssr driver happens.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      rpmsg: qcom_glink_ssr: fix module autoloading

Ricardo B. Marliere (1):
      rpmsg: core: Make rpmsg_class constant

 drivers/rpmsg/qcom_glink_ssr.c |  1 +
 drivers/rpmsg/rpmsg_char.c     |  2 +-
 drivers/rpmsg/rpmsg_core.c     | 16 +++++++++-------
 drivers/rpmsg/rpmsg_ctrl.c     |  2 +-
 drivers/rpmsg/rpmsg_internal.h |  2 +-
 5 files changed, 13 insertions(+), 10 deletions(-)
