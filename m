Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDA258EF3;
	Sat,  4 Oct 2025 23:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621336; cv=none; b=Hd8XEa8OwuU9F3fn2i+OnWn0f7av5Lzv7d6Q0jmTGzNgH5ISyn9D/qvdnntwu54JjtJjISJwX1cQx9evLjX08Tuo4TDxuj+Y9hAPCpBJlZotvpslxXwWEZWruI/hRvwGfFrrU0bGomd1wY9qnkXPRjVXgvh/i6YqNEzmDXBJGDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621336; c=relaxed/simple;
	bh=olLOGXKrqjXfJ3yzla/36b902GeTchJvhbiYfImskwA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PKv18taygI7lJQ9UbfeV6F63yZm51MhwMzqjqU0/+xO38kJxVJzzdkhcBYbLqAL0dPsgaItCO+WoGATMX5apNnQVI1Q1FnRJ3nTxrrd3rgYffwVfIJQnrN8YoGCQ/D8ibunIzevHepln+bUOnh1SLtsUcNNysTHtz5TndY44veo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fg87w2nH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fg87w2nH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D78C4CEF1;
	Sat,  4 Oct 2025 23:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759621335;
	bh=olLOGXKrqjXfJ3yzla/36b902GeTchJvhbiYfImskwA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Fg87w2nHzCVMPwUONpOu/nBu7PDWpOY9FZiN18eLhL9RiruTuQNyQbOcYuHTUjDAL
	 zJ8B1FsPUgTARKThJ2fvvcDJMGigHD3njfrchCcHY6bdx65vSNUTdfWG1/SJJMmU6q
	 Xsr2OB9/8UZx5beWbbfsZy6aBe70wq5lzWnej/+6ZYg9b+FoMyz0GEOY/p/w8kXnUl
	 vpShPOq9NPEMPSUccHtwBO8RLKmuepHyHy7kKVOte54XP9abEENE95eCHrZKBk0dRQ
	 I81jPSYkaq5WOx+z7TetPQYCsil6rVqjO5kvlpYt4IB9fi3cZgcsHfDBFjJ0X0fXN7
	 S4o7i1my2EsEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2939D0C1A;
	Sat,  4 Oct 2025 23:42:07 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251002135520.63777-1-andersson@kernel.org>
References: <20251002135520.63777-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251002135520.63777-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.18
X-PR-Tracked-Commit-Id: d41e075b077142bb9ae5df40b9ddf9fd7821a811
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c35f902cb31dad551dcc1c79540a58145cb19479
Message-Id: <175962132642.472872.3378767807072899620.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 23:42:06 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Peng Fan <peng.fan@nxp.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dmitry Baryshkov <lumag@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Zhen Ni <zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  2 Oct 2025 08:55:18 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c35f902cb31dad551dcc1c79540a58145cb19479

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
