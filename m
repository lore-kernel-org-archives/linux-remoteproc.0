Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D7148FFC;
	Tue, 21 May 2024 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716315229; cv=none; b=pSWyfMcnJrCOWdKK7ybiPOQer/82otSx4OdhS3C/Zf0n8pv/JcZO7rg/Ikf6W1eLFG/VpUIRuNiHT8Df3WWH+vogZ1nDplDIFnL4Pgmo9rkOgEP/cyCdxBWGrXpulmWzy0y0HhNneGc8kz7ri+HNZgRdsdYmaUjcoVD0ugAluBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716315229; c=relaxed/simple;
	bh=NLzwo880GzCZyGrxtqGgUhnLz4hwyr0rxcy9MNijWGQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dEyi3O+2//53+oBUKVou58nJgfjWttgMy3iGRN9DyjJ9hvc47p69rNGsLIRZLTjrAMgYcZEx19ar0xQ2BBpZzXCtMhZZUc71QcGS5jA/0FimxqqmKKYORGTKHl5ofr6bOTnfQH78TCAdX4eY8G17z6QhXFI1vxgRvbzrI6+BOPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKPmhC2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKPmhC2w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 912E0C4AF09;
	Tue, 21 May 2024 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716315229;
	bh=NLzwo880GzCZyGrxtqGgUhnLz4hwyr0rxcy9MNijWGQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nKPmhC2w3GryNBKXYcQm3luxM6zT/HXX5KQZasMx1PS+Jiz87COl6pQ/NZ7zjxImX
	 8icE75PnW54Z8iVdTGNQM0Cl85XAuh/tvzHvhhYs4Auh0+bDmetprJbXwt/b5REytG
	 SyIgSyNdHqmxYotmwdxR/fdYAYeMaGhxVe+WHUGnKGHOBPU8F5Dn0rb8XtBsRrdlsm
	 VHbygyjWOyopOBFvjyf1mqcqui7HndndIAhOGXI2RWuFaOIPWV0liPes7JOJenOTnC
	 2iAGrLajKyxubYNkzAyOKL64YRxJI2oFsHTTWUJgrZbN22i15LMGkzpUC/OSDx1rBL
	 E/ZkdyKOtP98A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89897C54BB2;
	Tue, 21 May 2024 18:13:49 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240521025847.231912-1-andersson@kernel.org>
References: <20240521025847.231912-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240521025847.231912-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.10
X-PR-Tracked-Commit-Id: bcbab579f968ffd63236d90227212e689ddbd600
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e66128fa8e7e38ebd0b0c95578f8020aec6c0dee
Message-Id: <171631522955.20025.1890766121213151993.pr-tracker-bot@kernel.org>
Date: Tue, 21 May 2024 18:13:49 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, "Ricardo B . Marliere" <ricardo@marliere.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 May 2024 19:58:46 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e66128fa8e7e38ebd0b0c95578f8020aec6c0dee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
