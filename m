Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7741C62;
	Fri,  1 Aug 2025 23:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754091021; cv=none; b=HU1ZpMZvZeh5QOJYiAXiINIbzqBfQZu/MfGHCD3XpA7QD6276s2L2azcpOX2LW1NLaSXuBScouXF+1QQiJ1zVTEzyM6/fZYSLWGeoob3KnnqdD8jsBgMHn0I8FIH5yQMpDE6wRBzCNGpEFYTNVzLyPI+iWpC2P/bAP39N7V7tXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754091021; c=relaxed/simple;
	bh=NV7Wknaz+JKzDLrmvbVQcSvPQ0BGB6bjeC9NYwdKC3Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I25uCRXXS0ylgOPNfbbKHeemkb73yhfpIZow3iBtr3eI15MMJ9eZDv1PXygtPSdJD//uS0m+dLKJphp22I+0hNS3oT6x4RH8nfAllwCqIaCXaaGiQl/Jw4hYBAyYV0DDn8L3L7qPk8YodgcCeoPRlqA+heqyTje4o8HUYNr+P/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5NQwQln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5NQwQln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F68C4CEE7;
	Fri,  1 Aug 2025 23:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754091020;
	bh=NV7Wknaz+JKzDLrmvbVQcSvPQ0BGB6bjeC9NYwdKC3Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F5NQwQlnAD7VEevWmmHjn1Iy7iTAZitIcEtpbaHGnxUgvYDHXc3j4PXnLSZXTzgzC
	 1f3sZ2wCfKa4q6tL/eIv+DnGgHdHc+YFgrY9IieUFK5x/FoE0XXLOQ2XzPfJpanBDE
	 nhEqwdDGL5cXjUbppOYiR+RWA2U+z0S7iR31rdb4okXWcVlZYfgnQTd9C+RYEjyAMh
	 aP3sxj1rIoHT6P0QPIJTLZk7TUt4izO2/h22IXD23DdAbLrQHCneZUU0+c2XCZ5Jpj
	 n0aVThl52pKpxzqTOclRJ1EyIOewBH2mKSoTJruSrvJparw8odCULeM/jH0MyBmOmH
	 /YxkjtK/SEbxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0FA383BF56;
	Fri,  1 Aug 2025 23:30:36 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250801195305.996861-1-andersson@kernel.org>
References: <20250801195305.996861-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250801195305.996861-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.17
X-PR-Tracked-Commit-Id: 1c20224123f41e4f7da44ae020832bdac3f30ec1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 111857421c93fc88924106436741bd2f5b8bc220
Message-Id: <175409103565.4150864.10448784912906872296.pr-tracker-bot@kernel.org>
Date: Fri, 01 Aug 2025 23:30:35 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Tanmay Shah <tanmay.shah@amd.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Lijuan Gao <lijuan.gao@oss.qualcomm.com>, Lijuan Gao <quic_lijuang@quicinc.com>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  1 Aug 2025 14:53:03 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/111857421c93fc88924106436741bd2f5b8bc220

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
