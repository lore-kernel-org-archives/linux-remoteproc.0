Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7DC22DF9D;
	Wed, 21 May 2025 03:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797304; cv=none; b=aFVa4gdjSV5bRHoAPYtqkMQAheHGDMJPTlIJHxhI8VR4M05t6L2MSs2SOJKFM06oxpbX5RjwQarKL3Qp2eb0D9Pss2/JYm8TFEGof0H2Mzub4vesBJ7GG35z/SPdCpKQ+eg9G5HsfhSb1gf8iAda/i6IVOBpYgoHn/K2Oue+NFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797304; c=relaxed/simple;
	bh=7jETtPCy6oKF134bycAAXt78bj6wLrVVr8DYW0fYfX8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cgp5zgkOxyyaqKUGr9Lf6JHDIGrj5bevse2da0cWDQA87eisxjFm5k6lPPmHxNMx1yHHRGtDz+XSwChfTBHp2UswsvzN44uE5snRrrwQu99CVdOSKstkjx30x4jpUm52pxbQLekH9YfkJW0arQjUcNBLTQPQuJftF4/cY9QTC0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awi8o+YB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awi8o+YB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD29C4CEE4;
	Wed, 21 May 2025 03:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797304;
	bh=7jETtPCy6oKF134bycAAXt78bj6wLrVVr8DYW0fYfX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=awi8o+YBCZooba5+PEu6zuC+SoEtaxSRsSSBgWLUQXz/KKX0OnH0GZCZzZ+6Yd5Ue
	 NsxZ4VAESlqDaRk0rV/C3Hm6ewIXOZQI+ZGesiE3iekg4j6YnYqy3hLE+WdL5NjSLH
	 lIU2nb6yOiNCPbC6zeZDN+d4ChGJBvc7Hf0O1EPzuEyi8UfNqyd2VH+hHwii7P6/7s
	 vUkFv8ME8qKIl9eFfIj2vTsggSBE3Skc/Gcv9cG4GGXznKHEd1n/MltBwaFXzOoMtH
	 L491QGJlq6IyZ/CgWNrrvAPXeoJHbJxxEUWGRkvt5fFlF6u34nXdX5g8m5s9OWJrQH
	 a4nOZ2xpyxvCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BC8380CEEF;
	Wed, 21 May 2025 03:15:41 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc fix for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250521024154.1049894-1-andersson@kernel.org>
References: <20250521024154.1049894-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250521024154.1049894-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15-fixes
X-PR-Tracked-Commit-Id: 4ca45af0a56d00b86285d6fdd720dca3215059a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
Message-Id: <174779733984.1554736.16663472927114101877.pr-tracker-bot@kernel.org>
Date: Wed, 21 May 2025 03:15:39 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 20 May 2025 21:41:51 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a95bc121ccdaee04c4d72f84dbfa6b880a514b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
