Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3813B2A2;
	Tue, 24 Sep 2024 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206578; cv=none; b=KQRDGCBJF6IDPvKN9DuKMn6POVqjLnMQ6QCYEV24xlZdJA5PXEe3nwHLcqeLIBgDA1Pm2ue2kGjAK1NI6eDF8UnLGJvrotDZqdBWB8Y6seMXLPLDWm24LPyGTbYctVKM1uFtSHNe3qgpDbCtobHFJWnI7lUP7xDRUUOFGG3ivWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206578; c=relaxed/simple;
	bh=bOhl4pmj/TqYgSETt/1JtZh2XRpcT1Fv5jdOx3cVjTU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pm+SPJvcVrcPJEwfy85vu192bX0O5kaYCoP7VftVHUrZIg4uTiUm7H50F/jSiEyWtIL6ET7Qz8XHCDQJv1th5a5GNafNFIV2Amfphu1EhfAlgk3m9a+MT/kI/vu7aDD+KkSAxxuAg0mv0T484Cpp718SvoaZmEU1QVDEciEoALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRF+5bQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRF+5bQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C0DC4CECD;
	Tue, 24 Sep 2024 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206578;
	bh=bOhl4pmj/TqYgSETt/1JtZh2XRpcT1Fv5jdOx3cVjTU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kRF+5bQeBMQqh9GL+y4unkfiNeU734H82lgF1Piqmn4sJW2c9fU2T0x5pJsELVYTy
	 1Lpr+NiBimzsNn3ZWF0J+w3tP9J3g6a1pgrDvzE62GzhuGH1KeHxpMWdfuTY82VexO
	 FBsCwLsdQRkJodU6kP4qMUNj+ozmvlxrQ+xjwisjRy4Wyar4JND0dfUrrKX5NXRTDK
	 7H7AdOHKqH4PM5pw0JOpoY8qeOxDw+mzupfvEKmD3budUwklr1HO4Rf3uj9XxSejOY
	 wUy1A5oF83Y5J/142u5TaEYmgkrZl97BaE2Yoy26SEI6xSAclxm7/Q95NDAvP9acCZ
	 LKKtXpJu6QiEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342D73806656;
	Tue, 24 Sep 2024 19:36:22 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240924044741.3078097-1-andersson@kernel.org>
References: <20240924044741.3078097-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240924044741.3078097-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.12
X-PR-Tracked-Commit-Id: 38a0e38b31d3f967525f6414711bed6f14dfa15e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c480f1da82c15f635a2b663740cb2bb241cc416
Message-Id: <172720658073.4172315.18015251738117947155.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 19:36:20 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>, Zhang Zekun <zhangzekun11@huawei.com>, Naina Mehta <quic_nainmeht@quicinc.com>, Hari Nagalla <hnagalla@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martyn Welch <martyn.welch@collabora.com>, Rob Herring <robh@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, Tengfei Fan <quic_tengfan@quicinc.com>, Udit Kumar <u-kumar1@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Sep 2024 21:47:40 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c480f1da82c15f635a2b663740cb2bb241cc416

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
