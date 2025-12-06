Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4368302777;
	Sat,  6 Dec 2025 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765048044; cv=none; b=hum6BtVrhz/+l82+fz421wwZjUFYV8S9ao7iEvmuBAX8yEKly9hgmI96lC2l136J/GgOGjbiZmsvwh5/ldCTG6E40ntUyYn+IAzD7ka60C8iuprVGtibMCpp0/PDoz8uoQA546U+Y8+z8jwVipqOEAM+5JyhG8oweisu0GLn3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765048044; c=relaxed/simple;
	bh=jzU2YC4zZZKaGNZwTOdjDjFd+mqR6aaVGwl35V0jmZo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I+u6jX6H9/PfaeS8GDk0PPy6FJIIGmYH5BzlixVwLpwERrw2g4gvLzd42n55qrL5bduyCfB1VRdYVYJGU0mIEmiczUp3hbz6rn0pZfZX14rR9w+A4b/K+LfEjTkUrghnZSOt4Fhxkl/dpvnFc3YU2+M/vjlaWwXd0eRt+Tf9EMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F13//Bls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F13//Bls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AF6C4CEF5;
	Sat,  6 Dec 2025 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765048043;
	bh=jzU2YC4zZZKaGNZwTOdjDjFd+mqR6aaVGwl35V0jmZo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F13//Bls9lH8f+3KPYFvMDVCWydqLb8Js8VHnEzhMZ3m4deLFnVCt6dks7DbogHRH
	 n2/Tpromrv/mpzx93BP8bIKZGUBOkF8Wzi1UjP21WAx/Pjzrsmlz8TqB9LD/u34kN6
	 uDILVaG3KfOsG8mi0MF1JjAkJWsMp4mlKKMvP7K6PIkJ+GjjmXJodnGDv4hGJ04/nY
	 sRox7nhkLaJvNMdegINqlHgyBdsD1J4eGaCvX9APLnNagsStOh9qdFzQN/5stUFprV
	 h/zLtF5Z4YDw+T5PNoc8xwWBRmKCpNy7SfBEDZN/EDV2sifMdAlDC8gtiSv88fQ594
	 sXf4vDzMGcSkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F27D93808200;
	Sat,  6 Dec 2025 19:04:21 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251205200628.120406-1-andersson@kernel.org>
References: <20251205200628.120406-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251205200628.120406-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-v6.19
X-PR-Tracked-Commit-Id: 112766cdf2e5ea0a0f72b0304d57a6f74c066670
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 973ec55764d0f0e25d495392477056d6a0be4660
Message-Id: <176504786064.2170003.15219743717641040986.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 19:04:20 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  5 Dec 2025 14:06:28 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/973ec55764d0f0e25d495392477056d6a0be4660

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
