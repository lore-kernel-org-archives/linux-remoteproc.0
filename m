Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472119CCFA;
	Sun, 21 Jun 2026 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023916; cv=none; b=bLnQbMLjc5DIxpo0zmVhMFfmdJ7wyArr0MZdhi+AmFSEVV058P5LIc5evpCg3EHbQwltSxwKqEF0X/RIH9LPo0mYRwYhbTQwTAtVBsHGGF8SNE/kuFTjqUQm1orheNjkL18X3tkVYg1YuXFVKPxNeGw1QBv6n1gVblsJHLaXXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023916; c=relaxed/simple;
	bh=me/MSTxOkJ8Wz7XVfJf4J5Tsy04H7AW59JBgy65xR6k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ASXib48I8trvCtmICE5tv/6xfU6ZPymy1hYKPWYPgehZMj5MsUel2wA8ZzmAiCv1c+10cYDwHffd71Pd3kB7NbY4hMpi2Un6LQLLPcqMuSybBmcHIT6QF8kGacGxmjxiSjiicHreAiN7insJG2E5XpvLbbK18t7ZmTUUOwvAiMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma/F8hpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma/F8hpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEFF1F000E9;
	Sun, 21 Jun 2026 06:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782023915;
	bh=ZshqlRVspk5Y/7bthJgDLh3fffgQo0OTvVaogmsHJm0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ma/F8hpMfq6wgUXOnYJ44OAC7nilZLePqBncVaqQruML+5cDCHi6k+3QAF/wOpM8J
	 OsU7yILt8ds0JZ5qxVzw+iG0PP343PCp7gxfS8W1SsPUXTap8wsIYMzDUOi/+HQKWS
	 RJuXkoZHRqBDaV/PvKQEVS1Ynd76DgVUGuy4r84QmO+7EwSNyhYTfFjWDffJeCuMR8
	 G/sKREXIRMUjEP+W7/q8L2y+jnGK0/k2UDpO2ktuix3waAcmXUFgUpUPX1b35meG2E
	 E3SsUKvLHCo9gNNHrvlV7UQ4bfcf0g04ARgvkONZIEF9KtEkrkGFnAbnkiQgCe2nuc
	 5bPt/CI3w/Qlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B153AAA6D8;
	Sun, 21 Jun 2026 06:38:28 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260620143709.1112373-1-andersson@kernel.org>
References: <20260620143709.1112373-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260620143709.1112373-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.2
X-PR-Tracked-Commit-Id: b5bfc7d039bb775730186a9c38d0f01afd729638
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d0d4d12e456ea587c8673e314e901ecb01e6329
Message-Id: <178202390666.305170.1988507283593428982.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2026 06:38:26 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Tanmay Shah <tanmay.shah@amd.com>, Peng Fan <peng.fan@nxp.com>, Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Alexandru Gagniuc <mr.nuke.me@gmail.com>, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, Jiafei Pan <Jiafei.Pan@nxp.com>, Julian Braha <julianbraha@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Jun 2026 09:37:09 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d0d4d12e456ea587c8673e314e901ecb01e6329

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
