Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD613E40F;
	Sun, 26 Jan 2025 01:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737853413; cv=none; b=JpIEctTS1oPphUgHBaaQGr5nBd1O54YL5dU3zX7EIyXWFzA1dzN9kkt/w9w49NkA8MQh2AtAFu99nkDpTeuJeQYDAqeVxQZ4HrdKhtQvAIDjzWHTg+lQ2tIhQg/3yASz+r30d0yRmLVP7D/hDWgFGIuOSzje32Xis+AT9QpN/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737853413; c=relaxed/simple;
	bh=/hGfBANG/IL/B116KftthsC+Horg1g63pjeOq+oTiNA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Fu6WjNNPUAaxj5u4VxHnrDiMjM+yS+HHIOy7XRaopyY6tpRiUuYlQq16aWW+IHRpE10uW+luhcV2BDf8LU5i0e+4O4PQKH5/eylHqsxwApTg/YZfzFHQNeesmx7fy45uIY4FKzP/ixUMoWv2jwE8NNsmpAfSN7UUMNt6gdJCQeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tP/cY1K2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tP/cY1K2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D0FC4CED6;
	Sun, 26 Jan 2025 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737853413;
	bh=/hGfBANG/IL/B116KftthsC+Horg1g63pjeOq+oTiNA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tP/cY1K2FrOFygov9kbriMsCPNX8zbSCwThoTqMNdB8PjMklzciAOh318yxb18nVB
	 1IqbhqSXbTtnW9jHgSn5NYa5v+DfILM8yqj334Qe2kRsAvqQGY8jkq02onciqKRWkv
	 8LUgKZf3v68s1dQEttIEwyTnGzz7VBGtWX49bVUPwZDoLOeJhG9UAIQbn9fdxeMEvR
	 6etzmsTmmO0GJkSOlX2XBRKSsFNOpKd6jbSp+XYjMyisO9XGWPr+ieBeH+Wvo/iiR0
	 l6iB+wi431zXeJP4IHlJ1xf55hDjhI5p2bNoM+BvzXshmLO2l12G0RGZgLEhQzueWS
	 o/qgU4NgUPSCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE14380AA79;
	Sun, 26 Jan 2025 01:03:59 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250125173905.1150203-1-andersson@kernel.org>
References: <20250125173905.1150203-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250125173905.1150203-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.14
X-PR-Tracked-Commit-Id: 3a53ff95b0be9a5d0ef5037e539558d0041f9a89
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa22f4da2a46b484a257d167c67a2adc1b7aaf68
Message-Id: <173785343820.2645989.5111459318996059458.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jan 2025 01:03:58 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Beleswar Padhi <b-padhi@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Chen-Yu Tsai <wenst@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 25 Jan 2025 09:39:04 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa22f4da2a46b484a257d167c67a2adc1b7aaf68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
