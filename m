Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103C21B192;
	Sat, 20 Jun 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781966314; cv=none; b=KwcIivy99cRF4r3qETeZP1QGQsxhBGjXwEUflYbceTSUPmH2GNbKUbRLAJ42P6J+5BwdaSPD4oy1vF3TgP3/L+mBdRBIJNNKfSHwIs4pWJJ16RcIXFAwUXJJqR50mAe7PUZRGwPgPF92wViCDanOHvocIoju75I6rGBVOulYQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781966314; c=relaxed/simple;
	bh=f9cCJEcPcto+RKdr5HFhF5bFtP/yaCk0IVHXqjXLwss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABRi3NNmuZFt6W2+0uzRXxLxky7e75TigFV5PCS/d0AcoGOxealfmO6IGNG7KYF6Dt0xIGtbMi76Z2fXo5lS47vPB4UqFgVIP97j2/YmW2SC4msZW5OAImh6GCkNQkikp7vkqpnl0I4bOergprGYa4I6xjPj3zwgns/b5zcJ8dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTrf67rJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTrf67rJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B1B1F000E9;
	Sat, 20 Jun 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781966313;
	bh=ygAbj7hbvSRB4WLpPAHBP5VriXRhqzkQmLqrP1nmI+Q=;
	h=From:To:Cc:Subject:Date;
	b=BTrf67rJ3eL5BBpa/FDZfsYOTBlVCDMjm/FD7OCntGsQse/IrOa80ORxAjYbi6T0n
	 QYEyPK5n1AJ0LBC0s+t2r2gavnniq0QOvp+zVrcs2yMIUGAgu/F44AeU9Y+lXRugvw
	 UyrdcrM8h0mZ4DsorTaMH+tgGfzH5lu9BfwAqqdJoxaHOZfCdBWRFUhtXg9r3xXdod
	 +3IwLp4YZl2/8m4nSy4OX+744hW/thD82m+EIQrsZII2vi5hxF6pOll+Zs4ZPwghZF
	 G2wHoglie1VFljDkVhKcKNagUTkmmnDGTQ2H9ypvCAun+IvuPDNQTuihpP8PCM7wmQ
	 2hqw6Zdb8GP+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [GIT PULL] rpmsg update for v7.2
Date: Sat, 20 Jun 2026 09:38:31 -0500
Message-ID: <20260620143831.1112703-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.2

for you to fetch changes up to 1ff3f528e67d20e2b1483dcaba899dc7832b2e6b:

  rpmsg: char: Fix use-after-free on probe error path (2026-06-04 11:58:37 -0600)

----------------------------------------------------------------
rpmsg update for v7.2

Fix use-after-free in rpmsg-char driver.

----------------------------------------------------------------
Yuho Choi (1):
      rpmsg: char: Fix use-after-free on probe error path

 drivers/rpmsg/rpmsg_char.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)
