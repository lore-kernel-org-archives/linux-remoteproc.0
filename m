Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09962505A5;
	Sat,  4 Oct 2025 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621341; cv=none; b=S//ob1sRSZBpDpp+hax0xQmj41ELaGOiF18FscSuaNk9OLa7yo/lOYlxlOge7cnpqFqM4o/ZsaBk9yI0SWBeT3C9wEEeUUteJ6btxPeyxOoyGf7phcIcp2wSLIRzZAlDM4BV9cjlSyVt71RpB3NaBJIpUJh8sgHhSFU4ehDY334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621341; c=relaxed/simple;
	bh=BQt7WZLSTlbyhkmmQVXRpjGzOAuebOMzPUj9sGHtDgw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VaDAFieMhTC7SVpINJb5P3u4wA31PJG0Kq576ct+2BqtOu+m+RpY9NpK633WqAw8v5sT2dQEkTnEh9NDVciIKx0HDbYc0DYpIprQpL3KZNnrHtnNLnI6FOSpa04nLSgb980B3NlenAZQA0xREoquKfY/LQsgYnTqbp3uaZPYzMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rapiq3qc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rapiq3qc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B69C4CEF9;
	Sat,  4 Oct 2025 23:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759621341;
	bh=BQt7WZLSTlbyhkmmQVXRpjGzOAuebOMzPUj9sGHtDgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rapiq3qcK0cB0pTAvGOCgGwkFL1iHl1byk7KoBZzmddtIdrrAQxS46gP1cZD50BfR
	 uyTvTMmtWGj/6puu+tvnf691tpMfME8exo7nCHzo9b9N04sN+PsLj8MSmQ71SO0LND
	 PV9LZ6kmWpohfF5OJ8lbi+VSOWJsFCT7HLwAtOqpwMdWAveLEKL2XZy9RT1kBTf/y+
	 2mazt6PiRqJzebVm1rJrwq19vTMM1AIOsudRViJ3sMD1FMEh3PcnyfBnZhqCFT+6Td
	 cTlq2zYHJ2UxQ9CKddDec06UJ9ptvf4Z3e9IWR9fdmED9tNFm/ETA26A/3PeFtydUU
	 7P4lkpdRj9xUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F0739D0C1A;
	Sat,  4 Oct 2025 23:42:13 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251002140524.64158-1-andersson@kernel.org>
References: <20251002140524.64158-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251002140524.64158-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.18
X-PR-Tracked-Commit-Id: 09390ed9af37ed612dd0967ff2b0d639872b8776
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20f868da2cc6c2d53e8a3c7a2a4d1edf5c730eae
Message-Id: <175962133229.472872.5583277289707469139.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 23:42:12 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Thorsten Blum <thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  2 Oct 2025 09:05:21 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20f868da2cc6c2d53e8a3c7a2a4d1edf5c730eae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
