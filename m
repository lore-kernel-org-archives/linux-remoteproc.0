Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6B466B47;
	Tue, 25 Aug 2026 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693666; cv=none; b=sqRli5EMW1J2RzFKC3OxSkE8LWsFtrQR6ZG2A2ivlT+1q+c3ATZptd0UkEqCXJ9wrtSPXocISVyk/8/zYMhTof9t1/MDJTnqULWVeKi9KMWh9K5snrMHwjl+htgVzhd5CtU+kW8pKGWUIXWKokZ540KMPkccVXfvUDaEoS4U4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693666; c=relaxed/simple;
	bh=NESbLus8JokJYCtSc/ZF0TJpTCN3fS/YYmAMV1JuWmg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CrVNgoAKy3MlAY8CafpzKpRge4sEofA6xfehitbDEzF8jN1hQVcb2lC/wj6tQh9qts4Kohb+2Y/IgPjhWvEe+Xd7wM//KOgtY0DYf6X+mjsmJr58Pe0a8kXikmLNz0FoIWeyABsBRIwnYPXZtoJiYSCTBDf8BJttX3gqquoGAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RixZVDMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RixZVDMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0101F00A3A;
	Tue, 25 Aug 2026 21:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693665;
	bh=bTgWBf9NbJVBhtYZm6crbc/+Kg1O8k1Echb6sfmYqZk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RixZVDMicTHHKLnwkG9OT/9Tvh0VsNocNJ+wI36R9NTMI3uktmgI+OdEUENxssZa1
	 L2RN4N3j7G70xC1b/ih9V+gaWbeCmyevGJlrdoFc1KvHXn7kF0YmyKLh4+VW2FTfgk
	 RyWj/wLHITkVzgtLrd/uARfVcQe9o5sYqCbWfuQBObRIXhZ0cePcPoXZka7YvS1bxH
	 zxvwhPcpsDw/xI1kyOCNfO8ovDAqR25X+BlQlKzRxUmnf34LGDk63H+iS+hbRCe7fA
	 SPLUyItoFBmzx1G6pSuM/9TnJirnR1FCW/qa7Btkv3zYz/NS+oynPqvHfAw1thR+EV
	 yv7F5pNsFnNbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568783924A57;
	Tue, 25 Aug 2026 21:33:33 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260825203229.926213-1-andersson@kernel.org>
References: <20260825203229.926213-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260825203229.926213-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.3
X-PR-Tracked-Commit-Id: e088ffa9a00eaaaf90da74763e774ca160969c26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
Message-Id: <178769361197.4118109.4021049667537088668.pr-tracker-bot@kernel.org>
Date: Tue, 25 Aug 2026 21:33:31 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Antonio Borneo <antonio.borneo@foss.st.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Aug 2026 15:32:29 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
