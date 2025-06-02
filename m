Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC6B660;
	Mon,  2 Jun 2025 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891841; cv=none; b=AmwE5t93MDXCQ5dbOuaIo1g6YZ6yYycGsfQQBPfQsDR/A0TCv2ld0iX5h+rjiYP6qPoXX/EET2sfR7tvI37okIOUE6S9XvtCp6qjykR21euiTdGY9b0JeyvKHLhH9stTjgKcDLKzDWY4YCksPQANKidv3xI/1kVwN7QiDQhSL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891841; c=relaxed/simple;
	bh=8LVTHc2CIY3i+iU9NIpiraQaeCmRC1dytqsnIesJADo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ldLx4elTJK5bP9Baw0I0Te3LLQf+oI+XoC60Qc0z+ExC7tehyIrUZdIZxVh4eNL5dMRa858YIBHfPYtr01Qqr/5BNAC11M/PKrVodod38Ta9r2OwqU+qQuJrFhRxjrTtjNa805POWsdX2vyXKh08Hpl2Nk/nveF+8CGQXfNaum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/Er14HK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/Er14HK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C60C4CEEE;
	Mon,  2 Jun 2025 19:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891841;
	bh=8LVTHc2CIY3i+iU9NIpiraQaeCmRC1dytqsnIesJADo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=T/Er14HKPiTUyx1oLUzzuTopZXt9czTE7lhReRxmFNpyi3yTTDXSnK8tx72sUZAg4
	 q89sGqGUWVI4WhII/OzcWBf7JFFk7CHuw3hB6ze1fO6D3MzbmTyihoMZE+BOqgtG5Z
	 m5HA18g448yE4BiMArGH0lX901XuoTcu9Qk7OX4E2Di1hFrMDBgYzVnzRUcTYhJrQA
	 3ho9ILBWKke4N72mvxMAiAsUInY7f35Z3HN/9ldnzcucqIpLsFgoDpXVdDfF/OVdnQ
	 VYie+Y2gK00i5CP2Es+CZ09q029Rt2U1CEHAIekMuQQ/KpgexRkeHp3PRm8bJZTeax
	 jios2HUPtXzRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE47380AAD0;
	Mon,  2 Jun 2025 19:17:54 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250602140914.2086-1-andersson@kernel.org>
References: <20250602140914.2086-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250602140914.2086-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.16
X-PR-Tracked-Commit-Id: 5de775df3362090a6e90046d1f2d83fe62489aa0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b509c16e1d7cba8d0fd3843f6641fcafb3761432
Message-Id: <174889187349.877155.2064923235735672025.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:17:53 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Dr . David Alan Gilbert" <linux@treblig.org>, Dan Carpenter <dan.carpenter@linaro.org>, Luca Weiss <luca@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  2 Jun 2025 09:09:12 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b509c16e1d7cba8d0fd3843f6641fcafb3761432

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
