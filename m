Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED930100D;
	Sat,  6 Dec 2025 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765048042; cv=none; b=cHKHaD81J4Hez02Bk84Yetieiny3wdBnLonRwZflTAFG0vzeC4HXlkZBPB1rZxx/iU4GZ5zJ+jKD8z+VjzFitOuUbWiB1bn6R0aOmTJvZ2IHlmoKrsQEZg/38Tdm8OnsIqRRKJXdVM1sthakLGbP0gPIwO3MNirEYBWhnmrjOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765048042; c=relaxed/simple;
	bh=wdyzESvsRQXJIV5x2M6hGsnr4tYVWDLrLodHRNoHEGc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GgQOjBn+r1LMLaA1ff3gPC8oPNlD/RAjHslx2VGhNy7Zp0Axhjh98GbMll7ezpg+12iKp9dZJhLgiJ5MM0Xvd6Vy0h46PeP6O2z5dgzQdkWgH46Llx0EijgFL4Iv2XGo+2t4NnaMuuifzJi6X0cRG7DsdcQk9bz6zxhjFvdZgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSVr31nW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSVr31nW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5965C4CEF5;
	Sat,  6 Dec 2025 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765048041;
	bh=wdyzESvsRQXJIV5x2M6hGsnr4tYVWDLrLodHRNoHEGc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PSVr31nW1pWpN/qw66vBnvfkO5Jqa6VBPmCkVTHUcmXIjbpgikeDFVMLrHNnejKRY
	 td5ZdhtueI+dILqNAVIlF1o8EiA5ZhigaaCRo29er8orhbWvHWzuHC/FLos4QMqBJ7
	 IoiSeyl2WfK38a7mRT6cy59Z9+wSEImMxEliS2R6dUU2RCw9MZGcWLcrkDt8xS1XF9
	 B0mfscQ+RdYvcOLexFRXlubAaxUREAc6pR9b+TXaBAKU0WwJuCEKHuL7Ra+50RjMGA
	 s7vcFTtEO8BuYtAoXHTPTsbYaGIrd1S3mcOOCoMmRKLxeo00Hl5RbSN1gsEET5LRx2
	 5Fa4a8krhThFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F29313808200;
	Sat,  6 Dec 2025 19:04:19 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251205200342.119676-1-andersson@kernel.org>
References: <20251205200342.119676-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251205200342.119676-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.19
X-PR-Tracked-Commit-Id: 641092c1bc1bbc3be059d9d723b1cec10a368617
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e637b37a520513a04d00f4add07ec25f357e6c6d
Message-Id: <176504785864.2170003.7507143168510636143.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 19:04:18 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Nickolay Goppen <setotau@mainlining.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>, Luca Weiss <luca@lucaweiss.eu>, Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  5 Dec 2025 14:03:42 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e637b37a520513a04d00f4add07ec25f357e6c6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
