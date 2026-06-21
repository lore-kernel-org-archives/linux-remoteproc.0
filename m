Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA324A047;
	Sun, 21 Jun 2026 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023920; cv=none; b=pVnSp5kXX4Aaz5tVXKIDkBTZ+Ah3MqrcvSeqt/E9Olrzoow/FfMasQuPP5jVuBE1oMyeSgC58g3gp+BnSzdABheHyXRPId2UIPn15mrkVoPu2QKF7PK4gQM6H54pUuIUygNzzVkgPeK4+Z+k6zuGQASz3H7X4G7xLpWEYr54frE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023920; c=relaxed/simple;
	bh=DVdqZZpWamFRwyvlI3iZ6YTyKv5Rsq9hqAORuiUH1uE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nE8xHPmPZN7QEs8HgzhQbxEgv0QXaDwoabA5q78X+9WuVLtmfAGLwuWK5CwlQqdTbLJz2I8tyx4eBwZmbfNNHg5AzFvpcEfZVDyt/GXfaMlugHofL1G1vXAltrM6Zbqno1e0mx778sHpIUDTnVeTecaUYjwW7mXVcrqe83Qpv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhWkjVh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhWkjVh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD211F000E9;
	Sun, 21 Jun 2026 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782023919;
	bh=9EP2f4JGH+1A6SFoMthsDj9Fs3DBbBRG9afTleiisaA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PhWkjVh33eLRO/+VIyuce56fcIftvA/istEGrcn7mWGK7tRFI6s6/4fS3EGXwwjsA
	 syv9hoFTRcLcK50q7O1Bi1vG8JvDDUNoRQFwfY91QfOTYTQ2VhVqqFVEpORuDQIPJy
	 ABIp7++ZJg4VN7HY/Fy2i4lXk4cjp3xIrs56xCKlYRHN8pDTERarG3Ol8sQmvwNveI
	 AUVZm45VWXhNagQemu6UXdhYwq3E9m4YDoD3TsS9iRlZ6RIq/OsfFGHiQlwkn16Xhc
	 amVzL67zcOqOWTqCI3wmfmP8JV4F6DrZ5xSBvWgrh0lob0EEuVKSlA4MR+x2OuCdU2
	 Do4mR47tgkzwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197AA3AAA6D8;
	Sun, 21 Jun 2026 06:38:32 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260620144022.1113253-1-andersson@kernel.org>
References: <20260620144022.1113253-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260620144022.1113253-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.2
X-PR-Tracked-Commit-Id: 8752c396ce3b2136b3d4c906fe103f6efb6782d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 322008f87f917e2217eeac386a9410945092eb2e
Message-Id: <178202391059.305170.15995663896808461444.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2026 06:38:30 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Jun 2026 09:40:22 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/322008f87f917e2217eeac386a9410945092eb2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
