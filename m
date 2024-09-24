Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAA4199B9;
	Tue, 24 Sep 2024 04:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727153460; cv=none; b=k1Inwj+XDboLWhir1AZU8UvBYkdVOgvbp8GDCrN1eAaZVgyC/GR05lBjJ3C2DsCa/WsSwy7ijaalCpCQtU3uaZFi2zoxW+scy++KhQ0svfiPq0T+thXCIsEFEOuFvjWqEE2PON16O8vdt+wNJGOO/Gk5h0SSE7erTf6n4Qt0EOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727153460; c=relaxed/simple;
	bh=ZxP3jvFza5gTRFKWXe9ArnGEx0T/ScydPvF5bCORiVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nAOX5JKwz42buIJ3Y26zmrhe5MxHB2CMneKigGRRcJJKRSOy/RPuFBM1peskeHZDKwn8n2/vye7VDP2jRskmrkxx/d6BR8rHnjAh3vvJizjQJmLBTsd2y8r6NoUBLMBt9KzNEFzXoP3QlFkNJ4Tgl5Qn+agu4EH07J14mZpRut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgMU9Qur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgMU9Qur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62CDC4CEC4;
	Tue, 24 Sep 2024 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727153460;
	bh=ZxP3jvFza5gTRFKWXe9ArnGEx0T/ScydPvF5bCORiVo=;
	h=From:To:Cc:Subject:Date:From;
	b=XgMU9Qurpprch1/7YpPoyoGfKxVUcPxTM1Yh+GsjF9Nf8d2y/FkzrbNU6SLaHK4A6
	 E16hbCCOkAswkHTJc7yg4n7culsPJA4llVYa6KnpwRUOGt0ThtLVfRQtpAhjVFmyP4
	 BAWKPhjO72XecRG/r0fVkZGWVAqfYfKWAZStqLJzTNYeYorjPu0wSwohWyX1SGMpXg
	 q+g/PZYBCTWUqrxXR1Oz/A9eAaf1sGuCD5/WbCsey88cH7+gFnaaKZ3n1W97jURlOU
	 j2aZcRwSqBI3zJ3SAkMZjgf8iBYV2PmmC5Tn9dD2xXRdfmYVnO6l174wKpjsD2qdCA
	 RN85pBw5C1ZoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [GIT PULL] hwspinlock update for v6.12
Date: Mon, 23 Sep 2024 21:54:19 -0700
Message-ID: <20240924045422.3080022-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.12

for you to fetch changes up to 8dc1bffd6e15da727f7cd07e2d2e7aea728f42ff:

  dt-bindings: hwlock: sprd-hwspinlock: convert to YAML (2024-08-12 15:27:14 -0700)

----------------------------------------------------------------
hwspinlock update for v6.12

This converts the Spreadtrum hardware spinlock DeviceTree binding to
YAML, to allow validation of related DeviceTree source.

----------------------------------------------------------------
Stanislav Jakubek (1):
      dt-bindings: hwlock: sprd-hwspinlock: convert to YAML

 .../bindings/hwlock/sprd,hwspinlock-r3p0.yaml      | 50 ++++++++++++++++++++++
 .../devicetree/bindings/hwlock/sprd-hwspinlock.txt | 23 ----------
 2 files changed, 50 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
