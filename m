Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211042;
	b=UsBbJPiVCKBdB5EJNt+r+LNI4LNRFisif5NRNmCzUOG2pnkPC/cxF4/83mZicjIJ4WMZ
	 wMBEgHRkVfNR1KF1d5KOF3UDAus/FIa4KzLlbEwE0xkr8YdtwCXcSaygQIqk+y0gfjhYU
	 WiguehXIy6ebCfZ3qx85LvrCKkccVpsz70FghC+WTqO2T5BlpbAaAUdnxdiF8Mo5VsU3o
	 7csobGf6WYFGCybhN88+Ym2F6fPgWIvt+r+XzdhXOAe0PPifq0BjNULGXV/SB8CLcjtyu
	 rOo5UClFs6P9CNHpan8nf3h/2gLd1lyrfRjjJr3z1cBbbISN7wCy8IawqDCx+k52jnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211042;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=8vYIZJehrSbjk3lnHp+LgvS6khmuVgWhbF1tzujUmD0=;
	b=x92lg9uEiaN+iQQOidkNflyDi+9r8ibJlQHiGFqOBhfXwQmpa/5HisMint2UeYe7NRjx
	 8v4Xh+M9UpzyIy3PK9kR0TkjS4g0k3T6Uv/TjF3bS6idm2Ssc4A0GZi3P+/QPpyBgY6lA
	 l+AnlS3Od0CZjWLlzezU7EkDMazMl/2IynVXZQ10EZR6p7T1ghaYPQBvLvQ5jVw3septE
	 r//77TSdZHerSNbs6wPuLJDNAZmHOiJLU4Sls5uWgw1uGh9z8/zzvDSAKLW3ZmMXXtE3e
	 nRqZNyUZuMhyfryWD9bvaJzBY45coP1rnuox4qJmupRwcU5xAlJD0avx31aK45p66Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fo2GVkJw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9A60A5BCC;
	Wed, 28 Oct 2026 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fo2GVkJw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D01F01829;
	Wed, 28 Oct 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211041;
	bh=8vYIZJehrSbjk3lnHp+LgvS6khmuVgWhbF1tzujUmD0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Fo2GVkJwZPnZ0shmNmnF/kCm6AegohvRNPdjMLdmdLcVWXbkylCHAZBuPf2kbZgm2
	 6BaNmIPrK6T/31JovGT6iNQjVtrPOLxdiAWS+J9C28K0gZnuepnn732yfgoYxSH5tR
	 htC932vej8RiywfQAwbp0tVOhQ8hWocZm50838sCNzpHDfHzkyyJMoSHihOMLnMPnw
	 sUYLRipwFSVHcWS3c12f9IEHpLqVtjNoCtKtVhdUptIfiTuxTBYwhWpdXZBVKJMyE5
	 OkiGmBeSCE6bV8e6KAxhJScu4bXy/zu1vVw2bvuYK/65dCljMf5WYatCgW2u2bAvGi
	 ixJ1PHbvA/l0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE4EA3AA9F6C;
	Wed, 28 Oct 2026 18:10:41 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028142414.19573-1-andersson@kernel.org>
References: <20261028142414.19573-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028142414.19573-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.4
X-PR-Tracked-Commit-Id: 7dd4cffdf4c2a496ccf783303a03d687a2127baf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d314add22247c91c74ef6ec093feee43fa2a9aa
Message-Id: <179321104046.1342141.15126693191248560336.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:40 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Tanmay Shah <tanmay.shah@amd.com>, Atul Akella <atul.akella@gmail.com>, Avi Weiss <thnkslprpt@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 09:24:14 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d314add22247c91c74ef6ec093feee43fa2a9aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
