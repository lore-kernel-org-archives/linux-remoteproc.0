Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE515143C5B;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721768992; cv=none; b=GIvbwU/fvFm7MMo/POSn8911CfL75AfoHByHEOREPHYCMCZ3oo+b4nyuv2A97CEbOTa8ZNZMOW+apIt5Y9LIUiwX1kkHAG1/M26Jmi6qksynhupqX+ol5NFNl1fZvTK8DNdHV4ZvdBrY52SQDW+TuE/2M3++DaYc8upaesRe2Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721768992; c=relaxed/simple;
	bh=zb7NNn28S/H97ahQEGRkZIokodj/MnPCaCa9yKyPqao=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OCnrmJeW7QFSdmQ1EaufHmOqw1ABHKNVnzzM1M6RKNkv+y1ynFporthFmfj9aYeZbQTxZiSvx9Hi2dlQjuGo2o9xrPEG9WKXVKixh0Wj2bWy3frnTl/e+wCANgI5pp9xxaD4BywiJDtdbckIukzHaUUyuhDJTHDMa4CaQ4l5A1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuslfctL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuslfctL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92807C4AF0A;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721768992;
	bh=zb7NNn28S/H97ahQEGRkZIokodj/MnPCaCa9yKyPqao=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CuslfctLqf6nZG4FAIai7eTJrHknYgbwkpHAWXMhX+Jyf+Ur13SEmAU4OFfb7Hz5d
	 SnKUzFGyTsvWgTwzV9xBwX8Vh2mW6dbUXSuSVRS6lfFhC7KZAKdZ9CYozcJwF7UWA+
	 gKdlYmMlfbdmYiDb2OxLAUy6o1YAsUQ5+WP42V4J9hPSMv98tW5Boxn3INV6YWBH+M
	 mSJde28LpOf1zyEtzsLzRYBAOtlicXVI5ff8RlE/G3QUx6WanJgv/PcgHv2Dic4AYX
	 Pq/ZMkszL1PaeN9aar+lCF0TbhTI+0P9WgrILVKtcwBt28f/tLH0mOVNI/cR0/eqMk
	 91o5II9KTqI8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 880A4C43443;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240723191750.3703388-1-andersson@kernel.org>
References: <20240723191750.3703388-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240723191750.3703388-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.11
X-PR-Tracked-Commit-Id: 36862eab884d997e182aad9163cc6ca953614a68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 643af93f15be901982b2b08f241263934201c99f
Message-Id: <172176899255.17734.2855603459731171717.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jul 2024 21:09:52 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Gwenael Treuveur <gwenael.treuveur@foss.st.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 23 Jul 2024 12:17:49 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/643af93f15be901982b2b08f241263934201c99f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
