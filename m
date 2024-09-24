Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256013C695;
	Tue, 24 Sep 2024 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206582; cv=none; b=ZR1DcYeRA1ncltB8NfPjhueCki7xejirjuIVQvRFdk/LIfrCi7jD4REvWtNUUAk6ptPENvbccD8JfYevT4quY6qoP3uEQl9K032rmnBXDUUf6sswympW/mqcV1rbSJKwBa+AW6BfjShlUNtCnPcr1WHa7bSDxGocDXD/lzL3YNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206582; c=relaxed/simple;
	bh=dwBZ8ly2ma26aoohGnlre+W1IdbkyDrCLxL1+2o6Z4k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iNrFzwODnqnfhNSmKzb9tKkMVmUd1s97aWDjpyMe2l9pcMKCUcQrpOurOGCPTBQ+Chombum7e1ValkapgsvxO4RBVw7bCdpESs0kQoflZ+BTCF6+ds55Fimiyfbtb/9FWDg6eU+wokLFax+Eq6nnes8KliDEmDhY0rho2WHKIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWIJ6vd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWIJ6vd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B37C4CEC5;
	Tue, 24 Sep 2024 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206581;
	bh=dwBZ8ly2ma26aoohGnlre+W1IdbkyDrCLxL1+2o6Z4k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fWIJ6vd/suLcI37vISCwhXqFZAW6kVbeb4W8JQsnP16HBjrKKnjlsRWF8+ouvXKb/
	 LlAu8HBGhbyKCCI8dr/4IInyfIjiazPgF4Tc7x+5ZTg2rwHznL4mz6O3oo0DX0E69u
	 ezqNTc6efm/sAsFOOyKvt+y0fgLdJllEcS8iGf66TVR7n6AOdYF6fAfnTVjJ6sc+sC
	 SZAkhfCr25UMi0paVgz2d8GqTcodIb406+91bi93E+iqNzXvH/eZ234etsJ/oPkfMp
	 c8tn1ofaxIWilumQFTcBqKacKJqwSRKHwnTya94uTbnJ/SRMlYY5lOwWWhE4F5VRZ9
	 iet5wLtZtJwXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7165D3806656;
	Tue, 24 Sep 2024 19:36:25 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock update for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240924045422.3080022-1-andersson@kernel.org>
References: <20240924045422.3080022-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240924045422.3080022-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.12
X-PR-Tracked-Commit-Id: 8dc1bffd6e15da727f7cd07e2d2e7aea728f42ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6db6a19f1ae31e29857b0f6f3e3896c22543be21
Message-Id: <172720658400.4172315.17562651460664440295.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 19:36:24 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Stanislav Jakubek <stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Sep 2024 21:54:19 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6db6a19f1ae31e29857b0f6f3e3896c22543be21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
