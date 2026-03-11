Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16603E121E;
	Wed, 11 Mar 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246945; cv=none; b=AlThTDWO8i36iFSHCxOIes6jqyS15dO/y9q63DIboew7m9e+LigfFYSZDlWgGNLtFM0D7O3kY9xzOOYxUY1Ws7m0LmkZ/CAlz3rt7VH0l2Lg6XH1q4ypBPKKEIMjUNTxErFSb3y+nLggxeFRg9SMy9S09BJJ4nG4Mx5vHRr6dKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246945; c=relaxed/simple;
	bh=2VJy2Nq6/YTR5GOs6j/37pAINVDjdEj//FbDmZ9jOA4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Dy7ab9P4yFcHrxjznz2XZ+X0S+RLQbUj+XYq2laRL0sVYT36/+J0WBoRUWHULJuvkaw+IRSN3OmXKM5O+I6uhSIJYrOWY0mGCmCUhF+VjtJxfRMrwo+QL3qHEPqYQQ/1cfcpCt/DdTWAsxvRnUjCf+Ob+1/FpM/id3CKv8JvOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HubVj/a1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HubVj/a1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A9C4CEF7;
	Wed, 11 Mar 2026 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773246944;
	bh=2VJy2Nq6/YTR5GOs6j/37pAINVDjdEj//FbDmZ9jOA4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HubVj/a1I9TPzHqyCL3ExLS14zlshL8ySAP7ujMhBz9PAGO2EgpLDIuF+E6Ty4kcK
	 nWKVGiGOLDEQANz+1QRC0ULrmdtjchQHJhn8UWSe+pTtfJymQEOKoMXmt3VNTKn+3n
	 zAkayCXP3vmZNmf5XrdlzlXYPMxdi/+QGdQVxPBJ1XAWBioU8mGARqDQHdxGq7f6OG
	 DXEEmS/xWwhsQb4yjrYGsO0s7uBmxt+bNQHhQE78XNZ7le5cuGu6ed+RrGJiszprQH
	 x8GKqT56maNZgFHE1fnXapz4OAajp8xCtgrgsdBCLxxgkxBKIvDqDQfhSdMVb41V/2
	 bkb0v7CtirMGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E643808200;
	Wed, 11 Mar 2026 16:35:42 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260311151933.26814-1-andersson@kernel.org>
References: <20260311151933.26814-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260311151933.26814-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0-fixes
X-PR-Tracked-Commit-Id: 97e4567d39941248579da34b7fbb568e6659511e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80234b5ab240f52fa45d201e899e207b9265ef91
Message-Id: <177324694048.3742424.1733571044102096292.pr-tracker-bot@kernel.org>
Date: Wed, 11 Mar 2026 16:35:40 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 11 Mar 2026 10:19:33 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80234b5ab240f52fa45d201e899e207b9265ef91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
