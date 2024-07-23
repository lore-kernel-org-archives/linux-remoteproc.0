Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877514373B;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721768992; cv=none; b=hMJXc5xcdIA+c4sI++woeoawqS+5Z6sp7SEheLwprghkFfo+FHPd+vztISvddCOsFu+eTARdEPA2rMQUS9wMAXUFGKfBtYxLdJ+ux/E5m8KDS6A/LqRQK6Ej5oXtjaarvS670Rx681x6Zdg3JQ+FPNqQtBk4D18L8XN+fWNUQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721768992; c=relaxed/simple;
	bh=Cc8LKP76yhObZRqtfmkYkGMgmX4ikT1HkVruKfwgwDE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZkSi/r4uytYagyU66+Liwh/IExqO5Cjl7Aplkw/Zl5VE+MCwfh/gHi295ce7fKHO5GFdXouxkH0D1vbar47s7AHSfhVH4W2vPSIeGDxmcbQoAJL5iLphYcJVreQef4SyrbrxrQHNGhwPeiRXCPlRb/jIzATZk44Hyutv1zPCiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enErlsl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enErlsl1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53257C4AF0F;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721768992;
	bh=Cc8LKP76yhObZRqtfmkYkGMgmX4ikT1HkVruKfwgwDE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=enErlsl1BUDnPOkZ2dZOs+3mzQOggJlEjwYEAaWTkBERwmhcHq+xyuahLE6kpRjJI
	 pqDI8oRpwI2IDBskm5UjfC0QO7OaV07jOM2UoX4FjF6LM16OrnOGMe2bSoJT9MhicI
	 rd8nj5TGYS+Y8s+WE38IWuUDoxMkHIIwWPeQV/pVLSXBWKt0a9Ri5yJj6+sskfZM+b
	 ifFBn1zfansaenhoJTBTmpUrYVSQQbd5RgYa7r2qq2anMLTT4PV9mtx53muUD60x4/
	 T3MaQE6lM07ejOgkeAaxArCbnNpIC9iggy+FpMZ508ZKpAnBcjiHAQrqPBc+W6bo0z
	 ckaOOUBXyu4/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49623C43443;
	Tue, 23 Jul 2024 21:09:52 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240723183042.3696037-1-andersson@kernel.org>
References: <20240723183042.3696037-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240723183042.3696037-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.11
X-PR-Tracked-Commit-Id: 19cb6058620620e68f1a9aed99393be5c3629db4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60c6119cadba52bee86b3e88011495483e26eb43
Message-Id: <172176899229.17734.18155001485901659708.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jul 2024 21:09:52 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Davis <afd@ti.com>, Richard Maina <quic_rmaina@quicinc.com>, Aleksandr Mishin <amishin@t-argos.ru>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Lew <quic_clew@quicinc.com>, Frank Li <Frank.Li@nxp.com>, Garrett Giordano <ggiordano@phytec.com>, Hari Nagalla <hnagalla@ti.com>, Jason Chen <Jason-ch.Chen@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Richard Genoud <richard.genoud@bootlin.com>, Tanmay Shah <tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 23 Jul 2024 11:30:41 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60c6119cadba52bee86b3e88011495483e26eb43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
