Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9013EA83;
	Sun, 30 Mar 2025 02:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302307; cv=none; b=qNwCM5x9Yoxk7IBRbaaMreGG8Z8N4h7xtz8rAEWfqcQTSPxy3ZeCbsMLp5nKSzG51MYCJ6IP5ONn39p5EblzlLPohriq7+N1Qhcp9so6owazjcj0vF6DVqAM3fPWsvxWt4kjBorUz1TLqo6eeGpSW3SgKmAVp1FEBTRra1HILQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302307; c=relaxed/simple;
	bh=cg09suAeEWbKdrq/9nd3jZ1iSU7zry2VxwB88vStfzE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WxAcW1jjd6M6rLCynmJG+Iu6lGGcXT4Iq7GaHeQoYAf2fXj9quY4g76/PcG9kX42slrakbM+MJKxrLUaat2miBXEJBW2Kff6okwtB3Rp09f5Is4DjwOJ58MYLM1FtMSPq7q741Hku8/bt/csnMpyiyQiBIFNn8f1KcoI7I/pgNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfUgRmb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfUgRmb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF89C4CEEB;
	Sun, 30 Mar 2025 02:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302307;
	bh=cg09suAeEWbKdrq/9nd3jZ1iSU7zry2VxwB88vStfzE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KfUgRmb3b3sSgUlm3Z2SrNhUK43Z4w2DvuWeW8MYEZfWo6lwWVjLEaajHgQKYyjPj
	 SX25KsgkdW14Xf0cujMYzpS/Qybuz8Zm/di1NmTLev/kk//rT4pgH0wwOISkHKGpBp
	 PSnZMLhjFtwG9LdY570vRO9y0L+RQfUDxocCyNZaoVHE3FvxEMFGDdHY2bqOvSqHIR
	 cJ4a3rz8vNHO/VdCbvnbSuKdj2Bea0sWrbXLB5XSgEzn6H4n5OkLR77gWNj0gPek1k
	 bBBXE04cAdtqBybiN1SvWoxzQVsa4//Aix9kTGVgJi842SKDLWM3roHXreJzkulTnh
	 dyA5Cju+o5ekQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0B380AA7A;
	Sun, 30 Mar 2025 02:39:04 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328171828.188058-1-andersson@kernel.org>
References: <20250328171828.188058-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328171828.188058-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.15
X-PR-Tracked-Commit-Id: fec04edb74126f21ac628c7be763c97deb49f69d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d4eca7ac5f92eceeadfae0321621ddef1346c5a
Message-Id: <174330234318.3338213.9369812925956751131.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:03 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Dr . David Alan Gilbert" <linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 12:18:27 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d4eca7ac5f92eceeadfae0321621ddef1346c5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
