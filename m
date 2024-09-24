Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3413C8EA;
	Tue, 24 Sep 2024 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206580; cv=none; b=mO7Q2Qo94CgRW4BQiPx55vKns41NiZez2fYMgoKocKXd9s72MEltudQtyGGsPL96SwvoLyOA/yOIS3KWnbIYljuQzNvJtte5nxZxVpFNQ9fReIJnFnlZn1z/OwmVJrQlfpQf4giMCWoHx//CXFZ1V+66sH/UWe+mHVujvzlGSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206580; c=relaxed/simple;
	bh=QbGqHI5O95OZ1maFh6rooUUf9Lpt0FK7zxU6I3MCpVs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MrybpJ5KTjxohlt0jhiD1GrKVrqI1ThMk6pp14Qni6BMxysUFTV/pLOVQzSEMGY2vT9R9DwY+to9gvd0gxmxq8oV4GsR0L0jf5YxDgdy2OA7ifGOS4hyVqIBxaTTQ3ORoq6yfOa2bOt2kdQzaRo/P/9+XMm8efS9+6TisLypLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaGMKO5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaGMKO5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C3C4CEC4;
	Tue, 24 Sep 2024 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206580;
	bh=QbGqHI5O95OZ1maFh6rooUUf9Lpt0FK7zxU6I3MCpVs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eaGMKO5VlS2r4hKBNFxjaQaa6Uo+rhIDvAXwMwFVnOyyoNogDFx0YKHqTNZAKhUsO
	 JY9G1shyk8WN5NOEgm4WD7zSFg5kZUF6uFE7BWwB7fZje50qGrR3Nt85orDrzJZEMh
	 6+jqHxD+qRgbTvItdzvSU/ajSowR5qacLTw+SdF5nabci+kZk5G+2sfOWerP9PSH/I
	 q1epGhcq3INxYyDVf37MIuEqekziLIDMecyybNIG1vi2fuawyseIwMjX2zkCrgW9/A
	 XYuSHsXESU/xIw3Ss3d5CcRZb2KsGYhzruNreJXXrMComB/Ozn9hxsQgA02Hla8EQV
	 sBHKIxSgQwK8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFEA3806656;
	Tue, 24 Sep 2024 19:36:23 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240924045223.3079508-1-andersson@kernel.org>
References: <20240924045223.3079508-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240924045223.3079508-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.12
X-PR-Tracked-Commit-Id: c1ddb29709e675ea2a406e3114dbf5c8c705dd59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e10aa1fee979a898b06a4c8f2083de16e16df69
Message-Id: <172720658240.4172315.1256187419192653955.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 19:36:22 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Sep 2024 21:52:22 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e10aa1fee979a898b06a4c8f2083de16e16df69

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
