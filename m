Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D7236B055;
	Fri, 17 Apr 2026 21:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461074; cv=none; b=NdLwDHhCi4IA+i1eBw6Gvd5Wv4CLQp/d5O0089oXksxXcaJWJEemT5/WX1xKZx3zbAxTdGyf/LCSXp0/yUfFX7uUmSezD00R6J33zx+RwSkIuzLIzrBp8MH1GK1k8F+wk46KWsjzJx0d1vJE0tq3IdGzZEdDfm10Bs7wb5nBWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461074; c=relaxed/simple;
	bh=NQL2g6Jw1eCPH38KwgUziinErPaEFr9qicR40L9Z9qA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WxB6kBJQtizj87n9wTQZJcod4fVGVx7F5zXaBOMkiv37Jpna3wpQe8J/wntEbdik2pLS0Gi0GN+h1ycTuTYYGLsfn7yh6XLlx6VssV5l29+Uh1JEaBuFl4hk5zDzumUIkx2B0pKH/lUtZ7ZuQFmuqtQYh0BAL+r4TsG77Qw3nSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e04hIcw6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e04hIcw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74B6C19425;
	Fri, 17 Apr 2026 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776461074;
	bh=NQL2g6Jw1eCPH38KwgUziinErPaEFr9qicR40L9Z9qA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=e04hIcw6E2MZy7+jYhTeXF7ZzkMGx2y0iLRiYswoJCpbZk25YnBsrufdj/2nuNKkO
	 JD44smmi+k03Ag5ETHPjXKrLsImfYBIP3TXS6lcuiRQ8Arjx+7ffCzZ58dXWrEkDU5
	 cXSpYI3cAJpwPxMqPh0+pjom/5kim+kZW5xFqtulRLB7YydYo5xYm/NvlpOpuqtKbj
	 RM1/10h9s967y4WpBg13SC++sx6Sl2UzJ2uKr+y+MMpucJCikOZ8HSJfoBsyEr8B+S
	 CbqPXkrPLCmIOYTJIUiO+RlPzo3jT4hbsxlberxnCRzbz1sdTYA7/YdDJyEtK1IHM3
	 qezGxHb4uVRcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE15380CEE7;
	Fri, 17 Apr 2026 21:24:02 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260417200132.2581415-1-andersson@kernel.org>
References: <20260417200132.2581415-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260417200132.2581415-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.1
X-PR-Tracked-Commit-Id: 56c1ec524284805da0181bc6e9ca656c0091b201
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d65218de87c4bfa879bc453c3050d3851c353dcc
Message-Id: <177646104113.161623.1457579120410944221.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 21:24:01 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, Andrew Davis <afd@ti.com>, Chen Ni <nichen@iscas.ac.cn>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Markus Schneider-Pargmann <msp@baylibre.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Tanmay Shah <tanmay.shah@amd.com>, Anas Iqbal <mohd.abd.6602@gmail.com>, Ben Levinsky <ben.levinsky@amd.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephan Gerhold <stephan@gerhold.net>, Tim Michals <tcmichals@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Apr 2026 15:01:32 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d65218de87c4bfa879bc453c3050d3851c353dcc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
