Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806E11187;
	Tue, 26 Nov 2024 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637295; cv=none; b=r8t9UspnvG0aK+49h1R7gSmZs16csoXmvGsVwm/stMn8jdykONOJf6kTpTwkwSnipdU8+e0hH+i+HfWI/3DNeF4tIvR621PIBaYo6HypLgVUk+828jiW/NqC1tQuDKzyhhFqEu9ygcZ4nkFLosdIYNo0nnx2XEjDAUOZHPCnF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637295; c=relaxed/simple;
	bh=VExXlLXoGKlbCFtjNoboli/j/zcJtEajaQeuNfI0f1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdX7CQo2rGLIXNqiEKuuuneevveR+HpGNhhHdifrQRoTRDgTQ/KWVr/0cizLVhL3obH/GRQoLiltUfMOOW06wPZwkDgp4EhtcQVB3+85mupYoo16cgdFUICrGcFFomT7WWgybhsaUCrwATsFV3c1OeSmLNuXniW1Sizwz2oKeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daDAbUQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daDAbUQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81490C4CECF;
	Tue, 26 Nov 2024 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732637294;
	bh=VExXlLXoGKlbCFtjNoboli/j/zcJtEajaQeuNfI0f1M=;
	h=From:To:Cc:Subject:Date:From;
	b=daDAbUQ8s+HL68S/xQ/CzrS6l5avnXlPpgUGpsKnP/a8z8hNsqSwJS/INnzcrf8+n
	 3heuJdxbXyOz/7GURm+CZunr5M3gSkCgZF0YuYKp60WfBgNiRcTVeDgIGQWnIm7viK
	 xROPw3Bvj8GNXtJzaqB1xWfInKSlH+HW3jCoFN+ppLzGtJzLZE8HdELku248TQhfJ4
	 HAkVqjrPE2q6HIt2Dw6+W+7VqXxehFjNjgNz9pe9yw9ca8Dz9JIsLLLiQTXFzyvYTh
	 cVd6xHS85rel5Ev2j+WQScC9kQgB7+h1r0y6zqqa0wI/UTGc78GB4ol32Cpa/bjtXw
	 K0UMXYrkVK0Fw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>
Subject: [GIT PULL] rpmsg updates for v6.13
Date: Tue, 26 Nov 2024 08:10:05 -0800
Message-ID: <20241126161007.3288016-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.13

for you to fetch changes up to 06c59d97f63c1b8af521fa5aef8a716fb988b285:

  rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length (2024-11-15 19:32:36 -0800)

----------------------------------------------------------------
rpmsg updates for v6.13

Correct GLINK driver's decoding of the CMD_OPEN message, as upper half
of the second parameter encodes "priority", and "length" is only the
lower half.

----------------------------------------------------------------
Jonathan Marek (1):
      rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length

 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
