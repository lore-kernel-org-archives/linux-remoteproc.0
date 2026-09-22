Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522738A718;
	Tue, 22 Sep 2026 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043385; cv=none; b=RbCTpcTVjTdwimNFlamU2wzNbgBwCNmGbDjNajNj1riM+dFzM5DALVE/gTs4it6pZDJ/xD28ddVfMG/QRBov6LHgVVBLDMJweKbeuz3Jg6RivdrZHOyBeJweajxaw7/3FogQNeYckw7C7GtdPkninIS/bIwZLpcMeShwnXbx7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043385; c=relaxed/simple;
	bh=AhGD0KZZ5JO/mKVrm+EUi011YS7XXX49GX4TZwc2zdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b69xxXGOj2OY/nKEUMlM6Q1adxpnNwKVJ1IEKoE3fFm/B32Ezt1kzvoETwQf8Hv30o2Obo53poix+FVAPFqwKyTnanpRbWBC48usG4HuODqC/52x8y4PXYlmABCjRvFtdWBC3oPtHWrih7BJNexqGF1f9pOfEJ5AHAeE+BMOoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUc0qZes; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUc0qZes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BA11F000FF;
	Tue, 22 Sep 2026 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790043383;
	bh=oWmrMnSl1qyrga1FKmhZgelQe84uhDCOygVCcIMfvYo=;
	h=From:To:Cc:Subject:Date;
	b=EUc0qZestVfKFmSWgopfrdgfw40REdnWn/Xf9Ky6Ejd0gRUZytOvyNBW9dwZf1jCX
	 c+xwtpvQWIJdBEm4RwrrfFE/tXvE5JKkIFyOc8ssgZ4zVVICKsMsKKVATbwBFQF2c1
	 SAjYd9XNY9gg/46s1kBEF34bFePowpPzZuyFkRXAOmEOJ3D+2FcNUZqv5NB7Fxry32
	 LpcMMVzVwt7AP6St4NDkJl8ounWhMdlIplkDgSoxE4eTW2nok/CBXE/qv8jZ/8GN34
	 tZKGTKEUl8X11+ZFn6molvCZ7quf8Vak1BG4SAPnfdy8XU6aSvrDO/U/LdQGCQ+tDP
	 vJMO6fTRFZ21w==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mostafa Saleh <smostafa@google.com>,
	Paul Hollinsky <phollinsky@holtechnik.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [GIT PULL] remoteproc fixes for v7.3
Date: Mon, 21 Sep 2026 21:16:21 -0500
Message-ID: <20260922021622.321847-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3-fixes

for you to fetch changes up to 9db31edf92dde1f3c98008bd5f88e859d14324cc:

  remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop() (2026-08-31 11:45:00 -0500)

----------------------------------------------------------------
remoteproc fixes for v7.3

Fix unbalanced handover IRQ for attached and the overwriting of the
shutdown return value in the Qualcomm PAS remoteproc driver.

Correct the conditions in the Qualcomm modem remoteproc driver for which
secure services to require after the move to "PAS service".

Ensure that the correct addresses are passed to iommu_unmap() in as
Qualcomm ADSP carveout are torn down.

----------------------------------------------------------------
Mostafa Saleh (1):
      remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage

Paul Hollinsky (1):
      remoteproc: qcom_q6v5_mss: Don't require PAS for memory protection

Shawn Guo (1):
      remoteproc: qcom: q6v5_pas: Don't enable handover IRQ on attach

Vignesh Viswanathan (1):
      remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()

 drivers/remoteproc/qcom_q6v5_adsp.c |  8 ++++----
 drivers/remoteproc/qcom_q6v5_mss.c  | 11 ++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c  | 12 +++++++-----
 3 files changed, 21 insertions(+), 10 deletions(-)
