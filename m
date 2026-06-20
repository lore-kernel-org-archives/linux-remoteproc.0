Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF92627467F;
	Sat, 20 Jun 2026 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781966425; cv=none; b=j0F60l3e/zCl6wS6q1DFBS+jfsHVh6LcgH2zbls+DaEmFxykw/3cfjU+okST/WpPQ4HjI5wsgmGvxapHXMVwMPsSzjGyYG4l82hP3z9U8k0joH+5I+q3Qy6KkYMBK1sXKfF9OpRa3KAe76rjXRaBA8EXGwiNp/Gkr4oXHPZQuKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781966425; c=relaxed/simple;
	bh=T4/QQ5N2oTO25N4mvCnjvDYujPz5Tm54IrihURIqzBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QklxszH+ybGIxtERQx6IdUpkd1iAwTCRZVdOFwL45eek9eXLXgMfv4hnIPi5TuNoGcP4Myd1SEPWQVyzWKxjjb7WOXi073Fse4RObWZSQWDNqp5lrE3nzqIMsD3+clCYoC5PelKfFIwcm3lOs7m6Va1u3nA4B+PcascdZyg1k9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFhgyDeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFhgyDeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AEE1F000E9;
	Sat, 20 Jun 2026 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781966424;
	bh=siDd2LJyH7hBHrbO1Z0nS6aEIA8l3UGw2jGY7QUkeks=;
	h=From:To:Cc:Subject:Date;
	b=OFhgyDeNZIsv2aW0Kmuy1kIhG7n7ZwoYuKPyvshCl4NJ0yqKI7u9AOA8fesrvrEHF
	 XkhFyLCOyL68sovqbCo/B13irG1jUzVsK5TW7gKUoziTBgV05qLbb4JPZdUq5E4WIH
	 VugM5BAjrWdnm+TJ9qkUlOM28cFgMIuwcztXVo8Y8nLWgd/4wNoq3ycvQFct7k7GhN
	 2XuuucXTQCFatpmdABeHmyEpakcmfZ4oBxI6Fb55FPqbmcUupx2dUZMOhNN/Lp0i2U
	 jv4TqhTIIIIhPzKBayLX0SjllL/PocjYVnReG3faAaDT9hLtfxCJU0SXdUUR7duOZf
	 Ne0mIszv0b5sw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL] hwspinlock updates for v7.2
Date: Sat, 20 Jun 2026 09:40:22 -0500
Message-ID: <20260620144022.1113253-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.2

for you to fetch changes up to 8752c396ce3b2136b3d4c906fe103f6efb6782d9:

  hwspinlock: qcom: avoid uninitialized struct members (2026-06-08 21:51:12 -0500)

----------------------------------------------------------------
hwspinlock updates for v7.2

Avoid uninitialized struct members in the Qualcomm hwspinlock driver.

----------------------------------------------------------------
Wolfram Sang (1):
      hwspinlock: qcom: avoid uninitialized struct members

 drivers/hwspinlock/qcom_hwspinlock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
