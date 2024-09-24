Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDC4962B;
	Tue, 24 Sep 2024 04:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727153342; cv=none; b=EnK7TefaYNhxidTUYLuttO2UpnH7TXMjmnMQJ8aJiteYAHuLdIq14yfPqmBBL17qAflQPq7Z0wAOPuy3V9BmU9roR/uyqVHQ4sdG56BYx7qZYRMQD3NAGCLEyTDLA1bGZLFFZNVflq3+7ABJkTM1MaPTGYT+EQ/hO3KndwLB92Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727153342; c=relaxed/simple;
	bh=OplhCHCwOyYdVZHWTwEwM7z+vdJ8Vq5aUqslGpYOt+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CK/xvon36txVvZgrKHk38MvWdIsaGnss2x7coPNhYf0rHVKWp+F5OOfszoRrDdXneWsGSYb102hqPzVwju0L3FNIoIZgitwnQhsBaT8Pe0XWfJuSTX5ez1wbaZTi6wBtV8cV6vvs57qVd9R5UVX68ffYTiOQpzDGm56NCc8tA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7CM927i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7CM927i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DF5C4CEC4;
	Tue, 24 Sep 2024 04:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727153342;
	bh=OplhCHCwOyYdVZHWTwEwM7z+vdJ8Vq5aUqslGpYOt+o=;
	h=From:To:Cc:Subject:Date:From;
	b=s7CM927iugxDBHOqShMhwZMEq+v15t0MlNICNbxXqcRQEILMzNwnMups2N1bX8vPV
	 gKyZbfS/QC/oDQ/snnz4W2ldzFXyywrf6SalUY0pOKFUAcOvjxtpiRmpIf1O1S7e6X
	 2c0olQZ8pdLAfqVtNZ6HNNi/2O1E+wz4afjT9E+JLVGmnYhjHYxKiVlD2rr3fgDOR6
	 yE9AwmxtGpkYECFTVUZwVobvjKN3uPR4+6kkyLe4js6VfWmjQYYPjwvnqwDOVQwE5s
	 uCtgde3FyhHB/Bk4xZfK0n8NXYCfpHqzN3+LvJYab2gtUYftTe+IgVypWxDK76f7zo
	 re2Sa+GzmiEGg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: [GIT PULL] rpmsg updates for v6.12
Date: Mon, 23 Sep 2024 21:52:22 -0700
Message-ID: <20240924045223.3079508-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.12

for you to fetch changes up to c1ddb29709e675ea2a406e3114dbf5c8c705dd59:

  rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings (2024-09-13 14:09:47 -0700)

----------------------------------------------------------------
rpmsg updates for v6.12

This performs minor cleanup/refactor of the Qualcomm GLINK code, in
order to then add trace events related to the messages exchange with the
remote side, useful for debugging a range of interoperability issues.

The nested structs with flexible array members, in the same driver, is
then rewritten to avoid the risk of invalid accesses.

----------------------------------------------------------------
Bjorn Andersson (3):
      rpmsg: glink: Tidy up RX advance handling
      rpmsg: glink: Pass channel to qcom_glink_send_close_ack()
      rpmsg: glink: Introduce packet tracepoints

Gustavo A. R. Silva (1):
      rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings

 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c | 166 +++++++++++++---
 drivers/rpmsg/qcom_glink_trace.h  | 406 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 542 insertions(+), 31 deletions(-)
 create mode 100644 drivers/rpmsg/qcom_glink_trace.h
